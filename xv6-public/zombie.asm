
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 64 02 00 00       	call   27a <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 63 02 00 00       	call   282 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 e9 02 00 00       	call   312 <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	56                   	push   %esi
  32:	53                   	push   %ebx
  33:	8b 75 08             	mov    0x8(%ebp),%esi
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  39:	89 f0                	mov    %esi,%eax
  3b:	89 d1                	mov    %edx,%ecx
  3d:	83 c2 01             	add    $0x1,%edx
  40:	89 c3                	mov    %eax,%ebx
  42:	83 c0 01             	add    $0x1,%eax
  45:	0f b6 09             	movzbl (%ecx),%ecx
  48:	88 0b                	mov    %cl,(%ebx)
  4a:	84 c9                	test   %cl,%cl
  4c:	75 ed                	jne    3b <strcpy+0xd>
    ;
  return os;
}
  4e:	89 f0                	mov    %esi,%eax
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    

00000054 <strcmp>:

int strcmp(const char *p, const char *q)
{
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
  5d:	eb 06                	jmp    65 <strcmp+0x11>
    p++, q++;
  5f:	83 c1 01             	add    $0x1,%ecx
  62:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  65:	0f b6 01             	movzbl (%ecx),%eax
  68:	84 c0                	test   %al,%al
  6a:	74 04                	je     70 <strcmp+0x1c>
  6c:	3a 02                	cmp    (%edx),%al
  6e:	74 ef                	je     5f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  70:	0f b6 c0             	movzbl %al,%eax
  73:	0f b6 12             	movzbl (%edx),%edx
  76:	29 d0                	sub    %edx,%eax
}
  78:	5d                   	pop    %ebp
  79:	c3                   	ret    

0000007a <strlen>:

uint strlen(const char *s)
{
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
  80:	b8 00 00 00 00       	mov    $0x0,%eax
  85:	eb 03                	jmp    8a <strlen+0x10>
  87:	83 c0 01             	add    $0x1,%eax
  8a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8e:	75 f7                	jne    87 <strlen+0xd>
    ;
  return n;
}
  90:	5d                   	pop    %ebp
  91:	c3                   	ret    

00000092 <memset>:

void *
memset(void *dst, int c, uint n)
{
  92:	55                   	push   %ebp
  93:	89 e5                	mov    %esp,%ebp
  95:	57                   	push   %edi
  96:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  99:	89 d7                	mov    %edx,%edi
  9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  a1:	fc                   	cld    
  a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  a4:	89 d0                	mov    %edx,%eax
  a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
  a9:	c9                   	leave  
  aa:	c3                   	ret    

000000ab <strchr>:

char *
strchr(const char *s, char c)
{
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
  b5:	eb 03                	jmp    ba <strchr+0xf>
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	0f b6 10             	movzbl (%eax),%edx
  bd:	84 d2                	test   %dl,%dl
  bf:	74 06                	je     c7 <strchr+0x1c>
    if (*s == c)
  c1:	38 ca                	cmp    %cl,%dl
  c3:	75 f2                	jne    b7 <strchr+0xc>
  c5:	eb 05                	jmp    cc <strchr+0x21>
      return (char *)s;
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    

000000ce <gets>:

char *
gets(char *buf, int max)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	57                   	push   %edi
  d2:	56                   	push   %esi
  d3:	53                   	push   %ebx
  d4:	83 ec 1c             	sub    $0x1c,%esp
  d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  da:	bb 00 00 00 00       	mov    $0x0,%ebx
  df:	89 de                	mov    %ebx,%esi
  e1:	83 c3 01             	add    $0x1,%ebx
  e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  e7:	7d 2e                	jge    117 <gets+0x49>
  {
    cc = read(0, &c, 1);
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	6a 01                	push   $0x1
  ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
  f1:	50                   	push   %eax
  f2:	6a 00                	push   $0x0
  f4:	e8 a1 01 00 00       	call   29a <read>
    if (cc < 1)
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	85 c0                	test   %eax,%eax
  fe:	7e 17                	jle    117 <gets+0x49>
      break;
    buf[i++] = c;
 100:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 104:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c2             	sete   %dl
 10c:	3c 0d                	cmp    $0xd,%al
 10e:	0f 94 c0             	sete   %al
 111:	08 c2                	or     %al,%dl
 113:	74 ca                	je     df <gets+0x11>
    buf[i++] = c;
 115:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 117:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 11b:	89 f8                	mov    %edi,%eax
 11d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <stat>:

int stat(const char *n, struct stat *st)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 12a:	83 ec 08             	sub    $0x8,%esp
 12d:	6a 00                	push   $0x0
 12f:	ff 75 08             	push   0x8(%ebp)
 132:	e8 8b 01 00 00       	call   2c2 <open>
  if (fd < 0)
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	78 24                	js     162 <stat+0x3d>
 13e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 140:	83 ec 08             	sub    $0x8,%esp
 143:	ff 75 0c             	push   0xc(%ebp)
 146:	50                   	push   %eax
 147:	e8 8e 01 00 00       	call   2da <fstat>
 14c:	89 c6                	mov    %eax,%esi
  close(fd);
 14e:	89 1c 24             	mov    %ebx,(%esp)
 151:	e8 54 01 00 00       	call   2aa <close>
  return r;
 156:	83 c4 10             	add    $0x10,%esp
}
 159:	89 f0                	mov    %esi,%eax
 15b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15e:	5b                   	pop    %ebx
 15f:	5e                   	pop    %esi
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    
    return -1;
 162:	be ff ff ff ff       	mov    $0xffffffff,%esi
 167:	eb f0                	jmp    159 <stat+0x34>

00000169 <atoi>:

int atoi(const char *s)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	53                   	push   %ebx
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 170:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 175:	eb 10                	jmp    187 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 177:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 17a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 17d:	83 c1 01             	add    $0x1,%ecx
 180:	0f be c0             	movsbl %al,%eax
 183:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 187:	0f b6 01             	movzbl (%ecx),%eax
 18a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 18d:	80 fb 09             	cmp    $0x9,%bl
 190:	76 e5                	jbe    177 <atoi+0xe>
  return n;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	8b 75 08             	mov    0x8(%ebp),%esi
 1a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 1a9:	eb 0d                	jmp    1b8 <memmove+0x1f>
    *dst++ = *src++;
 1ab:	0f b6 01             	movzbl (%ecx),%eax
 1ae:	88 02                	mov    %al,(%edx)
 1b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 1b3:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 1b6:	89 d8                	mov    %ebx,%eax
 1b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7f ec                	jg     1ab <memmove+0x12>
  return vdst;
}
 1bf:	89 f0                	mov    %esi,%eax
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 1cb:	83 38 01             	cmpl   $0x1,(%eax)
 1ce:	74 fb                	je     1cb <lock_acquire+0x6>
    ;
  lock->flag = 1;
 1d0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <lock_release>:
void lock_release(lock_t *lock)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e4:	5d                   	pop    %ebp
 1e5:	c3                   	ret    

000001e6 <lock_init>:
void lock_init(lock_t *lock)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    

000001f4 <thread_create>:
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	53                   	push   %ebx
 1f8:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 1fb:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 1fe:	53                   	push   %ebx
 1ff:	e8 e2 ff ff ff       	call   1e6 <lock_init>
  lock_acquire(&lock);
 204:	89 1c 24             	mov    %ebx,(%esp)
 207:	e8 b9 ff ff ff       	call   1c5 <lock_acquire>
  void *stack = malloc(4096 * 2);
 20c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 213:	e8 e5 03 00 00       	call   5fd <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 218:	50                   	push   %eax
 219:	ff 75 10             	push   0x10(%ebp)
 21c:	ff 75 0c             	push   0xc(%ebp)
 21f:	ff 75 08             	push   0x8(%ebp)
 222:	e8 fb 00 00 00       	call   322 <clone>
}
 227:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 22a:	c9                   	leave  
 22b:	c3                   	ret    

