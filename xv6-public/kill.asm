
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 b4 06 00 00       	push   $0x6b4
  2d:	6a 02                	push   $0x2
  2f:	e8 d0 03 00 00       	call   404 <printf>
    exit();
  34:	e8 76 02 00 00       	call   2af <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 52 01 00 00       	call   196 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 93 02 00 00       	call   2df <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 54 02 00 00       	call   2af <exit>

0000005b <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	8b 75 08             	mov    0x8(%ebp),%esi
  63:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  66:	89 f0                	mov    %esi,%eax
  68:	89 d1                	mov    %edx,%ecx
  6a:	83 c2 01             	add    $0x1,%edx
  6d:	89 c3                	mov    %eax,%ebx
  6f:	83 c0 01             	add    $0x1,%eax
  72:	0f b6 09             	movzbl (%ecx),%ecx
  75:	88 0b                	mov    %cl,(%ebx)
  77:	84 c9                	test   %cl,%cl
  79:	75 ed                	jne    68 <strcpy+0xd>
    ;
  return os;
}
  7b:	89 f0                	mov    %esi,%eax
  7d:	5b                   	pop    %ebx
  7e:	5e                   	pop    %esi
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    

00000081 <strcmp>:

int strcmp(const char *p, const char *q)
{
  81:	55                   	push   %ebp
  82:	89 e5                	mov    %esp,%ebp
  84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  87:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
  8a:	eb 06                	jmp    92 <strcmp+0x11>
    p++, q++;
  8c:	83 c1 01             	add    $0x1,%ecx
  8f:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  92:	0f b6 01             	movzbl (%ecx),%eax
  95:	84 c0                	test   %al,%al
  97:	74 04                	je     9d <strcmp+0x1c>
  99:	3a 02                	cmp    (%edx),%al
  9b:	74 ef                	je     8c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9d:	0f b6 c0             	movzbl %al,%eax
  a0:	0f b6 12             	movzbl (%edx),%edx
  a3:	29 d0                	sub    %edx,%eax
}
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    

000000a7 <strlen>:

uint strlen(const char *s)
{
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
  ad:	b8 00 00 00 00       	mov    $0x0,%eax
  b2:	eb 03                	jmp    b7 <strlen+0x10>
  b4:	83 c0 01             	add    $0x1,%eax
  b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bb:	75 f7                	jne    b4 <strlen+0xd>
    ;
  return n;
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <memset>:

void *
memset(void *dst, int c, uint n)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	57                   	push   %edi
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c6:	89 d7                	mov    %edx,%edi
  c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ce:	fc                   	cld    
  cf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d1:	89 d0                	mov    %edx,%eax
  d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d6:	c9                   	leave  
  d7:	c3                   	ret    

000000d8 <strchr>:

char *
strchr(const char *s, char c)
{
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
  e2:	eb 03                	jmp    e7 <strchr+0xf>
  e4:	83 c0 01             	add    $0x1,%eax
  e7:	0f b6 10             	movzbl (%eax),%edx
  ea:	84 d2                	test   %dl,%dl
  ec:	74 06                	je     f4 <strchr+0x1c>
    if (*s == c)
  ee:	38 ca                	cmp    %cl,%dl
  f0:	75 f2                	jne    e4 <strchr+0xc>
  f2:	eb 05                	jmp    f9 <strchr+0x21>
      return (char *)s;
  return 0;
  f4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <gets>:

char *
gets(char *buf, int max)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	57                   	push   %edi
  ff:	56                   	push   %esi
 100:	53                   	push   %ebx
 101:	83 ec 1c             	sub    $0x1c,%esp
 104:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 107:	bb 00 00 00 00       	mov    $0x0,%ebx
 10c:	89 de                	mov    %ebx,%esi
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 114:	7d 2e                	jge    144 <gets+0x49>
  {
    cc = read(0, &c, 1);
 116:	83 ec 04             	sub    $0x4,%esp
 119:	6a 01                	push   $0x1
 11b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11e:	50                   	push   %eax
 11f:	6a 00                	push   $0x0
 121:	e8 a1 01 00 00       	call   2c7 <read>
    if (cc < 1)
 126:	83 c4 10             	add    $0x10,%esp
 129:	85 c0                	test   %eax,%eax
 12b:	7e 17                	jle    144 <gets+0x49>
      break;
    buf[i++] = c;
 12d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 131:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 134:	3c 0a                	cmp    $0xa,%al
 136:	0f 94 c2             	sete   %dl
 139:	3c 0d                	cmp    $0xd,%al
 13b:	0f 94 c0             	sete   %al
 13e:	08 c2                	or     %al,%dl
 140:	74 ca                	je     10c <gets+0x11>
    buf[i++] = c;
 142:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 144:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 148:	89 f8                	mov    %edi,%eax
 14a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <stat>:

int stat(const char *n, struct stat *st)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	56                   	push   %esi
 156:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	6a 00                	push   $0x0
 15c:	ff 75 08             	push   0x8(%ebp)
 15f:	e8 8b 01 00 00       	call   2ef <open>
  if (fd < 0)
 164:	83 c4 10             	add    $0x10,%esp
 167:	85 c0                	test   %eax,%eax
 169:	78 24                	js     18f <stat+0x3d>
 16b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16d:	83 ec 08             	sub    $0x8,%esp
 170:	ff 75 0c             	push   0xc(%ebp)
 173:	50                   	push   %eax
 174:	e8 8e 01 00 00       	call   307 <fstat>
 179:	89 c6                	mov    %eax,%esi
  close(fd);
 17b:	89 1c 24             	mov    %ebx,(%esp)
 17e:	e8 54 01 00 00       	call   2d7 <close>
  return r;
 183:	83 c4 10             	add    $0x10,%esp
}
 186:	89 f0                	mov    %esi,%eax
 188:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
    return -1;
 18f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 194:	eb f0                	jmp    186 <stat+0x34>

00000196 <atoi>:

int atoi(const char *s)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19d:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 1a2:	eb 10                	jmp    1b4 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 1a4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1aa:	83 c1 01             	add    $0x1,%ecx
 1ad:	0f be c0             	movsbl %al,%eax
 1b0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 1b4:	0f b6 01             	movzbl (%ecx),%eax
 1b7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ba:	80 fb 09             	cmp    $0x9,%bl
 1bd:	76 e5                	jbe    1a4 <atoi+0xe>
  return n;
}
 1bf:	89 d0                	mov    %edx,%eax
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    

000001c6 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	56                   	push   %esi
 1ca:	53                   	push   %ebx
 1cb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 1d6:	eb 0d                	jmp    1e5 <memmove+0x1f>
    *dst++ = *src++;
 1d8:	0f b6 01             	movzbl (%ecx),%eax
 1db:	88 02                	mov    %al,(%edx)
 1dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e0:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 1e3:	89 d8                	mov    %ebx,%eax
 1e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <memmove+0x12>
  return vdst;
}
 1ec:	89 f0                	mov    %esi,%eax
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 1f8:	83 38 01             	cmpl   $0x1,(%eax)
 1fb:	74 fb                	je     1f8 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 1fd:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    

00000205 <lock_release>:
void lock_release(lock_t *lock)
{
 205:	55                   	push   %ebp
 206:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 208:	8b 45 08             	mov    0x8(%ebp),%eax
 20b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <lock_init>:
void lock_init(lock_t *lock)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    

00000221 <thread_create>:
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	53                   	push   %ebx
 225:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 228:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 22b:	53                   	push   %ebx
 22c:	e8 e2 ff ff ff       	call   213 <lock_init>
  lock_acquire(&lock);
 231:	89 1c 24             	mov    %ebx,(%esp)
 234:	e8 b9 ff ff ff       	call   1f2 <lock_acquire>
  void *stack = malloc(4096 * 2);
 239:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 240:	e8 e5 03 00 00       	call   62a <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 245:	50                   	push   %eax
 246:	ff 75 10             	push   0x10(%ebp)
 249:	ff 75 0c             	push   0xc(%ebp)
 24c:	ff 75 08             	push   0x8(%ebp)
 24f:	e8 fb 00 00 00       	call   34f <clone>
}
 254:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 257:	c9                   	leave  
 258:	c3                   	ret    

