
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
  19:	a3 74 0c 00 00       	mov    %eax,0xc74
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 70 0c 00 00       	push   $0xc70
  26:	e8 47 03 00 00       	call   372 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 68 0c 00 00    	cmp    %ebx,0xc68
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 70 0c 00 00       	push   $0xc70
  41:	e8 19 03 00 00       	call   35f <lock_acquire>
      tmp = global;
  46:	8b 15 74 0c 00 00    	mov    0xc74,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 c1 03 00 00       	call   41c <exit>

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
  6a:	e8 2d 04 00 00       	call   49c <getpid>
  6f:	a3 78 0c 00 00       	mov    %eax,0xc78
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 70 0c 00 00       	push   $0xc70
  7c:	e8 ff 02 00 00       	call   380 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 6c 0c 00 00    	cmp    %ebx,0xc6c
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 e7 02 00 00       	call   38e <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
  b0:	68 20 08 00 00       	push   $0x820
  b5:	68 2a 08 00 00       	push   $0x82a
  ba:	6a 01                	push   $0x1
  bc:	e8 b0 04 00 00       	call   571 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 32 08 00 00       	push   $0x832
  c9:	68 41 08 00 00       	push   $0x841
  ce:	6a 01                	push   $0x1
  d0:	e8 9c 04 00 00       	call   571 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 55 08 00 00       	push   $0x855
  dd:	6a 01                	push   $0x1
  df:	e8 8d 04 00 00       	call   571 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 78 0c 00 00    	push   0xc78
  ed:	e8 5a 03 00 00       	call   44c <kill>
  f2:	e8 25 03 00 00       	call   41c <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 bc 02 00 00       	call   3c6 <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 20 08 00 00       	push   $0x820
 11a:	68 2a 08 00 00       	push   $0x82a
 11f:	6a 01                	push   $0x1
 121:	e8 4b 04 00 00       	call   571 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 62 08 00 00       	push   $0x862
 12e:	68 41 08 00 00       	push   $0x841
 133:	6a 01                	push   $0x1
 135:	e8 37 04 00 00       	call   571 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 55 08 00 00       	push   $0x855
 142:	6a 01                	push   $0x1
 144:	e8 28 04 00 00       	call   571 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 78 0c 00 00    	push   0xc78
 152:	e8 f5 02 00 00       	call   44c <kill>
 157:	e8 c0 02 00 00       	call   41c <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 68 0c 00 00 	imul   0xc68,%eax
 163:	3b 05 74 0c 00 00    	cmp    0xc74,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 20 08 00 00       	push   $0x820
 172:	68 2a 08 00 00       	push   $0x82a
 177:	6a 01                	push   $0x1
 179:	e8 f3 03 00 00       	call   571 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 6f 08 00 00       	push   $0x86f
 186:	68 41 08 00 00       	push   $0x841
 18b:	6a 01                	push   $0x1
 18d:	e8 df 03 00 00       	call   571 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 55 08 00 00       	push   $0x855
 19a:	6a 01                	push   $0x1
 19c:	e8 d0 03 00 00       	call   571 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 78 0c 00 00    	push   0xc78
 1aa:	e8 9d 02 00 00       	call   44c <kill>
 1af:	e8 68 02 00 00       	call   41c <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 8d 08 00 00       	push   $0x88d
 1bc:	6a 01                	push   $0x1
 1be:	e8 ae 03 00 00       	call   571 <printf>
   exit();
 1c3:	e8 54 02 00 00       	call   41c <exit>

000001c8 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	56                   	push   %esi
 1cc:	53                   	push   %ebx
 1cd:	8b 75 08             	mov    0x8(%ebp),%esi
 1d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 1d3:	89 f0                	mov    %esi,%eax
 1d5:	89 d1                	mov    %edx,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
 1da:	89 c3                	mov    %eax,%ebx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	0f b6 09             	movzbl (%ecx),%ecx
 1e2:	88 0b                	mov    %cl,(%ebx)
 1e4:	84 c9                	test   %cl,%cl
 1e6:	75 ed                	jne    1d5 <strcpy+0xd>
    ;
  return os;
}
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    

000001ee <strcmp>:

