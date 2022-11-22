
_mkdir:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: mkdir files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 cc 06 00 00       	push   $0x6cc
  30:	6a 02                	push   $0x2
  32:	e8 e5 03 00 00       	call   41c <printf>
    exit();
  37:	e8 8b 02 00 00       	call   2c7 <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(mkdir(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 dc 02 00 00       	call   32f <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 e3 06 00 00       	push   $0x6e3
  64:	6a 02                	push   $0x2
  66:	e8 b1 03 00 00       	call   41c <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 54 02 00 00       	call   2c7 <exit>

00000073 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	56                   	push   %esi
  77:	53                   	push   %ebx
  78:	8b 75 08             	mov    0x8(%ebp),%esi
  7b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  7e:	89 f0                	mov    %esi,%eax
  80:	89 d1                	mov    %edx,%ecx
  82:	83 c2 01             	add    $0x1,%edx
  85:	89 c3                	mov    %eax,%ebx
  87:	83 c0 01             	add    $0x1,%eax
  8a:	0f b6 09             	movzbl (%ecx),%ecx
  8d:	88 0b                	mov    %cl,(%ebx)
  8f:	84 c9                	test   %cl,%cl
  91:	75 ed                	jne    80 <strcpy+0xd>
    ;
  return os;
}
  93:	89 f0                	mov    %esi,%eax
  95:	5b                   	pop    %ebx
  96:	5e                   	pop    %esi
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    

00000099 <strcmp>:

int strcmp(const char *p, const char *q)
{
  99:	55                   	push   %ebp
  9a:	89 e5                	mov    %esp,%ebp
  9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
  a2:	eb 06                	jmp    aa <strcmp+0x11>
    p++, q++;
  a4:	83 c1 01             	add    $0x1,%ecx
  a7:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  aa:	0f b6 01             	movzbl (%ecx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 04                	je     b5 <strcmp+0x1c>
  b1:	3a 02                	cmp    (%edx),%al
  b3:	74 ef                	je     a4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	0f b6 12             	movzbl (%edx),%edx
  bb:	29 d0                	sub    %edx,%eax
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <strlen>:

uint strlen(const char *s)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
  c5:	b8 00 00 00 00       	mov    $0x0,%eax
  ca:	eb 03                	jmp    cf <strlen+0x10>
  cc:	83 c0 01             	add    $0x1,%eax
  cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  d3:	75 f7                	jne    cc <strlen+0xd>
    ;
  return n;
}
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    

000000d7 <memset>:

void *
memset(void *dst, int c, uint n)
{
  d7:	55                   	push   %ebp
  d8:	89 e5                	mov    %esp,%ebp
  da:	57                   	push   %edi
  db:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  de:	89 d7                	mov    %edx,%edi
  e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  e6:	fc                   	cld    
  e7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e9:	89 d0                	mov    %edx,%eax
  eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ee:	c9                   	leave  
  ef:	c3                   	ret    

000000f0 <strchr>:

char *
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
  fa:	eb 03                	jmp    ff <strchr+0xf>
  fc:	83 c0 01             	add    $0x1,%eax
  ff:	0f b6 10             	movzbl (%eax),%edx
 102:	84 d2                	test   %dl,%dl
 104:	74 06                	je     10c <strchr+0x1c>
    if (*s == c)
 106:	38 ca                	cmp    %cl,%dl
 108:	75 f2                	jne    fc <strchr+0xc>
 10a:	eb 05                	jmp    111 <strchr+0x21>
      return (char *)s;
  return 0;
 10c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <gets>:

char *
gets(char *buf, int max)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x49>
  {
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 a1 01 00 00       	call   2df <read>
    if (cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x49>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x11>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int stat(const char *n, struct stat *st)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	56                   	push   %esi
 16e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	6a 00                	push   $0x0
 174:	ff 75 08             	push   0x8(%ebp)
 177:	e8 8b 01 00 00       	call   307 <open>
  if (fd < 0)
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	85 c0                	test   %eax,%eax
 181:	78 24                	js     1a7 <stat+0x3d>
 183:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 185:	83 ec 08             	sub    $0x8,%esp
 188:	ff 75 0c             	push   0xc(%ebp)
 18b:	50                   	push   %eax
 18c:	e8 8e 01 00 00       	call   31f <fstat>
 191:	89 c6                	mov    %eax,%esi
  close(fd);
 193:	89 1c 24             	mov    %ebx,(%esp)
 196:	e8 54 01 00 00       	call   2ef <close>
  return r;
 19b:	83 c4 10             	add    $0x10,%esp
}
 19e:	89 f0                	mov    %esi,%eax
 1a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a3:	5b                   	pop    %ebx
 1a4:	5e                   	pop    %esi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
    return -1;
 1a7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ac:	eb f0                	jmp    19e <stat+0x34>

000001ae <atoi>:

int atoi(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	53                   	push   %ebx
 1b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1b5:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 1ba:	eb 10                	jmp    1cc <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 1bc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1bf:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1c2:	83 c1 01             	add    $0x1,%ecx
 1c5:	0f be c0             	movsbl %al,%eax
 1c8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 1cc:	0f b6 01             	movzbl (%ecx),%eax
 1cf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d2:	80 fb 09             	cmp    $0x9,%bl
 1d5:	76 e5                	jbe    1bc <atoi+0xe>
  return n;
}
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1dc:	c9                   	leave  
 1dd:	c3                   	ret    

000001de <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	56                   	push   %esi
 1e2:	53                   	push   %ebx
 1e3:	8b 75 08             	mov    0x8(%ebp),%esi
 1e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 1ee:	eb 0d                	jmp    1fd <memmove+0x1f>
    *dst++ = *src++;
 1f0:	0f b6 01             	movzbl (%ecx),%eax
 1f3:	88 02                	mov    %al,(%edx)
 1f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 1f8:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 1fb:	89 d8                	mov    %ebx,%eax
 1fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 200:	85 c0                	test   %eax,%eax
 202:	7f ec                	jg     1f0 <memmove+0x12>
  return vdst;
}
 204:	89 f0                	mov    %esi,%eax
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5d                   	pop    %ebp
 209:	c3                   	ret    

0000020a <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 210:	83 38 01             	cmpl   $0x1,(%eax)
 213:	74 fb                	je     210 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 215:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    

0000021d <lock_release>:
void lock_release(lock_t *lock)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    

0000022b <lock_init>:
void lock_init(lock_t *lock)
{
 22b:	55                   	push   %ebp
 22c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 237:	5d                   	pop    %ebp
 238:	c3                   	ret    

00000239 <thread_create>:
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	53                   	push   %ebx
 23d:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 240:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 243:	53                   	push   %ebx
 244:	e8 e2 ff ff ff       	call   22b <lock_init>
  lock_acquire(&lock);
 249:	89 1c 24             	mov    %ebx,(%esp)
 24c:	e8 b9 ff ff ff       	call   20a <lock_acquire>
  void *stack = malloc(4096 * 2);
 251:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 258:	e8 e5 03 00 00       	call   642 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 25d:	50                   	push   %eax
 25e:	ff 75 10             	push   0x10(%ebp)
 261:	ff 75 0c             	push   0xc(%ebp)
 264:	ff 75 08             	push   0x8(%ebp)
 267:	e8 fb 00 00 00       	call   367 <clone>
}
 26c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 26f:	c9                   	leave  
 270:	c3                   	ret    

00000271 <thread_join>:
{
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 279:	6a 04                	push   $0x4
 27b:	e8 c2 03 00 00       	call   642 <malloc>
 280:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 283:	8d 45 f4             	lea    -0xc(%ebp),%eax
 286:	89 04 24             	mov    %eax,(%esp)
 289:	e8 e1 00 00 00       	call   36f <join>
 28e:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 290:	8d 75 f0             	lea    -0x10(%ebp),%esi
 293:	89 34 24             	mov    %esi,(%esp)
 296:	e8 90 ff ff ff       	call   22b <lock_init>
  lock_acquire(&lock);
 29b:	89 34 24             	mov    %esi,(%esp)
 29e:	e8 67 ff ff ff       	call   20a <lock_acquire>
  free(stack);
 2a3:	83 c4 04             	add    $0x4,%esp
 2a6:	ff 75 f4             	push   -0xc(%ebp)
 2a9:	e8 d4 02 00 00       	call   582 <free>
  lock_release(&lock);
 2ae:	89 34 24             	mov    %esi,(%esp)
 2b1:	e8 67 ff ff ff       	call   21d <lock_release>
}
 2b6:	89 d8                	mov    %ebx,%eax
 2b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2bb:	5b                   	pop    %ebx
 2bc:	5e                   	pop    %esi
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2bf:	b8 01 00 00 00       	mov    $0x1,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <exit>:
SYSCALL(exit)
 2c7:	b8 02 00 00 00       	mov    $0x2,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <wait>:
SYSCALL(wait)
 2cf:	b8 03 00 00 00       	mov    $0x3,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <pipe>:
SYSCALL(pipe)
 2d7:	b8 04 00 00 00       	mov    $0x4,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <read>:
SYSCALL(read)
 2df:	b8 05 00 00 00       	mov    $0x5,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <write>:
SYSCALL(write)
 2e7:	b8 10 00 00 00       	mov    $0x10,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <close>:
SYSCALL(close)
 2ef:	b8 15 00 00 00       	mov    $0x15,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <kill>:
SYSCALL(kill)
 2f7:	b8 06 00 00 00       	mov    $0x6,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <exec>:
SYSCALL(exec)
 2ff:	b8 07 00 00 00       	mov    $0x7,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <open>:
SYSCALL(open)
 307:	b8 0f 00 00 00       	mov    $0xf,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <mknod>:
SYSCALL(mknod)
 30f:	b8 11 00 00 00       	mov    $0x11,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <unlink>:
SYSCALL(unlink)
 317:	b8 12 00 00 00       	mov    $0x12,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <fstat>:
SYSCALL(fstat)
 31f:	b8 08 00 00 00       	mov    $0x8,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <link>:
SYSCALL(link)
 327:	b8 13 00 00 00       	mov    $0x13,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <mkdir>:
SYSCALL(mkdir)
 32f:	b8 14 00 00 00       	mov    $0x14,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <chdir>:
SYSCALL(chdir)
 337:	b8 09 00 00 00       	mov    $0x9,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <dup>:
SYSCALL(dup)
 33f:	b8 0a 00 00 00       	mov    $0xa,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <getpid>:
SYSCALL(getpid)
 347:	b8 0b 00 00 00       	mov    $0xb,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <sbrk>:
SYSCALL(sbrk)
 34f:	b8 0c 00 00 00       	mov    $0xc,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <sleep>:
SYSCALL(sleep)
 357:	b8 0d 00 00 00       	mov    $0xd,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <uptime>:
SYSCALL(uptime)
 35f:	b8 0e 00 00 00       	mov    $0xe,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <clone>:
SYSCALL(clone)
 367:	b8 16 00 00 00       	mov    $0x16,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <join>:
 36f:	b8 17 00 00 00       	mov    $0x17,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 377:	55                   	push   %ebp
 378:	89 e5                	mov    %esp,%ebp
 37a:	83 ec 1c             	sub    $0x1c,%esp
 37d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 380:	6a 01                	push   $0x1
 382:	8d 55 f4             	lea    -0xc(%ebp),%edx
 385:	52                   	push   %edx
 386:	50                   	push   %eax
 387:	e8 5b ff ff ff       	call   2e7 <write>
}
 38c:	83 c4 10             	add    $0x10,%esp
 38f:	c9                   	leave  
 390:	c3                   	ret    

00000391 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	57                   	push   %edi
 395:	56                   	push   %esi
 396:	53                   	push   %ebx
 397:	83 ec 2c             	sub    $0x2c,%esp
 39a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 39d:	89 d0                	mov    %edx,%eax
 39f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3a1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3a5:	0f 95 c1             	setne  %cl
 3a8:	c1 ea 1f             	shr    $0x1f,%edx
 3ab:	84 d1                	test   %dl,%cl
 3ad:	74 44                	je     3f3 <printint+0x62>
    neg = 1;
    x = -xx;
 3af:	f7 d8                	neg    %eax
 3b1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3b3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3ba:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3bf:	89 c8                	mov    %ecx,%eax
 3c1:	ba 00 00 00 00       	mov    $0x0,%edx
 3c6:	f7 f6                	div    %esi
 3c8:	89 df                	mov    %ebx,%edi
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	0f b6 92 60 07 00 00 	movzbl 0x760(%edx),%edx
 3d4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3d8:	89 ca                	mov    %ecx,%edx
 3da:	89 c1                	mov    %eax,%ecx
 3dc:	39 d6                	cmp    %edx,%esi
 3de:	76 df                	jbe    3bf <printint+0x2e>
  if(neg)
 3e0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3e4:	74 31                	je     417 <printint+0x86>
    buf[i++] = '-';
 3e6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3eb:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ee:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f1:	eb 17                	jmp    40a <printint+0x79>
    x = xx;
 3f3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3f5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3fc:	eb bc                	jmp    3ba <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3fe:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 403:	89 f0                	mov    %esi,%eax
 405:	e8 6d ff ff ff       	call   377 <putc>
  while(--i >= 0)
 40a:	83 eb 01             	sub    $0x1,%ebx
 40d:	79 ef                	jns    3fe <printint+0x6d>
}
 40f:	83 c4 2c             	add    $0x2c,%esp
 412:	5b                   	pop    %ebx
 413:	5e                   	pop    %esi
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	8b 75 d0             	mov    -0x30(%ebp),%esi
 41a:	eb ee                	jmp    40a <printint+0x79>

0000041c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	57                   	push   %edi
 420:	56                   	push   %esi
 421:	53                   	push   %ebx
 422:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 425:	8d 45 10             	lea    0x10(%ebp),%eax
 428:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 42b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 430:	bb 00 00 00 00       	mov    $0x0,%ebx
 435:	eb 14                	jmp    44b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 437:	89 fa                	mov    %edi,%edx
 439:	8b 45 08             	mov    0x8(%ebp),%eax
 43c:	e8 36 ff ff ff       	call   377 <putc>
 441:	eb 05                	jmp    448 <printf+0x2c>
      }
    } else if(state == '%'){
 443:	83 fe 25             	cmp    $0x25,%esi
 446:	74 25                	je     46d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 448:	83 c3 01             	add    $0x1,%ebx
 44b:	8b 45 0c             	mov    0xc(%ebp),%eax
 44e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 452:	84 c0                	test   %al,%al
 454:	0f 84 20 01 00 00    	je     57a <printf+0x15e>
    c = fmt[i] & 0xff;
 45a:	0f be f8             	movsbl %al,%edi
 45d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 460:	85 f6                	test   %esi,%esi
 462:	75 df                	jne    443 <printf+0x27>
      if(c == '%'){
 464:	83 f8 25             	cmp    $0x25,%eax
 467:	75 ce                	jne    437 <printf+0x1b>
        state = '%';
 469:	89 c6                	mov    %eax,%esi
 46b:	eb db                	jmp    448 <printf+0x2c>
      if(c == 'd'){
 46d:	83 f8 25             	cmp    $0x25,%eax
 470:	0f 84 cf 00 00 00    	je     545 <printf+0x129>
 476:	0f 8c dd 00 00 00    	jl     559 <printf+0x13d>
 47c:	83 f8 78             	cmp    $0x78,%eax
 47f:	0f 8f d4 00 00 00    	jg     559 <printf+0x13d>
 485:	83 f8 63             	cmp    $0x63,%eax
 488:	0f 8c cb 00 00 00    	jl     559 <printf+0x13d>
 48e:	83 e8 63             	sub    $0x63,%eax
 491:	83 f8 15             	cmp    $0x15,%eax
 494:	0f 87 bf 00 00 00    	ja     559 <printf+0x13d>
 49a:	ff 24 85 08 07 00 00 	jmp    *0x708(,%eax,4)
        printint(fd, *ap, 10, 1);
 4a1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4a4:	8b 17                	mov    (%edi),%edx
 4a6:	83 ec 0c             	sub    $0xc,%esp
 4a9:	6a 01                	push   $0x1
 4ab:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	e8 d9 fe ff ff       	call   391 <printint>
        ap++;
 4b8:	83 c7 04             	add    $0x4,%edi
 4bb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4be:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4c1:	be 00 00 00 00       	mov    $0x0,%esi
 4c6:	eb 80                	jmp    448 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4c8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4cb:	8b 17                	mov    (%edi),%edx
 4cd:	83 ec 0c             	sub    $0xc,%esp
 4d0:	6a 00                	push   $0x0
 4d2:	b9 10 00 00 00       	mov    $0x10,%ecx
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	e8 b2 fe ff ff       	call   391 <printint>
        ap++;
 4df:	83 c7 04             	add    $0x4,%edi
 4e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4e5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e8:	be 00 00 00 00       	mov    $0x0,%esi
 4ed:	e9 56 ff ff ff       	jmp    448 <printf+0x2c>
        s = (char*)*ap;
 4f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4f5:	8b 30                	mov    (%eax),%esi
        ap++;
 4f7:	83 c0 04             	add    $0x4,%eax
 4fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4fd:	85 f6                	test   %esi,%esi
 4ff:	75 15                	jne    516 <printf+0xfa>
          s = "(null)";
 501:	be ff 06 00 00       	mov    $0x6ff,%esi
 506:	eb 0e                	jmp    516 <printf+0xfa>
          putc(fd, *s);
 508:	0f be d2             	movsbl %dl,%edx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 64 fe ff ff       	call   377 <putc>
          s++;
 513:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 516:	0f b6 16             	movzbl (%esi),%edx
 519:	84 d2                	test   %dl,%dl
 51b:	75 eb                	jne    508 <printf+0xec>
      state = 0;
 51d:	be 00 00 00 00       	mov    $0x0,%esi
 522:	e9 21 ff ff ff       	jmp    448 <printf+0x2c>
        putc(fd, *ap);
 527:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 52a:	0f be 17             	movsbl (%edi),%edx
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	e8 42 fe ff ff       	call   377 <putc>
        ap++;
 535:	83 c7 04             	add    $0x4,%edi
 538:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 53b:	be 00 00 00 00       	mov    $0x0,%esi
 540:	e9 03 ff ff ff       	jmp    448 <printf+0x2c>
        putc(fd, c);
 545:	89 fa                	mov    %edi,%edx
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	e8 28 fe ff ff       	call   377 <putc>
      state = 0;
 54f:	be 00 00 00 00       	mov    $0x0,%esi
 554:	e9 ef fe ff ff       	jmp    448 <printf+0x2c>
        putc(fd, '%');
 559:	ba 25 00 00 00       	mov    $0x25,%edx
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	e8 11 fe ff ff       	call   377 <putc>
        putc(fd, c);
 566:	89 fa                	mov    %edi,%edx
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	e8 07 fe ff ff       	call   377 <putc>
      state = 0;
 570:	be 00 00 00 00       	mov    $0x0,%esi
 575:	e9 ce fe ff ff       	jmp    448 <printf+0x2c>
    }
  }
}
 57a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5f                   	pop    %edi
 580:	5d                   	pop    %ebp
 581:	c3                   	ret    

