
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 34 07 00 00       	push   $0x734
  19:	e8 53 03 00 00       	call   371 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 7a 03 00 00       	call   3a9 <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 6e 03 00 00       	call   3a9 <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 34 07 00 00       	push   $0x734
  4c:	e8 28 03 00 00       	call   379 <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 34 07 00 00       	push   $0x734
  5b:	e8 11 03 00 00       	call   371 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 4f 07 00 00       	push   $0x74f
  6d:	6a 01                	push   $0x1
  6f:	e8 12 04 00 00       	call   486 <printf>
      exit();
  74:	e8 b8 02 00 00       	call   331 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 7b 07 00 00       	push   $0x77b
  81:	6a 01                	push   $0x1
  83:	e8 fe 03 00 00       	call   486 <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 a9 02 00 00       	call   339 <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 3c 07 00 00       	push   $0x73c
  a0:	6a 01                	push   $0x1
  a2:	e8 df 03 00 00       	call   486 <printf>
    pid = fork();
  a7:	e8 7d 02 00 00       	call   329 <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 34 0b 00 00       	push   $0xb34
  bf:	68 62 07 00 00       	push   $0x762
  c4:	e8 a0 02 00 00       	call   369 <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 65 07 00 00       	push   $0x765
  d1:	6a 01                	push   $0x1
  d3:	e8 ae 03 00 00       	call   486 <printf>
      exit();
  d8:	e8 54 02 00 00       	call   331 <exit>

000000dd <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	56                   	push   %esi
  e1:	53                   	push   %ebx
  e2:	8b 75 08             	mov    0x8(%ebp),%esi
  e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  e8:	89 f0                	mov    %esi,%eax
  ea:	89 d1                	mov    %edx,%ecx
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	89 c3                	mov    %eax,%ebx
  f1:	83 c0 01             	add    $0x1,%eax
  f4:	0f b6 09             	movzbl (%ecx),%ecx
  f7:	88 0b                	mov    %cl,(%ebx)
  f9:	84 c9                	test   %cl,%cl
  fb:	75 ed                	jne    ea <strcpy+0xd>
    ;
  return os;
}
  fd:	89 f0                	mov    %esi,%eax
  ff:	5b                   	pop    %ebx
 100:	5e                   	pop    %esi
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    

00000103 <strcmp>:

int strcmp(const char *p, const char *q)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 10c:	eb 06                	jmp    114 <strcmp+0x11>
    p++, q++;
 10e:	83 c1 01             	add    $0x1,%ecx
 111:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 114:	0f b6 01             	movzbl (%ecx),%eax
 117:	84 c0                	test   %al,%al
 119:	74 04                	je     11f <strcmp+0x1c>
 11b:	3a 02                	cmp    (%edx),%al
 11d:	74 ef                	je     10e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 11f:	0f b6 c0             	movzbl %al,%eax
 122:	0f b6 12             	movzbl (%edx),%edx
 125:	29 d0                	sub    %edx,%eax
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    

00000129 <strlen>:

uint strlen(const char *s)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 12f:	b8 00 00 00 00       	mov    $0x0,%eax
 134:	eb 03                	jmp    139 <strlen+0x10>
 136:	83 c0 01             	add    $0x1,%eax
 139:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 13d:	75 f7                	jne    136 <strlen+0xd>
    ;
  return n;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    

00000141 <memset>:

void *
memset(void *dst, int c, uint n)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	57                   	push   %edi
 145:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 148:	89 d7                	mov    %edx,%edi
 14a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14d:	8b 45 0c             	mov    0xc(%ebp),%eax
 150:	fc                   	cld    
 151:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 153:	89 d0                	mov    %edx,%eax
 155:	8b 7d fc             	mov    -0x4(%ebp),%edi
 158:	c9                   	leave  
 159:	c3                   	ret    

0000015a <strchr>:

char *
strchr(const char *s, char c)
{
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 164:	eb 03                	jmp    169 <strchr+0xf>
 166:	83 c0 01             	add    $0x1,%eax
 169:	0f b6 10             	movzbl (%eax),%edx
 16c:	84 d2                	test   %dl,%dl
 16e:	74 06                	je     176 <strchr+0x1c>
    if (*s == c)
 170:	38 ca                	cmp    %cl,%dl
 172:	75 f2                	jne    166 <strchr+0xc>
 174:	eb 05                	jmp    17b <strchr+0x21>
      return (char *)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    

0000017d <gets>:

char *
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	57                   	push   %edi
 181:	56                   	push   %esi
 182:	53                   	push   %ebx
 183:	83 ec 1c             	sub    $0x1c,%esp
 186:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 189:	bb 00 00 00 00       	mov    $0x0,%ebx
 18e:	89 de                	mov    %ebx,%esi
 190:	83 c3 01             	add    $0x1,%ebx
 193:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 196:	7d 2e                	jge    1c6 <gets+0x49>
  {
    cc = read(0, &c, 1);
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	6a 01                	push   $0x1
 19d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	6a 00                	push   $0x0
 1a3:	e8 a1 01 00 00       	call   349 <read>
    if (cc < 1)
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 17                	jle    1c6 <gets+0x49>
      break;
    buf[i++] = c;
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 1b6:	3c 0a                	cmp    $0xa,%al
 1b8:	0f 94 c2             	sete   %dl
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	0f 94 c0             	sete   %al
 1c0:	08 c2                	or     %al,%dl
 1c2:	74 ca                	je     18e <gets+0x11>
    buf[i++] = c;
 1c4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1c6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1ca:	89 f8                	mov    %edi,%eax
 1cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cf:	5b                   	pop    %ebx
 1d0:	5e                   	pop    %esi
 1d1:	5f                   	pop    %edi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <stat>:

int stat(const char *n, struct stat *st)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	6a 00                	push   $0x0
 1de:	ff 75 08             	push   0x8(%ebp)
 1e1:	e8 8b 01 00 00       	call   371 <open>
  if (fd < 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
 1eb:	78 24                	js     211 <stat+0x3d>
 1ed:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ef:	83 ec 08             	sub    $0x8,%esp
 1f2:	ff 75 0c             	push   0xc(%ebp)
 1f5:	50                   	push   %eax
 1f6:	e8 8e 01 00 00       	call   389 <fstat>
 1fb:	89 c6                	mov    %eax,%esi
  close(fd);
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	e8 54 01 00 00       	call   359 <close>
  return r;
 205:	83 c4 10             	add    $0x10,%esp
}
 208:	89 f0                	mov    %esi,%eax
 20a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
    return -1;
 211:	be ff ff ff ff       	mov    $0xffffffff,%esi
 216:	eb f0                	jmp    208 <stat+0x34>

00000218 <atoi>:

int atoi(const char *s)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	53                   	push   %ebx
 21c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 21f:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 224:	eb 10                	jmp    236 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 226:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 229:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 22c:	83 c1 01             	add    $0x1,%ecx
 22f:	0f be c0             	movsbl %al,%eax
 232:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 236:	0f b6 01             	movzbl (%ecx),%eax
 239:	8d 58 d0             	lea    -0x30(%eax),%ebx
 23c:	80 fb 09             	cmp    $0x9,%bl
 23f:	76 e5                	jbe    226 <atoi+0xe>
  return n;
}
 241:	89 d0                	mov    %edx,%eax
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 246:	c9                   	leave  
 247:	c3                   	ret    

00000248 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
 24d:	8b 75 08             	mov    0x8(%ebp),%esi
 250:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 253:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 256:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 258:	eb 0d                	jmp    267 <memmove+0x1f>
    *dst++ = *src++;
 25a:	0f b6 01             	movzbl (%ecx),%eax
 25d:	88 02                	mov    %al,(%edx)
 25f:	8d 49 01             	lea    0x1(%ecx),%ecx
 262:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 265:	89 d8                	mov    %ebx,%eax
 267:	8d 58 ff             	lea    -0x1(%eax),%ebx
 26a:	85 c0                	test   %eax,%eax
 26c:	7f ec                	jg     25a <memmove+0x12>
  return vdst;
}
 26e:	89 f0                	mov    %esi,%eax
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 27a:	83 38 01             	cmpl   $0x1,(%eax)
 27d:	74 fb                	je     27a <lock_acquire+0x6>
    ;
  lock->flag = 1;
 27f:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    