int strcmp(const char *p, const char *q)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 1f7:	eb 06                	jmp    1ff <strcmp+0x11>
    p++, q++;
 1f9:	83 c1 01             	add    $0x1,%ecx
 1fc:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	84 c0                	test   %al,%al
 204:	74 04                	je     20a <strcmp+0x1c>
 206:	3a 02                	cmp    (%edx),%al
 208:	74 ef                	je     1f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 20a:	0f b6 c0             	movzbl %al,%eax
 20d:	0f b6 12             	movzbl (%edx),%edx
 210:	29 d0                	sub    %edx,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <strlen>:

uint strlen(const char *s)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
 21f:	eb 03                	jmp    224 <strlen+0x10>
 221:	83 c0 01             	add    $0x1,%eax
 224:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 228:	75 f7                	jne    221 <strlen+0xd>
    ;
  return n;
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <memset>:

void *
memset(void *dst, int c, uint n)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	57                   	push   %edi
 230:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 233:	89 d7                	mov    %edx,%edi
 235:	8b 4d 10             	mov    0x10(%ebp),%ecx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	fc                   	cld    
 23c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 23e:	89 d0                	mov    %edx,%eax
 240:	8b 7d fc             	mov    -0x4(%ebp),%edi
 243:	c9                   	leave  
 244:	c3                   	ret    

00000245 <strchr>:

char *
strchr(const char *s, char c)
{
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 24f:	eb 03                	jmp    254 <strchr+0xf>
 251:	83 c0 01             	add    $0x1,%eax
 254:	0f b6 10             	movzbl (%eax),%edx
 257:	84 d2                	test   %dl,%dl
 259:	74 06                	je     261 <strchr+0x1c>
    if (*s == c)
 25b:	38 ca                	cmp    %cl,%dl
 25d:	75 f2                	jne    251 <strchr+0xc>
 25f:	eb 05                	jmp    266 <strchr+0x21>
      return (char *)s;
  return 0;
 261:	b8 00 00 00 00       	mov    $0x0,%eax
}
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    

00000268 <gets>:

char *
gets(char *buf, int max)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	57                   	push   %edi
 26c:	56                   	push   %esi
 26d:	53                   	push   %ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 274:	bb 00 00 00 00       	mov    $0x0,%ebx
 279:	89 de                	mov    %ebx,%esi
 27b:	83 c3 01             	add    $0x1,%ebx
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7d 2e                	jge    2b1 <gets+0x49>
  {
    cc = read(0, &c, 1);
 283:	83 ec 04             	sub    $0x4,%esp
 286:	6a 01                	push   $0x1
 288:	8d 45 e7             	lea    -0x19(%ebp),%eax
 28b:	50                   	push   %eax
 28c:	6a 00                	push   $0x0
 28e:	e8 a1 01 00 00       	call   434 <read>
    if (cc < 1)
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	7e 17                	jle    2b1 <gets+0x49>
      break;
    buf[i++] = c;
 29a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	0f 94 c2             	sete   %dl
 2a6:	3c 0d                	cmp    $0xd,%al
 2a8:	0f 94 c0             	sete   %al
 2ab:	08 c2                	or     %al,%dl
 2ad:	74 ca                	je     279 <gets+0x11>
    buf[i++] = c;
 2af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2b5:	89 f8                	mov    %edi,%eax
 2b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ba:	5b                   	pop    %ebx
 2bb:	5e                   	pop    %esi
 2bc:	5f                   	pop    %edi
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <stat>:

int stat(const char *n, struct stat *st)
{
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	56                   	push   %esi
 2c3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c4:	83 ec 08             	sub    $0x8,%esp
 2c7:	6a 00                	push   $0x0
 2c9:	ff 75 08             	push   0x8(%ebp)
 2cc:	e8 8b 01 00 00       	call   45c <open>
  if (fd < 0)
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	78 24                	js     2fc <stat+0x3d>
 2d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2da:	83 ec 08             	sub    $0x8,%esp
 2dd:	ff 75 0c             	push   0xc(%ebp)
 2e0:	50                   	push   %eax
 2e1:	e8 8e 01 00 00       	call   474 <fstat>
 2e6:	89 c6                	mov    %eax,%esi
  close(fd);
 2e8:	89 1c 24             	mov    %ebx,(%esp)
 2eb:	e8 54 01 00 00       	call   444 <close>
  return r;
 2f0:	83 c4 10             	add    $0x10,%esp
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f8:	5b                   	pop    %ebx
 2f9:	5e                   	pop    %esi
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    
    return -1;
 2fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 301:	eb f0                	jmp    2f3 <stat+0x34>

00000303 <atoi>:

int atoi(const char *s)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	53                   	push   %ebx
 307:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 30a:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 30f:	eb 10                	jmp    321 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 311:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 314:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 317:	83 c1 01             	add    $0x1,%ecx
 31a:	0f be c0             	movsbl %al,%eax
 31d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 321:	0f b6 01             	movzbl (%ecx),%eax
 324:	8d 58 d0             	lea    -0x30(%eax),%ebx
 327:	80 fb 09             	cmp    $0x9,%bl
 32a:	76 e5                	jbe    311 <atoi+0xe>
  return n;
}
 32c:	89 d0                	mov    %edx,%eax
 32e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 331:	c9                   	leave  
 332:	c3                   	ret    

00000333 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	56                   	push   %esi
 337:	53                   	push   %ebx
 338:	8b 75 08             	mov    0x8(%ebp),%esi
 33b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 33e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 341:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 343:	eb 0d                	jmp    352 <memmove+0x1f>
    *dst++ = *src++;
 345:	0f b6 01             	movzbl (%ecx),%eax
 348:	88 02                	mov    %al,(%edx)
 34a:	8d 49 01             	lea    0x1(%ecx),%ecx
 34d:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 350:	89 d8                	mov    %ebx,%eax
 352:	8d 58 ff             	lea    -0x1(%eax),%ebx
 355:	85 c0                	test   %eax,%eax
 357:	7f ec                	jg     345 <memmove+0x12>
  return vdst;
}
 359:	89 f0                	mov    %esi,%eax
 35b:	5b                   	pop    %ebx
 35c:	5e                   	pop    %esi
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    