00000259 <thread_join>:
{
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
 25e:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 261:	6a 04                	push   $0x4
 263:	e8 c2 03 00 00       	call   62a <malloc>
 268:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 26b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 26e:	89 04 24             	mov    %eax,(%esp)
 271:	e8 e1 00 00 00       	call   357 <join>
 276:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 278:	8d 75 f0             	lea    -0x10(%ebp),%esi
 27b:	89 34 24             	mov    %esi,(%esp)
 27e:	e8 90 ff ff ff       	call   213 <lock_init>
  lock_acquire(&lock);
 283:	89 34 24             	mov    %esi,(%esp)
 286:	e8 67 ff ff ff       	call   1f2 <lock_acquire>
  free(stack);
 28b:	83 c4 04             	add    $0x4,%esp
 28e:	ff 75 f4             	push   -0xc(%ebp)
 291:	e8 d4 02 00 00       	call   56a <free>
  lock_release(&lock);
 296:	89 34 24             	mov    %esi,(%esp)
 299:	e8 67 ff ff ff       	call   205 <lock_release>
}
 29e:	89 d8                	mov    %ebx,%eax
 2a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a3:	5b                   	pop    %ebx
 2a4:	5e                   	pop    %esi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    

000002a7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a7:	b8 01 00 00 00       	mov    $0x1,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <exit>:
SYSCALL(exit)
 2af:	b8 02 00 00 00       	mov    $0x2,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <wait>:
SYSCALL(wait)
 2b7:	b8 03 00 00 00       	mov    $0x3,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <pipe>:
SYSCALL(pipe)
 2bf:	b8 04 00 00 00       	mov    $0x4,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <read>:
SYSCALL(read)
 2c7:	b8 05 00 00 00       	mov    $0x5,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <write>:
SYSCALL(write)
 2cf:	b8 10 00 00 00       	mov    $0x10,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <close>:
SYSCALL(close)
 2d7:	b8 15 00 00 00       	mov    $0x15,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <kill>:
SYSCALL(kill)
 2df:	b8 06 00 00 00       	mov    $0x6,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <exec>:
SYSCALL(exec)
 2e7:	b8 07 00 00 00       	mov    $0x7,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <open>:
SYSCALL(open)
 2ef:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <mknod>:
SYSCALL(mknod)
 2f7:	b8 11 00 00 00       	mov    $0x11,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <unlink>:
SYSCALL(unlink)
 2ff:	b8 12 00 00 00       	mov    $0x12,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <fstat>:
SYSCALL(fstat)
 307:	b8 08 00 00 00       	mov    $0x8,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <link>:
SYSCALL(link)
 30f:	b8 13 00 00 00       	mov    $0x13,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <mkdir>:
SYSCALL(mkdir)
 317:	b8 14 00 00 00       	mov    $0x14,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <chdir>:
SYSCALL(chdir)
 31f:	b8 09 00 00 00       	mov    $0x9,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <dup>:
SYSCALL(dup)
 327:	b8 0a 00 00 00       	mov    $0xa,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <getpid>:
SYSCALL(getpid)
 32f:	b8 0b 00 00 00       	mov    $0xb,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <sbrk>:
SYSCALL(sbrk)
 337:	b8 0c 00 00 00       	mov    $0xc,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <sleep>:
SYSCALL(sleep)
 33f:	b8 0d 00 00 00       	mov    $0xd,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <uptime>:
SYSCALL(uptime)
 347:	b8 0e 00 00 00       	mov    $0xe,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <clone>:
SYSCALL(clone)
 34f:	b8 16 00 00 00       	mov    $0x16,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <join>:
 357:	b8 17 00 00 00       	mov    $0x17,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	83 ec 1c             	sub    $0x1c,%esp
 365:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 368:	6a 01                	push   $0x1
 36a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 36d:	52                   	push   %edx
 36e:	50                   	push   %eax
 36f:	e8 5b ff ff ff       	call   2cf <write>
}
 374:	83 c4 10             	add    $0x10,%esp
 377:	c9                   	leave  
 378:	c3                   	ret    

