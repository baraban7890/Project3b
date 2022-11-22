
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 f9 03 00 00       	call   40f <getpid>
  16:	a3 ac 0b 00 00       	mov    %eax,0xbac

   int fork_pid = fork();
  1b:	e8 67 03 00 00       	call   387 <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 63                	je     87 <main+0x87>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 66                	jle    8c <main+0x8c>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 05 04 00 00       	call   437 <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 94 07 00 00       	push   $0x794
  45:	68 9d 07 00 00       	push   $0x79d
  4a:	6a 01                	push   $0x1
  4c:	e8 93 04 00 00       	call   4e4 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 d3 07 00 00       	push   $0x7d3
  59:	68 b2 07 00 00       	push   $0x7b2
  5e:	6a 01                	push   $0x1
  60:	e8 7f 04 00 00       	call   4e4 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 c6 07 00 00       	push   $0x7c6
  6d:	6a 01                	push   $0x1
  6f:	e8 70 04 00 00       	call   4e4 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 ac 0b 00 00    	push   0xbac
  7d:	e8 3d 03 00 00       	call   3bf <kill>
  82:	e8 08 03 00 00       	call   38f <exit>
     exit();
  87:	e8 03 03 00 00       	call   38f <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 94 07 00 00       	push   $0x794
  93:	68 9d 07 00 00       	push   $0x79d
  98:	6a 01                	push   $0x1
  9a:	e8 45 04 00 00       	call   4e4 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 a5 07 00 00       	push   $0x7a5
  a7:	68 b2 07 00 00       	push   $0x7b2
  ac:	6a 01                	push   $0x1
  ae:	e8 31 04 00 00       	call   4e4 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 c6 07 00 00       	push   $0x7c6
  bb:	6a 01                	push   $0x1
  bd:	e8 22 04 00 00       	call   4e4 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 ac 0b 00 00    	push   0xbac
  cb:	e8 ef 02 00 00       	call   3bf <kill>
  d0:	e8 ba 02 00 00       	call   38f <exit>

   assert(wait() > 0);
  d5:	e8 bd 02 00 00       	call   397 <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 ed 07 00 00       	push   $0x7ed
  e6:	6a 01                	push   $0x1
  e8:	e8 f7 03 00 00       	call   4e4 <printf>
   exit();
  ed:	e8 9d 02 00 00       	call   38f <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 94 07 00 00       	push   $0x794
  f9:	68 9d 07 00 00       	push   $0x79d
  fe:	6a 01                	push   $0x1
 100:	e8 df 03 00 00       	call   4e4 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 e2 07 00 00       	push   $0x7e2
 10d:	68 b2 07 00 00       	push   $0x7b2
 112:	6a 01                	push   $0x1
 114:	e8 cb 03 00 00       	call   4e4 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 c6 07 00 00       	push   $0x7c6
 121:	6a 01                	push   $0x1
 123:	e8 bc 03 00 00       	call   4e4 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 ac 0b 00 00    	push   0xbac
 131:	e8 89 02 00 00       	call   3bf <kill>
 136:	e8 54 02 00 00       	call   38f <exit>

0000013b <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	56                   	push   %esi
 13f:	53                   	push   %ebx
 140:	8b 75 08             	mov    0x8(%ebp),%esi
 143:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 146:	89 f0                	mov    %esi,%eax
 148:	89 d1                	mov    %edx,%ecx
 14a:	83 c2 01             	add    $0x1,%edx
 14d:	89 c3                	mov    %eax,%ebx
 14f:	83 c0 01             	add    $0x1,%eax
 152:	0f b6 09             	movzbl (%ecx),%ecx
 155:	88 0b                	mov    %cl,(%ebx)
 157:	84 c9                	test   %cl,%cl
 159:	75 ed                	jne    148 <strcpy+0xd>
    ;
  return os;
}
 15b:	89 f0                	mov    %esi,%eax
 15d:	5b                   	pop    %ebx
 15e:	5e                   	pop    %esi
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    

00000161 <strcmp>:

int strcmp(const char *p, const char *q)
{
 161:	55                   	push   %ebp
 162:	89 e5                	mov    %esp,%ebp
 164:	8b 4d 08             	mov    0x8(%ebp),%ecx
 167:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 16a:	eb 06                	jmp    172 <strcmp+0x11>
    p++, q++;
 16c:	83 c1 01             	add    $0x1,%ecx
 16f:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 172:	0f b6 01             	movzbl (%ecx),%eax
 175:	84 c0                	test   %al,%al
 177:	74 04                	je     17d <strcmp+0x1c>
 179:	3a 02                	cmp    (%edx),%al
 17b:	74 ef                	je     16c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 17d:	0f b6 c0             	movzbl %al,%eax
 180:	0f b6 12             	movzbl (%edx),%edx
 183:	29 d0                	sub    %edx,%eax
}
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    

00000187 <strlen>:

uint strlen(const char *s)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 18d:	b8 00 00 00 00       	mov    $0x0,%eax
 192:	eb 03                	jmp    197 <strlen+0x10>
 194:	83 c0 01             	add    $0x1,%eax
 197:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 19b:	75 f7                	jne    194 <strlen+0xd>
    ;
  return n;
}
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <memset>:

void *
memset(void *dst, int c, uint n)
{
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	57                   	push   %edi
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a6:	89 d7                	mov    %edx,%edi
 1a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ae:	fc                   	cld    
 1af:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b1:	89 d0                	mov    %edx,%eax
 1b3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <strchr>:

char *
strchr(const char *s, char c)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 1c2:	eb 03                	jmp    1c7 <strchr+0xf>
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	0f b6 10             	movzbl (%eax),%edx
 1ca:	84 d2                	test   %dl,%dl
 1cc:	74 06                	je     1d4 <strchr+0x1c>
    if (*s == c)
 1ce:	38 ca                	cmp    %cl,%dl
 1d0:	75 f2                	jne    1c4 <strchr+0xc>
 1d2:	eb 05                	jmp    1d9 <strchr+0x21>
      return (char *)s;
  return 0;
 1d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    

000001db <gets>:

char *
gets(char *buf, int max)
{
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
 1de:	57                   	push   %edi
 1df:	56                   	push   %esi
 1e0:	53                   	push   %ebx
 1e1:	83 ec 1c             	sub    $0x1c,%esp
 1e4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 1e7:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ec:	89 de                	mov    %ebx,%esi
 1ee:	83 c3 01             	add    $0x1,%ebx
 1f1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f4:	7d 2e                	jge    224 <gets+0x49>
  {
    cc = read(0, &c, 1);
 1f6:	83 ec 04             	sub    $0x4,%esp
 1f9:	6a 01                	push   $0x1
 1fb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fe:	50                   	push   %eax
 1ff:	6a 00                	push   $0x0
 201:	e8 a1 01 00 00       	call   3a7 <read>
    if (cc < 1)
 206:	83 c4 10             	add    $0x10,%esp
 209:	85 c0                	test   %eax,%eax
 20b:	7e 17                	jle    224 <gets+0x49>
      break;
    buf[i++] = c;
 20d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 211:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 214:	3c 0a                	cmp    $0xa,%al
 216:	0f 94 c2             	sete   %dl
 219:	3c 0d                	cmp    $0xd,%al
 21b:	0f 94 c0             	sete   %al
 21e:	08 c2                	or     %al,%dl
 220:	74 ca                	je     1ec <gets+0x11>
    buf[i++] = c;
 222:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 224:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 228:	89 f8                	mov    %edi,%eax
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <stat>:

int stat(const char *n, struct stat *st)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	56                   	push   %esi
 236:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 237:	83 ec 08             	sub    $0x8,%esp
 23a:	6a 00                	push   $0x0
 23c:	ff 75 08             	push   0x8(%ebp)
 23f:	e8 8b 01 00 00       	call   3cf <open>
  if (fd < 0)
 244:	83 c4 10             	add    $0x10,%esp
 247:	85 c0                	test   %eax,%eax
 249:	78 24                	js     26f <stat+0x3d>
 24b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	ff 75 0c             	push   0xc(%ebp)
 253:	50                   	push   %eax
 254:	e8 8e 01 00 00       	call   3e7 <fstat>
 259:	89 c6                	mov    %eax,%esi
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
 25e:	e8 54 01 00 00       	call   3b7 <close>
  return r;
 263:	83 c4 10             	add    $0x10,%esp
}
 266:	89 f0                	mov    %esi,%eax
 268:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
    return -1;
 26f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 274:	eb f0                	jmp    266 <stat+0x34>

00000276 <atoi>:

int atoi(const char *s)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	53                   	push   %ebx
 27a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27d:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 282:	eb 10                	jmp    294 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 284:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 287:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 28a:	83 c1 01             	add    $0x1,%ecx
 28d:	0f be c0             	movsbl %al,%eax
 290:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 294:	0f b6 01             	movzbl (%ecx),%eax
 297:	8d 58 d0             	lea    -0x30(%eax),%ebx
 29a:	80 fb 09             	cmp    $0x9,%bl
 29d:	76 e5                	jbe    284 <atoi+0xe>
  return n;
}
 29f:	89 d0                	mov    %edx,%eax
 2a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	56                   	push   %esi
 2aa:	53                   	push   %ebx
 2ab:	8b 75 08             	mov    0x8(%ebp),%esi
 2ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 2b6:	eb 0d                	jmp    2c5 <memmove+0x1f>
    *dst++ = *src++;
 2b8:	0f b6 01             	movzbl (%ecx),%eax
 2bb:	88 02                	mov    %al,(%edx)
 2bd:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c0:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 2c3:	89 d8                	mov    %ebx,%eax
 2c5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7f ec                	jg     2b8 <memmove+0x12>
  return vdst;
}
 2cc:	89 f0                	mov    %esi,%eax
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    