0000035f <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 365:	83 38 01             	cmpl   $0x1,(%eax)
 368:	74 fb                	je     365 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 36a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 370:	5d                   	pop    %ebp
 371:	c3                   	ret    

00000372 <lock_release>:
void lock_release(lock_t *lock)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 375:	8b 45 08             	mov    0x8(%ebp),%eax
 378:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <lock_init>:
void lock_init(lock_t *lock)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    

0000038e <thread_create>:
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	53                   	push   %ebx
 392:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 395:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 398:	53                   	push   %ebx
 399:	e8 e2 ff ff ff       	call   380 <lock_init>
  lock_acquire(&lock);
 39e:	89 1c 24             	mov    %ebx,(%esp)
 3a1:	e8 b9 ff ff ff       	call   35f <lock_acquire>
  void *stack = malloc(4096 * 2);
 3a6:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 3ad:	e8 e5 03 00 00       	call   797 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 3b2:	50                   	push   %eax
 3b3:	ff 75 10             	push   0x10(%ebp)
 3b6:	ff 75 0c             	push   0xc(%ebp)
 3b9:	ff 75 08             	push   0x8(%ebp)
 3bc:	e8 fb 00 00 00       	call   4bc <clone>
}
 3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c4:	c9                   	leave  
 3c5:	c3                   	ret    

000003c6 <thread_join>:
{
 3c6:	55                   	push   %ebp
 3c7:	89 e5                	mov    %esp,%ebp
 3c9:	56                   	push   %esi
 3ca:	53                   	push   %ebx
 3cb:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 3ce:	6a 04                	push   $0x4
 3d0:	e8 c2 03 00 00       	call   797 <malloc>
 3d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 3d8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3db:	89 04 24             	mov    %eax,(%esp)
 3de:	e8 e1 00 00 00       	call   4c4 <join>
 3e3:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 3e5:	8d 75 f0             	lea    -0x10(%ebp),%esi
 3e8:	89 34 24             	mov    %esi,(%esp)
 3eb:	e8 90 ff ff ff       	call   380 <lock_init>
  lock_acquire(&lock);
 3f0:	89 34 24             	mov    %esi,(%esp)
 3f3:	e8 67 ff ff ff       	call   35f <lock_acquire>
  free(stack);
 3f8:	83 c4 04             	add    $0x4,%esp
 3fb:	ff 75 f4             	push   -0xc(%ebp)
 3fe:	e8 d4 02 00 00       	call   6d7 <free>
  lock_release(&lock);
 403:	89 34 24             	mov    %esi,(%esp)
 406:	e8 67 ff ff ff       	call   372 <lock_release>
}
 40b:	89 d8                	mov    %ebx,%eax
 40d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 410:	5b                   	pop    %ebx
 411:	5e                   	pop    %esi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    

