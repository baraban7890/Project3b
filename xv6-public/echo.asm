
_echo:     file format elf32-i386


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
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba aa 06 00 00       	mov    $0x6aa,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 ac 06 00 00       	push   $0x6ac
  2e:	6a 01                	push   $0x1
  30:	e8 c5 03 00 00       	call   3fa <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba a8 06 00 00       	mov    $0x6a8,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 54 02 00 00       	call   2a5 <exit>

00000051 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	56                   	push   %esi
  55:	53                   	push   %ebx
  56:	8b 75 08             	mov    0x8(%ebp),%esi
  59:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  5c:	89 f0                	mov    %esi,%eax
  5e:	89 d1                	mov    %edx,%ecx
  60:	83 c2 01             	add    $0x1,%edx
  63:	89 c3                	mov    %eax,%ebx
  65:	83 c0 01             	add    $0x1,%eax
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	88 0b                	mov    %cl,(%ebx)
  6d:	84 c9                	test   %cl,%cl
  6f:	75 ed                	jne    5e <strcpy+0xd>
    ;
  return os;
}
  71:	89 f0                	mov    %esi,%eax
  73:	5b                   	pop    %ebx
  74:	5e                   	pop    %esi
  75:	5d                   	pop    %ebp
  76:	c3                   	ret    

00000077 <strcmp>:

int strcmp(const char *p, const char *q)
{
  77:	55                   	push   %ebp
  78:	89 e5                	mov    %esp,%ebp
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
  80:	eb 06                	jmp    88 <strcmp+0x11>
    p++, q++;
  82:	83 c1 01             	add    $0x1,%ecx
  85:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  88:	0f b6 01             	movzbl (%ecx),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 04                	je     93 <strcmp+0x1c>
  8f:	3a 02                	cmp    (%edx),%al
  91:	74 ef                	je     82 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  93:	0f b6 c0             	movzbl %al,%eax
  96:	0f b6 12             	movzbl (%edx),%edx
  99:	29 d0                	sub    %edx,%eax
}
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    

0000009d <strlen>:

uint strlen(const char *s)
{
  9d:	55                   	push   %ebp
  9e:	89 e5                	mov    %esp,%ebp
  a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
  a3:	b8 00 00 00 00       	mov    $0x0,%eax
  a8:	eb 03                	jmp    ad <strlen+0x10>
  aa:	83 c0 01             	add    $0x1,%eax
  ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  b1:	75 f7                	jne    aa <strlen+0xd>
    ;
  return n;
}
  b3:	5d                   	pop    %ebp
  b4:	c3                   	ret    

000000b5 <memset>:

void *
memset(void *dst, int c, uint n)
{
  b5:	55                   	push   %ebp
  b6:	89 e5                	mov    %esp,%ebp
  b8:	57                   	push   %edi
  b9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  bc:	89 d7                	mov    %edx,%edi
  be:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  c4:	fc                   	cld    
  c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c7:	89 d0                	mov    %edx,%eax
  c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strchr>:

char *
strchr(const char *s, char c)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	8b 45 08             	mov    0x8(%ebp),%eax
  d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
  d8:	eb 03                	jmp    dd <strchr+0xf>
  da:	83 c0 01             	add    $0x1,%eax
  dd:	0f b6 10             	movzbl (%eax),%edx
  e0:	84 d2                	test   %dl,%dl
  e2:	74 06                	je     ea <strchr+0x1c>
    if (*s == c)
  e4:	38 ca                	cmp    %cl,%dl
  e6:	75 f2                	jne    da <strchr+0xc>
  e8:	eb 05                	jmp    ef <strchr+0x21>
      return (char *)s;
  return 0;
  ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <gets>:

char *
gets(char *buf, int max)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	57                   	push   %edi
  f5:	56                   	push   %esi
  f6:	53                   	push   %ebx
  f7:	83 ec 1c             	sub    $0x1c,%esp
  fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 102:	89 de                	mov    %ebx,%esi
 104:	83 c3 01             	add    $0x1,%ebx
 107:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 10a:	7d 2e                	jge    13a <gets+0x49>
  {
    cc = read(0, &c, 1);
 10c:	83 ec 04             	sub    $0x4,%esp
 10f:	6a 01                	push   $0x1
 111:	8d 45 e7             	lea    -0x19(%ebp),%eax
 114:	50                   	push   %eax
 115:	6a 00                	push   $0x0
 117:	e8 a1 01 00 00       	call   2bd <read>
    if (cc < 1)
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	7e 17                	jle    13a <gets+0x49>
      break;
    buf[i++] = c;
 123:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 127:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 12a:	3c 0a                	cmp    $0xa,%al
 12c:	0f 94 c2             	sete   %dl
 12f:	3c 0d                	cmp    $0xd,%al
 131:	0f 94 c0             	sete   %al
 134:	08 c2                	or     %al,%dl
 136:	74 ca                	je     102 <gets+0x11>
    buf[i++] = c;
 138:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 13a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 13e:	89 f8                	mov    %edi,%eax
 140:	8d 65 f4             	lea    -0xc(%ebp),%esp
 143:	5b                   	pop    %ebx
 144:	5e                   	pop    %esi
 145:	5f                   	pop    %edi
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    

00000148 <stat>:

int stat(const char *n, struct stat *st)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	6a 00                	push   $0x0
 152:	ff 75 08             	push   0x8(%ebp)
 155:	e8 8b 01 00 00       	call   2e5 <open>
  if (fd < 0)
 15a:	83 c4 10             	add    $0x10,%esp
 15d:	85 c0                	test   %eax,%eax
 15f:	78 24                	js     185 <stat+0x3d>
 161:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 163:	83 ec 08             	sub    $0x8,%esp
 166:	ff 75 0c             	push   0xc(%ebp)
 169:	50                   	push   %eax
 16a:	e8 8e 01 00 00       	call   2fd <fstat>
 16f:	89 c6                	mov    %eax,%esi
  close(fd);
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 54 01 00 00       	call   2cd <close>
  return r;
 179:	83 c4 10             	add    $0x10,%esp
}
 17c:	89 f0                	mov    %esi,%eax
 17e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
    return -1;
 185:	be ff ff ff ff       	mov    $0xffffffff,%esi
 18a:	eb f0                	jmp    17c <stat+0x34>

0000018c <atoi>:

int atoi(const char *s)
{
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	53                   	push   %ebx
 190:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 193:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 198:	eb 10                	jmp    1aa <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 19a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 19d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f be c0             	movsbl %al,%eax
 1a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 1aa:	0f b6 01             	movzbl (%ecx),%eax
 1ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b0:	80 fb 09             	cmp    $0x9,%bl
 1b3:	76 e5                	jbe    19a <atoi+0xe>
  return n;
}
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ba:	c9                   	leave  
 1bb:	c3                   	ret    

000001bc <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	56                   	push   %esi
 1c0:	53                   	push   %ebx
 1c1:	8b 75 08             	mov    0x8(%ebp),%esi
 1c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1c7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 1cc:	eb 0d                	jmp    1db <memmove+0x1f>
    *dst++ = *src++;
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	88 02                	mov    %al,(%edx)
 1d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 1d6:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 1d9:	89 d8                	mov    %ebx,%eax
 1db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1de:	85 c0                	test   %eax,%eax
 1e0:	7f ec                	jg     1ce <memmove+0x12>
  return vdst;
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    

000001e8 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 1ee:	83 38 01             	cmpl   $0x1,(%eax)
 1f1:	74 fb                	je     1ee <lock_acquire+0x6>
    ;
  lock->flag = 1;
 1f3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 1f9:	5d                   	pop    %ebp
 1fa:	c3                   	ret    

000001fb <lock_release>:
void lock_release(lock_t *lock)
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    

00000209 <lock_init>:
void lock_init(lock_t *lock)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 20c:	8b 45 08             	mov    0x8(%ebp),%eax
 20f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <thread_create>:
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	53                   	push   %ebx
 21b:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 21e:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 221:	53                   	push   %ebx
 222:	e8 e2 ff ff ff       	call   209 <lock_init>
  lock_acquire(&lock);
 227:	89 1c 24             	mov    %ebx,(%esp)
 22a:	e8 b9 ff ff ff       	call   1e8 <lock_acquire>
  void *stack = malloc(4096 * 2);
 22f:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 236:	e8 e5 03 00 00       	call   620 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 23b:	50                   	push   %eax
 23c:	ff 75 10             	push   0x10(%ebp)
 23f:	ff 75 0c             	push   0xc(%ebp)
 242:	ff 75 08             	push   0x8(%ebp)
 245:	e8 fb 00 00 00       	call   345 <clone>
}
 24a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <thread_join>:
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	56                   	push   %esi
 253:	53                   	push   %ebx
 254:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 257:	6a 04                	push   $0x4
 259:	e8 c2 03 00 00       	call   620 <malloc>
 25e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 261:	8d 45 f4             	lea    -0xc(%ebp),%eax
 264:	89 04 24             	mov    %eax,(%esp)
 267:	e8 e1 00 00 00       	call   34d <join>
 26c:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 26e:	8d 75 f0             	lea    -0x10(%ebp),%esi
 271:	89 34 24             	mov    %esi,(%esp)
 274:	e8 90 ff ff ff       	call   209 <lock_init>
  lock_acquire(&lock);
 279:	89 34 24             	mov    %esi,(%esp)
 27c:	e8 67 ff ff ff       	call   1e8 <lock_acquire>
  free(stack);
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 75 f4             	push   -0xc(%ebp)
 287:	e8 d4 02 00 00       	call   560 <free>
  lock_release(&lock);
 28c:	89 34 24             	mov    %esi,(%esp)
 28f:	e8 67 ff ff ff       	call   1fb <lock_release>
}
 294:	89 d8                	mov    %ebx,%eax
 296:	8d 65 f8             	lea    -0x8(%ebp),%esp
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    