00000582 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 582:	55                   	push   %ebp
 583:	89 e5                	mov    %esp,%ebp
 585:	57                   	push   %edi
 586:	56                   	push   %esi
 587:	53                   	push   %ebx
 588:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 58b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 58e:	a1 b8 0a 00 00       	mov    0xab8,%eax
 593:	eb 02                	jmp    597 <free+0x15>
 595:	89 d0                	mov    %edx,%eax
 597:	39 c8                	cmp    %ecx,%eax
 599:	73 04                	jae    59f <free+0x1d>
 59b:	39 08                	cmp    %ecx,(%eax)
 59d:	77 12                	ja     5b1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 59f:	8b 10                	mov    (%eax),%edx
 5a1:	39 c2                	cmp    %eax,%edx
 5a3:	77 f0                	ja     595 <free+0x13>
 5a5:	39 c8                	cmp    %ecx,%eax
 5a7:	72 08                	jb     5b1 <free+0x2f>
 5a9:	39 ca                	cmp    %ecx,%edx
 5ab:	77 04                	ja     5b1 <free+0x2f>
 5ad:	89 d0                	mov    %edx,%eax
 5af:	eb e6                	jmp    597 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5b1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5b4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5b7:	8b 10                	mov    (%eax),%edx
 5b9:	39 d7                	cmp    %edx,%edi
 5bb:	74 19                	je     5d6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5c0:	8b 50 04             	mov    0x4(%eax),%edx
 5c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5c6:	39 ce                	cmp    %ecx,%esi
 5c8:	74 1b                	je     5e5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ca:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5cc:	a3 b8 0a 00 00       	mov    %eax,0xab8
}
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5f                   	pop    %edi
 5d4:	5d                   	pop    %ebp
 5d5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5d6:	03 72 04             	add    0x4(%edx),%esi
 5d9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5dc:	8b 10                	mov    (%eax),%edx
 5de:	8b 12                	mov    (%edx),%edx
 5e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5e3:	eb db                	jmp    5c0 <free+0x3e>
    p->s.size += bp->s.size;
 5e5:	03 53 fc             	add    -0x4(%ebx),%edx
 5e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5eb:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5ee:	89 10                	mov    %edx,(%eax)
 5f0:	eb da                	jmp    5cc <free+0x4a>