00000414 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 414:	b8 01 00 00 00       	mov    $0x1,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <exit>:
SYSCALL(exit)
 41c:	b8 02 00 00 00       	mov    $0x2,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <wait>:
SYSCALL(wait)
 424:	b8 03 00 00 00       	mov    $0x3,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <pipe>:
SYSCALL(pipe)
 42c:	b8 04 00 00 00       	mov    $0x4,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <read>:
SYSCALL(read)
 434:	b8 05 00 00 00       	mov    $0x5,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <write>:
SYSCALL(write)
 43c:	b8 10 00 00 00       	mov    $0x10,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <close>:
SYSCALL(close)
 444:	b8 15 00 00 00       	mov    $0x15,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <kill>:
SYSCALL(kill)
 44c:	b8 06 00 00 00       	mov    $0x6,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <exec>:
SYSCALL(exec)
 454:	b8 07 00 00 00       	mov    $0x7,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <open>:
SYSCALL(open)
 45c:	b8 0f 00 00 00       	mov    $0xf,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <mknod>:
SYSCALL(mknod)
 464:	b8 11 00 00 00       	mov    $0x11,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <unlink>:
SYSCALL(unlink)
 46c:	b8 12 00 00 00       	mov    $0x12,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <fstat>:
SYSCALL(fstat)
 474:	b8 08 00 00 00       	mov    $0x8,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <link>:
SYSCALL(link)
 47c:	b8 13 00 00 00       	mov    $0x13,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <mkdir>:
SYSCALL(mkdir)
 484:	b8 14 00 00 00       	mov    $0x14,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <chdir>:
SYSCALL(chdir)
 48c:	b8 09 00 00 00       	mov    $0x9,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <dup>:
SYSCALL(dup)
 494:	b8 0a 00 00 00       	mov    $0xa,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <getpid>:
SYSCALL(getpid)
 49c:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sbrk>:
SYSCALL(sbrk)
 4a4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <sleep>:
SYSCALL(sleep)
 4ac:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <uptime>:
SYSCALL(uptime)
 4b4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <clone>:
SYSCALL(clone)
 4bc:	b8 16 00 00 00       	mov    $0x16,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <join>:
 4c4:	b8 17 00 00 00       	mov    $0x17,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	83 ec 1c             	sub    $0x1c,%esp
 4d2:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4d5:	6a 01                	push   $0x1
 4d7:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4da:	52                   	push   %edx
 4db:	50                   	push   %eax
 4dc:	e8 5b ff ff ff       	call   43c <write>
}
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	57                   	push   %edi
 4ea:	56                   	push   %esi
 4eb:	53                   	push   %ebx
 4ec:	83 ec 2c             	sub    $0x2c,%esp
 4ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4f2:	89 d0                	mov    %edx,%eax
 4f4:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4fa:	0f 95 c1             	setne  %cl
 4fd:	c1 ea 1f             	shr    $0x1f,%edx
 500:	84 d1                	test   %dl,%cl
 502:	74 44                	je     548 <printint+0x62>
    neg = 1;
    x = -xx;
 504:	f7 d8                	neg    %eax
 506:	89 c1                	mov    %eax,%ecx
    neg = 1;
 508:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 50f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 514:	89 c8                	mov    %ecx,%eax
 516:	ba 00 00 00 00       	mov    $0x0,%edx
 51b:	f7 f6                	div    %esi
 51d:	89 df                	mov    %ebx,%edi
 51f:	83 c3 01             	add    $0x1,%ebx
 522:	0f b6 92 fc 08 00 00 	movzbl 0x8fc(%edx),%edx
 529:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 52d:	89 ca                	mov    %ecx,%edx
 52f:	89 c1                	mov    %eax,%ecx
 531:	39 d6                	cmp    %edx,%esi
 533:	76 df                	jbe    514 <printint+0x2e>
  if(neg)
 535:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 539:	74 31                	je     56c <printint+0x86>
    buf[i++] = '-';
 53b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 540:	8d 5f 02             	lea    0x2(%edi),%ebx
 543:	8b 75 d0             	mov    -0x30(%ebp),%esi
 546:	eb 17                	jmp    55f <printint+0x79>
    x = xx;
 548:	89 c1                	mov    %eax,%ecx
  neg = 0;
 54a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 551:	eb bc                	jmp    50f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 553:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 558:	89 f0                	mov    %esi,%eax
 55a:	e8 6d ff ff ff       	call   4cc <putc>
  while(--i >= 0)
 55f:	83 eb 01             	sub    $0x1,%ebx
 562:	79 ef                	jns    553 <printint+0x6d>
}
 564:	83 c4 2c             	add    $0x2c,%esp
 567:	5b                   	pop    %ebx
 568:	5e                   	pop    %esi
 569:	5f                   	pop    %edi
 56a:	5d                   	pop    %ebp
 56b:	c3                   	ret    
 56c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 56f:	eb ee                	jmp    55f <printint+0x79>