00000379 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	57                   	push   %edi
 37d:	56                   	push   %esi
 37e:	53                   	push   %ebx
 37f:	83 ec 2c             	sub    $0x2c,%esp
 382:	89 45 d0             	mov    %eax,-0x30(%ebp)
 385:	89 d0                	mov    %edx,%eax
 387:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 389:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 38d:	0f 95 c1             	setne  %cl
 390:	c1 ea 1f             	shr    $0x1f,%edx
 393:	84 d1                	test   %dl,%cl
 395:	74 44                	je     3db <printint+0x62>
    neg = 1;
    x = -xx;
 397:	f7 d8                	neg    %eax
 399:	89 c1                	mov    %eax,%ecx
    neg = 1;
 39b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3a2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3a7:	89 c8                	mov    %ecx,%eax
 3a9:	ba 00 00 00 00       	mov    $0x0,%edx
 3ae:	f7 f6                	div    %esi
 3b0:	89 df                	mov    %ebx,%edi
 3b2:	83 c3 01             	add    $0x1,%ebx
 3b5:	0f b6 92 28 07 00 00 	movzbl 0x728(%edx),%edx
 3bc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3c0:	89 ca                	mov    %ecx,%edx
 3c2:	89 c1                	mov    %eax,%ecx
 3c4:	39 d6                	cmp    %edx,%esi
 3c6:	76 df                	jbe    3a7 <printint+0x2e>
  if(neg)
 3c8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3cc:	74 31                	je     3ff <printint+0x86>
    buf[i++] = '-';
 3ce:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3d3:	8d 5f 02             	lea    0x2(%edi),%ebx
 3d6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d9:	eb 17                	jmp    3f2 <printint+0x79>
    x = xx;
 3db:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3dd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3e4:	eb bc                	jmp    3a2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3e6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3eb:	89 f0                	mov    %esi,%eax
 3ed:	e8 6d ff ff ff       	call   35f <putc>
  while(--i >= 0)
 3f2:	83 eb 01             	sub    $0x1,%ebx
 3f5:	79 ef                	jns    3e6 <printint+0x6d>
}
 3f7:	83 c4 2c             	add    $0x2c,%esp
 3fa:	5b                   	pop    %ebx
 3fb:	5e                   	pop    %esi
 3fc:	5f                   	pop    %edi
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    
 3ff:	8b 75 d0             	mov    -0x30(%ebp),%esi
 402:	eb ee                	jmp    3f2 <printint+0x79>

