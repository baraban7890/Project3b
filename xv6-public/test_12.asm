
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void worker(void *arg1, void *arg2);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
  14:	e8 3d 07 00 00       	call   756 <getpid>

   int arg1 = 11, arg2 = 22;

   lock_init(&lock);
  19:	83 ec 0c             	sub    $0xc,%esp
   int arg1 = 11, arg2 = 22;
  1c:	c7 45 e0 0b 00 00 00 	movl   $0xb,-0x20(%ebp)
   lock_init(&lock);
  23:	68 f8 0f 00 00       	push   $0xff8
   ppid = getpid();
  28:	a3 04 10 00 00       	mov    %eax,0x1004
   int arg1 = 11, arg2 = 22;
  2d:	c7 45 e4 16 00 00 00 	movl   $0x16,-0x1c(%ebp)
   lock_init(&lock);
  34:	e8 87 06 00 00       	call   6c0 <lock_init>
   lock_init(&lock2);
  39:	c7 04 24 f4 0f 00 00 	movl   $0xff4,(%esp)
  40:	e8 7b 06 00 00       	call   6c0 <lock_init>
   lock_acquire(&lock);
  45:	c7 04 24 f8 0f 00 00 	movl   $0xff8,(%esp)
  4c:	e8 3f 06 00 00       	call   690 <lock_acquire>
   lock_acquire(&lock2);
  51:	c7 04 24 f4 0f 00 00 	movl   $0xff4,(%esp)
  58:	e8 33 06 00 00       	call   690 <lock_acquire>

   for (int i = 0; i < num_threads; i++) {
  5d:	8b 35 f0 0f 00 00    	mov    0xff0,%esi
  63:	83 c4 10             	add    $0x10,%esp
  66:	85 f6                	test   %esi,%esi
  68:	7e 75                	jle    df <main+0xdf>
  6a:	31 db                	xor    %ebx,%ebx
  6c:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  6f:	8d 75 e0             	lea    -0x20(%ebp),%esi
  72:	eb 0f                	jmp    83 <main+0x83>
  74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  78:	83 c3 01             	add    $0x1,%ebx
  7b:	39 1d f0 0f 00 00    	cmp    %ebx,0xff0
  81:	7e 5c                	jle    df <main+0xdf>
      int thread_pid = thread_create(worker, &arg1, &arg2);
  83:	83 ec 04             	sub    $0x4,%esp
  86:	57                   	push   %edi
  87:	56                   	push   %esi
  88:	68 20 02 00 00       	push   $0x220
  8d:	e8 9e 05 00 00       	call   630 <thread_create>
      assert(thread_pid > 0);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	7f df                	jg     78 <main+0x78>
  99:	6a 28                	push   $0x28
  9b:	68 68 0b 00 00       	push   $0xb68
  a0:	68 72 0b 00 00       	push   $0xb72
  a5:	6a 01                	push   $0x1
  a7:	e8 94 07 00 00       	call   840 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 b9 0b 00 00       	push   $0xbb9
   }
   lock_release(&lock2);

   for (int i = 0; i < num_threads; i++) {
      int join_pid = thread_join();
      assert(join_pid > 0);
  b4:	68 98 0b 00 00       	push   $0xb98
  b9:	6a 01                	push   $0x1
  bb:	e8 80 07 00 00       	call   840 <printf>
  c0:	5a                   	pop    %edx
  c1:	59                   	pop    %ecx
  c2:	68 ac 0b 00 00       	push   $0xbac
  c7:	6a 01                	push   $0x1
  c9:	e8 72 07 00 00       	call   840 <printf>
  ce:	5b                   	pop    %ebx
  cf:	ff 35 04 10 00 00    	push   0x1004
  d5:	e8 2c 06 00 00       	call   706 <kill>
  da:	e8 f7 05 00 00       	call   6d6 <exit>
   size = (unsigned int)sbrk(0);
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	6a 00                	push   $0x0
  e4:	e8 75 06 00 00       	call   75e <sbrk>
   while (global < num_threads) {
  e9:	83 c4 10             	add    $0x10,%esp
   size = (unsigned int)sbrk(0);
  ec:	a3 fc 0f 00 00       	mov    %eax,0xffc
   while (global < num_threads) {
  f1:	a1 f0 0f 00 00       	mov    0xff0,%eax
  f6:	39 05 00 10 00 00    	cmp    %eax,0x1000
  fc:	7d 37                	jge    135 <main+0x135>
  fe:	66 90                	xchg   %ax,%ax
      lock_release(&lock);
 100:	83 ec 0c             	sub    $0xc,%esp
 103:	68 f8 0f 00 00       	push   $0xff8
 108:	e8 a3 05 00 00       	call   6b0 <lock_release>
      sleep(100);
 10d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 114:	e8 4d 06 00 00       	call   766 <sleep>
      lock_acquire(&lock);
 119:	c7 04 24 f8 0f 00 00 	movl   $0xff8,(%esp)
 120:	e8 6b 05 00 00       	call   690 <lock_acquire>
   while (global < num_threads) {
 125:	a1 f0 0f 00 00       	mov    0xff0,%eax
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	39 05 00 10 00 00    	cmp    %eax,0x1000
 133:	7c cb                	jl     100 <main+0x100>
   global = 0;
 135:	c7 05 00 10 00 00 00 	movl   $0x0,0x1000
 13c:	00 00 00 
   sbrk(10000);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	68 10 27 00 00       	push   $0x2710
 147:	e8 12 06 00 00       	call   75e <sbrk>
   size = (unsigned int)sbrk(0);
 14c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 153:	e8 06 06 00 00       	call   75e <sbrk>
   lock_release(&lock);
 158:	c7 04 24 f8 0f 00 00 	movl   $0xff8,(%esp)
   size = (unsigned int)sbrk(0);
 15f:	a3 fc 0f 00 00       	mov    %eax,0xffc
   lock_release(&lock);
 164:	e8 47 05 00 00       	call   6b0 <lock_release>
   while (global < num_threads) {
 169:	a1 f0 0f 00 00       	mov    0xff0,%eax
 16e:	83 c4 10             	add    $0x10,%esp
 171:	39 05 00 10 00 00    	cmp    %eax,0x1000
 177:	7d 3c                	jge    1b5 <main+0x1b5>
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      lock_release(&lock2);
 180:	83 ec 0c             	sub    $0xc,%esp
 183:	68 f4 0f 00 00       	push   $0xff4
 188:	e8 23 05 00 00       	call   6b0 <lock_release>
      sleep(100);
 18d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 194:	e8 cd 05 00 00       	call   766 <sleep>
      lock_acquire(&lock2);
 199:	c7 04 24 f4 0f 00 00 	movl   $0xff4,(%esp)
 1a0:	e8 eb 04 00 00       	call   690 <lock_acquire>
   while (global < num_threads) {
 1a5:	a1 f0 0f 00 00       	mov    0xff0,%eax
 1aa:	83 c4 10             	add    $0x10,%esp
 1ad:	39 05 00 10 00 00    	cmp    %eax,0x1000
 1b3:	7c cb                	jl     180 <main+0x180>
   lock_release(&lock2);
 1b5:	83 ec 0c             	sub    $0xc,%esp
 1b8:	68 f4 0f 00 00       	push   $0xff4
 1bd:	e8 ee 04 00 00       	call   6b0 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	83 3d f0 0f 00 00 00 	cmpl   $0x0,0xff0
 1cc:	7e 3e                	jle    20c <main+0x20c>
 1ce:	31 db                	xor    %ebx,%ebx
 1d0:	eb 11                	jmp    1e3 <main+0x1e3>
 1d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d8:	83 c3 01             	add    $0x1,%ebx
 1db:	39 1d f0 0f 00 00    	cmp    %ebx,0xff0
 1e1:	7e 29                	jle    20c <main+0x20c>
      int join_pid = thread_join();
 1e3:	e8 78 04 00 00       	call   660 <thread_join>
      assert(join_pid > 0);
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <main+0x1d8>
 1ec:	6a 41                	push   $0x41
 1ee:	68 68 0b 00 00       	push   $0xb68
 1f3:	68 72 0b 00 00       	push   $0xb72
 1f8:	6a 01                	push   $0x1
 1fa:	e8 41 06 00 00       	call   840 <printf>
 1ff:	83 c4 0c             	add    $0xc,%esp
 202:	68 c8 0b 00 00       	push   $0xbc8
 207:	e9 a8 fe ff ff       	jmp    b4 <main+0xb4>
   }

   printf(1, "TEST PASSED\n");
 20c:	50                   	push   %eax
 20d:	50                   	push   %eax
 20e:	68 d5 0b 00 00       	push   $0xbd5
 213:	6a 01                	push   $0x1
 215:	e8 26 06 00 00       	call   840 <printf>
   exit();
 21a:	e8 b7 04 00 00       	call   6d6 <exit>
 21f:	90                   	nop

00000220 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
 226:	68 f8 0f 00 00       	push   $0xff8
 22b:	e8 60 04 00 00       	call   690 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 230:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 237:	e8 22 05 00 00       	call   75e <sbrk>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	3b 05 fc 0f 00 00    	cmp    0xffc,%eax
 245:	74 46                	je     28d <worker+0x6d>
 247:	6a 5b                	push   $0x5b

   


   lock_acquire(&lock2);
   assert((unsigned int)sbrk(0) == size);
 249:	68 68 0b 00 00       	push   $0xb68
 24e:	68 72 0b 00 00       	push   $0xb72
 253:	6a 01                	push   $0x1
 255:	e8 e6 05 00 00       	call   840 <printf>
 25a:	83 c4 0c             	add    $0xc,%esp
 25d:	68 7a 0b 00 00       	push   $0xb7a
 262:	68 98 0b 00 00       	push   $0xb98
 267:	6a 01                	push   $0x1
 269:	e8 d2 05 00 00       	call   840 <printf>
 26e:	58                   	pop    %eax
 26f:	5a                   	pop    %edx
 270:	68 ac 0b 00 00       	push   $0xbac
 275:	6a 01                	push   $0x1
 277:	e8 c4 05 00 00       	call   840 <printf>
 27c:	59                   	pop    %ecx
 27d:	ff 35 04 10 00 00    	push   0x1004
 283:	e8 7e 04 00 00       	call   706 <kill>
 288:	e8 49 04 00 00       	call   6d6 <exit>
   lock_release(&lock);
 28d:	83 ec 0c             	sub    $0xc,%esp
   global++;
 290:	83 05 00 10 00 00 01 	addl   $0x1,0x1000
   lock_release(&lock);
 297:	68 f8 0f 00 00       	push   $0xff8
 29c:	e8 0f 04 00 00       	call   6b0 <lock_release>
   lock_acquire(&lock2);
 2a1:	c7 04 24 f4 0f 00 00 	movl   $0xff4,(%esp)
 2a8:	e8 e3 03 00 00       	call   690 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 2ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2b4:	e8 a5 04 00 00       	call   75e <sbrk>
 2b9:	83 c4 10             	add    $0x10,%esp
 2bc:	3b 05 fc 0f 00 00    	cmp    0xffc,%eax
 2c2:	74 04                	je     2c8 <worker+0xa8>
 2c4:	6a 63                	push   $0x63
 2c6:	eb 81                	jmp    249 <worker+0x29>
   global++;
   sbrk(10000);
 2c8:	83 ec 0c             	sub    $0xc,%esp
   global++;
 2cb:	83 05 00 10 00 00 01 	addl   $0x1,0x1000
   sbrk(10000);
 2d2:	68 10 27 00 00       	push   $0x2710
 2d7:	e8 82 04 00 00       	call   75e <sbrk>
   size = (unsigned int)sbrk(0);
 2dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2e3:	e8 76 04 00 00       	call   75e <sbrk>
   lock_release(&lock2);
 2e8:	c7 04 24 f4 0f 00 00 	movl   $0xff4,(%esp)
   size = (unsigned int)sbrk(0);
 2ef:	a3 fc 0f 00 00       	mov    %eax,0xffc
   lock_release(&lock2);
 2f4:	e8 b7 03 00 00       	call   6b0 <lock_release>



   exit();
 2f9:	e8 d8 03 00 00       	call   6d6 <exit>
 2fe:	66 90                	xchg   %ax,%ax

00000300 <worker2>:
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 306:	8b 45 0c             	mov    0xc(%ebp),%eax
 309:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	83 38 0b             	cmpl   $0xb,(%eax)
 311:	75 4b                	jne    35e <worker2+0x5e>
   assert(arg2_int == 22);
 313:	83 fa 16             	cmp    $0x16,%edx
 316:	74 63                	je     37b <worker2+0x7b>
 318:	6a 4d                	push   $0x4d
 31a:	68 68 0b 00 00       	push   $0xb68
 31f:	68 72 0b 00 00       	push   $0xb72
 324:	6a 01                	push   $0x1
 326:	e8 15 05 00 00       	call   840 <printf>
 32b:	83 c4 0c             	add    $0xc,%esp
 32e:	68 f1 0b 00 00       	push   $0xbf1
 333:	68 98 0b 00 00       	push   $0xb98
 338:	6a 01                	push   $0x1
 33a:	e8 01 05 00 00       	call   840 <printf>
 33f:	58                   	pop    %eax
 340:	5a                   	pop    %edx
 341:	68 ac 0b 00 00       	push   $0xbac
 346:	6a 01                	push   $0x1
 348:	e8 f3 04 00 00       	call   840 <printf>
 34d:	59                   	pop    %ecx
 34e:	ff 35 04 10 00 00    	push   0x1004
 354:	e8 ad 03 00 00       	call   706 <kill>
 359:	e8 78 03 00 00       	call   6d6 <exit>
   assert(arg1_int == 11);
 35e:	6a 4c                	push   $0x4c
 360:	68 68 0b 00 00       	push   $0xb68
 365:	68 72 0b 00 00       	push   $0xb72
 36a:	6a 01                	push   $0x1
 36c:	e8 cf 04 00 00       	call   840 <printf>
 371:	83 c4 0c             	add    $0xc,%esp
 374:	68 e2 0b 00 00       	push   $0xbe2
 379:	eb b8                	jmp    333 <worker2+0x33>
   lock_acquire(&lock2);
 37b:	83 ec 0c             	sub    $0xc,%esp
 37e:	68 f4 0f 00 00       	push   $0xff4
 383:	e8 08 03 00 00       	call   690 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 388:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 38f:	e8 ca 03 00 00       	call   75e <sbrk>
 394:	83 c4 10             	add    $0x10,%esp
 397:	3b 05 fc 0f 00 00    	cmp    0xffc,%eax
 39d:	74 20                	je     3bf <worker2+0xbf>
 39f:	6a 50                	push   $0x50
 3a1:	68 68 0b 00 00       	push   $0xb68
 3a6:	68 72 0b 00 00       	push   $0xb72
 3ab:	6a 01                	push   $0x1
 3ad:	e8 8e 04 00 00       	call   840 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 7a 0b 00 00       	push   $0xb7a
 3ba:	e9 74 ff ff ff       	jmp    333 <worker2+0x33>
   lock_release(&lock2);
 3bf:	83 ec 0c             	sub    $0xc,%esp
   global++;
 3c2:	83 05 00 10 00 00 01 	addl   $0x1,0x1000
   lock_release(&lock2);
 3c9:	68 f4 0f 00 00       	push   $0xff4
 3ce:	e8 dd 02 00 00       	call   6b0 <lock_release>
   exit();
 3d3:	e8 fe 02 00 00       	call   6d6 <exit>
 3d8:	66 90                	xchg   %ax,%ax
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 3e0:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 3e1:	31 c0                	xor    %eax,%eax
{
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	53                   	push   %ebx
 3e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 3f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3f7:	83 c0 01             	add    $0x1,%eax
 3fa:	84 d2                	test   %dl,%dl
 3fc:	75 f2                	jne    3f0 <strcpy+0x10>
    ;
  return os;
}
 3fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 401:	89 c8                	mov    %ecx,%eax
 403:	c9                   	leave  
 404:	c3                   	ret    
 405:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <strcmp>:

int strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 55 08             	mov    0x8(%ebp),%edx
 417:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 41a:	0f b6 02             	movzbl (%edx),%eax
 41d:	84 c0                	test   %al,%al
 41f:	75 17                	jne    438 <strcmp+0x28>
 421:	eb 3a                	jmp    45d <strcmp+0x4d>
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 42c:	83 c2 01             	add    $0x1,%edx
 42f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 432:	84 c0                	test   %al,%al
 434:	74 1a                	je     450 <strcmp+0x40>
    p++, q++;
 436:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 438:	0f b6 19             	movzbl (%ecx),%ebx
 43b:	38 c3                	cmp    %al,%bl
 43d:	74 e9                	je     428 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 43f:	29 d8                	sub    %ebx,%eax
}
 441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 444:	c9                   	leave  
 445:	c3                   	ret    
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 450:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 454:	31 c0                	xor    %eax,%eax
 456:	29 d8                	sub    %ebx,%eax
}
 458:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45b:	c9                   	leave  
 45c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 45d:	0f b6 19             	movzbl (%ecx),%ebx
 460:	31 c0                	xor    %eax,%eax
 462:	eb db                	jmp    43f <strcmp+0x2f>
 464:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <strlen>:

uint strlen(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 476:	80 3a 00             	cmpb   $0x0,(%edx)
 479:	74 15                	je     490 <strlen+0x20>
 47b:	31 c0                	xor    %eax,%eax
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	83 c0 01             	add    $0x1,%eax
 483:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 487:	89 c1                	mov    %eax,%ecx
 489:	75 f5                	jne    480 <strlen+0x10>
    ;
  return n;
}
 48b:	89 c8                	mov    %ecx,%eax
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    
 48f:	90                   	nop
  for (n = 0; s[n]; n++)
 490:	31 c9                	xor    %ecx,%ecx
}
 492:	5d                   	pop    %ebp
 493:	89 c8                	mov    %ecx,%eax
 495:	c3                   	ret    
 496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi

000004a0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	89 d7                	mov    %edx,%edi
 4af:	fc                   	cld    
 4b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4b5:	89 d0                	mov    %edx,%eax
 4b7:	c9                   	leave  
 4b8:	c3                   	ret    
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <strchr>:

char *
strchr(const char *s, char c)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 4ca:	0f b6 10             	movzbl (%eax),%edx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	75 12                	jne    4e3 <strchr+0x23>
 4d1:	eb 1d                	jmp    4f0 <strchr+0x30>
 4d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d7:	90                   	nop
 4d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4dc:	83 c0 01             	add    $0x1,%eax
 4df:	84 d2                	test   %dl,%dl
 4e1:	74 0d                	je     4f0 <strchr+0x30>
    if (*s == c)
 4e3:	38 d1                	cmp    %dl,%cl
 4e5:	75 f1                	jne    4d8 <strchr+0x18>
      return (char *)s;
  return 0;
}
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4f0:	31 c0                	xor    %eax,%eax
}
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <gets>:

char *
gets(char *buf, int max)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 505:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 508:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 509:	31 db                	xor    %ebx,%ebx
{
 50b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 50e:	eb 27                	jmp    537 <gets+0x37>
    cc = read(0, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	6a 01                	push   $0x1
 515:	57                   	push   %edi
 516:	6a 00                	push   $0x0
 518:	e8 d1 01 00 00       	call   6ee <read>
    if (cc < 1)
 51d:	83 c4 10             	add    $0x10,%esp
 520:	85 c0                	test   %eax,%eax
 522:	7e 1d                	jle    541 <gets+0x41>
      break;
    buf[i++] = c;
 524:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 528:	8b 55 08             	mov    0x8(%ebp),%edx
 52b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 52f:	3c 0a                	cmp    $0xa,%al
 531:	74 1d                	je     550 <gets+0x50>
 533:	3c 0d                	cmp    $0xd,%al
 535:	74 19                	je     550 <gets+0x50>
  for (i = 0; i + 1 < max;)
 537:	89 de                	mov    %ebx,%esi
 539:	83 c3 01             	add    $0x1,%ebx
 53c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 53f:	7c cf                	jl     510 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 548:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54b:	5b                   	pop    %ebx
 54c:	5e                   	pop    %esi
 54d:	5f                   	pop    %edi
 54e:	5d                   	pop    %ebp
 54f:	c3                   	ret    
  buf[i] = '\0';
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	89 de                	mov    %ebx,%esi
 555:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 559:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5f                   	pop    %edi
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <stat>:

int stat(const char *n, struct stat *st)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	56                   	push   %esi
 574:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 575:	83 ec 08             	sub    $0x8,%esp
 578:	6a 00                	push   $0x0
 57a:	ff 75 08             	push   0x8(%ebp)
 57d:	e8 94 01 00 00       	call   716 <open>
  if (fd < 0)
 582:	83 c4 10             	add    $0x10,%esp
 585:	85 c0                	test   %eax,%eax
 587:	78 27                	js     5b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 589:	83 ec 08             	sub    $0x8,%esp
 58c:	ff 75 0c             	push   0xc(%ebp)
 58f:	89 c3                	mov    %eax,%ebx
 591:	50                   	push   %eax
 592:	e8 97 01 00 00       	call   72e <fstat>
  close(fd);
 597:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 59a:	89 c6                	mov    %eax,%esi
  close(fd);
 59c:	e8 5d 01 00 00       	call   6fe <close>
  return r;
 5a1:	83 c4 10             	add    $0x10,%esp
}
 5a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5a7:	89 f0                	mov    %esi,%eax
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 5b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5b5:	eb ed                	jmp    5a4 <stat+0x34>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax

000005c0 <atoi>:

int atoi(const char *s)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	53                   	push   %ebx
 5c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 5c7:	0f be 02             	movsbl (%edx),%eax
 5ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 5d5:	77 1e                	ja     5f5 <atoi+0x35>
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 5e0:	83 c2 01             	add    $0x1,%edx
 5e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 5ea:	0f be 02             	movsbl (%edx),%eax
 5ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f0:	80 fb 09             	cmp    $0x9,%bl
 5f3:	76 eb                	jbe    5e0 <atoi+0x20>
  return n;
}
 5f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f8:	89 c8                	mov    %ecx,%eax
 5fa:	c9                   	leave  
 5fb:	c3                   	ret    
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000600 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	8b 45 10             	mov    0x10(%ebp),%eax
 607:	8b 55 08             	mov    0x8(%ebp),%edx
 60a:	56                   	push   %esi
 60b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 60e:	85 c0                	test   %eax,%eax
 610:	7e 13                	jle    625 <memmove+0x25>
 612:	01 d0                	add    %edx,%eax
  dst = vdst;
 614:	89 d7                	mov    %edx,%edi
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 620:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 621:	39 f8                	cmp    %edi,%eax
 623:	75 fb                	jne    620 <memmove+0x20>
  return vdst;
}
 625:	5e                   	pop    %esi
 626:	89 d0                	mov    %edx,%eax
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop

00000630 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 636:	68 00 20 00 00       	push   $0x2000
 63b:	e8 30 04 00 00       	call   a70 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 640:	50                   	push   %eax
 641:	ff 75 10             	push   0x10(%ebp)
 644:	ff 75 0c             	push   0xc(%ebp)
 647:	ff 75 08             	push   0x8(%ebp)
 64a:	e8 27 01 00 00       	call   776 <clone>

  return pid;
}
 64f:	c9                   	leave  
 650:	c3                   	ret    
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 658:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop

00000660 <thread_join>:

int thread_join()
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 667:	6a 04                	push   $0x4
 669:	e8 02 04 00 00       	call   a70 <malloc>
 66e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 671:	8d 45 f4             	lea    -0xc(%ebp),%eax
 674:	89 04 24             	mov    %eax,(%esp)
 677:	e8 02 01 00 00       	call   77e <join>
 67c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 67e:	58                   	pop    %eax
 67f:	ff 75 f4             	push   -0xc(%ebp)
 682:	e8 59 03 00 00       	call   9e0 <free>
  lock_release(&lock);

  return pid;
}
 687:	89 d8                	mov    %ebx,%eax
 689:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 68c:	c9                   	leave  
 68d:	c3                   	ret    
 68e:	66 90                	xchg   %ax,%ax