00000571 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 571:	55                   	push   %ebp
 572:	89 e5                	mov    %esp,%ebp
 574:	57                   	push   %edi
 575:	56                   	push   %esi
 576:	53                   	push   %ebx
 577:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 57a:	8d 45 10             	lea    0x10(%ebp),%eax
 57d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 580:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 585:	bb 00 00 00 00       	mov    $0x0,%ebx
 58a:	eb 14                	jmp    5a0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 58c:	89 fa                	mov    %edi,%edx
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	e8 36 ff ff ff       	call   4cc <putc>
 596:	eb 05                	jmp    59d <printf+0x2c>
      }
    } else if(state == '%'){
 598:	83 fe 25             	cmp    $0x25,%esi
 59b:	74 25                	je     5c2 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 59d:	83 c3 01             	add    $0x1,%ebx
 5a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5a7:	84 c0                	test   %al,%al
 5a9:	0f 84 20 01 00 00    	je     6cf <printf+0x15e>
    c = fmt[i] & 0xff;
 5af:	0f be f8             	movsbl %al,%edi
 5b2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5b5:	85 f6                	test   %esi,%esi
 5b7:	75 df                	jne    598 <printf+0x27>
      if(c == '%'){
 5b9:	83 f8 25             	cmp    $0x25,%eax
 5bc:	75 ce                	jne    58c <printf+0x1b>
        state = '%';
 5be:	89 c6                	mov    %eax,%esi
 5c0:	eb db                	jmp    59d <printf+0x2c>
      if(c == 'd'){
 5c2:	83 f8 25             	cmp    $0x25,%eax
 5c5:	0f 84 cf 00 00 00    	je     69a <printf+0x129>
 5cb:	0f 8c dd 00 00 00    	jl     6ae <printf+0x13d>
 5d1:	83 f8 78             	cmp    $0x78,%eax
 5d4:	0f 8f d4 00 00 00    	jg     6ae <printf+0x13d>
 5da:	83 f8 63             	cmp    $0x63,%eax
 5dd:	0f 8c cb 00 00 00    	jl     6ae <printf+0x13d>
 5e3:	83 e8 63             	sub    $0x63,%eax
 5e6:	83 f8 15             	cmp    $0x15,%eax
 5e9:	0f 87 bf 00 00 00    	ja     6ae <printf+0x13d>
 5ef:	ff 24 85 a4 08 00 00 	jmp    *0x8a4(,%eax,4)
        printint(fd, *ap, 10, 1);
 5f6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f9:	8b 17                	mov    (%edi),%edx
 5fb:	83 ec 0c             	sub    $0xc,%esp
 5fe:	6a 01                	push   $0x1
 600:	b9 0a 00 00 00       	mov    $0xa,%ecx
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	e8 d9 fe ff ff       	call   4e6 <printint>
        ap++;
 60d:	83 c7 04             	add    $0x4,%edi
 610:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 613:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 616:	be 00 00 00 00       	mov    $0x0,%esi
 61b:	eb 80                	jmp    59d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 61d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 620:	8b 17                	mov    (%edi),%edx
 622:	83 ec 0c             	sub    $0xc,%esp
 625:	6a 00                	push   $0x0
 627:	b9 10 00 00 00       	mov    $0x10,%ecx
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	e8 b2 fe ff ff       	call   4e6 <printint>
        ap++;
 634:	83 c7 04             	add    $0x4,%edi
 637:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 63a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63d:	be 00 00 00 00       	mov    $0x0,%esi
 642:	e9 56 ff ff ff       	jmp    59d <printf+0x2c>
        s = (char*)*ap;
 647:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64a:	8b 30                	mov    (%eax),%esi
        ap++;
 64c:	83 c0 04             	add    $0x4,%eax
 64f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 652:	85 f6                	test   %esi,%esi
 654:	75 15                	jne    66b <printf+0xfa>
          s = "(null)";
 656:	be 9a 08 00 00       	mov    $0x89a,%esi
 65b:	eb 0e                	jmp    66b <printf+0xfa>
          putc(fd, *s);
 65d:	0f be d2             	movsbl %dl,%edx
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	e8 64 fe ff ff       	call   4cc <putc>
          s++;
 668:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 66b:	0f b6 16             	movzbl (%esi),%edx
 66e:	84 d2                	test   %dl,%dl
 670:	75 eb                	jne    65d <printf+0xec>
      state = 0;
 672:	be 00 00 00 00       	mov    $0x0,%esi
 677:	e9 21 ff ff ff       	jmp    59d <printf+0x2c>
        putc(fd, *ap);
 67c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 67f:	0f be 17             	movsbl (%edi),%edx
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	e8 42 fe ff ff       	call   4cc <putc>
        ap++;
 68a:	83 c7 04             	add    $0x4,%edi
 68d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 690:	be 00 00 00 00       	mov    $0x0,%esi
 695:	e9 03 ff ff ff       	jmp    59d <printf+0x2c>
        putc(fd, c);
 69a:	89 fa                	mov    %edi,%edx
 69c:	8b 45 08             	mov    0x8(%ebp),%eax
 69f:	e8 28 fe ff ff       	call   4cc <putc>
      state = 0;
 6a4:	be 00 00 00 00       	mov    $0x0,%esi
 6a9:	e9 ef fe ff ff       	jmp    59d <printf+0x2c>
        putc(fd, '%');
 6ae:	ba 25 00 00 00       	mov    $0x25,%edx
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	e8 11 fe ff ff       	call   4cc <putc>
        putc(fd, c);
 6bb:	89 fa                	mov    %edi,%edx
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	e8 07 fe ff ff       	call   4cc <putc>
      state = 0;
 6c5:	be 00 00 00 00       	mov    $0x0,%esi
 6ca:	e9 ce fe ff ff       	jmp    59d <printf+0x2c>
    }
  }
}
 6cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d2:	5b                   	pop    %ebx
 6d3:	5e                   	pop    %esi
 6d4:	5f                   	pop    %edi
 6d5:	5d                   	pop    %ebp
 6d6:	c3                   	ret    