00000287 <lock_release>:
void lock_release(lock_t *lock)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    

00000295 <lock_init>:
void lock_init(lock_t *lock)
{
 295:	55                   	push   %ebp
 296:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <thread_create>:
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 2aa:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 2ad:	53                   	push   %ebx
 2ae:	e8 e2 ff ff ff       	call   295 <lock_init>
  lock_acquire(&lock);
 2b3:	89 1c 24             	mov    %ebx,(%esp)
 2b6:	e8 b9 ff ff ff       	call   274 <lock_acquire>
  void *stack = malloc(4096 * 2);
 2bb:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 2c2:	e8 e5 03 00 00       	call   6ac <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 2c7:	50                   	push   %eax
 2c8:	ff 75 10             	push   0x10(%ebp)
 2cb:	ff 75 0c             	push   0xc(%ebp)
 2ce:	ff 75 08             	push   0x8(%ebp)
 2d1:	e8 fb 00 00 00       	call   3d1 <clone>
}
 2d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d9:	c9                   	leave  
 2da:	c3                   	ret    

000002db <thread_join>:
{
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	56                   	push   %esi
 2df:	53                   	push   %ebx
 2e0:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 2e3:	6a 04                	push   $0x4
 2e5:	e8 c2 03 00 00       	call   6ac <malloc>
 2ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 2ed:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2f0:	89 04 24             	mov    %eax,(%esp)
 2f3:	e8 e1 00 00 00       	call   3d9 <join>
 2f8:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 2fa:	8d 75 f0             	lea    -0x10(%ebp),%esi
 2fd:	89 34 24             	mov    %esi,(%esp)
 300:	e8 90 ff ff ff       	call   295 <lock_init>
  lock_acquire(&lock);
 305:	89 34 24             	mov    %esi,(%esp)
 308:	e8 67 ff ff ff       	call   274 <lock_acquire>
  free(stack);
 30d:	83 c4 04             	add    $0x4,%esp
 310:	ff 75 f4             	push   -0xc(%ebp)
 313:	e8 d4 02 00 00       	call   5ec <free>
  lock_release(&lock);
 318:	89 34 24             	mov    %esi,(%esp)
 31b:	e8 67 ff ff ff       	call   287 <lock_release>
}
 320:	89 d8                	mov    %ebx,%eax
 322:	8d 65 f8             	lea    -0x8(%ebp),%esp
 325:	5b                   	pop    %ebx
 326:	5e                   	pop    %esi
 327:	5d                   	pop    %ebp
 328:	c3                   	ret    

00000329 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 329:	b8 01 00 00 00       	mov    $0x1,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <exit>:
SYSCALL(exit)
 331:	b8 02 00 00 00       	mov    $0x2,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <wait>:
SYSCALL(wait)
 339:	b8 03 00 00 00       	mov    $0x3,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <pipe>:
SYSCALL(pipe)
 341:	b8 04 00 00 00       	mov    $0x4,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <read>:
SYSCALL(read)
 349:	b8 05 00 00 00       	mov    $0x5,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <write>:
SYSCALL(write)
 351:	b8 10 00 00 00       	mov    $0x10,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <close>:
SYSCALL(close)
 359:	b8 15 00 00 00       	mov    $0x15,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <kill>:
SYSCALL(kill)
 361:	b8 06 00 00 00       	mov    $0x6,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <exec>:
SYSCALL(exec)
 369:	b8 07 00 00 00       	mov    $0x7,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <open>:
SYSCALL(open)
 371:	b8 0f 00 00 00       	mov    $0xf,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <mknod>:
SYSCALL(mknod)
 379:	b8 11 00 00 00       	mov    $0x11,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <unlink>:
SYSCALL(unlink)
 381:	b8 12 00 00 00       	mov    $0x12,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <fstat>:
SYSCALL(fstat)
 389:	b8 08 00 00 00       	mov    $0x8,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <link>:
SYSCALL(link)
 391:	b8 13 00 00 00       	mov    $0x13,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <mkdir>:
SYSCALL(mkdir)
 399:	b8 14 00 00 00       	mov    $0x14,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <chdir>:
SYSCALL(chdir)
 3a1:	b8 09 00 00 00       	mov    $0x9,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <dup>:
SYSCALL(dup)
 3a9:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <getpid>:
SYSCALL(getpid)
 3b1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <sbrk>:
SYSCALL(sbrk)
 3b9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <sleep>:
SYSCALL(sleep)
 3c1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <uptime>:
SYSCALL(uptime)
 3c9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <clone>:
SYSCALL(clone)
 3d1:	b8 16 00 00 00       	mov    $0x16,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <join>:
 3d9:	b8 17 00 00 00       	mov    $0x17,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3e1:	55                   	push   %ebp
 3e2:	89 e5                	mov    %esp,%ebp
 3e4:	83 ec 1c             	sub    $0x1c,%esp
 3e7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ea:	6a 01                	push   $0x1
 3ec:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3ef:	52                   	push   %edx
 3f0:	50                   	push   %eax
 3f1:	e8 5b ff ff ff       	call   351 <write>
}
 3f6:	83 c4 10             	add    $0x10,%esp
 3f9:	c9                   	leave  
 3fa:	c3                   	ret    

000003fb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3fb:	55                   	push   %ebp
 3fc:	89 e5                	mov    %esp,%ebp
 3fe:	57                   	push   %edi
 3ff:	56                   	push   %esi
 400:	53                   	push   %ebx
 401:	83 ec 2c             	sub    $0x2c,%esp
 404:	89 45 d0             	mov    %eax,-0x30(%ebp)
 407:	89 d0                	mov    %edx,%eax
 409:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 40f:	0f 95 c1             	setne  %cl
 412:	c1 ea 1f             	shr    $0x1f,%edx
 415:	84 d1                	test   %dl,%cl
 417:	74 44                	je     45d <printint+0x62>
    neg = 1;
    x = -xx;
 419:	f7 d8                	neg    %eax
 41b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 41d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 424:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 429:	89 c8                	mov    %ecx,%eax
 42b:	ba 00 00 00 00       	mov    $0x0,%edx
 430:	f7 f6                	div    %esi
 432:	89 df                	mov    %ebx,%edi
 434:	83 c3 01             	add    $0x1,%ebx
 437:	0f b6 92 e4 07 00 00 	movzbl 0x7e4(%edx),%edx
 43e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 442:	89 ca                	mov    %ecx,%edx
 444:	89 c1                	mov    %eax,%ecx
 446:	39 d6                	cmp    %edx,%esi
 448:	76 df                	jbe    429 <printint+0x2e>
  if(neg)
 44a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 44e:	74 31                	je     481 <printint+0x86>
    buf[i++] = '-';
 450:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 455:	8d 5f 02             	lea    0x2(%edi),%ebx
 458:	8b 75 d0             	mov    -0x30(%ebp),%esi
 45b:	eb 17                	jmp    474 <printint+0x79>
    x = xx;
 45d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 45f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 466:	eb bc                	jmp    424 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 468:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 46d:	89 f0                	mov    %esi,%eax
 46f:	e8 6d ff ff ff       	call   3e1 <putc>
  while(--i >= 0)
 474:	83 eb 01             	sub    $0x1,%ebx
 477:	79 ef                	jns    468 <printint+0x6d>
}
 479:	83 c4 2c             	add    $0x2c,%esp
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5f                   	pop    %edi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
 481:	8b 75 d0             	mov    -0x30(%ebp),%esi
 484:	eb ee                	jmp    474 <printint+0x79>