0000022c <thread_join>:
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	56                   	push   %esi
 230:	53                   	push   %ebx
 231:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 234:	6a 04                	push   $0x4
 236:	e8 c2 03 00 00       	call   5fd <malloc>
 23b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 23e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 241:	89 04 24             	mov    %eax,(%esp)
 244:	e8 e1 00 00 00       	call   32a <join>
 249:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 24b:	8d 75 f0             	lea    -0x10(%ebp),%esi
 24e:	89 34 24             	mov    %esi,(%esp)
 251:	e8 90 ff ff ff       	call   1e6 <lock_init>
  lock_acquire(&lock);
 256:	89 34 24             	mov    %esi,(%esp)
 259:	e8 67 ff ff ff       	call   1c5 <lock_acquire>
  free(stack);
 25e:	83 c4 04             	add    $0x4,%esp
 261:	ff 75 f4             	push   -0xc(%ebp)
 264:	e8 d4 02 00 00       	call   53d <free>
  lock_release(&lock);
 269:	89 34 24             	mov    %esi,(%esp)
 26c:	e8 67 ff ff ff       	call   1d8 <lock_release>
}
 271:	89 d8                	mov    %ebx,%eax
 273:	8d 65 f8             	lea    -0x8(%ebp),%esp
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27a:	b8 01 00 00 00       	mov    $0x1,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <exit>:
SYSCALL(exit)
 282:	b8 02 00 00 00       	mov    $0x2,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <wait>:
SYSCALL(wait)
 28a:	b8 03 00 00 00       	mov    $0x3,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <pipe>:
SYSCALL(pipe)
 292:	b8 04 00 00 00       	mov    $0x4,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <read>:
SYSCALL(read)
 29a:	b8 05 00 00 00       	mov    $0x5,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <write>:
SYSCALL(write)
 2a2:	b8 10 00 00 00       	mov    $0x10,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <close>:
SYSCALL(close)
 2aa:	b8 15 00 00 00       	mov    $0x15,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <kill>:
SYSCALL(kill)
 2b2:	b8 06 00 00 00       	mov    $0x6,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <exec>:
SYSCALL(exec)
 2ba:	b8 07 00 00 00       	mov    $0x7,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <open>:
SYSCALL(open)
 2c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <mknod>:
SYSCALL(mknod)
 2ca:	b8 11 00 00 00       	mov    $0x11,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <unlink>:
SYSCALL(unlink)
 2d2:	b8 12 00 00 00       	mov    $0x12,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <fstat>:
SYSCALL(fstat)
 2da:	b8 08 00 00 00       	mov    $0x8,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <link>:
SYSCALL(link)
 2e2:	b8 13 00 00 00       	mov    $0x13,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mkdir>:
SYSCALL(mkdir)
 2ea:	b8 14 00 00 00       	mov    $0x14,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <chdir>:
SYSCALL(chdir)
 2f2:	b8 09 00 00 00       	mov    $0x9,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <dup>:
SYSCALL(dup)
 2fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <getpid>:
SYSCALL(getpid)
 302:	b8 0b 00 00 00       	mov    $0xb,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sbrk>:
SYSCALL(sbrk)
 30a:	b8 0c 00 00 00       	mov    $0xc,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <sleep>:
SYSCALL(sleep)
 312:	b8 0d 00 00 00       	mov    $0xd,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <uptime>:
SYSCALL(uptime)
 31a:	b8 0e 00 00 00       	mov    $0xe,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <clone>:
SYSCALL(clone)
 322:	b8 16 00 00 00       	mov    $0x16,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <join>:
 32a:	b8 17 00 00 00       	mov    $0x17,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 1c             	sub    $0x1c,%esp
 338:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 33b:	6a 01                	push   $0x1
 33d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 340:	52                   	push   %edx
 341:	50                   	push   %eax
 342:	e8 5b ff ff ff       	call   2a2 <write>
}
 347:	83 c4 10             	add    $0x10,%esp
 34a:	c9                   	leave  
 34b:	c3                   	ret    

