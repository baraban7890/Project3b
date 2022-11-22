5150 // File system implementation.  Five layers:
5151 //   + Blocks: allocator for raw disk blocks.
5152 //   + Log: crash recovery for multi-step updates.
5153 //   + Files: inode allocator, reading, writing, metadata.
5154 //   + Directories: inode with special contents (list of other inodes!)
5155 //   + Names: paths like /usr/rtm/xv6/fs.c for convenient naming.
5156 //
5157 // This file contains the low-level file system manipulation
5158 // routines.  The (higher-level) system call implementations
5159 // are in sysfile.c.
5160 
5161 #include "types.h"
5162 #include "defs.h"
5163 #include "param.h"
5164 #include "stat.h"
5165 #include "mmu.h"
5166 #include "proc.h"
5167 #include "spinlock.h"
5168 #include "sleeplock.h"
5169 #include "fs.h"
5170 #include "buf.h"
5171 #include "file.h"
5172 
5173 #define min(a, b) ((a) < (b) ? (a) : (b))
5174 static void itrunc(struct inode*);
5175 // there should be one superblock per disk device, but we run with
5176 // only one device
5177 struct superblock sb;
5178 
5179 // Read the super block.
5180 void
5181 readsb(int dev, struct superblock *sb)
5182 {
5183   struct buf *bp;
5184 
5185   bp = bread(dev, 1);
5186   memmove(sb, bp->data, sizeof(*sb));
5187   brelse(bp);
5188 }
5189 
5190 
5191 
5192 
5193 
5194 
5195 
5196 
5197 
5198 
5199 
5200 // Zero a block.
5201 static void
5202 bzero(int dev, int bno)
5203 {
5204   struct buf *bp;
5205 
5206   bp = bread(dev, bno);
5207   memset(bp->data, 0, BSIZE);
5208   log_write(bp);
5209   brelse(bp);
5210 }
5211 
5212 // Blocks.
5213 
5214 // Allocate a zeroed disk block.
5215 static uint
5216 balloc(uint dev)
5217 {
5218   int b, bi, m;
5219   struct buf *bp;
5220 
5221   bp = 0;
5222   for(b = 0; b < sb.size; b += BPB){
5223     bp = bread(dev, BBLOCK(b, sb));
5224     for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
5225       m = 1 << (bi % 8);
5226       if((bp->data[bi/8] & m) == 0){  // Is block free?
5227         bp->data[bi/8] |= m;  // Mark block in use.
5228         log_write(bp);
5229         brelse(bp);
5230         bzero(dev, b + bi);
5231         return b + bi;
5232       }
5233     }
5234     brelse(bp);
5235   }
5236   panic("balloc: out of blocks");
5237 }
5238 
5239 
5240 
5241 
5242 
5243 
5244 
5245 
5246 
5247 
5248 
5249 
5250 // Free a disk block.
5251 static void
5252 bfree(int dev, uint b)
5253 {
5254   struct buf *bp;
5255   int bi, m;
5256 
5257   bp = bread(dev, BBLOCK(b, sb));
5258   bi = b % BPB;
5259   m = 1 << (bi % 8);
5260   if((bp->data[bi/8] & m) == 0)
5261     panic("freeing free block");
5262   bp->data[bi/8] &= ~m;
5263   log_write(bp);
5264   brelse(bp);
5265 }
5266 
5267 // Inodes.
5268 //
5269 // An inode describes a single unnamed file.
5270 // The inode disk structure holds metadata: the file's type,
5271 // its size, the number of links referring to it, and the
5272 // list of blocks holding the file's content.
5273 //
5274 // The inodes are laid out sequentially on disk at
5275 // sb.startinode. Each inode has a number, indicating its
5276 // position on the disk.
5277 //
5278 // The kernel keeps a cache of in-use inodes in memory
5279 // to provide a place for synchronizing access
5280 // to inodes used by multiple processes. The cached
5281 // inodes include book-keeping information that is
5282 // not stored on disk: ip->ref and ip->valid.
5283 //
5284 // An inode and its in-memory representation go through a
5285 // sequence of states before they can be used by the
5286 // rest of the file system code.
5287 //
5288 // * Allocation: an inode is allocated if its type (on disk)
5289 //   is non-zero. ialloc() allocates, and iput() frees if
5290 //   the reference and link counts have fallen to zero.
5291 //
5292 // * Referencing in cache: an entry in the inode cache
5293 //   is free if ip->ref is zero. Otherwise ip->ref tracks
5294 //   the number of in-memory pointers to the entry (open
5295 //   files and current directories). iget() finds or
5296 //   creates a cache entry and increments its ref; iput()
5297 //   decrements ref.
5298 //
5299 // * Valid: the information (type, size, &c) in an inode
5300 //   cache entry is only correct when ip->valid is 1.
5301 //   ilock() reads the inode from
5302 //   the disk and sets ip->valid, while iput() clears
5303 //   ip->valid if ip->ref has fallen to zero.
5304 //
5305 // * Locked: file system code may only examine and modify
5306 //   the information in an inode and its content if it
5307 //   has first locked the inode.
5308 //
5309 // Thus a typical sequence is:
5310 //   ip = iget(dev, inum)
5311 //   ilock(ip)
5312 //   ... examine and modify ip->xxx ...
5313 //   iunlock(ip)
5314 //   iput(ip)
5315 //
5316 // ilock() is separate from iget() so that system calls can
5317 // get a long-term reference to an inode (as for an open file)
5318 // and only lock it for short periods (e.g., in read()).
5319 // The separation also helps avoid deadlock and races during
5320 // pathname lookup. iget() increments ip->ref so that the inode
5321 // stays cached and pointers to it remain valid.
5322 //
5323 // Many internal file system functions expect the caller to
5324 // have locked the inodes involved; this lets callers create
5325 // multi-step atomic operations.
5326 //
5327 // The icache.lock spin-lock protects the allocation of icache
5328 // entries. Since ip->ref indicates whether an entry is free,
5329 // and ip->dev and ip->inum indicate which i-node an entry
5330 // holds, one must hold icache.lock while using any of those fields.
5331 //
5332 // An ip->lock sleep-lock protects all ip-> fields other than ref,
5333 // dev, and inum.  One must hold ip->lock in order to
5334 // read or write that inode's ip->valid, ip->size, ip->type, &c.
5335 
5336 struct {
5337   struct spinlock lock;
5338   struct inode inode[NINODE];
5339 } icache;
5340 
5341 void
5342 iinit(int dev)
5343 {
5344   int i = 0;
5345 
5346   initlock(&icache.lock, "icache");
5347   for(i = 0; i < NINODE; i++) {
5348     initsleeplock(&icache.inode[i].lock, "inode");
5349   }
5350   readsb(dev, &sb);
5351   cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
5352  inodestart %d bmap start %d\n", sb.size, sb.nblocks,
5353           sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
5354           sb.bmapstart);
5355 }
5356 
5357 static struct inode* iget(uint dev, uint inum);
5358 
5359 
5360 
5361 
5362 
5363 
5364 
5365 
5366 
5367 
5368 
5369 
5370 
5371 
5372 
5373 
5374 
5375 
5376 
5377 
5378 
5379 
5380 
5381 
5382 
5383 
5384 
5385 
5386 
5387 
5388 
5389 
5390 
5391 
5392 
5393 
5394 
5395 
5396 
5397 
5398 
5399 
5400 // Allocate an inode on device dev.
5401 // Mark it as allocated by  giving it type type.
5402 // Returns an unlocked but allocated and referenced inode.
5403 struct inode*
5404 ialloc(uint dev, short type)
5405 {
5406   int inum;
5407   struct buf *bp;
5408   struct dinode *dip;
5409 
5410   for(inum = 1; inum < sb.ninodes; inum++){
5411     bp = bread(dev, IBLOCK(inum, sb));
5412     dip = (struct dinode*)bp->data + inum%IPB;
5413     if(dip->type == 0){  // a free inode
5414       memset(dip, 0, sizeof(*dip));
5415       dip->type = type;
5416       log_write(bp);   // mark it allocated on the disk
5417       brelse(bp);
5418       return iget(dev, inum);
5419     }
5420     brelse(bp);
5421   }
5422   panic("ialloc: no inodes");
5423 }
5424 
5425 // Copy a modified in-memory inode to disk.
5426 // Must be called after every change to an ip->xxx field
5427 // that lives on disk, since i-node cache is write-through.
5428 // Caller must hold ip->lock.
5429 void
5430 iupdate(struct inode *ip)
5431 {
5432   struct buf *bp;
5433   struct dinode *dip;
5434 
5435   bp = bread(ip->dev, IBLOCK(ip->inum, sb));
5436   dip = (struct dinode*)bp->data + ip->inum%IPB;
5437   dip->type = ip->type;
5438   dip->major = ip->major;
5439   dip->minor = ip->minor;
5440   dip->nlink = ip->nlink;
5441   dip->size = ip->size;
5442   memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
5443   log_write(bp);
5444   brelse(bp);
5445 }
5446 
5447 
5448 
5449 
5450 // Find the inode with number inum on device dev
5451 // and return the in-memory copy. Does not lock
5452 // the inode and does not read it from disk.
5453 static struct inode*
5454 iget(uint dev, uint inum)
5455 {
5456   struct inode *ip, *empty;
5457 
5458   acquire(&icache.lock);
5459 
5460   // Is the inode already cached?
5461   empty = 0;
5462   for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
5463     if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
5464       ip->ref++;
5465       release(&icache.lock);
5466       return ip;
5467     }
5468     if(empty == 0 && ip->ref == 0)    // Remember empty slot.
5469       empty = ip;
5470   }
5471 
5472   // Recycle an inode cache entry.
5473   if(empty == 0)
5474     panic("iget: no inodes");
5475 
5476   ip = empty;
5477   ip->dev = dev;
5478   ip->inum = inum;
5479   ip->ref = 1;
5480   ip->valid = 0;
5481   release(&icache.lock);
5482 
5483   return ip;
5484 }
5485 
5486 // Increment reference count for ip.
5487 // Returns ip to enable ip = idup(ip1) idiom.
5488 struct inode*
5489 idup(struct inode *ip)
5490 {
5491   acquire(&icache.lock);
5492   ip->ref++;
5493   release(&icache.lock);
5494   return ip;
5495 }
5496 
5497 
5498 
5499 
5500 // Lock the given inode.
5501 // Reads the inode from disk if necessary.
5502 void
5503 ilock(struct inode *ip)
5504 {
5505   struct buf *bp;
5506   struct dinode *dip;
5507 
5508   if(ip == 0 || ip->ref < 1)
5509     panic("ilock");
5510 
5511   acquiresleep(&ip->lock);
5512 
5513   if(ip->valid == 0){
5514     bp = bread(ip->dev, IBLOCK(ip->inum, sb));
5515     dip = (struct dinode*)bp->data + ip->inum%IPB;
5516     ip->type = dip->type;
5517     ip->major = dip->major;
5518     ip->minor = dip->minor;
5519     ip->nlink = dip->nlink;
5520     ip->size = dip->size;
5521     memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
5522     brelse(bp);
5523     ip->valid = 1;
5524     if(ip->type == 0)
5525       panic("ilock: no type");
5526   }
5527 }
5528 
5529 // Unlock the given inode.
5530 void
5531 iunlock(struct inode *ip)
5532 {
5533   if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
5534     panic("iunlock");
5535 
5536   releasesleep(&ip->lock);
5537 }
5538 
5539 
5540 
5541 
5542 
5543 
5544 
5545 
5546 
5547 
5548 
5549 
5550 // Drop a reference to an in-memory inode.
5551 // If that was the last reference, the inode cache entry can
5552 // be recycled.
5553 // If that was the last reference and the inode has no links
5554 // to it, free the inode (and its content) on disk.
5555 // All calls to iput() must be inside a transaction in
5556 // case it has to free the inode.
5557 void
5558 iput(struct inode *ip)
5559 {
5560   acquiresleep(&ip->lock);
5561   if(ip->valid && ip->nlink == 0){
5562     acquire(&icache.lock);
5563     int r = ip->ref;
5564     release(&icache.lock);
5565     if(r == 1){
5566       // inode has no links and no other references: truncate and free.
5567       itrunc(ip);
5568       ip->type = 0;
5569       iupdate(ip);
5570       ip->valid = 0;
5571     }
5572   }
5573   releasesleep(&ip->lock);
5574 
5575   acquire(&icache.lock);
5576   ip->ref--;
5577   release(&icache.lock);
5578 }
5579 
5580 // Common idiom: unlock, then put.
5581 void
5582 iunlockput(struct inode *ip)
5583 {
5584   iunlock(ip);
5585   iput(ip);
5586 }
5587 
5588 
5589 
5590 
5591 
5592 
5593 
5594 
5595 
5596 
5597 
5598 
5599 
5600 // Inode content
5601 //
5602 // The content (data) associated with each inode is stored
5603 // in blocks on the disk. The first NDIRECT block numbers
5604 // are listed in ip->addrs[].  The next NINDIRECT blocks are
5605 // listed in block ip->addrs[NDIRECT].
5606 
5607 // Return the disk block address of the nth block in inode ip.
5608 // If there is no such block, bmap allocates one.
5609 static uint
5610 bmap(struct inode *ip, uint bn)
5611 {
5612   uint addr, *a;
5613   struct buf *bp;
5614 
5615   if(bn < NDIRECT){
5616     if((addr = ip->addrs[bn]) == 0)
5617       ip->addrs[bn] = addr = balloc(ip->dev);
5618     return addr;
5619   }
5620   bn -= NDIRECT;
5621 
5622   if(bn < NINDIRECT){
5623     // Load indirect block, allocating if necessary.
5624     if((addr = ip->addrs[NDIRECT]) == 0)
5625       ip->addrs[NDIRECT] = addr = balloc(ip->dev);
5626     bp = bread(ip->dev, addr);
5627     a = (uint*)bp->data;
5628     if((addr = a[bn]) == 0){
5629       a[bn] = addr = balloc(ip->dev);
5630       log_write(bp);
5631     }
5632     brelse(bp);
5633     return addr;
5634   }
5635 
5636   panic("bmap: out of range");
5637 }
5638 
5639 
5640 
5641 
5642 
5643 
5644 
5645 
5646 
5647 
5648 
5649 
5650 // Truncate inode (discard contents).
5651 // Only called when the inode has no links
5652 // to it (no directory entries referring to it)
5653 // and has no in-memory reference to it (is
5654 // not an open file or current directory).
5655 static void
5656 itrunc(struct inode *ip)
5657 {
5658   int i, j;
5659   struct buf *bp;
5660   uint *a;
5661 
5662   for(i = 0; i < NDIRECT; i++){
5663     if(ip->addrs[i]){
5664       bfree(ip->dev, ip->addrs[i]);
5665       ip->addrs[i] = 0;
5666     }
5667   }
5668 
5669   if(ip->addrs[NDIRECT]){
5670     bp = bread(ip->dev, ip->addrs[NDIRECT]);
5671     a = (uint*)bp->data;
5672     for(j = 0; j < NINDIRECT; j++){
5673       if(a[j])
5674         bfree(ip->dev, a[j]);
5675     }
5676     brelse(bp);
5677     bfree(ip->dev, ip->addrs[NDIRECT]);
5678     ip->addrs[NDIRECT] = 0;
5679   }
5680 
5681   ip->size = 0;
5682   iupdate(ip);
5683 }
5684 
5685 // Copy stat information from inode.
5686 // Caller must hold ip->lock.
5687 void
5688 stati(struct inode *ip, struct stat *st)
5689 {
5690   st->dev = ip->dev;
5691   st->ino = ip->inum;
5692   st->type = ip->type;
5693   st->nlink = ip->nlink;
5694   st->size = ip->size;
5695 }
5696 
5697 
5698 
5699 
5700 // Read data from inode.
5701 // Caller must hold ip->lock.
5702 int
5703 readi(struct inode *ip, char *dst, uint off, uint n)
5704 {
5705   uint tot, m;
5706   struct buf *bp;
5707 
5708   if(ip->type == T_DEV){
5709     if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
5710       return -1;
5711     return devsw[ip->major].read(ip, dst, n);
5712   }
5713 
5714   if(off > ip->size || off + n < off)
5715     return -1;
5716   if(off + n > ip->size)
5717     n = ip->size - off;
5718 
5719   for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
5720     bp = bread(ip->dev, bmap(ip, off/BSIZE));
5721     m = min(n - tot, BSIZE - off%BSIZE);
5722     memmove(dst, bp->data + off%BSIZE, m);
5723     brelse(bp);
5724   }
5725   return n;
5726 }
5727 
5728 
5729 
5730 
5731 
5732 
5733 
5734 
5735 
5736 
5737 
5738 
5739 
5740 
5741 
5742 
5743 
5744 
5745 
5746 
5747 
5748 
5749 
5750 // Write data to inode.
5751 // Caller must hold ip->lock.
5752 int
5753 writei(struct inode *ip, char *src, uint off, uint n)
5754 {
5755   uint tot, m;
5756   struct buf *bp;
5757 
5758   if(ip->type == T_DEV){
5759     if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
5760       return -1;
5761     return devsw[ip->major].write(ip, src, n);
5762   }
5763 
5764   if(off > ip->size || off + n < off)
5765     return -1;
5766   if(off + n > MAXFILE*BSIZE)
5767     return -1;
5768 
5769   for(tot=0; tot<n; tot+=m, off+=m, src+=m){
5770     bp = bread(ip->dev, bmap(ip, off/BSIZE));
5771     m = min(n - tot, BSIZE - off%BSIZE);
5772     memmove(bp->data + off%BSIZE, src, m);
5773     log_write(bp);
5774     brelse(bp);
5775   }
5776 
5777   if(n > 0 && off > ip->size){
5778     ip->size = off;
5779     iupdate(ip);
5780   }
5781   return n;
5782 }
5783 
5784 
5785 
5786 
5787 
5788 
5789 
5790 
5791 
5792 
5793 
5794 
5795 
5796 
5797 
5798 
5799 
5800 // Directories
5801 
5802 int
5803 namecmp(const char *s, const char *t)
5804 {
5805   return strncmp(s, t, DIRSIZ);
5806 }
5807 
5808 // Look for a directory entry in a directory.
5809 // If found, set *poff to byte offset of entry.
5810 struct inode*
5811 dirlookup(struct inode *dp, char *name, uint *poff)
5812 {
5813   uint off, inum;
5814   struct dirent de;
5815 
5816   if(dp->type != T_DIR)
5817     panic("dirlookup not DIR");
5818 
5819   for(off = 0; off < dp->size; off += sizeof(de)){
5820     if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
5821       panic("dirlookup read");
5822     if(de.inum == 0)
5823       continue;
5824     if(namecmp(name, de.name) == 0){
5825       // entry matches path element
5826       if(poff)
5827         *poff = off;
5828       inum = de.inum;
5829       return iget(dp->dev, inum);
5830     }
5831   }
5832 
5833   return 0;
5834 }
5835 
5836 
5837 
5838 
5839 
5840 
5841 
5842 
5843 
5844 
5845 
5846 
5847 
5848 
5849 
5850 // Write a new directory entry (name, inum) into the directory dp.
5851 int
5852 dirlink(struct inode *dp, char *name, uint inum)
5853 {
5854   int off;
5855   struct dirent de;
5856   struct inode *ip;
5857 
5858   // Check that name is not present.
5859   if((ip = dirlookup(dp, name, 0)) != 0){
5860     iput(ip);
5861     return -1;
5862   }
5863 
5864   // Look for an empty dirent.
5865   for(off = 0; off < dp->size; off += sizeof(de)){
5866     if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
5867       panic("dirlink read");
5868     if(de.inum == 0)
5869       break;
5870   }
5871 
5872   strncpy(de.name, name, DIRSIZ);
5873   de.inum = inum;
5874   if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
5875     panic("dirlink");
5876 
5877   return 0;
5878 }
5879 
5880 
5881 
5882 
5883 
5884 
5885 
5886 
5887 
5888 
5889 
5890 
5891 
5892 
5893 
5894 
5895 
5896 
5897 
5898 
5899 
5900 // Paths
5901 
5902 // Copy the next path element from path into name.
5903 // Return a pointer to the element following the copied one.
5904 // The returned path has no leading slashes,
5905 // so the caller can check *path=='\0' to see if the name is the last one.
5906 // If no name to remove, return 0.
5907 //
5908 // Examples:
5909 //   skipelem("a/bb/c", name) = "bb/c", setting name = "a"
5910 //   skipelem("///a//bb", name) = "bb", setting name = "a"
5911 //   skipelem("a", name) = "", setting name = "a"
5912 //   skipelem("", name) = skipelem("////", name) = 0
5913 //
5914 static char*
5915 skipelem(char *path, char *name)
5916 {
5917   char *s;
5918   int len;
5919 
5920   while(*path == '/')
5921     path++;
5922   if(*path == 0)
5923     return 0;
5924   s = path;
5925   while(*path != '/' && *path != 0)
5926     path++;
5927   len = path - s;
5928   if(len >= DIRSIZ)
5929     memmove(name, s, DIRSIZ);
5930   else {
5931     memmove(name, s, len);
5932     name[len] = 0;
5933   }
5934   while(*path == '/')
5935     path++;
5936   return path;
5937 }
5938 
5939 
5940 
5941 
5942 
5943 
5944 
5945 
5946 
5947 
5948 
5949 
5950 // Look up and return the inode for a path name.
5951 // If parent != 0, return the inode for the parent and copy the final
5952 // path element into name, which must have room for DIRSIZ bytes.
5953 // Must be called inside a transaction since it calls iput().
5954 static struct inode*
5955 namex(char *path, int nameiparent, char *name)
5956 {
5957   struct inode *ip, *next;
5958 
5959   if(*path == '/')
5960     ip = iget(ROOTDEV, ROOTINO);
5961   else
5962     ip = idup(myproc()->cwd);
5963 
5964   while((path = skipelem(path, name)) != 0){
5965     ilock(ip);
5966     if(ip->type != T_DIR){
5967       iunlockput(ip);
5968       return 0;
5969     }
5970     if(nameiparent && *path == '\0'){
5971       // Stop one level early.
5972       iunlock(ip);
5973       return ip;
5974     }
5975     if((next = dirlookup(ip, name, 0)) == 0){
5976       iunlockput(ip);
5977       return 0;
5978     }
5979     iunlockput(ip);
5980     ip = next;
5981   }
5982   if(nameiparent){
5983     iput(ip);
5984     return 0;
5985   }
5986   return ip;
5987 }
5988 
5989 struct inode*
5990 namei(char *path)
5991 {
5992   char name[DIRSIZ];
5993   return namex(path, 0, name);
5994 }
5995 
5996 
5997 
5998 
5999 
6000 struct inode*
6001 nameiparent(char *path, char *name)
6002 {
6003   return namex(path, 1, name);
6004 }
6005 
6006 
6007 
6008 
6009 
6010 
6011 
6012 
6013 
6014 
6015 
6016 
6017 
6018 
6019 
6020 
6021 
6022 
6023 
6024 
6025 
6026 
6027 
6028 
6029 
6030 
6031 
6032 
6033 
6034 
6035 
6036 
6037 
6038 
6039 
6040 
6041 
6042 
6043 
6044 
6045 
6046 
6047 
6048 
6049 