000005f2 <morecore>:

static Header*
morecore(uint nu)
{
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	53                   	push   %ebx
 5f6:	83 ec 04             	sub    $0x4,%esp
 5f9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5fb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 600:	77 05                	ja     607 <morecore+0x15>
    nu = 4096;
 602:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 607:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 60e:	83 ec 0c             	sub    $0xc,%esp
 611:	50                   	push   %eax
 612:	e8 38 fd ff ff       	call   34f <sbrk>
  if(p == (char*)-1)
 617:	83 c4 10             	add    $0x10,%esp
 61a:	83 f8 ff             	cmp    $0xffffffff,%eax
 61d:	74 1c                	je     63b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 61f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 622:	83 c0 08             	add    $0x8,%eax
 625:	83 ec 0c             	sub    $0xc,%esp
 628:	50                   	push   %eax
 629:	e8 54 ff ff ff       	call   582 <free>
  return freep;
 62e:	a1 b8 0a 00 00       	mov    0xab8,%eax
 633:	83 c4 10             	add    $0x10,%esp
}
 636:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 639:	c9                   	leave  
 63a:	c3                   	ret    
    return 0;
 63b:	b8 00 00 00 00       	mov    $0x0,%eax
 640:	eb f4                	jmp    636 <morecore+0x44>