000002d2 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 2d8:	83 38 01             	cmpl   $0x1,(%eax)
 2db:	74 fb                	je     2d8 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 2dd:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 2e3:	5d                   	pop    %ebp
 2e4:	c3                   	ret    

000002e5 <lock_release>:
void lock_release(lock_t *lock)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <lock_init>:
void lock_init(lock_t *lock)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    

00000301 <thread_create>:
{
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	53                   	push   %ebx
 305:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 308:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 30b:	53                   	push   %ebx
 30c:	e8 e2 ff ff ff       	call   2f3 <lock_init>
  lock_acquire(&lock);
 311:	89 1c 24             	mov    %ebx,(%esp)
 314:	e8 b9 ff ff ff       	call   2d2 <lock_acquire>
  void *stack = malloc(4096 * 2);
 319:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 320:	e8 e5 03 00 00       	call   70a <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 325:	50                   	push   %eax
 326:	ff 75 10             	push   0x10(%ebp)
 329:	ff 75 0c             	push   0xc(%ebp)
 32c:	ff 75 08             	push   0x8(%ebp)
 32f:	e8 fb 00 00 00       	call   42f <clone>
}
 334:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 337:	c9                   	leave  
 338:	c3                   	ret    

00000339 <thread_join>:
{
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
 33c:	56                   	push   %esi
 33d:	53                   	push   %ebx
 33e:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 341:	6a 04                	push   $0x4
 343:	e8 c2 03 00 00       	call   70a <malloc>
 348:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 34b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 34e:	89 04 24             	mov    %eax,(%esp)
 351:	e8 e1 00 00 00       	call   437 <join>
 356:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 358:	8d 75 f0             	lea    -0x10(%ebp),%esi
 35b:	89 34 24             	mov    %esi,(%esp)
 35e:	e8 90 ff ff ff       	call   2f3 <lock_init>
  lock_acquire(&lock);
 363:	89 34 24             	mov    %esi,(%esp)
 366:	e8 67 ff ff ff       	call   2d2 <lock_acquire>
  free(stack);
 36b:	83 c4 04             	add    $0x4,%esp
 36e:	ff 75 f4             	push   -0xc(%ebp)
 371:	e8 d4 02 00 00       	call   64a <free>
  lock_release(&lock);
 376:	89 34 24             	mov    %esi,(%esp)
 379:	e8 67 ff ff ff       	call   2e5 <lock_release>
}
 37e:	89 d8                	mov    %ebx,%eax
 380:	8d 65 f8             	lea    -0x8(%ebp),%esp
 383:	5b                   	pop    %ebx
 384:	5e                   	pop    %esi
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    

00000387 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 387:	b8 01 00 00 00       	mov    $0x1,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <exit>:
SYSCALL(exit)
 38f:	b8 02 00 00 00       	mov    $0x2,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <wait>:
SYSCALL(wait)
 397:	b8 03 00 00 00       	mov    $0x3,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <pipe>:
SYSCALL(pipe)
 39f:	b8 04 00 00 00       	mov    $0x4,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <read>:
SYSCALL(read)
 3a7:	b8 05 00 00 00       	mov    $0x5,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <write>:
SYSCALL(write)
 3af:	b8 10 00 00 00       	mov    $0x10,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <close>:
SYSCALL(close)
 3b7:	b8 15 00 00 00       	mov    $0x15,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <kill>:
SYSCALL(kill)
 3bf:	b8 06 00 00 00       	mov    $0x6,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <exec>:
SYSCALL(exec)
 3c7:	b8 07 00 00 00       	mov    $0x7,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <open>:
SYSCALL(open)
 3cf:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <mknod>:
SYSCALL(mknod)
 3d7:	b8 11 00 00 00       	mov    $0x11,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <unlink>:
SYSCALL(unlink)
 3df:	b8 12 00 00 00       	mov    $0x12,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <fstat>:
SYSCALL(fstat)
 3e7:	b8 08 00 00 00       	mov    $0x8,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <link>:
SYSCALL(link)
 3ef:	b8 13 00 00 00       	mov    $0x13,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <mkdir>:
SYSCALL(mkdir)
 3f7:	b8 14 00 00 00       	mov    $0x14,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <chdir>:
SYSCALL(chdir)
 3ff:	b8 09 00 00 00       	mov    $0x9,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <dup>:
SYSCALL(dup)
 407:	b8 0a 00 00 00       	mov    $0xa,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <getpid>:
SYSCALL(getpid)
 40f:	b8 0b 00 00 00       	mov    $0xb,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <sbrk>:
SYSCALL(sbrk)
 417:	b8 0c 00 00 00       	mov    $0xc,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <sleep>:
SYSCALL(sleep)
 41f:	b8 0d 00 00 00       	mov    $0xd,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <uptime>:
SYSCALL(uptime)
 427:	b8 0e 00 00 00       	mov    $0xe,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <clone>:
SYSCALL(clone)
 42f:	b8 16 00 00 00       	mov    $0x16,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <join>:
 437:	b8 17 00 00 00       	mov    $0x17,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 1c             	sub    $0x1c,%esp
 445:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 448:	6a 01                	push   $0x1
 44a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 44d:	52                   	push   %edx
 44e:	50                   	push   %eax
 44f:	e8 5b ff ff ff       	call   3af <write>
}
 454:	83 c4 10             	add    $0x10,%esp
 457:	c9                   	leave  
 458:	c3                   	ret    

00000459 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 459:	55                   	push   %ebp
 45a:	89 e5                	mov    %esp,%ebp
 45c:	57                   	push   %edi
 45d:	56                   	push   %esi
 45e:	53                   	push   %ebx
 45f:	83 ec 2c             	sub    $0x2c,%esp
 462:	89 45 d0             	mov    %eax,-0x30(%ebp)
 465:	89 d0                	mov    %edx,%eax
 467:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 469:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 46d:	0f 95 c1             	setne  %cl
 470:	c1 ea 1f             	shr    $0x1f,%edx
 473:	84 d1                	test   %dl,%cl
 475:	74 44                	je     4bb <printint+0x62>
    neg = 1;
    x = -xx;
 477:	f7 d8                	neg    %eax
 479:	89 c1                	mov    %eax,%ecx
    neg = 1;
 47b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 482:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 487:	89 c8                	mov    %ecx,%eax
 489:	ba 00 00 00 00       	mov    $0x0,%edx
 48e:	f7 f6                	div    %esi
 490:	89 df                	mov    %ebx,%edi
 492:	83 c3 01             	add    $0x1,%ebx
 495:	0f b6 92 5c 08 00 00 	movzbl 0x85c(%edx),%edx
 49c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4a0:	89 ca                	mov    %ecx,%edx
 4a2:	89 c1                	mov    %eax,%ecx
 4a4:	39 d6                	cmp    %edx,%esi
 4a6:	76 df                	jbe    487 <printint+0x2e>
  if(neg)
 4a8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4ac:	74 31                	je     4df <printint+0x86>
    buf[i++] = '-';
 4ae:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4b3:	8d 5f 02             	lea    0x2(%edi),%ebx
 4b6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b9:	eb 17                	jmp    4d2 <printint+0x79>
    x = xx;
 4bb:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4bd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4c4:	eb bc                	jmp    482 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4c6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4cb:	89 f0                	mov    %esi,%eax
 4cd:	e8 6d ff ff ff       	call   43f <putc>
  while(--i >= 0)
 4d2:	83 eb 01             	sub    $0x1,%ebx
 4d5:	79 ef                	jns    4c6 <printint+0x6d>
}
 4d7:	83 c4 2c             	add    $0x2c,%esp
 4da:	5b                   	pop    %ebx
 4db:	5e                   	pop    %esi
 4dc:	5f                   	pop    %edi
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    
 4df:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4e2:	eb ee                	jmp    4d2 <printint+0x79>