0000034c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34c:	55                   	push   %ebp
 34d:	89 e5                	mov    %esp,%ebp
 34f:	57                   	push   %edi
 350:	56                   	push   %esi
 351:	53                   	push   %ebx
 352:	83 ec 2c             	sub    $0x2c,%esp
 355:	89 45 d0             	mov    %eax,-0x30(%ebp)
 358:	89 d0                	mov    %edx,%eax
 35a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 35c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 360:	0f 95 c1             	setne  %cl
 363:	c1 ea 1f             	shr    $0x1f,%edx
 366:	84 d1                	test   %dl,%cl
 368:	74 44                	je     3ae <printint+0x62>
    neg = 1;
    x = -xx;
 36a:	f7 d8                	neg    %eax
 36c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 36e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 375:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 37a:	89 c8                	mov    %ecx,%eax
 37c:	ba 00 00 00 00       	mov    $0x0,%edx
 381:	f7 f6                	div    %esi
 383:	89 df                	mov    %ebx,%edi
 385:	83 c3 01             	add    $0x1,%ebx
 388:	0f b6 92 e4 06 00 00 	movzbl 0x6e4(%edx),%edx
 38f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 393:	89 ca                	mov    %ecx,%edx
 395:	89 c1                	mov    %eax,%ecx
 397:	39 d6                	cmp    %edx,%esi
 399:	76 df                	jbe    37a <printint+0x2e>
  if(neg)
 39b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 39f:	74 31                	je     3d2 <printint+0x86>
    buf[i++] = '-';
 3a1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3a6:	8d 5f 02             	lea    0x2(%edi),%ebx
 3a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ac:	eb 17                	jmp    3c5 <printint+0x79>
    x = xx;
 3ae:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3b7:	eb bc                	jmp    375 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3b9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3be:	89 f0                	mov    %esi,%eax
 3c0:	e8 6d ff ff ff       	call   332 <putc>
  while(--i >= 0)
 3c5:	83 eb 01             	sub    $0x1,%ebx
 3c8:	79 ef                	jns    3b9 <printint+0x6d>
}
 3ca:	83 c4 2c             	add    $0x2c,%esp
 3cd:	5b                   	pop    %ebx
 3ce:	5e                   	pop    %esi
 3cf:	5f                   	pop    %edi
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    
 3d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d5:	eb ee                	jmp    3c5 <printint+0x79>