000006d7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d7:	55                   	push   %ebp
 6d8:	89 e5                	mov    %esp,%ebp
 6da:	57                   	push   %edi
 6db:	56                   	push   %esi
 6dc:	53                   	push   %ebx
 6dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e3:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 6e8:	eb 02                	jmp    6ec <free+0x15>
 6ea:	89 d0                	mov    %edx,%eax
 6ec:	39 c8                	cmp    %ecx,%eax
 6ee:	73 04                	jae    6f4 <free+0x1d>
 6f0:	39 08                	cmp    %ecx,(%eax)
 6f2:	77 12                	ja     706 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f4:	8b 10                	mov    (%eax),%edx
 6f6:	39 c2                	cmp    %eax,%edx
 6f8:	77 f0                	ja     6ea <free+0x13>
 6fa:	39 c8                	cmp    %ecx,%eax
 6fc:	72 08                	jb     706 <free+0x2f>
 6fe:	39 ca                	cmp    %ecx,%edx
 700:	77 04                	ja     706 <free+0x2f>
 702:	89 d0                	mov    %edx,%eax
 704:	eb e6                	jmp    6ec <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 706:	8b 73 fc             	mov    -0x4(%ebx),%esi
 709:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70c:	8b 10                	mov    (%eax),%edx
 70e:	39 d7                	cmp    %edx,%edi
 710:	74 19                	je     72b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 712:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71b:	39 ce                	cmp    %ecx,%esi
 71d:	74 1b                	je     73a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 721:	a3 7c 0c 00 00       	mov    %eax,0xc7c
}
 726:	5b                   	pop    %ebx
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 72b:	03 72 04             	add    0x4(%edx),%esi
 72e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 731:	8b 10                	mov    (%eax),%edx
 733:	8b 12                	mov    (%edx),%edx
 735:	89 53 f8             	mov    %edx,-0x8(%ebx)
 738:	eb db                	jmp    715 <free+0x3e>
    p->s.size += bp->s.size;
 73a:	03 53 fc             	add    -0x4(%ebx),%edx
 73d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 740:	8b 53 f8             	mov    -0x8(%ebx),%edx
 743:	89 10                	mov    %edx,(%eax)
 745:	eb da                	jmp    721 <free+0x4a>