00000690 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 696:	83 38 01             	cmpl   $0x1,(%eax)
 699:	75 05                	jne    6a0 <lock_acquire+0x10>
 69b:	eb fe                	jmp    69b <lock_acquire+0xb>
 69d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 6a0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop

000006b0 <lock_release>:
void lock_release(lock_t *lock)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 6bc:	5d                   	pop    %ebp
 6bd:	c3                   	ret    
 6be:	66 90                	xchg   %ax,%ax

000006c0 <lock_init>:
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	8b 45 08             	mov    0x8(%ebp),%eax
 6c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 6cc:	5d                   	pop    %ebp
 6cd:	c3                   	ret    

000006ce <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ce:	b8 01 00 00 00       	mov    $0x1,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <exit>:
SYSCALL(exit)
 6d6:	b8 02 00 00 00       	mov    $0x2,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <wait>:
SYSCALL(wait)
 6de:	b8 03 00 00 00       	mov    $0x3,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <pipe>:
SYSCALL(pipe)
 6e6:	b8 04 00 00 00       	mov    $0x4,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <read>:
SYSCALL(read)
 6ee:	b8 05 00 00 00       	mov    $0x5,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <write>:
SYSCALL(write)
 6f6:	b8 10 00 00 00       	mov    $0x10,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <close>:
SYSCALL(close)
 6fe:	b8 15 00 00 00       	mov    $0x15,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <kill>:
SYSCALL(kill)
 706:	b8 06 00 00 00       	mov    $0x6,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <exec>:
SYSCALL(exec)
 70e:	b8 07 00 00 00       	mov    $0x7,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <open>:
SYSCALL(open)
 716:	b8 0f 00 00 00       	mov    $0xf,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret    

0000071e <mknod>:
SYSCALL(mknod)
 71e:	b8 11 00 00 00       	mov    $0x11,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret    

00000726 <unlink>:
SYSCALL(unlink)
 726:	b8 12 00 00 00       	mov    $0x12,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret    

0000072e <fstat>:
SYSCALL(fstat)
 72e:	b8 08 00 00 00       	mov    $0x8,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret    

00000736 <link>:
SYSCALL(link)
 736:	b8 13 00 00 00       	mov    $0x13,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <mkdir>:
SYSCALL(mkdir)
 73e:	b8 14 00 00 00       	mov    $0x14,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <chdir>:
SYSCALL(chdir)
 746:	b8 09 00 00 00       	mov    $0x9,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <dup>:
SYSCALL(dup)
 74e:	b8 0a 00 00 00       	mov    $0xa,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <getpid>:
SYSCALL(getpid)
 756:	b8 0b 00 00 00       	mov    $0xb,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret    