00000404 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	53                   	push   %ebx
 40a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 40d:	8d 45 10             	lea    0x10(%ebp),%eax
 410:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 413:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 418:	bb 00 00 00 00       	mov    $0x0,%ebx
 41d:	eb 14                	jmp    433 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 41f:	89 fa                	mov    %edi,%edx
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	e8 36 ff ff ff       	call   35f <putc>
 429:	eb 05                	jmp    430 <printf+0x2c>
      }
    } else if(state == '%'){
 42b:	83 fe 25             	cmp    $0x25,%esi
 42e:	74 25                	je     455 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 430:	83 c3 01             	add    $0x1,%ebx
 433:	8b 45 0c             	mov    0xc(%ebp),%eax
 436:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 43a:	84 c0                	test   %al,%al
 43c:	0f 84 20 01 00 00    	je     562 <printf+0x15e>
    c = fmt[i] & 0xff;
 442:	0f be f8             	movsbl %al,%edi
 445:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 448:	85 f6                	test   %esi,%esi
 44a:	75 df                	jne    42b <printf+0x27>
      if(c == '%'){
 44c:	83 f8 25             	cmp    $0x25,%eax
 44f:	75 ce                	jne    41f <printf+0x1b>
        state = '%';
 451:	89 c6                	mov    %eax,%esi
 453:	eb db                	jmp    430 <printf+0x2c>
      if(c == 'd'){
 455:	83 f8 25             	cmp    $0x25,%eax
 458:	0f 84 cf 00 00 00    	je     52d <printf+0x129>
 45e:	0f 8c dd 00 00 00    	jl     541 <printf+0x13d>
 464:	83 f8 78             	cmp    $0x78,%eax
 467:	0f 8f d4 00 00 00    	jg     541 <printf+0x13d>
 46d:	83 f8 63             	cmp    $0x63,%eax
 470:	0f 8c cb 00 00 00    	jl     541 <printf+0x13d>
 476:	83 e8 63             	sub    $0x63,%eax
 479:	83 f8 15             	cmp    $0x15,%eax
 47c:	0f 87 bf 00 00 00    	ja     541 <printf+0x13d>
 482:	ff 24 85 d0 06 00 00 	jmp    *0x6d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 489:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 48c:	8b 17                	mov    (%edi),%edx
 48e:	83 ec 0c             	sub    $0xc,%esp
 491:	6a 01                	push   $0x1
 493:	b9 0a 00 00 00       	mov    $0xa,%ecx
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	e8 d9 fe ff ff       	call   379 <printint>
        ap++;
 4a0:	83 c7 04             	add    $0x4,%edi
 4a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a9:	be 00 00 00 00       	mov    $0x0,%esi
 4ae:	eb 80                	jmp    430 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b3:	8b 17                	mov    (%edi),%edx
 4b5:	83 ec 0c             	sub    $0xc,%esp
 4b8:	6a 00                	push   $0x0
 4ba:	b9 10 00 00 00       	mov    $0x10,%ecx
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	e8 b2 fe ff ff       	call   379 <printint>
        ap++;
 4c7:	83 c7 04             	add    $0x4,%edi
 4ca:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4cd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4d0:	be 00 00 00 00       	mov    $0x0,%esi
 4d5:	e9 56 ff ff ff       	jmp    430 <printf+0x2c>
        s = (char*)*ap;
 4da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4dd:	8b 30                	mov    (%eax),%esi
        ap++;
 4df:	83 c0 04             	add    $0x4,%eax
 4e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4e5:	85 f6                	test   %esi,%esi
 4e7:	75 15                	jne    4fe <printf+0xfa>
          s = "(null)";
 4e9:	be c8 06 00 00       	mov    $0x6c8,%esi
 4ee:	eb 0e                	jmp    4fe <printf+0xfa>
          putc(fd, *s);
 4f0:	0f be d2             	movsbl %dl,%edx
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	e8 64 fe ff ff       	call   35f <putc>
          s++;
 4fb:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4fe:	0f b6 16             	movzbl (%esi),%edx
 501:	84 d2                	test   %dl,%dl
 503:	75 eb                	jne    4f0 <printf+0xec>
      state = 0;
 505:	be 00 00 00 00       	mov    $0x0,%esi
 50a:	e9 21 ff ff ff       	jmp    430 <printf+0x2c>
        putc(fd, *ap);
 50f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 512:	0f be 17             	movsbl (%edi),%edx
 515:	8b 45 08             	mov    0x8(%ebp),%eax
 518:	e8 42 fe ff ff       	call   35f <putc>
        ap++;
 51d:	83 c7 04             	add    $0x4,%edi
 520:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	e9 03 ff ff ff       	jmp    430 <printf+0x2c>
        putc(fd, c);
 52d:	89 fa                	mov    %edi,%edx
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	e8 28 fe ff ff       	call   35f <putc>
      state = 0;
 537:	be 00 00 00 00       	mov    $0x0,%esi
 53c:	e9 ef fe ff ff       	jmp    430 <printf+0x2c>
        putc(fd, '%');
 541:	ba 25 00 00 00       	mov    $0x25,%edx
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	e8 11 fe ff ff       	call   35f <putc>
        putc(fd, c);
 54e:	89 fa                	mov    %edi,%edx
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	e8 07 fe ff ff       	call   35f <putc>
      state = 0;
 558:	be 00 00 00 00       	mov    $0x0,%esi
 55d:	e9 ce fe ff ff       	jmp    430 <printf+0x2c>
    }
  }
}
 562:	8d 65 f4             	lea    -0xc(%ebp),%esp
 565:	5b                   	pop    %ebx
 566:	5e                   	pop    %esi
 567:	5f                   	pop    %edi
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    

0000056a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 56a:	55                   	push   %ebp
 56b:	89 e5                	mov    %esp,%ebp
 56d:	57                   	push   %edi
 56e:	56                   	push   %esi
 56f:	53                   	push   %ebx
 570:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 573:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 576:	a1 80 0a 00 00       	mov    0xa80,%eax
 57b:	eb 02                	jmp    57f <free+0x15>
 57d:	89 d0                	mov    %edx,%eax
 57f:	39 c8                	cmp    %ecx,%eax
 581:	73 04                	jae    587 <free+0x1d>
 583:	39 08                	cmp    %ecx,(%eax)
 585:	77 12                	ja     599 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 587:	8b 10                	mov    (%eax),%edx
 589:	39 c2                	cmp    %eax,%edx
 58b:	77 f0                	ja     57d <free+0x13>
 58d:	39 c8                	cmp    %ecx,%eax
 58f:	72 08                	jb     599 <free+0x2f>
 591:	39 ca                	cmp    %ecx,%edx
 593:	77 04                	ja     599 <free+0x2f>
 595:	89 d0                	mov    %edx,%eax
 597:	eb e6                	jmp    57f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 599:	8b 73 fc             	mov    -0x4(%ebx),%esi
 59c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 59f:	8b 10                	mov    (%eax),%edx
 5a1:	39 d7                	cmp    %edx,%edi
 5a3:	74 19                	je     5be <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5a5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a8:	8b 50 04             	mov    0x4(%eax),%edx
 5ab:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ae:	39 ce                	cmp    %ecx,%esi
 5b0:	74 1b                	je     5cd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5b2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5b4:	a3 80 0a 00 00       	mov    %eax,0xa80
}
 5b9:	5b                   	pop    %ebx
 5ba:	5e                   	pop    %esi
 5bb:	5f                   	pop    %edi
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5be:	03 72 04             	add    0x4(%edx),%esi
 5c1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5c4:	8b 10                	mov    (%eax),%edx
 5c6:	8b 12                	mov    (%edx),%edx
 5c8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5cb:	eb db                	jmp    5a8 <free+0x3e>
    p->s.size += bp->s.size;
 5cd:	03 53 fc             	add    -0x4(%ebx),%edx
 5d0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5d3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5d6:	89 10                	mov    %edx,(%eax)
 5d8:	eb da                	jmp    5b4 <free+0x4a>