0000029d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29d:	b8 01 00 00 00       	mov    $0x1,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <exit>:
SYSCALL(exit)
 2a5:	b8 02 00 00 00       	mov    $0x2,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <wait>:
SYSCALL(wait)
 2ad:	b8 03 00 00 00       	mov    $0x3,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <pipe>:
SYSCALL(pipe)
 2b5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <read>:
SYSCALL(read)
 2bd:	b8 05 00 00 00       	mov    $0x5,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <write>:
SYSCALL(write)
 2c5:	b8 10 00 00 00       	mov    $0x10,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <close>:
SYSCALL(close)
 2cd:	b8 15 00 00 00       	mov    $0x15,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <kill>:
SYSCALL(kill)
 2d5:	b8 06 00 00 00       	mov    $0x6,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <exec>:
SYSCALL(exec)
 2dd:	b8 07 00 00 00       	mov    $0x7,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <open>:
SYSCALL(open)
 2e5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <mknod>:
SYSCALL(mknod)
 2ed:	b8 11 00 00 00       	mov    $0x11,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <unlink>:
SYSCALL(unlink)
 2f5:	b8 12 00 00 00       	mov    $0x12,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <fstat>:
SYSCALL(fstat)
 2fd:	b8 08 00 00 00       	mov    $0x8,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <link>:
SYSCALL(link)
 305:	b8 13 00 00 00       	mov    $0x13,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <mkdir>:
SYSCALL(mkdir)
 30d:	b8 14 00 00 00       	mov    $0x14,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <chdir>:
SYSCALL(chdir)
 315:	b8 09 00 00 00       	mov    $0x9,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <dup>:
SYSCALL(dup)
 31d:	b8 0a 00 00 00       	mov    $0xa,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <getpid>:
SYSCALL(getpid)
 325:	b8 0b 00 00 00       	mov    $0xb,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <sbrk>:
SYSCALL(sbrk)
 32d:	b8 0c 00 00 00       	mov    $0xc,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <sleep>:
SYSCALL(sleep)
 335:	b8 0d 00 00 00       	mov    $0xd,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <uptime>:
SYSCALL(uptime)
 33d:	b8 0e 00 00 00       	mov    $0xe,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <clone>:
SYSCALL(clone)
 345:	b8 16 00 00 00       	mov    $0x16,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <join>:
 34d:	b8 17 00 00 00       	mov    $0x17,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
 358:	83 ec 1c             	sub    $0x1c,%esp
 35b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 35e:	6a 01                	push   $0x1
 360:	8d 55 f4             	lea    -0xc(%ebp),%edx
 363:	52                   	push   %edx
 364:	50                   	push   %eax
 365:	e8 5b ff ff ff       	call   2c5 <write>
}
 36a:	83 c4 10             	add    $0x10,%esp
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	57                   	push   %edi
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	83 ec 2c             	sub    $0x2c,%esp
 378:	89 45 d0             	mov    %eax,-0x30(%ebp)
 37b:	89 d0                	mov    %edx,%eax
 37d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 383:	0f 95 c1             	setne  %cl
 386:	c1 ea 1f             	shr    $0x1f,%edx
 389:	84 d1                	test   %dl,%cl
 38b:	74 44                	je     3d1 <printint+0x62>
    neg = 1;
    x = -xx;
 38d:	f7 d8                	neg    %eax
 38f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 391:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 398:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 39d:	89 c8                	mov    %ecx,%eax
 39f:	ba 00 00 00 00       	mov    $0x0,%edx
 3a4:	f7 f6                	div    %esi
 3a6:	89 df                	mov    %ebx,%edi
 3a8:	83 c3 01             	add    $0x1,%ebx
 3ab:	0f b6 92 10 07 00 00 	movzbl 0x710(%edx),%edx
 3b2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3b6:	89 ca                	mov    %ecx,%edx
 3b8:	89 c1                	mov    %eax,%ecx
 3ba:	39 d6                	cmp    %edx,%esi
 3bc:	76 df                	jbe    39d <printint+0x2e>
  if(neg)
 3be:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3c2:	74 31                	je     3f5 <printint+0x86>
    buf[i++] = '-';
 3c4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3c9:	8d 5f 02             	lea    0x2(%edi),%ebx
 3cc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3cf:	eb 17                	jmp    3e8 <printint+0x79>
    x = xx;
 3d1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3d3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3da:	eb bc                	jmp    398 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3dc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e1:	89 f0                	mov    %esi,%eax
 3e3:	e8 6d ff ff ff       	call   355 <putc>
  while(--i >= 0)
 3e8:	83 eb 01             	sub    $0x1,%ebx
 3eb:	79 ef                	jns    3dc <printint+0x6d>
}
 3ed:	83 c4 2c             	add    $0x2c,%esp
 3f0:	5b                   	pop    %ebx
 3f1:	5e                   	pop    %esi
 3f2:	5f                   	pop    %edi
 3f3:	5d                   	pop    %ebp
 3f4:	c3                   	ret    
 3f5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f8:	eb ee                	jmp    3e8 <printint+0x79>