000004e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	57                   	push   %edi
 4e8:	56                   	push   %esi
 4e9:	53                   	push   %ebx
 4ea:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4ed:	8d 45 10             	lea    0x10(%ebp),%eax
 4f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4f3:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4f8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4fd:	eb 14                	jmp    513 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4ff:	89 fa                	mov    %edi,%edx
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	e8 36 ff ff ff       	call   43f <putc>
 509:	eb 05                	jmp    510 <printf+0x2c>
      }
    } else if(state == '%'){
 50b:	83 fe 25             	cmp    $0x25,%esi
 50e:	74 25                	je     535 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 510:	83 c3 01             	add    $0x1,%ebx
 513:	8b 45 0c             	mov    0xc(%ebp),%eax
 516:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 51a:	84 c0                	test   %al,%al
 51c:	0f 84 20 01 00 00    	je     642 <printf+0x15e>
    c = fmt[i] & 0xff;
 522:	0f be f8             	movsbl %al,%edi
 525:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 528:	85 f6                	test   %esi,%esi
 52a:	75 df                	jne    50b <printf+0x27>
      if(c == '%'){
 52c:	83 f8 25             	cmp    $0x25,%eax
 52f:	75 ce                	jne    4ff <printf+0x1b>
        state = '%';
 531:	89 c6                	mov    %eax,%esi
 533:	eb db                	jmp    510 <printf+0x2c>
      if(c == 'd'){
 535:	83 f8 25             	cmp    $0x25,%eax
 538:	0f 84 cf 00 00 00    	je     60d <printf+0x129>
 53e:	0f 8c dd 00 00 00    	jl     621 <printf+0x13d>
 544:	83 f8 78             	cmp    $0x78,%eax
 547:	0f 8f d4 00 00 00    	jg     621 <printf+0x13d>
 54d:	83 f8 63             	cmp    $0x63,%eax
 550:	0f 8c cb 00 00 00    	jl     621 <printf+0x13d>
 556:	83 e8 63             	sub    $0x63,%eax
 559:	83 f8 15             	cmp    $0x15,%eax
 55c:	0f 87 bf 00 00 00    	ja     621 <printf+0x13d>
 562:	ff 24 85 04 08 00 00 	jmp    *0x804(,%eax,4)
        printint(fd, *ap, 10, 1);
 569:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 56c:	8b 17                	mov    (%edi),%edx
 56e:	83 ec 0c             	sub    $0xc,%esp
 571:	6a 01                	push   $0x1
 573:	b9 0a 00 00 00       	mov    $0xa,%ecx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	e8 d9 fe ff ff       	call   459 <printint>
        ap++;
 580:	83 c7 04             	add    $0x4,%edi
 583:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 586:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 589:	be 00 00 00 00       	mov    $0x0,%esi
 58e:	eb 80                	jmp    510 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 590:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 593:	8b 17                	mov    (%edi),%edx
 595:	83 ec 0c             	sub    $0xc,%esp
 598:	6a 00                	push   $0x0
 59a:	b9 10 00 00 00       	mov    $0x10,%ecx
 59f:	8b 45 08             	mov    0x8(%ebp),%eax
 5a2:	e8 b2 fe ff ff       	call   459 <printint>
        ap++;
 5a7:	83 c7 04             	add    $0x4,%edi
 5aa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5ad:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5b0:	be 00 00 00 00       	mov    $0x0,%esi
 5b5:	e9 56 ff ff ff       	jmp    510 <printf+0x2c>
        s = (char*)*ap;
 5ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5bd:	8b 30                	mov    (%eax),%esi
        ap++;
 5bf:	83 c0 04             	add    $0x4,%eax
 5c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5c5:	85 f6                	test   %esi,%esi
 5c7:	75 15                	jne    5de <printf+0xfa>
          s = "(null)";
 5c9:	be fa 07 00 00       	mov    $0x7fa,%esi
 5ce:	eb 0e                	jmp    5de <printf+0xfa>
          putc(fd, *s);
 5d0:	0f be d2             	movsbl %dl,%edx
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	e8 64 fe ff ff       	call   43f <putc>
          s++;
 5db:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5de:	0f b6 16             	movzbl (%esi),%edx
 5e1:	84 d2                	test   %dl,%dl
 5e3:	75 eb                	jne    5d0 <printf+0xec>
      state = 0;
 5e5:	be 00 00 00 00       	mov    $0x0,%esi
 5ea:	e9 21 ff ff ff       	jmp    510 <printf+0x2c>
        putc(fd, *ap);
 5ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f2:	0f be 17             	movsbl (%edi),%edx
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	e8 42 fe ff ff       	call   43f <putc>
        ap++;
 5fd:	83 c7 04             	add    $0x4,%edi
 600:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 603:	be 00 00 00 00       	mov    $0x0,%esi
 608:	e9 03 ff ff ff       	jmp    510 <printf+0x2c>
        putc(fd, c);
 60d:	89 fa                	mov    %edi,%edx
 60f:	8b 45 08             	mov    0x8(%ebp),%eax
 612:	e8 28 fe ff ff       	call   43f <putc>
      state = 0;
 617:	be 00 00 00 00       	mov    $0x0,%esi
 61c:	e9 ef fe ff ff       	jmp    510 <printf+0x2c>
        putc(fd, '%');
 621:	ba 25 00 00 00       	mov    $0x25,%edx
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	e8 11 fe ff ff       	call   43f <putc>
        putc(fd, c);
 62e:	89 fa                	mov    %edi,%edx
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	e8 07 fe ff ff       	call   43f <putc>
      state = 0;
 638:	be 00 00 00 00       	mov    $0x0,%esi
 63d:	e9 ce fe ff ff       	jmp    510 <printf+0x2c>
    }
  }
}
 642:	8d 65 f4             	lea    -0xc(%ebp),%esp
 645:	5b                   	pop    %ebx
 646:	5e                   	pop    %esi
 647:	5f                   	pop    %edi
 648:	5d                   	pop    %ebp
 649:	c3                   	ret    