000005da <morecore>:

static Header*
morecore(uint nu)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	53                   	push   %ebx
 5de:	83 ec 04             	sub    $0x4,%esp
 5e1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5e3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5e8:	77 05                	ja     5ef <morecore+0x15>
    nu = 4096;
 5ea:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5ef:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5f6:	83 ec 0c             	sub    $0xc,%esp
 5f9:	50                   	push   %eax
 5fa:	e8 38 fd ff ff       	call   337 <sbrk>
  if(p == (char*)-1)
 5ff:	83 c4 10             	add    $0x10,%esp
 602:	83 f8 ff             	cmp    $0xffffffff,%eax
 605:	74 1c                	je     623 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 607:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 60a:	83 c0 08             	add    $0x8,%eax
 60d:	83 ec 0c             	sub    $0xc,%esp
 610:	50                   	push   %eax
 611:	e8 54 ff ff ff       	call   56a <free>
  return freep;
 616:	a1 80 0a 00 00       	mov    0xa80,%eax
 61b:	83 c4 10             	add    $0x10,%esp
}
 61e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 621:	c9                   	leave  
 622:	c3                   	ret    
    return 0;
 623:	b8 00 00 00 00       	mov    $0x0,%eax
 628:	eb f4                	jmp    61e <morecore+0x44>

0000062a <malloc>:

void*
malloc(uint nbytes)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	53                   	push   %ebx
 62e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 631:	8b 45 08             	mov    0x8(%ebp),%eax
 634:	8d 58 07             	lea    0x7(%eax),%ebx
 637:	c1 eb 03             	shr    $0x3,%ebx
 63a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 63d:	8b 0d 80 0a 00 00    	mov    0xa80,%ecx
 643:	85 c9                	test   %ecx,%ecx
 645:	74 04                	je     64b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 647:	8b 01                	mov    (%ecx),%eax
 649:	eb 4a                	jmp    695 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 64b:	c7 05 80 0a 00 00 84 	movl   $0xa84,0xa80
 652:	0a 00 00 
 655:	c7 05 84 0a 00 00 84 	movl   $0xa84,0xa84
 65c:	0a 00 00 
    base.s.size = 0;
 65f:	c7 05 88 0a 00 00 00 	movl   $0x0,0xa88
 666:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 669:	b9 84 0a 00 00       	mov    $0xa84,%ecx
 66e:	eb d7                	jmp    647 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 670:	74 19                	je     68b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 672:	29 da                	sub    %ebx,%edx
 674:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 677:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 67a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 67d:	89 0d 80 0a 00 00    	mov    %ecx,0xa80
      return (void*)(p + 1);
 683:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 689:	c9                   	leave  
 68a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 68b:	8b 10                	mov    (%eax),%edx
 68d:	89 11                	mov    %edx,(%ecx)
 68f:	eb ec                	jmp    67d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 691:	89 c1                	mov    %eax,%ecx
 693:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	39 da                	cmp    %ebx,%edx
 69a:	73 d4                	jae    670 <malloc+0x46>
    if(p == freep)
 69c:	39 05 80 0a 00 00    	cmp    %eax,0xa80
 6a2:	75 ed                	jne    691 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6a4:	89 d8                	mov    %ebx,%eax
 6a6:	e8 2f ff ff ff       	call   5da <morecore>
 6ab:	85 c0                	test   %eax,%eax
 6ad:	75 e2                	jne    691 <malloc+0x67>
 6af:	eb d5                	jmp    686 <malloc+0x5c>