000003fa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	57                   	push   %edi
 3fe:	56                   	push   %esi
 3ff:	53                   	push   %ebx
 400:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 403:	8d 45 10             	lea    0x10(%ebp),%eax
 406:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 409:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 40e:	bb 00 00 00 00       	mov    $0x0,%ebx
 413:	eb 14                	jmp    429 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 415:	89 fa                	mov    %edi,%edx
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	e8 36 ff ff ff       	call   355 <putc>
 41f:	eb 05                	jmp    426 <printf+0x2c>
      }
    } else if(state == '%'){
 421:	83 fe 25             	cmp    $0x25,%esi
 424:	74 25                	je     44b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 426:	83 c3 01             	add    $0x1,%ebx
 429:	8b 45 0c             	mov    0xc(%ebp),%eax
 42c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 430:	84 c0                	test   %al,%al
 432:	0f 84 20 01 00 00    	je     558 <printf+0x15e>
    c = fmt[i] & 0xff;
 438:	0f be f8             	movsbl %al,%edi
 43b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 43e:	85 f6                	test   %esi,%esi
 440:	75 df                	jne    421 <printf+0x27>
      if(c == '%'){
 442:	83 f8 25             	cmp    $0x25,%eax
 445:	75 ce                	jne    415 <printf+0x1b>
        state = '%';
 447:	89 c6                	mov    %eax,%esi
 449:	eb db                	jmp    426 <printf+0x2c>
      if(c == 'd'){
 44b:	83 f8 25             	cmp    $0x25,%eax
 44e:	0f 84 cf 00 00 00    	je     523 <printf+0x129>
 454:	0f 8c dd 00 00 00    	jl     537 <printf+0x13d>
 45a:	83 f8 78             	cmp    $0x78,%eax
 45d:	0f 8f d4 00 00 00    	jg     537 <printf+0x13d>
 463:	83 f8 63             	cmp    $0x63,%eax
 466:	0f 8c cb 00 00 00    	jl     537 <printf+0x13d>
 46c:	83 e8 63             	sub    $0x63,%eax
 46f:	83 f8 15             	cmp    $0x15,%eax
 472:	0f 87 bf 00 00 00    	ja     537 <printf+0x13d>
 478:	ff 24 85 b8 06 00 00 	jmp    *0x6b8(,%eax,4)
        printint(fd, *ap, 10, 1);
 47f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 482:	8b 17                	mov    (%edi),%edx
 484:	83 ec 0c             	sub    $0xc,%esp
 487:	6a 01                	push   $0x1
 489:	b9 0a 00 00 00       	mov    $0xa,%ecx
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	e8 d9 fe ff ff       	call   36f <printint>
        ap++;
 496:	83 c7 04             	add    $0x4,%edi
 499:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 49c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 49f:	be 00 00 00 00       	mov    $0x0,%esi
 4a4:	eb 80                	jmp    426 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4a9:	8b 17                	mov    (%edi),%edx
 4ab:	83 ec 0c             	sub    $0xc,%esp
 4ae:	6a 00                	push   $0x0
 4b0:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	e8 b2 fe ff ff       	call   36f <printint>
        ap++;
 4bd:	83 c7 04             	add    $0x4,%edi
 4c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c6:	be 00 00 00 00       	mov    $0x0,%esi
 4cb:	e9 56 ff ff ff       	jmp    426 <printf+0x2c>
        s = (char*)*ap;
 4d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d3:	8b 30                	mov    (%eax),%esi
        ap++;
 4d5:	83 c0 04             	add    $0x4,%eax
 4d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4db:	85 f6                	test   %esi,%esi
 4dd:	75 15                	jne    4f4 <printf+0xfa>
          s = "(null)";
 4df:	be b1 06 00 00       	mov    $0x6b1,%esi
 4e4:	eb 0e                	jmp    4f4 <printf+0xfa>
          putc(fd, *s);
 4e6:	0f be d2             	movsbl %dl,%edx
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	e8 64 fe ff ff       	call   355 <putc>
          s++;
 4f1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4f4:	0f b6 16             	movzbl (%esi),%edx
 4f7:	84 d2                	test   %dl,%dl
 4f9:	75 eb                	jne    4e6 <printf+0xec>
      state = 0;
 4fb:	be 00 00 00 00       	mov    $0x0,%esi
 500:	e9 21 ff ff ff       	jmp    426 <printf+0x2c>
        putc(fd, *ap);
 505:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 508:	0f be 17             	movsbl (%edi),%edx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 42 fe ff ff       	call   355 <putc>
        ap++;
 513:	83 c7 04             	add    $0x4,%edi
 516:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 519:	be 00 00 00 00       	mov    $0x0,%esi
 51e:	e9 03 ff ff ff       	jmp    426 <printf+0x2c>
        putc(fd, c);
 523:	89 fa                	mov    %edi,%edx
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	e8 28 fe ff ff       	call   355 <putc>
      state = 0;
 52d:	be 00 00 00 00       	mov    $0x0,%esi
 532:	e9 ef fe ff ff       	jmp    426 <printf+0x2c>
        putc(fd, '%');
 537:	ba 25 00 00 00       	mov    $0x25,%edx
 53c:	8b 45 08             	mov    0x8(%ebp),%eax
 53f:	e8 11 fe ff ff       	call   355 <putc>
        putc(fd, c);
 544:	89 fa                	mov    %edi,%edx
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	e8 07 fe ff ff       	call   355 <putc>
      state = 0;
 54e:	be 00 00 00 00       	mov    $0x0,%esi
 553:	e9 ce fe ff ff       	jmp    426 <printf+0x2c>
    }
  }
}
 558:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5f                   	pop    %edi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    

00000560 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 569:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 56c:	a1 68 0a 00 00       	mov    0xa68,%eax
 571:	eb 02                	jmp    575 <free+0x15>
 573:	89 d0                	mov    %edx,%eax
 575:	39 c8                	cmp    %ecx,%eax
 577:	73 04                	jae    57d <free+0x1d>
 579:	39 08                	cmp    %ecx,(%eax)
 57b:	77 12                	ja     58f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 57d:	8b 10                	mov    (%eax),%edx
 57f:	39 c2                	cmp    %eax,%edx
 581:	77 f0                	ja     573 <free+0x13>
 583:	39 c8                	cmp    %ecx,%eax
 585:	72 08                	jb     58f <free+0x2f>
 587:	39 ca                	cmp    %ecx,%edx
 589:	77 04                	ja     58f <free+0x2f>
 58b:	89 d0                	mov    %edx,%eax
 58d:	eb e6                	jmp    575 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 58f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 592:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 595:	8b 10                	mov    (%eax),%edx
 597:	39 d7                	cmp    %edx,%edi
 599:	74 19                	je     5b4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 59b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 59e:	8b 50 04             	mov    0x4(%eax),%edx
 5a1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a4:	39 ce                	cmp    %ecx,%esi
 5a6:	74 1b                	je     5c3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5aa:	a3 68 0a 00 00       	mov    %eax,0xa68
}
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5b4:	03 72 04             	add    0x4(%edx),%esi
 5b7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5ba:	8b 10                	mov    (%eax),%edx
 5bc:	8b 12                	mov    (%edx),%edx
 5be:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5c1:	eb db                	jmp    59e <free+0x3e>
    p->s.size += bp->s.size;
 5c3:	03 53 fc             	add    -0x4(%ebx),%edx
 5c6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5cc:	89 10                	mov    %edx,(%eax)
 5ce:	eb da                	jmp    5aa <free+0x4a>