0000064a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 64a:	55                   	push   %ebp
 64b:	89 e5                	mov    %esp,%ebp
 64d:	57                   	push   %edi
 64e:	56                   	push   %esi
 64f:	53                   	push   %ebx
 650:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 653:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 656:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 65b:	eb 02                	jmp    65f <free+0x15>
 65d:	89 d0                	mov    %edx,%eax
 65f:	39 c8                	cmp    %ecx,%eax
 661:	73 04                	jae    667 <free+0x1d>
 663:	39 08                	cmp    %ecx,(%eax)
 665:	77 12                	ja     679 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 667:	8b 10                	mov    (%eax),%edx
 669:	39 c2                	cmp    %eax,%edx
 66b:	77 f0                	ja     65d <free+0x13>
 66d:	39 c8                	cmp    %ecx,%eax
 66f:	72 08                	jb     679 <free+0x2f>
 671:	39 ca                	cmp    %ecx,%edx
 673:	77 04                	ja     679 <free+0x2f>
 675:	89 d0                	mov    %edx,%eax
 677:	eb e6                	jmp    65f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 679:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67f:	8b 10                	mov    (%eax),%edx
 681:	39 d7                	cmp    %edx,%edi
 683:	74 19                	je     69e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 685:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 688:	8b 50 04             	mov    0x4(%eax),%edx
 68b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 68e:	39 ce                	cmp    %ecx,%esi
 690:	74 1b                	je     6ad <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 692:	89 08                	mov    %ecx,(%eax)
  freep = p;
 694:	a3 b0 0b 00 00       	mov    %eax,0xbb0
}
 699:	5b                   	pop    %ebx
 69a:	5e                   	pop    %esi
 69b:	5f                   	pop    %edi
 69c:	5d                   	pop    %ebp
 69d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 69e:	03 72 04             	add    0x4(%edx),%esi
 6a1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a4:	8b 10                	mov    (%eax),%edx
 6a6:	8b 12                	mov    (%edx),%edx
 6a8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6ab:	eb db                	jmp    688 <free+0x3e>
    p->s.size += bp->s.size;
 6ad:	03 53 fc             	add    -0x4(%ebx),%edx
 6b0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6b3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6b6:	89 10                	mov    %edx,(%eax)
 6b8:	eb da                	jmp    694 <free+0x4a>