00000486 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 486:	55                   	push   %ebp
 487:	89 e5                	mov    %esp,%ebp
 489:	57                   	push   %edi
 48a:	56                   	push   %esi
 48b:	53                   	push   %ebx
 48c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 48f:	8d 45 10             	lea    0x10(%ebp),%eax
 492:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 495:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 49a:	bb 00 00 00 00       	mov    $0x0,%ebx
 49f:	eb 14                	jmp    4b5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4a1:	89 fa                	mov    %edi,%edx
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	e8 36 ff ff ff       	call   3e1 <putc>
 4ab:	eb 05                	jmp    4b2 <printf+0x2c>
      }
    } else if(state == '%'){
 4ad:	83 fe 25             	cmp    $0x25,%esi
 4b0:	74 25                	je     4d7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4b2:	83 c3 01             	add    $0x1,%ebx
 4b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4bc:	84 c0                	test   %al,%al
 4be:	0f 84 20 01 00 00    	je     5e4 <printf+0x15e>
    c = fmt[i] & 0xff;
 4c4:	0f be f8             	movsbl %al,%edi
 4c7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4ca:	85 f6                	test   %esi,%esi
 4cc:	75 df                	jne    4ad <printf+0x27>
      if(c == '%'){
 4ce:	83 f8 25             	cmp    $0x25,%eax
 4d1:	75 ce                	jne    4a1 <printf+0x1b>
        state = '%';
 4d3:	89 c6                	mov    %eax,%esi
 4d5:	eb db                	jmp    4b2 <printf+0x2c>
      if(c == 'd'){
 4d7:	83 f8 25             	cmp    $0x25,%eax
 4da:	0f 84 cf 00 00 00    	je     5af <printf+0x129>
 4e0:	0f 8c dd 00 00 00    	jl     5c3 <printf+0x13d>
 4e6:	83 f8 78             	cmp    $0x78,%eax
 4e9:	0f 8f d4 00 00 00    	jg     5c3 <printf+0x13d>
 4ef:	83 f8 63             	cmp    $0x63,%eax
 4f2:	0f 8c cb 00 00 00    	jl     5c3 <printf+0x13d>
 4f8:	83 e8 63             	sub    $0x63,%eax
 4fb:	83 f8 15             	cmp    $0x15,%eax
 4fe:	0f 87 bf 00 00 00    	ja     5c3 <printf+0x13d>
 504:	ff 24 85 8c 07 00 00 	jmp    *0x78c(,%eax,4)
        printint(fd, *ap, 10, 1);
 50b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50e:	8b 17                	mov    (%edi),%edx
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	6a 01                	push   $0x1
 515:	b9 0a 00 00 00       	mov    $0xa,%ecx
 51a:	8b 45 08             	mov    0x8(%ebp),%eax
 51d:	e8 d9 fe ff ff       	call   3fb <printint>
        ap++;
 522:	83 c7 04             	add    $0x4,%edi
 525:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 528:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52b:	be 00 00 00 00       	mov    $0x0,%esi
 530:	eb 80                	jmp    4b2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 532:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 535:	8b 17                	mov    (%edi),%edx
 537:	83 ec 0c             	sub    $0xc,%esp
 53a:	6a 00                	push   $0x0
 53c:	b9 10 00 00 00       	mov    $0x10,%ecx
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	e8 b2 fe ff ff       	call   3fb <printint>
        ap++;
 549:	83 c7 04             	add    $0x4,%edi
 54c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 54f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 552:	be 00 00 00 00       	mov    $0x0,%esi
 557:	e9 56 ff ff ff       	jmp    4b2 <printf+0x2c>
        s = (char*)*ap;
 55c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55f:	8b 30                	mov    (%eax),%esi
        ap++;
 561:	83 c0 04             	add    $0x4,%eax
 564:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 567:	85 f6                	test   %esi,%esi
 569:	75 15                	jne    580 <printf+0xfa>
          s = "(null)";
 56b:	be 84 07 00 00       	mov    $0x784,%esi
 570:	eb 0e                	jmp    580 <printf+0xfa>
          putc(fd, *s);
 572:	0f be d2             	movsbl %dl,%edx
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	e8 64 fe ff ff       	call   3e1 <putc>
          s++;
 57d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 580:	0f b6 16             	movzbl (%esi),%edx
 583:	84 d2                	test   %dl,%dl
 585:	75 eb                	jne    572 <printf+0xec>
      state = 0;
 587:	be 00 00 00 00       	mov    $0x0,%esi
 58c:	e9 21 ff ff ff       	jmp    4b2 <printf+0x2c>
        putc(fd, *ap);
 591:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 594:	0f be 17             	movsbl (%edi),%edx
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	e8 42 fe ff ff       	call   3e1 <putc>
        ap++;
 59f:	83 c7 04             	add    $0x4,%edi
 5a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5a5:	be 00 00 00 00       	mov    $0x0,%esi
 5aa:	e9 03 ff ff ff       	jmp    4b2 <printf+0x2c>
        putc(fd, c);
 5af:	89 fa                	mov    %edi,%edx
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	e8 28 fe ff ff       	call   3e1 <putc>
      state = 0;
 5b9:	be 00 00 00 00       	mov    $0x0,%esi
 5be:	e9 ef fe ff ff       	jmp    4b2 <printf+0x2c>
        putc(fd, '%');
 5c3:	ba 25 00 00 00       	mov    $0x25,%edx
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	e8 11 fe ff ff       	call   3e1 <putc>
        putc(fd, c);
 5d0:	89 fa                	mov    %edi,%edx
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	e8 07 fe ff ff       	call   3e1 <putc>
      state = 0;
 5da:	be 00 00 00 00       	mov    $0x0,%esi
 5df:	e9 ce fe ff ff       	jmp    4b2 <printf+0x2c>
    }
  }
}
 5e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e7:	5b                   	pop    %ebx
 5e8:	5e                   	pop    %esi
 5e9:	5f                   	pop    %edi
 5ea:	5d                   	pop    %ebp
 5eb:	c3                   	ret    

