
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
    printf(2, "Usage: ln old new\n");
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 b4 06 00 00       	push   $0x6b4
  1f:	6a 02                	push   $0x2
  21:	e8 df 03 00 00       	call   405 <printf>
    exit();
  26:	e8 85 02 00 00       	call   2b0 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 d7 02 00 00       	call   310 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 6b 02 00 00       	call   2b0 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 c7 06 00 00       	push   $0x6c7
  50:	6a 02                	push   $0x2
  52:	e8 ae 03 00 00       	call   405 <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	56                   	push   %esi
  60:	53                   	push   %ebx
  61:	8b 75 08             	mov    0x8(%ebp),%esi
  64:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  67:	89 f0                	mov    %esi,%eax
  69:	89 d1                	mov    %edx,%ecx
  6b:	83 c2 01             	add    $0x1,%edx
  6e:	89 c3                	mov    %eax,%ebx
  70:	83 c0 01             	add    $0x1,%eax
  73:	0f b6 09             	movzbl (%ecx),%ecx
  76:	88 0b                	mov    %cl,(%ebx)
  78:	84 c9                	test   %cl,%cl
  7a:	75 ed                	jne    69 <strcpy+0xd>
    ;
  return os;
}
  7c:	89 f0                	mov    %esi,%eax
  7e:	5b                   	pop    %ebx
  7f:	5e                   	pop    %esi
  80:	5d                   	pop    %ebp
  81:	c3                   	ret    

00000082 <strcmp>:

int strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  85:	8b 4d 08             	mov    0x8(%ebp),%ecx
  88:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
  8b:	eb 06                	jmp    93 <strcmp+0x11>
    p++, q++;
  8d:	83 c1 01             	add    $0x1,%ecx
  90:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  93:	0f b6 01             	movzbl (%ecx),%eax
  96:	84 c0                	test   %al,%al
  98:	74 04                	je     9e <strcmp+0x1c>
  9a:	3a 02                	cmp    (%edx),%al
  9c:	74 ef                	je     8d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9e:	0f b6 c0             	movzbl %al,%eax
  a1:	0f b6 12             	movzbl (%edx),%edx
  a4:	29 d0                	sub    %edx,%eax
}
  a6:	5d                   	pop    %ebp
  a7:	c3                   	ret    

000000a8 <strlen>:

uint strlen(const char *s)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
  ae:	b8 00 00 00 00       	mov    $0x0,%eax
  b3:	eb 03                	jmp    b8 <strlen+0x10>
  b5:	83 c0 01             	add    $0x1,%eax
  b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bc:	75 f7                	jne    b5 <strlen+0xd>
    ;
  return n;
}
  be:	5d                   	pop    %ebp
  bf:	c3                   	ret    

000000c0 <memset>:

void *
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c7:	89 d7                	mov    %edx,%edi
  c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  cf:	fc                   	cld    
  d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d2:	89 d0                	mov    %edx,%eax
  d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d7:	c9                   	leave  
  d8:	c3                   	ret    

000000d9 <strchr>:

char *
strchr(const char *s, char c)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	8b 45 08             	mov    0x8(%ebp),%eax
  df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
  e3:	eb 03                	jmp    e8 <strchr+0xf>
  e5:	83 c0 01             	add    $0x1,%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	84 d2                	test   %dl,%dl
  ed:	74 06                	je     f5 <strchr+0x1c>
    if (*s == c)
  ef:	38 ca                	cmp    %cl,%dl
  f1:	75 f2                	jne    e5 <strchr+0xc>
  f3:	eb 05                	jmp    fa <strchr+0x21>
      return (char *)s;
  return 0;
  f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  fa:	5d                   	pop    %ebp
  fb:	c3                   	ret    

000000fc <gets>:

char *
gets(char *buf, int max)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	57                   	push   %edi
 100:	56                   	push   %esi
 101:	53                   	push   %ebx
 102:	83 ec 1c             	sub    $0x1c,%esp
 105:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 108:	bb 00 00 00 00       	mov    $0x0,%ebx
 10d:	89 de                	mov    %ebx,%esi
 10f:	83 c3 01             	add    $0x1,%ebx
 112:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 115:	7d 2e                	jge    145 <gets+0x49>
  {
    cc = read(0, &c, 1);
 117:	83 ec 04             	sub    $0x4,%esp
 11a:	6a 01                	push   $0x1
 11c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11f:	50                   	push   %eax
 120:	6a 00                	push   $0x0
 122:	e8 a1 01 00 00       	call   2c8 <read>
    if (cc < 1)
 127:	83 c4 10             	add    $0x10,%esp
 12a:	85 c0                	test   %eax,%eax
 12c:	7e 17                	jle    145 <gets+0x49>
      break;
    buf[i++] = c;
 12e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 132:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 135:	3c 0a                	cmp    $0xa,%al
 137:	0f 94 c2             	sete   %dl
 13a:	3c 0d                	cmp    $0xd,%al
 13c:	0f 94 c0             	sete   %al
 13f:	08 c2                	or     %al,%dl
 141:	74 ca                	je     10d <gets+0x11>
    buf[i++] = c;
 143:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 145:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 149:	89 f8                	mov    %edi,%eax
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14e:	5b                   	pop    %ebx
 14f:	5e                   	pop    %esi
 150:	5f                   	pop    %edi
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    

00000153 <stat>:

int stat(const char *n, struct stat *st)
{
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	56                   	push   %esi
 157:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	6a 00                	push   $0x0
 15d:	ff 75 08             	push   0x8(%ebp)
 160:	e8 8b 01 00 00       	call   2f0 <open>
  if (fd < 0)
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	78 24                	js     190 <stat+0x3d>
 16c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16e:	83 ec 08             	sub    $0x8,%esp
 171:	ff 75 0c             	push   0xc(%ebp)
 174:	50                   	push   %eax
 175:	e8 8e 01 00 00       	call   308 <fstat>
 17a:	89 c6                	mov    %eax,%esi
  close(fd);
 17c:	89 1c 24             	mov    %ebx,(%esp)
 17f:	e8 54 01 00 00       	call   2d8 <close>
  return r;
 184:	83 c4 10             	add    $0x10,%esp
}
 187:	89 f0                	mov    %esi,%eax
 189:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18c:	5b                   	pop    %ebx
 18d:	5e                   	pop    %esi
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    
    return -1;
 190:	be ff ff ff ff       	mov    $0xffffffff,%esi
 195:	eb f0                	jmp    187 <stat+0x34>

00000197 <atoi>:

int atoi(const char *s)
{
 197:	55                   	push   %ebp
 198:	89 e5                	mov    %esp,%ebp
 19a:	53                   	push   %ebx
 19b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19e:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 1a3:	eb 10                	jmp    1b5 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 1a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1ab:	83 c1 01             	add    $0x1,%ecx
 1ae:	0f be c0             	movsbl %al,%eax
 1b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 1b5:	0f b6 01             	movzbl (%ecx),%eax
 1b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1bb:	80 fb 09             	cmp    $0x9,%bl
 1be:	76 e5                	jbe    1a5 <atoi+0xe>
  return n;
}
 1c0:	89 d0                	mov    %edx,%eax
 1c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c5:	c9                   	leave  
 1c6:	c3                   	ret    

000001c7 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	56                   	push   %esi
 1cb:	53                   	push   %ebx
 1cc:	8b 75 08             	mov    0x8(%ebp),%esi
 1cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 1d7:	eb 0d                	jmp    1e6 <memmove+0x1f>
    *dst++ = *src++;
 1d9:	0f b6 01             	movzbl (%ecx),%eax
 1dc:	88 02                	mov    %al,(%edx)
 1de:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e1:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 1e4:	89 d8                	mov    %ebx,%eax
 1e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e9:	85 c0                	test   %eax,%eax
 1eb:	7f ec                	jg     1d9 <memmove+0x12>
  return vdst;
}
 1ed:	89 f0                	mov    %esi,%eax
 1ef:	5b                   	pop    %ebx
 1f0:	5e                   	pop    %esi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    