000006ba <morecore>:

static Header*
morecore(uint nu)
{
 6ba:	55                   	push   %ebp
 6bb:	89 e5                	mov    %esp,%ebp
 6bd:	53                   	push   %ebx
 6be:	83 ec 04             	sub    $0x4,%esp
 6c1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6c3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6c8:	77 05                	ja     6cf <morecore+0x15>
    nu = 4096;
 6ca:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6cf:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6d6:	83 ec 0c             	sub    $0xc,%esp
 6d9:	50                   	push   %eax
 6da:	e8 38 fd ff ff       	call   417 <sbrk>
  if(p == (char*)-1)
 6df:	83 c4 10             	add    $0x10,%esp
 6e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e5:	74 1c                	je     703 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6e7:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6ea:	83 c0 08             	add    $0x8,%eax
 6ed:	83 ec 0c             	sub    $0xc,%esp
 6f0:	50                   	push   %eax
 6f1:	e8 54 ff ff ff       	call   64a <free>
  return freep;
 6f6:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 6fb:	83 c4 10             	add    $0x10,%esp
}
 6fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 701:	c9                   	leave  
 702:	c3                   	ret    
    return 0;
 703:	b8 00 00 00 00       	mov    $0x0,%eax
 708:	eb f4                	jmp    6fe <morecore+0x44>

0000070a <malloc>:

void*
malloc(uint nbytes)
{
 70a:	55                   	push   %ebp
 70b:	89 e5                	mov    %esp,%ebp
 70d:	53                   	push   %ebx
 70e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	8d 58 07             	lea    0x7(%eax),%ebx
 717:	c1 eb 03             	shr    $0x3,%ebx
 71a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 71d:	8b 0d b0 0b 00 00    	mov    0xbb0,%ecx
 723:	85 c9                	test   %ecx,%ecx
 725:	74 04                	je     72b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 727:	8b 01                	mov    (%ecx),%eax
 729:	eb 4a                	jmp    775 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 72b:	c7 05 b0 0b 00 00 b4 	movl   $0xbb4,0xbb0
 732:	0b 00 00 
 735:	c7 05 b4 0b 00 00 b4 	movl   $0xbb4,0xbb4
 73c:	0b 00 00 
    base.s.size = 0;
 73f:	c7 05 b8 0b 00 00 00 	movl   $0x0,0xbb8
 746:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 749:	b9 b4 0b 00 00       	mov    $0xbb4,%ecx
 74e:	eb d7                	jmp    727 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 750:	74 19                	je     76b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 752:	29 da                	sub    %ebx,%edx
 754:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 757:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 75a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 75d:	89 0d b0 0b 00 00    	mov    %ecx,0xbb0
      return (void*)(p + 1);
 763:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 766:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 769:	c9                   	leave  
 76a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 76b:	8b 10                	mov    (%eax),%edx
 76d:	89 11                	mov    %edx,(%ecx)
 76f:	eb ec                	jmp    75d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 771:	89 c1                	mov    %eax,%ecx
 773:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 775:	8b 50 04             	mov    0x4(%eax),%edx
 778:	39 da                	cmp    %ebx,%edx
 77a:	73 d4                	jae    750 <malloc+0x46>
    if(p == freep)
 77c:	39 05 b0 0b 00 00    	cmp    %eax,0xbb0
 782:	75 ed                	jne    771 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 784:	89 d8                	mov    %ebx,%eax
 786:	e8 2f ff ff ff       	call   6ba <morecore>
 78b:	85 c0                	test   %eax,%eax
 78d:	75 e2                	jne    771 <malloc+0x67>
 78f:	eb d5                	jmp    766 <malloc+0x5c>