000003d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	57                   	push   %edi
 3db:	56                   	push   %esi
 3dc:	53                   	push   %ebx
 3dd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e0:	8d 45 10             	lea    0x10(%ebp),%eax
 3e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3e6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f0:	eb 14                	jmp    406 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f2:	89 fa                	mov    %edi,%edx
 3f4:	8b 45 08             	mov    0x8(%ebp),%eax
 3f7:	e8 36 ff ff ff       	call   332 <putc>
 3fc:	eb 05                	jmp    403 <printf+0x2c>
      }
    } else if(state == '%'){
 3fe:	83 fe 25             	cmp    $0x25,%esi
 401:	74 25                	je     428 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 403:	83 c3 01             	add    $0x1,%ebx
 406:	8b 45 0c             	mov    0xc(%ebp),%eax
 409:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 40d:	84 c0                	test   %al,%al
 40f:	0f 84 20 01 00 00    	je     535 <printf+0x15e>
    c = fmt[i] & 0xff;
 415:	0f be f8             	movsbl %al,%edi
 418:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 41b:	85 f6                	test   %esi,%esi
 41d:	75 df                	jne    3fe <printf+0x27>
      if(c == '%'){
 41f:	83 f8 25             	cmp    $0x25,%eax
 422:	75 ce                	jne    3f2 <printf+0x1b>
        state = '%';
 424:	89 c6                	mov    %eax,%esi
 426:	eb db                	jmp    403 <printf+0x2c>
      if(c == 'd'){
 428:	83 f8 25             	cmp    $0x25,%eax
 42b:	0f 84 cf 00 00 00    	je     500 <printf+0x129>
 431:	0f 8c dd 00 00 00    	jl     514 <printf+0x13d>
 437:	83 f8 78             	cmp    $0x78,%eax
 43a:	0f 8f d4 00 00 00    	jg     514 <printf+0x13d>
 440:	83 f8 63             	cmp    $0x63,%eax
 443:	0f 8c cb 00 00 00    	jl     514 <printf+0x13d>
 449:	83 e8 63             	sub    $0x63,%eax
 44c:	83 f8 15             	cmp    $0x15,%eax
 44f:	0f 87 bf 00 00 00    	ja     514 <printf+0x13d>
 455:	ff 24 85 8c 06 00 00 	jmp    *0x68c(,%eax,4)
        printint(fd, *ap, 10, 1);
 45c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45f:	8b 17                	mov    (%edi),%edx
 461:	83 ec 0c             	sub    $0xc,%esp
 464:	6a 01                	push   $0x1
 466:	b9 0a 00 00 00       	mov    $0xa,%ecx
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	e8 d9 fe ff ff       	call   34c <printint>
        ap++;
 473:	83 c7 04             	add    $0x4,%edi
 476:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 479:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 47c:	be 00 00 00 00       	mov    $0x0,%esi
 481:	eb 80                	jmp    403 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 483:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 486:	8b 17                	mov    (%edi),%edx
 488:	83 ec 0c             	sub    $0xc,%esp
 48b:	6a 00                	push   $0x0
 48d:	b9 10 00 00 00       	mov    $0x10,%ecx
 492:	8b 45 08             	mov    0x8(%ebp),%eax
 495:	e8 b2 fe ff ff       	call   34c <printint>
        ap++;
 49a:	83 c7 04             	add    $0x4,%edi
 49d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a3:	be 00 00 00 00       	mov    $0x0,%esi
 4a8:	e9 56 ff ff ff       	jmp    403 <printf+0x2c>
        s = (char*)*ap;
 4ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b0:	8b 30                	mov    (%eax),%esi
        ap++;
 4b2:	83 c0 04             	add    $0x4,%eax
 4b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4b8:	85 f6                	test   %esi,%esi
 4ba:	75 15                	jne    4d1 <printf+0xfa>
          s = "(null)";
 4bc:	be 84 06 00 00       	mov    $0x684,%esi
 4c1:	eb 0e                	jmp    4d1 <printf+0xfa>
          putc(fd, *s);
 4c3:	0f be d2             	movsbl %dl,%edx
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	e8 64 fe ff ff       	call   332 <putc>
          s++;
 4ce:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d1:	0f b6 16             	movzbl (%esi),%edx
 4d4:	84 d2                	test   %dl,%dl
 4d6:	75 eb                	jne    4c3 <printf+0xec>
      state = 0;
 4d8:	be 00 00 00 00       	mov    $0x0,%esi
 4dd:	e9 21 ff ff ff       	jmp    403 <printf+0x2c>
        putc(fd, *ap);
 4e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e5:	0f be 17             	movsbl (%edi),%edx
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	e8 42 fe ff ff       	call   332 <putc>
        ap++;
 4f0:	83 c7 04             	add    $0x4,%edi
 4f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4f6:	be 00 00 00 00       	mov    $0x0,%esi
 4fb:	e9 03 ff ff ff       	jmp    403 <printf+0x2c>
        putc(fd, c);
 500:	89 fa                	mov    %edi,%edx
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	e8 28 fe ff ff       	call   332 <putc>
      state = 0;
 50a:	be 00 00 00 00       	mov    $0x0,%esi
 50f:	e9 ef fe ff ff       	jmp    403 <printf+0x2c>
        putc(fd, '%');
 514:	ba 25 00 00 00       	mov    $0x25,%edx
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	e8 11 fe ff ff       	call   332 <putc>
        putc(fd, c);
 521:	89 fa                	mov    %edi,%edx
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	e8 07 fe ff ff       	call   332 <putc>
      state = 0;
 52b:	be 00 00 00 00       	mov    $0x0,%esi
 530:	e9 ce fe ff ff       	jmp    403 <printf+0x2c>
    }
  }
}
 535:	8d 65 f4             	lea    -0xc(%ebp),%esp
 538:	5b                   	pop    %ebx
 539:	5e                   	pop    %esi
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    

0000053d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	57                   	push   %edi
 541:	56                   	push   %esi
 542:	53                   	push   %ebx
 543:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 546:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 549:	a1 30 0a 00 00       	mov    0xa30,%eax
 54e:	eb 02                	jmp    552 <free+0x15>
 550:	89 d0                	mov    %edx,%eax
 552:	39 c8                	cmp    %ecx,%eax
 554:	73 04                	jae    55a <free+0x1d>
 556:	39 08                	cmp    %ecx,(%eax)
 558:	77 12                	ja     56c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 55a:	8b 10                	mov    (%eax),%edx
 55c:	39 c2                	cmp    %eax,%edx
 55e:	77 f0                	ja     550 <free+0x13>
 560:	39 c8                	cmp    %ecx,%eax
 562:	72 08                	jb     56c <free+0x2f>
 564:	39 ca                	cmp    %ecx,%edx
 566:	77 04                	ja     56c <free+0x2f>
 568:	89 d0                	mov    %edx,%eax
 56a:	eb e6                	jmp    552 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 56c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 56f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 572:	8b 10                	mov    (%eax),%edx
 574:	39 d7                	cmp    %edx,%edi
 576:	74 19                	je     591 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 578:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57b:	8b 50 04             	mov    0x4(%eax),%edx
 57e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 581:	39 ce                	cmp    %ecx,%esi
 583:	74 1b                	je     5a0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 585:	89 08                	mov    %ecx,(%eax)
  freep = p;
 587:	a3 30 0a 00 00       	mov    %eax,0xa30
}
 58c:	5b                   	pop    %ebx
 58d:	5e                   	pop    %esi
 58e:	5f                   	pop    %edi
 58f:	5d                   	pop    %ebp
 590:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 591:	03 72 04             	add    0x4(%edx),%esi
 594:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 597:	8b 10                	mov    (%eax),%edx
 599:	8b 12                	mov    (%edx),%edx
 59b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 59e:	eb db                	jmp    57b <free+0x3e>
    p->s.size += bp->s.size;
 5a0:	03 53 fc             	add    -0x4(%ebx),%edx
 5a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5a6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5a9:	89 10                	mov    %edx,(%eax)
 5ab:	eb da                	jmp    587 <free+0x4a>