000005ec <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	57                   	push   %edi
 5f0:	56                   	push   %esi
 5f1:	53                   	push   %ebx
 5f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f8:	a1 3c 0b 00 00       	mov    0xb3c,%eax
 5fd:	eb 02                	jmp    601 <free+0x15>
 5ff:	89 d0                	mov    %edx,%eax
 601:	39 c8                	cmp    %ecx,%eax
 603:	73 04                	jae    609 <free+0x1d>
 605:	39 08                	cmp    %ecx,(%eax)
 607:	77 12                	ja     61b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 609:	8b 10                	mov    (%eax),%edx
 60b:	39 c2                	cmp    %eax,%edx
 60d:	77 f0                	ja     5ff <free+0x13>
 60f:	39 c8                	cmp    %ecx,%eax
 611:	72 08                	jb     61b <free+0x2f>
 613:	39 ca                	cmp    %ecx,%edx
 615:	77 04                	ja     61b <free+0x2f>
 617:	89 d0                	mov    %edx,%eax
 619:	eb e6                	jmp    601 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 61b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 621:	8b 10                	mov    (%eax),%edx
 623:	39 d7                	cmp    %edx,%edi
 625:	74 19                	je     640 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 627:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 62a:	8b 50 04             	mov    0x4(%eax),%edx
 62d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 630:	39 ce                	cmp    %ecx,%esi
 632:	74 1b                	je     64f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 634:	89 08                	mov    %ecx,(%eax)
  freep = p;
 636:	a3 3c 0b 00 00       	mov    %eax,0xb3c
}
 63b:	5b                   	pop    %ebx
 63c:	5e                   	pop    %esi
 63d:	5f                   	pop    %edi
 63e:	5d                   	pop    %ebp
 63f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 640:	03 72 04             	add    0x4(%edx),%esi
 643:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 646:	8b 10                	mov    (%eax),%edx
 648:	8b 12                	mov    (%edx),%edx
 64a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 64d:	eb db                	jmp    62a <free+0x3e>
    p->s.size += bp->s.size;
 64f:	03 53 fc             	add    -0x4(%ebx),%edx
 652:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 655:	8b 53 f8             	mov    -0x8(%ebx),%edx
 658:	89 10                	mov    %edx,(%eax)
 65a:	eb da                	jmp    636 <free+0x4a>