000001f3 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 1f9:	83 38 01             	cmpl   $0x1,(%eax)
 1fc:	74 fb                	je     1f9 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 1fe:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 204:	5d                   	pop    %ebp
 205:	c3                   	ret    

00000206 <lock_release>:
void lock_release(lock_t *lock)
{
 206:	55                   	push   %ebp
 207:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <lock_init>:
void lock_init(lock_t *lock)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 220:	5d                   	pop    %ebp
 221:	c3                   	ret    

00000222 <thread_create>:
{
 222:	55                   	push   %ebp
 223:	89 e5                	mov    %esp,%ebp
 225:	53                   	push   %ebx
 226:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 229:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 22c:	53                   	push   %ebx
 22d:	e8 e2 ff ff ff       	call   214 <lock_init>
  lock_acquire(&lock);
 232:	89 1c 24             	mov    %ebx,(%esp)
 235:	e8 b9 ff ff ff       	call   1f3 <lock_acquire>
  void *stack = malloc(4096 * 2);
 23a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 241:	e8 e5 03 00 00       	call   62b <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 246:	50                   	push   %eax
 247:	ff 75 10             	push   0x10(%ebp)
 24a:	ff 75 0c             	push   0xc(%ebp)
 24d:	ff 75 08             	push   0x8(%ebp)
 250:	e8 fb 00 00 00       	call   350 <clone>
}
 255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 258:	c9                   	leave  
 259:	c3                   	ret    

0000025a <thread_join>:
{
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	56                   	push   %esi
 25e:	53                   	push   %ebx
 25f:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 262:	6a 04                	push   $0x4
 264:	e8 c2 03 00 00       	call   62b <malloc>
 269:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 26c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 26f:	89 04 24             	mov    %eax,(%esp)
 272:	e8 e1 00 00 00       	call   358 <join>
 277:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 279:	8d 75 f0             	lea    -0x10(%ebp),%esi
 27c:	89 34 24             	mov    %esi,(%esp)
 27f:	e8 90 ff ff ff       	call   214 <lock_init>
  lock_acquire(&lock);
 284:	89 34 24             	mov    %esi,(%esp)
 287:	e8 67 ff ff ff       	call   1f3 <lock_acquire>
  free(stack);
 28c:	83 c4 04             	add    $0x4,%esp
 28f:	ff 75 f4             	push   -0xc(%ebp)
 292:	e8 d4 02 00 00       	call   56b <free>
  lock_release(&lock);
 297:	89 34 24             	mov    %esi,(%esp)
 29a:	e8 67 ff ff ff       	call   206 <lock_release>
}
 29f:	89 d8                	mov    %ebx,%eax
 2a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a4:	5b                   	pop    %ebx
 2a5:	5e                   	pop    %esi
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    

000002a8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a8:	b8 01 00 00 00       	mov    $0x1,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <exit>:
SYSCALL(exit)
 2b0:	b8 02 00 00 00       	mov    $0x2,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <wait>:
SYSCALL(wait)
 2b8:	b8 03 00 00 00       	mov    $0x3,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <pipe>:
SYSCALL(pipe)
 2c0:	b8 04 00 00 00       	mov    $0x4,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <read>:
SYSCALL(read)
 2c8:	b8 05 00 00 00       	mov    $0x5,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <write>:
SYSCALL(write)
 2d0:	b8 10 00 00 00       	mov    $0x10,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <close>:
SYSCALL(close)
 2d8:	b8 15 00 00 00       	mov    $0x15,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <kill>:
SYSCALL(kill)
 2e0:	b8 06 00 00 00       	mov    $0x6,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <exec>:
SYSCALL(exec)
 2e8:	b8 07 00 00 00       	mov    $0x7,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <open>:
SYSCALL(open)
 2f0:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <mknod>:
SYSCALL(mknod)
 2f8:	b8 11 00 00 00       	mov    $0x11,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <unlink>:
SYSCALL(unlink)
 300:	b8 12 00 00 00       	mov    $0x12,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <fstat>:
SYSCALL(fstat)
 308:	b8 08 00 00 00       	mov    $0x8,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <link>:
SYSCALL(link)
 310:	b8 13 00 00 00       	mov    $0x13,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <mkdir>:
SYSCALL(mkdir)
 318:	b8 14 00 00 00       	mov    $0x14,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <chdir>:
SYSCALL(chdir)
 320:	b8 09 00 00 00       	mov    $0x9,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <dup>:
SYSCALL(dup)
 328:	b8 0a 00 00 00       	mov    $0xa,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <getpid>:
SYSCALL(getpid)
 330:	b8 0b 00 00 00       	mov    $0xb,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <sbrk>:
SYSCALL(sbrk)
 338:	b8 0c 00 00 00       	mov    $0xc,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <sleep>:
SYSCALL(sleep)
 340:	b8 0d 00 00 00       	mov    $0xd,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <uptime>:
SYSCALL(uptime)
 348:	b8 0e 00 00 00       	mov    $0xe,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <clone>:
SYSCALL(clone)
 350:	b8 16 00 00 00       	mov    $0x16,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <join>:
 358:	b8 17 00 00 00       	mov    $0x17,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	83 ec 1c             	sub    $0x1c,%esp
 366:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 369:	6a 01                	push   $0x1
 36b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 36e:	52                   	push   %edx
 36f:	50                   	push   %eax
 370:	e8 5b ff ff ff       	call   2d0 <write>
}
 375:	83 c4 10             	add    $0x10,%esp
 378:	c9                   	leave  
 379:	c3                   	ret    