000005ad <morecore>:

static Header*
morecore(uint nu)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	53                   	push   %ebx
 5b1:	83 ec 04             	sub    $0x4,%esp
 5b4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5b6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5bb:	77 05                	ja     5c2 <morecore+0x15>
    nu = 4096;
 5bd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	50                   	push   %eax
 5cd:	e8 38 fd ff ff       	call   30a <sbrk>
  if(p == (char*)-1)
 5d2:	83 c4 10             	add    $0x10,%esp
 5d5:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d8:	74 1c                	je     5f6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5da:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5dd:	83 c0 08             	add    $0x8,%eax
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	50                   	push   %eax
 5e4:	e8 54 ff ff ff       	call   53d <free>
  return freep;
 5e9:	a1 30 0a 00 00       	mov    0xa30,%eax
 5ee:	83 c4 10             	add    $0x10,%esp
}
 5f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f4:	c9                   	leave  
 5f5:	c3                   	ret    
    return 0;
 5f6:	b8 00 00 00 00       	mov    $0x0,%eax
 5fb:	eb f4                	jmp    5f1 <morecore+0x44>

000005fd <malloc>:

void*
malloc(uint nbytes)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	53                   	push   %ebx
 601:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	8d 58 07             	lea    0x7(%eax),%ebx
 60a:	c1 eb 03             	shr    $0x3,%ebx
 60d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 610:	8b 0d 30 0a 00 00    	mov    0xa30,%ecx
 616:	85 c9                	test   %ecx,%ecx
 618:	74 04                	je     61e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 61a:	8b 01                	mov    (%ecx),%eax
 61c:	eb 4a                	jmp    668 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 61e:	c7 05 30 0a 00 00 34 	movl   $0xa34,0xa30
 625:	0a 00 00 
 628:	c7 05 34 0a 00 00 34 	movl   $0xa34,0xa34
 62f:	0a 00 00 
    base.s.size = 0;
 632:	c7 05 38 0a 00 00 00 	movl   $0x0,0xa38
 639:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 63c:	b9 34 0a 00 00       	mov    $0xa34,%ecx
 641:	eb d7                	jmp    61a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 643:	74 19                	je     65e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 645:	29 da                	sub    %ebx,%edx
 647:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 64a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 64d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 650:	89 0d 30 0a 00 00    	mov    %ecx,0xa30
      return (void*)(p + 1);
 656:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 659:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65c:	c9                   	leave  
 65d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 65e:	8b 10                	mov    (%eax),%edx
 660:	89 11                	mov    %edx,(%ecx)
 662:	eb ec                	jmp    650 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 664:	89 c1                	mov    %eax,%ecx
 666:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	39 da                	cmp    %ebx,%edx
 66d:	73 d4                	jae    643 <malloc+0x46>
    if(p == freep)
 66f:	39 05 30 0a 00 00    	cmp    %eax,0xa30
 675:	75 ed                	jne    664 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 677:	89 d8                	mov    %ebx,%eax
 679:	e8 2f ff ff ff       	call   5ad <morecore>
 67e:	85 c0                	test   %eax,%eax
 680:	75 e2                	jne    664 <malloc+0x67>
 682:	eb d5                	jmp    659 <malloc+0x5c>