0000075e <sbrk>:
SYSCALL(sbrk)
 75e:	b8 0c 00 00 00       	mov    $0xc,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret    

00000766 <sleep>:
SYSCALL(sleep)
 766:	b8 0d 00 00 00       	mov    $0xd,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret    

0000076e <uptime>:
SYSCALL(uptime)
 76e:	b8 0e 00 00 00       	mov    $0xe,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret    

00000776 <clone>:
SYSCALL(clone)
 776:	b8 16 00 00 00       	mov    $0x16,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret    

0000077e <join>:
 77e:	b8 17 00 00 00       	mov    $0x17,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret    
 786:	66 90                	xchg   %ax,%ax
 788:	66 90                	xchg   %ax,%ax
 78a:	66 90                	xchg   %ax,%ax
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax

00000790 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 3c             	sub    $0x3c,%esp
 799:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 79c:	89 d1                	mov    %edx,%ecx
{
 79e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 7a1:	85 d2                	test   %edx,%edx
 7a3:	0f 89 7f 00 00 00    	jns    828 <printint+0x98>
 7a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7ad:	74 79                	je     828 <printint+0x98>
    neg = 1;
 7af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 7b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 7b8:	31 db                	xor    %ebx,%ebx
 7ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7c0:	89 c8                	mov    %ecx,%eax
 7c2:	31 d2                	xor    %edx,%edx
 7c4:	89 cf                	mov    %ecx,%edi
 7c6:	f7 75 c4             	divl   -0x3c(%ebp)
 7c9:	0f b6 92 60 0c 00 00 	movzbl 0xc60(%edx),%edx
 7d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7d3:	89 d8                	mov    %ebx,%eax
 7d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7e1:	76 dd                	jbe    7c0 <printint+0x30>
  if(neg)
 7e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7e6:	85 c9                	test   %ecx,%ecx
 7e8:	74 0c                	je     7f6 <printint+0x66>
    buf[i++] = '-';
 7ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7fd:	eb 07                	jmp    806 <printint+0x76>
 7ff:	90                   	nop
    putc(fd, buf[i]);
 800:	0f b6 13             	movzbl (%ebx),%edx
 803:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 806:	83 ec 04             	sub    $0x4,%esp
 809:	88 55 d7             	mov    %dl,-0x29(%ebp)
 80c:	6a 01                	push   $0x1
 80e:	56                   	push   %esi
 80f:	57                   	push   %edi
 810:	e8 e1 fe ff ff       	call   6f6 <write>
  while(--i >= 0)
 815:	83 c4 10             	add    $0x10,%esp
 818:	39 de                	cmp    %ebx,%esi
 81a:	75 e4                	jne    800 <printint+0x70>
}
 81c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 81f:	5b                   	pop    %ebx
 820:	5e                   	pop    %esi
 821:	5f                   	pop    %edi
 822:	5d                   	pop    %ebp
 823:	c3                   	ret    
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 828:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 82f:	eb 87                	jmp    7b8 <printint+0x28>
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop

00000840 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	57                   	push   %edi
 844:	56                   	push   %esi
 845:	53                   	push   %ebx
 846:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 849:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 84c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 84f:	0f b6 13             	movzbl (%ebx),%edx
 852:	84 d2                	test   %dl,%dl
 854:	74 6a                	je     8c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 856:	8d 45 10             	lea    0x10(%ebp),%eax
 859:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 85c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 85f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 861:	89 45 d0             	mov    %eax,-0x30(%ebp)
 864:	eb 36                	jmp    89c <printf+0x5c>
 866:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86d:	8d 76 00             	lea    0x0(%esi),%esi
 870:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 873:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 878:	83 f8 25             	cmp    $0x25,%eax
 87b:	74 15                	je     892 <printf+0x52>
  write(fd, &c, 1);
 87d:	83 ec 04             	sub    $0x4,%esp
 880:	88 55 e7             	mov    %dl,-0x19(%ebp)
 883:	6a 01                	push   $0x1
 885:	57                   	push   %edi
 886:	56                   	push   %esi
 887:	e8 6a fe ff ff       	call   6f6 <write>
 88c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 88f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 892:	0f b6 13             	movzbl (%ebx),%edx
 895:	83 c3 01             	add    $0x1,%ebx
 898:	84 d2                	test   %dl,%dl
 89a:	74 24                	je     8c0 <printf+0x80>
    c = fmt[i] & 0xff;
 89c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 89f:	85 c9                	test   %ecx,%ecx
 8a1:	74 cd                	je     870 <printf+0x30>
      }
    } else if(state == '%'){
 8a3:	83 f9 25             	cmp    $0x25,%ecx
 8a6:	75 ea                	jne    892 <printf+0x52>
      if(c == 'd'){
 8a8:	83 f8 25             	cmp    $0x25,%eax
 8ab:	0f 84 07 01 00 00    	je     9b8 <printf+0x178>
 8b1:	83 e8 63             	sub    $0x63,%eax
 8b4:	83 f8 15             	cmp    $0x15,%eax
 8b7:	77 17                	ja     8d0 <printf+0x90>
 8b9:	ff 24 85 08 0c 00 00 	jmp    *0xc08(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
 8c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
  write(fd, &c, 1);
 8d0:	83 ec 04             	sub    $0x4,%esp
 8d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 8d6:	6a 01                	push   $0x1
 8d8:	57                   	push   %edi
 8d9:	56                   	push   %esi
 8da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8de:	e8 13 fe ff ff       	call   6f6 <write>
        putc(fd, c);
 8e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 8e7:	83 c4 0c             	add    $0xc,%esp
 8ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8ed:	6a 01                	push   $0x1
 8ef:	57                   	push   %edi
 8f0:	56                   	push   %esi
 8f1:	e8 00 fe ff ff       	call   6f6 <write>
        putc(fd, c);
 8f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8f9:	31 c9                	xor    %ecx,%ecx
 8fb:	eb 95                	jmp    892 <printf+0x52>
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	b9 10 00 00 00       	mov    $0x10,%ecx
 908:	6a 00                	push   $0x0
 90a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 90d:	8b 10                	mov    (%eax),%edx
 90f:	89 f0                	mov    %esi,%eax
 911:	e8 7a fe ff ff       	call   790 <printint>
        ap++;
 916:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 91a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91d:	31 c9                	xor    %ecx,%ecx
 91f:	e9 6e ff ff ff       	jmp    892 <printf+0x52>
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 928:	8b 45 d0             	mov    -0x30(%ebp),%eax
 92b:	8b 10                	mov    (%eax),%edx
        ap++;
 92d:	83 c0 04             	add    $0x4,%eax
 930:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 933:	85 d2                	test   %edx,%edx
 935:	0f 84 8d 00 00 00    	je     9c8 <printf+0x188>
        while(*s != 0){
 93b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 93e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 940:	84 c0                	test   %al,%al
 942:	0f 84 4a ff ff ff    	je     892 <printf+0x52>
 948:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 94b:	89 d3                	mov    %edx,%ebx
 94d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 950:	83 ec 04             	sub    $0x4,%esp
          s++;
 953:	83 c3 01             	add    $0x1,%ebx
 956:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 959:	6a 01                	push   $0x1
 95b:	57                   	push   %edi
 95c:	56                   	push   %esi
 95d:	e8 94 fd ff ff       	call   6f6 <write>
        while(*s != 0){
 962:	0f b6 03             	movzbl (%ebx),%eax
 965:	83 c4 10             	add    $0x10,%esp
 968:	84 c0                	test   %al,%al
 96a:	75 e4                	jne    950 <printf+0x110>
      state = 0;
 96c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 96f:	31 c9                	xor    %ecx,%ecx
 971:	e9 1c ff ff ff       	jmp    892 <printf+0x52>
 976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 980:	83 ec 0c             	sub    $0xc,%esp
 983:	b9 0a 00 00 00       	mov    $0xa,%ecx
 988:	6a 01                	push   $0x1
 98a:	e9 7b ff ff ff       	jmp    90a <printf+0xca>
 98f:	90                   	nop
        putc(fd, *ap);
 990:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 993:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 996:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 998:	6a 01                	push   $0x1
 99a:	57                   	push   %edi
 99b:	56                   	push   %esi
        putc(fd, *ap);
 99c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 99f:	e8 52 fd ff ff       	call   6f6 <write>
        ap++;
 9a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9ab:	31 c9                	xor    %ecx,%ecx
 9ad:	e9 e0 fe ff ff       	jmp    892 <printf+0x52>
 9b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 9b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 9bb:	83 ec 04             	sub    $0x4,%esp
 9be:	e9 2a ff ff ff       	jmp    8ed <printf+0xad>
 9c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9c7:	90                   	nop
          s = "(null)";
 9c8:	ba 00 0c 00 00       	mov    $0xc00,%edx
        while(*s != 0){
 9cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 9d0:	b8 28 00 00 00       	mov    $0x28,%eax
 9d5:	89 d3                	mov    %edx,%ebx
 9d7:	e9 74 ff ff ff       	jmp    950 <printf+0x110>
 9dc:	66 90                	xchg   %ax,%ax
 9de:	66 90                	xchg   %ax,%ax

000009e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e1:	a1 08 10 00 00       	mov    0x1008,%eax
{
 9e6:	89 e5                	mov    %esp,%ebp
 9e8:	57                   	push   %edi
 9e9:	56                   	push   %esi
 9ea:	53                   	push   %ebx
 9eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9f8:	89 c2                	mov    %eax,%edx
 9fa:	8b 00                	mov    (%eax),%eax
 9fc:	39 ca                	cmp    %ecx,%edx
 9fe:	73 30                	jae    a30 <free+0x50>
 a00:	39 c1                	cmp    %eax,%ecx
 a02:	72 04                	jb     a08 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a04:	39 c2                	cmp    %eax,%edx
 a06:	72 f0                	jb     9f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a08:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a0b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a0e:	39 f8                	cmp    %edi,%eax
 a10:	74 30                	je     a42 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a12:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a15:	8b 42 04             	mov    0x4(%edx),%eax
 a18:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a1b:	39 f1                	cmp    %esi,%ecx
 a1d:	74 3a                	je     a59 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a1f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a21:	5b                   	pop    %ebx
  freep = p;
 a22:	89 15 08 10 00 00    	mov    %edx,0x1008
}
 a28:	5e                   	pop    %esi
 a29:	5f                   	pop    %edi
 a2a:	5d                   	pop    %ebp
 a2b:	c3                   	ret    
 a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a30:	39 c2                	cmp    %eax,%edx
 a32:	72 c4                	jb     9f8 <free+0x18>
 a34:	39 c1                	cmp    %eax,%ecx
 a36:	73 c0                	jae    9f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a38:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a3b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a3e:	39 f8                	cmp    %edi,%eax
 a40:	75 d0                	jne    a12 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a42:	03 70 04             	add    0x4(%eax),%esi
 a45:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a48:	8b 02                	mov    (%edx),%eax
 a4a:	8b 00                	mov    (%eax),%eax
 a4c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a4f:	8b 42 04             	mov    0x4(%edx),%eax
 a52:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a55:	39 f1                	cmp    %esi,%ecx
 a57:	75 c6                	jne    a1f <free+0x3f>
    p->s.size += bp->s.size;
 a59:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a5c:	89 15 08 10 00 00    	mov    %edx,0x1008
    p->s.size += bp->s.size;
 a62:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a65:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a68:	89 0a                	mov    %ecx,(%edx)
}
 a6a:	5b                   	pop    %ebx
 a6b:	5e                   	pop    %esi
 a6c:	5f                   	pop    %edi
 a6d:	5d                   	pop    %ebp
 a6e:	c3                   	ret    
 a6f:	90                   	nop

00000a70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	57                   	push   %edi
 a74:	56                   	push   %esi
 a75:	53                   	push   %ebx
 a76:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a79:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a7c:	8b 3d 08 10 00 00    	mov    0x1008,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a82:	8d 70 07             	lea    0x7(%eax),%esi
 a85:	c1 ee 03             	shr    $0x3,%esi
 a88:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a8b:	85 ff                	test   %edi,%edi
 a8d:	0f 84 9d 00 00 00    	je     b30 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a93:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a95:	8b 4a 04             	mov    0x4(%edx),%ecx
 a98:	39 f1                	cmp    %esi,%ecx
 a9a:	73 6a                	jae    b06 <malloc+0x96>
 a9c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 aa1:	39 de                	cmp    %ebx,%esi
 aa3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 aa6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 aad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 ab0:	eb 17                	jmp    ac9 <malloc+0x59>
 ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 aba:	8b 48 04             	mov    0x4(%eax),%ecx
 abd:	39 f1                	cmp    %esi,%ecx
 abf:	73 4f                	jae    b10 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac1:	8b 3d 08 10 00 00    	mov    0x1008,%edi
 ac7:	89 c2                	mov    %eax,%edx
 ac9:	39 d7                	cmp    %edx,%edi
 acb:	75 eb                	jne    ab8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 acd:	83 ec 0c             	sub    $0xc,%esp
 ad0:	ff 75 e4             	push   -0x1c(%ebp)
 ad3:	e8 86 fc ff ff       	call   75e <sbrk>
  if(p == (char*)-1)
 ad8:	83 c4 10             	add    $0x10,%esp
 adb:	83 f8 ff             	cmp    $0xffffffff,%eax
 ade:	74 1c                	je     afc <malloc+0x8c>
  hp->s.size = nu;
 ae0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ae3:	83 ec 0c             	sub    $0xc,%esp
 ae6:	83 c0 08             	add    $0x8,%eax
 ae9:	50                   	push   %eax
 aea:	e8 f1 fe ff ff       	call   9e0 <free>
  return freep;
 aef:	8b 15 08 10 00 00    	mov    0x1008,%edx
      if((p = morecore(nunits)) == 0)
 af5:	83 c4 10             	add    $0x10,%esp
 af8:	85 d2                	test   %edx,%edx
 afa:	75 bc                	jne    ab8 <malloc+0x48>
        return 0;
  }
}
 afc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 aff:	31 c0                	xor    %eax,%eax
}
 b01:	5b                   	pop    %ebx
 b02:	5e                   	pop    %esi
 b03:	5f                   	pop    %edi
 b04:	5d                   	pop    %ebp
 b05:	c3                   	ret    
    if(p->s.size >= nunits){
 b06:	89 d0                	mov    %edx,%eax
 b08:	89 fa                	mov    %edi,%edx
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b10:	39 ce                	cmp    %ecx,%esi
 b12:	74 4c                	je     b60 <malloc+0xf0>
        p->s.size -= nunits;
 b14:	29 f1                	sub    %esi,%ecx
 b16:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b19:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b1c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b1f:	89 15 08 10 00 00    	mov    %edx,0x1008
}
 b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b28:	83 c0 08             	add    $0x8,%eax
}
 b2b:	5b                   	pop    %ebx
 b2c:	5e                   	pop    %esi
 b2d:	5f                   	pop    %edi
 b2e:	5d                   	pop    %ebp
 b2f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 b30:	c7 05 08 10 00 00 0c 	movl   $0x100c,0x1008
 b37:	10 00 00 
    base.s.size = 0;
 b3a:	bf 0c 10 00 00       	mov    $0x100c,%edi
    base.s.ptr = freep = prevp = &base;
 b3f:	c7 05 0c 10 00 00 0c 	movl   $0x100c,0x100c
 b46:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b49:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b4b:	c7 05 10 10 00 00 00 	movl   $0x0,0x1010
 b52:	00 00 00 
    if(p->s.size >= nunits){
 b55:	e9 42 ff ff ff       	jmp    a9c <malloc+0x2c>
 b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b60:	8b 08                	mov    (%eax),%ecx
 b62:	89 0a                	mov    %ecx,(%edx)
 b64:	eb b9                	jmp    b1f <malloc+0xaf>