0000037a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	57                   	push   %edi
 37e:	56                   	push   %esi
 37f:	53                   	push   %ebx
 380:	83 ec 2c             	sub    $0x2c,%esp
 383:	89 45 d0             	mov    %eax,-0x30(%ebp)
 386:	89 d0                	mov    %edx,%eax
 388:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 38a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 38e:	0f 95 c1             	setne  %cl
 391:	c1 ea 1f             	shr    $0x1f,%edx
 394:	84 d1                	test   %dl,%cl
 396:	74 44                	je     3dc <printint+0x62>
    neg = 1;
    x = -xx;
 398:	f7 d8                	neg    %eax
 39a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 39c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3a3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3a8:	89 c8                	mov    %ecx,%eax
 3aa:	ba 00 00 00 00       	mov    $0x0,%edx
 3af:	f7 f6                	div    %esi
 3b1:	89 df                	mov    %ebx,%edi
 3b3:	83 c3 01             	add    $0x1,%ebx
 3b6:	0f b6 92 3c 07 00 00 	movzbl 0x73c(%edx),%edx
 3bd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3c1:	89 ca                	mov    %ecx,%edx
 3c3:	89 c1                	mov    %eax,%ecx
 3c5:	39 d6                	cmp    %edx,%esi
 3c7:	76 df                	jbe    3a8 <printint+0x2e>
  if(neg)
 3c9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3cd:	74 31                	je     400 <printint+0x86>
    buf[i++] = '-';
 3cf:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3d4:	8d 5f 02             	lea    0x2(%edi),%ebx
 3d7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3da:	eb 17                	jmp    3f3 <printint+0x79>
    x = xx;
 3dc:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3de:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3e5:	eb bc                	jmp    3a3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3e7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3ec:	89 f0                	mov    %esi,%eax
 3ee:	e8 6d ff ff ff       	call   360 <putc>
  while(--i >= 0)
 3f3:	83 eb 01             	sub    $0x1,%ebx
 3f6:	79 ef                	jns    3e7 <printint+0x6d>
}
 3f8:	83 c4 2c             	add    $0x2c,%esp
 3fb:	5b                   	pop    %ebx
 3fc:	5e                   	pop    %esi
 3fd:	5f                   	pop    %edi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    
 400:	8b 75 d0             	mov    -0x30(%ebp),%esi
 403:	eb ee                	jmp    3f3 <printint+0x79>