0000065c <morecore>:

static Header*
morecore(uint nu)
{
 65c:	55                   	push   %ebp
 65d:	89 e5                	mov    %esp,%ebp
 65f:	53                   	push   %ebx
 660:	83 ec 04             	sub    $0x4,%esp
 663:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 665:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 66a:	77 05                	ja     671 <morecore+0x15>
    nu = 4096;
 66c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 671:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 678:	83 ec 0c             	sub    $0xc,%esp
 67b:	50                   	push   %eax
 67c:	e8 38 fd ff ff       	call   3b9 <sbrk>
  if(p == (char*)-1)
 681:	83 c4 10             	add    $0x10,%esp
 684:	83 f8 ff             	cmp    $0xffffffff,%eax
 687:	74 1c                	je     6a5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 689:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 68c:	83 c0 08             	add    $0x8,%eax
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	50                   	push   %eax
 693:	e8 54 ff ff ff       	call   5ec <free>
  return freep;
 698:	a1 3c 0b 00 00       	mov    0xb3c,%eax
 69d:	83 c4 10             	add    $0x10,%esp
}
 6a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a3:	c9                   	leave  
 6a4:	c3                   	ret    
    return 0;
 6a5:	b8 00 00 00 00       	mov    $0x0,%eax
 6aa:	eb f4                	jmp    6a0 <morecore+0x44>

000006ac <malloc>:

void*
malloc(uint nbytes)
{
 6ac:	55                   	push   %ebp
 6ad:	89 e5                	mov    %esp,%ebp
 6af:	53                   	push   %ebx
 6b0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	8d 58 07             	lea    0x7(%eax),%ebx
 6b9:	c1 eb 03             	shr    $0x3,%ebx
 6bc:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6bf:	8b 0d 3c 0b 00 00    	mov    0xb3c,%ecx
 6c5:	85 c9                	test   %ecx,%ecx
 6c7:	74 04                	je     6cd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c9:	8b 01                	mov    (%ecx),%eax
 6cb:	eb 4a                	jmp    717 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6cd:	c7 05 3c 0b 00 00 40 	movl   $0xb40,0xb3c
 6d4:	0b 00 00 
 6d7:	c7 05 40 0b 00 00 40 	movl   $0xb40,0xb40
 6de:	0b 00 00 
    base.s.size = 0;
 6e1:	c7 05 44 0b 00 00 00 	movl   $0x0,0xb44
 6e8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6eb:	b9 40 0b 00 00       	mov    $0xb40,%ecx
 6f0:	eb d7                	jmp    6c9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6f2:	74 19                	je     70d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6f4:	29 da                	sub    %ebx,%edx
 6f6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6fc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6ff:	89 0d 3c 0b 00 00    	mov    %ecx,0xb3c
      return (void*)(p + 1);
 705:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 708:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 70b:	c9                   	leave  
 70c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 70d:	8b 10                	mov    (%eax),%edx
 70f:	89 11                	mov    %edx,(%ecx)
 711:	eb ec                	jmp    6ff <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 713:	89 c1                	mov    %eax,%ecx
 715:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 717:	8b 50 04             	mov    0x4(%eax),%edx
 71a:	39 da                	cmp    %ebx,%edx
 71c:	73 d4                	jae    6f2 <malloc+0x46>
    if(p == freep)
 71e:	39 05 3c 0b 00 00    	cmp    %eax,0xb3c
 724:	75 ed                	jne    713 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 726:	89 d8                	mov    %ebx,%eax
 728:	e8 2f ff ff ff       	call   65c <morecore>
 72d:	85 c0                	test   %eax,%eax
 72f:	75 e2                	jne    713 <malloc+0x67>
 731:	eb d5                	jmp    708 <malloc+0x5c>