000005d0 <morecore>:

static Header*
morecore(uint nu)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	53                   	push   %ebx
 5d4:	83 ec 04             	sub    $0x4,%esp
 5d7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5d9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5de:	77 05                	ja     5e5 <morecore+0x15>
    nu = 4096;
 5e0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5e5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5ec:	83 ec 0c             	sub    $0xc,%esp
 5ef:	50                   	push   %eax
 5f0:	e8 38 fd ff ff       	call   32d <sbrk>
  if(p == (char*)-1)
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	83 f8 ff             	cmp    $0xffffffff,%eax
 5fb:	74 1c                	je     619 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5fd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 600:	83 c0 08             	add    $0x8,%eax
 603:	83 ec 0c             	sub    $0xc,%esp
 606:	50                   	push   %eax
 607:	e8 54 ff ff ff       	call   560 <free>
  return freep;
 60c:	a1 68 0a 00 00       	mov    0xa68,%eax
 611:	83 c4 10             	add    $0x10,%esp
}
 614:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 617:	c9                   	leave  
 618:	c3                   	ret    
    return 0;
 619:	b8 00 00 00 00       	mov    $0x0,%eax
 61e:	eb f4                	jmp    614 <morecore+0x44>

00000620 <malloc>:

void*
malloc(uint nbytes)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	53                   	push   %ebx
 624:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 627:	8b 45 08             	mov    0x8(%ebp),%eax
 62a:	8d 58 07             	lea    0x7(%eax),%ebx
 62d:	c1 eb 03             	shr    $0x3,%ebx
 630:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 633:	8b 0d 68 0a 00 00    	mov    0xa68,%ecx
 639:	85 c9                	test   %ecx,%ecx
 63b:	74 04                	je     641 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 63d:	8b 01                	mov    (%ecx),%eax
 63f:	eb 4a                	jmp    68b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 641:	c7 05 68 0a 00 00 6c 	movl   $0xa6c,0xa68
 648:	0a 00 00 
 64b:	c7 05 6c 0a 00 00 6c 	movl   $0xa6c,0xa6c
 652:	0a 00 00 
    base.s.size = 0;
 655:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 65c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 65f:	b9 6c 0a 00 00       	mov    $0xa6c,%ecx
 664:	eb d7                	jmp    63d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 666:	74 19                	je     681 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 668:	29 da                	sub    %ebx,%edx
 66a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 66d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 670:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 673:	89 0d 68 0a 00 00    	mov    %ecx,0xa68
      return (void*)(p + 1);
 679:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 67c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 67f:	c9                   	leave  
 680:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 681:	8b 10                	mov    (%eax),%edx
 683:	89 11                	mov    %edx,(%ecx)
 685:	eb ec                	jmp    673 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 687:	89 c1                	mov    %eax,%ecx
 689:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 68b:	8b 50 04             	mov    0x4(%eax),%edx
 68e:	39 da                	cmp    %ebx,%edx
 690:	73 d4                	jae    666 <malloc+0x46>
    if(p == freep)
 692:	39 05 68 0a 00 00    	cmp    %eax,0xa68
 698:	75 ed                	jne    687 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 69a:	89 d8                	mov    %ebx,%eax
 69c:	e8 2f ff ff ff       	call   5d0 <morecore>
 6a1:	85 c0                	test   %eax,%eax
 6a3:	75 e2                	jne    687 <malloc+0x67>
 6a5:	eb d5                	jmp    67c <malloc+0x5c>