00000405 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 405:	55                   	push   %ebp
 406:	89 e5                	mov    %esp,%ebp
 408:	57                   	push   %edi
 409:	56                   	push   %esi
 40a:	53                   	push   %ebx
 40b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 40e:	8d 45 10             	lea    0x10(%ebp),%eax
 411:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 414:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 419:	bb 00 00 00 00       	mov    $0x0,%ebx
 41e:	eb 14                	jmp    434 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 420:	89 fa                	mov    %edi,%edx
 422:	8b 45 08             	mov    0x8(%ebp),%eax
 425:	e8 36 ff ff ff       	call   360 <putc>
 42a:	eb 05                	jmp    431 <printf+0x2c>
      }
    } else if(state == '%'){
 42c:	83 fe 25             	cmp    $0x25,%esi
 42f:	74 25                	je     456 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 431:	83 c3 01             	add    $0x1,%ebx
 434:	8b 45 0c             	mov    0xc(%ebp),%eax
 437:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 43b:	84 c0                	test   %al,%al
 43d:	0f 84 20 01 00 00    	je     563 <printf+0x15e>
    c = fmt[i] & 0xff;
 443:	0f be f8             	movsbl %al,%edi
 446:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 449:	85 f6                	test   %esi,%esi
 44b:	75 df                	jne    42c <printf+0x27>
      if(c == '%'){
 44d:	83 f8 25             	cmp    $0x25,%eax
 450:	75 ce                	jne    420 <printf+0x1b>
        state = '%';
 452:	89 c6                	mov    %eax,%esi
 454:	eb db                	jmp    431 <printf+0x2c>
      if(c == 'd'){
 456:	83 f8 25             	cmp    $0x25,%eax
 459:	0f 84 cf 00 00 00    	je     52e <printf+0x129>
 45f:	0f 8c dd 00 00 00    	jl     542 <printf+0x13d>
 465:	83 f8 78             	cmp    $0x78,%eax
 468:	0f 8f d4 00 00 00    	jg     542 <printf+0x13d>
 46e:	83 f8 63             	cmp    $0x63,%eax
 471:	0f 8c cb 00 00 00    	jl     542 <printf+0x13d>
 477:	83 e8 63             	sub    $0x63,%eax
 47a:	83 f8 15             	cmp    $0x15,%eax
 47d:	0f 87 bf 00 00 00    	ja     542 <printf+0x13d>
 483:	ff 24 85 e4 06 00 00 	jmp    *0x6e4(,%eax,4)
        printint(fd, *ap, 10, 1);
 48a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 48d:	8b 17                	mov    (%edi),%edx
 48f:	83 ec 0c             	sub    $0xc,%esp
 492:	6a 01                	push   $0x1
 494:	b9 0a 00 00 00       	mov    $0xa,%ecx
 499:	8b 45 08             	mov    0x8(%ebp),%eax
 49c:	e8 d9 fe ff ff       	call   37a <printint>
        ap++;
 4a1:	83 c7 04             	add    $0x4,%edi
 4a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4aa:	be 00 00 00 00       	mov    $0x0,%esi
 4af:	eb 80                	jmp    431 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b4:	8b 17                	mov    (%edi),%edx
 4b6:	83 ec 0c             	sub    $0xc,%esp
 4b9:	6a 00                	push   $0x0
 4bb:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	e8 b2 fe ff ff       	call   37a <printint>
        ap++;
 4c8:	83 c7 04             	add    $0x4,%edi
 4cb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4ce:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4d1:	be 00 00 00 00       	mov    $0x0,%esi
 4d6:	e9 56 ff ff ff       	jmp    431 <printf+0x2c>
        s = (char*)*ap;
 4db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4de:	8b 30                	mov    (%eax),%esi
        ap++;
 4e0:	83 c0 04             	add    $0x4,%eax
 4e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4e6:	85 f6                	test   %esi,%esi
 4e8:	75 15                	jne    4ff <printf+0xfa>
          s = "(null)";
 4ea:	be db 06 00 00       	mov    $0x6db,%esi
 4ef:	eb 0e                	jmp    4ff <printf+0xfa>
          putc(fd, *s);
 4f1:	0f be d2             	movsbl %dl,%edx
 4f4:	8b 45 08             	mov    0x8(%ebp),%eax
 4f7:	e8 64 fe ff ff       	call   360 <putc>
          s++;
 4fc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4ff:	0f b6 16             	movzbl (%esi),%edx
 502:	84 d2                	test   %dl,%dl
 504:	75 eb                	jne    4f1 <printf+0xec>
      state = 0;
 506:	be 00 00 00 00       	mov    $0x0,%esi
 50b:	e9 21 ff ff ff       	jmp    431 <printf+0x2c>
        putc(fd, *ap);
 510:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 513:	0f be 17             	movsbl (%edi),%edx
 516:	8b 45 08             	mov    0x8(%ebp),%eax
 519:	e8 42 fe ff ff       	call   360 <putc>
        ap++;
 51e:	83 c7 04             	add    $0x4,%edi
 521:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 524:	be 00 00 00 00       	mov    $0x0,%esi
 529:	e9 03 ff ff ff       	jmp    431 <printf+0x2c>
        putc(fd, c);
 52e:	89 fa                	mov    %edi,%edx
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	e8 28 fe ff ff       	call   360 <putc>
      state = 0;
 538:	be 00 00 00 00       	mov    $0x0,%esi
 53d:	e9 ef fe ff ff       	jmp    431 <printf+0x2c>
        putc(fd, '%');
 542:	ba 25 00 00 00       	mov    $0x25,%edx
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	e8 11 fe ff ff       	call   360 <putc>
        putc(fd, c);
 54f:	89 fa                	mov    %edi,%edx
 551:	8b 45 08             	mov    0x8(%ebp),%eax
 554:	e8 07 fe ff ff       	call   360 <putc>
      state = 0;
 559:	be 00 00 00 00       	mov    $0x0,%esi
 55e:	e9 ce fe ff ff       	jmp    431 <printf+0x2c>
    }
  }
}
 563:	8d 65 f4             	lea    -0xc(%ebp),%esp
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5f                   	pop    %edi
 569:	5d                   	pop    %ebp
 56a:	c3                   	ret    