00000747 <morecore>:

static Header*
morecore(uint nu)
{
 747:	55                   	push   %ebp
 748:	89 e5                	mov    %esp,%ebp
 74a:	53                   	push   %ebx
 74b:	83 ec 04             	sub    $0x4,%esp
 74e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 750:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 755:	77 05                	ja     75c <morecore+0x15>
    nu = 4096;
 757:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 75c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	50                   	push   %eax
 767:	e8 38 fd ff ff       	call   4a4 <sbrk>
  if(p == (char*)-1)
 76c:	83 c4 10             	add    $0x10,%esp
 76f:	83 f8 ff             	cmp    $0xffffffff,%eax
 772:	74 1c                	je     790 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 774:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 777:	83 c0 08             	add    $0x8,%eax
 77a:	83 ec 0c             	sub    $0xc,%esp
 77d:	50                   	push   %eax
 77e:	e8 54 ff ff ff       	call   6d7 <free>
  return freep;
 783:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 788:	83 c4 10             	add    $0x10,%esp
}
 78b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 78e:	c9                   	leave  
 78f:	c3                   	ret    
    return 0;
 790:	b8 00 00 00 00       	mov    $0x0,%eax
 795:	eb f4                	jmp    78b <morecore+0x44>

00000797 <malloc>:

void*
malloc(uint nbytes)
{
 797:	55                   	push   %ebp
 798:	89 e5                	mov    %esp,%ebp
 79a:	53                   	push   %ebx
 79b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 79e:	8b 45 08             	mov    0x8(%ebp),%eax
 7a1:	8d 58 07             	lea    0x7(%eax),%ebx
 7a4:	c1 eb 03             	shr    $0x3,%ebx
 7a7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7aa:	8b 0d 7c 0c 00 00    	mov    0xc7c,%ecx
 7b0:	85 c9                	test   %ecx,%ecx
 7b2:	74 04                	je     7b8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b4:	8b 01                	mov    (%ecx),%eax
 7b6:	eb 4a                	jmp    802 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7b8:	c7 05 7c 0c 00 00 80 	movl   $0xc80,0xc7c
 7bf:	0c 00 00 
 7c2:	c7 05 80 0c 00 00 80 	movl   $0xc80,0xc80
 7c9:	0c 00 00 
    base.s.size = 0;
 7cc:	c7 05 84 0c 00 00 00 	movl   $0x0,0xc84
 7d3:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7d6:	b9 80 0c 00 00       	mov    $0xc80,%ecx
 7db:	eb d7                	jmp    7b4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7dd:	74 19                	je     7f8 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7df:	29 da                	sub    %ebx,%edx
 7e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7e7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ea:	89 0d 7c 0c 00 00    	mov    %ecx,0xc7c
      return (void*)(p + 1);
 7f0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f6:	c9                   	leave  
 7f7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7f8:	8b 10                	mov    (%eax),%edx
 7fa:	89 11                	mov    %edx,(%ecx)
 7fc:	eb ec                	jmp    7ea <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fe:	89 c1                	mov    %eax,%ecx
 800:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 802:	8b 50 04             	mov    0x4(%eax),%edx
 805:	39 da                	cmp    %ebx,%edx
 807:	73 d4                	jae    7dd <malloc+0x46>
    if(p == freep)
 809:	39 05 7c 0c 00 00    	cmp    %eax,0xc7c
 80f:	75 ed                	jne    7fe <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 811:	89 d8                	mov    %ebx,%eax
 813:	e8 2f ff ff ff       	call   747 <morecore>
 818:	85 c0                	test   %eax,%eax
 81a:	75 e2                	jne    7fe <malloc+0x67>
 81c:	eb d5                	jmp    7f3 <malloc+0x5c>