00000642 <malloc>:

void*
malloc(uint nbytes)
{
 642:	55                   	push   %ebp
 643:	89 e5                	mov    %esp,%ebp
 645:	53                   	push   %ebx
 646:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 649:	8b 45 08             	mov    0x8(%ebp),%eax
 64c:	8d 58 07             	lea    0x7(%eax),%ebx
 64f:	c1 eb 03             	shr    $0x3,%ebx
 652:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 655:	8b 0d b8 0a 00 00    	mov    0xab8,%ecx
 65b:	85 c9                	test   %ecx,%ecx
 65d:	74 04                	je     663 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 65f:	8b 01                	mov    (%ecx),%eax
 661:	eb 4a                	jmp    6ad <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 663:	c7 05 b8 0a 00 00 bc 	movl   $0xabc,0xab8
 66a:	0a 00 00 
 66d:	c7 05 bc 0a 00 00 bc 	movl   $0xabc,0xabc
 674:	0a 00 00 
    base.s.size = 0;
 677:	c7 05 c0 0a 00 00 00 	movl   $0x0,0xac0
 67e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 681:	b9 bc 0a 00 00       	mov    $0xabc,%ecx
 686:	eb d7                	jmp    65f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 688:	74 19                	je     6a3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 68a:	29 da                	sub    %ebx,%edx
 68c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 68f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 692:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 695:	89 0d b8 0a 00 00    	mov    %ecx,0xab8
      return (void*)(p + 1);
 69b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 69e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a1:	c9                   	leave  
 6a2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6a3:	8b 10                	mov    (%eax),%edx
 6a5:	89 11                	mov    %edx,(%ecx)
 6a7:	eb ec                	jmp    695 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a9:	89 c1                	mov    %eax,%ecx
 6ab:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6ad:	8b 50 04             	mov    0x4(%eax),%edx
 6b0:	39 da                	cmp    %ebx,%edx
 6b2:	73 d4                	jae    688 <malloc+0x46>
    if(p == freep)
 6b4:	39 05 b8 0a 00 00    	cmp    %eax,0xab8
 6ba:	75 ed                	jne    6a9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6bc:	89 d8                	mov    %ebx,%eax
 6be:	e8 2f ff ff ff       	call   5f2 <morecore>
 6c3:	85 c0                	test   %eax,%eax
 6c5:	75 e2                	jne    6a9 <malloc+0x67>
 6c7:	eb d5                	jmp    69e <malloc+0x5c>