0000056b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 56b:	55                   	push   %ebp
 56c:	89 e5                	mov    %esp,%ebp
 56e:	57                   	push   %edi
 56f:	56                   	push   %esi
 570:	53                   	push   %ebx
 571:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 574:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 577:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 57c:	eb 02                	jmp    580 <free+0x15>
 57e:	89 d0                	mov    %edx,%eax
 580:	39 c8                	cmp    %ecx,%eax
 582:	73 04                	jae    588 <free+0x1d>
 584:	39 08                	cmp    %ecx,(%eax)
 586:	77 12                	ja     59a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 588:	8b 10                	mov    (%eax),%edx
 58a:	39 c2                	cmp    %eax,%edx
 58c:	77 f0                	ja     57e <free+0x13>
 58e:	39 c8                	cmp    %ecx,%eax
 590:	72 08                	jb     59a <free+0x2f>
 592:	39 ca                	cmp    %ecx,%edx
 594:	77 04                	ja     59a <free+0x2f>
 596:	89 d0                	mov    %edx,%eax
 598:	eb e6                	jmp    580 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 59a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 59d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5a0:	8b 10                	mov    (%eax),%edx
 5a2:	39 d7                	cmp    %edx,%edi
 5a4:	74 19                	je     5bf <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a9:	8b 50 04             	mov    0x4(%eax),%edx
 5ac:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5af:	39 ce                	cmp    %ecx,%esi
 5b1:	74 1b                	je     5ce <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5b3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5b5:	a3 8c 0a 00 00       	mov    %eax,0xa8c
}
 5ba:	5b                   	pop    %ebx
 5bb:	5e                   	pop    %esi
 5bc:	5f                   	pop    %edi
 5bd:	5d                   	pop    %ebp
 5be:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5bf:	03 72 04             	add    0x4(%edx),%esi
 5c2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5c5:	8b 10                	mov    (%eax),%edx
 5c7:	8b 12                	mov    (%edx),%edx
 5c9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5cc:	eb db                	jmp    5a9 <free+0x3e>
    p->s.size += bp->s.size;
 5ce:	03 53 fc             	add    -0x4(%ebx),%edx
 5d1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5d4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5d7:	89 10                	mov    %edx,(%eax)
 5d9:	eb da                	jmp    5b5 <free+0x4a>

000005db <morecore>:

static Header*
morecore(uint nu)
{
 5db:	55                   	push   %ebp
 5dc:	89 e5                	mov    %esp,%ebp
 5de:	53                   	push   %ebx
 5df:	83 ec 04             	sub    $0x4,%esp
 5e2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5e4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5e9:	77 05                	ja     5f0 <morecore+0x15>
    nu = 4096;
 5eb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5f0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5f7:	83 ec 0c             	sub    $0xc,%esp
 5fa:	50                   	push   %eax
 5fb:	e8 38 fd ff ff       	call   338 <sbrk>
  if(p == (char*)-1)
 600:	83 c4 10             	add    $0x10,%esp
 603:	83 f8 ff             	cmp    $0xffffffff,%eax
 606:	74 1c                	je     624 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 608:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 60b:	83 c0 08             	add    $0x8,%eax
 60e:	83 ec 0c             	sub    $0xc,%esp
 611:	50                   	push   %eax
 612:	e8 54 ff ff ff       	call   56b <free>
  return freep;
 617:	a1 8c 0a 00 00       	mov    0xa8c,%eax
 61c:	83 c4 10             	add    $0x10,%esp
}
 61f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 622:	c9                   	leave  
 623:	c3                   	ret    
    return 0;
 624:	b8 00 00 00 00       	mov    $0x0,%eax
 629:	eb f4                	jmp    61f <morecore+0x44>

0000062b <malloc>:

void*
malloc(uint nbytes)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	53                   	push   %ebx
 62f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	8d 58 07             	lea    0x7(%eax),%ebx
 638:	c1 eb 03             	shr    $0x3,%ebx
 63b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 63e:	8b 0d 8c 0a 00 00    	mov    0xa8c,%ecx
 644:	85 c9                	test   %ecx,%ecx
 646:	74 04                	je     64c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 648:	8b 01                	mov    (%ecx),%eax
 64a:	eb 4a                	jmp    696 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 64c:	c7 05 8c 0a 00 00 90 	movl   $0xa90,0xa8c
 653:	0a 00 00 
 656:	c7 05 90 0a 00 00 90 	movl   $0xa90,0xa90
 65d:	0a 00 00 
    base.s.size = 0;
 660:	c7 05 94 0a 00 00 00 	movl   $0x0,0xa94
 667:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 66a:	b9 90 0a 00 00       	mov    $0xa90,%ecx
 66f:	eb d7                	jmp    648 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 671:	74 19                	je     68c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 673:	29 da                	sub    %ebx,%edx
 675:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 678:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 67b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 67e:	89 0d 8c 0a 00 00    	mov    %ecx,0xa8c
      return (void*)(p + 1);
 684:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 687:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 68a:	c9                   	leave  
 68b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 68c:	8b 10                	mov    (%eax),%edx
 68e:	89 11                	mov    %edx,(%ecx)
 690:	eb ec                	jmp    67e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 692:	89 c1                	mov    %eax,%ecx
 694:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 696:	8b 50 04             	mov    0x4(%eax),%edx
 699:	39 da                	cmp    %ebx,%edx
 69b:	73 d4                	jae    671 <malloc+0x46>
    if(p == freep)
 69d:	39 05 8c 0a 00 00    	cmp    %eax,0xa8c
 6a3:	75 ed                	jne    692 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6a5:	89 d8                	mov    %ebx,%eax
 6a7:	e8 2f ff ff ff       	call   5db <morecore>
 6ac:	85 c0                	test   %eax,%eax
 6ae:	75 e2                	jne    692 <malloc+0x67>
 6b0:	eb d5                	jmp    687 <malloc+0x5c>
