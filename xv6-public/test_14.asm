
_test_14:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <worker+0x30>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <worker+0x79>
   assert(global == 1);
  18:	a1 1c 0d 00 00       	mov    0xd1c,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 1c 0d 00 00       	mov    %eax,0xd1c
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 b4 08 00 00       	push   $0x8b4
  37:	68 be 08 00 00       	push   $0x8be
  3c:	6a 01                	push   $0x1
  3e:	e8 c2 05 00 00       	call   605 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 c6 08 00 00       	push   $0x8c6
  4b:	68 d1 08 00 00       	push   $0x8d1
  50:	6a 01                	push   $0x1
  52:	e8 ae 05 00 00       	call   605 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 e5 08 00 00       	push   $0x8e5
  5f:	6a 01                	push   $0x1
  61:	e8 9f 05 00 00       	call   605 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 20 0d 00 00    	push   0xd20
  6f:	e8 6c 04 00 00       	call   4e0 <kill>
  74:	e8 37 04 00 00       	call   4b0 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 b4 08 00 00       	push   $0x8b4
  80:	68 be 08 00 00       	push   $0x8be
  85:	6a 01                	push   $0x1
  87:	e8 79 05 00 00       	call   605 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 f2 08 00 00       	push   $0x8f2
  94:	68 d1 08 00 00       	push   $0x8d1
  99:	6a 01                	push   $0x1
  9b:	e8 65 05 00 00       	call   605 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 e5 08 00 00       	push   $0x8e5
  a8:	6a 01                	push   $0x1
  aa:	e8 56 05 00 00       	call   605 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 20 0d 00 00    	push   0xd20
  b8:	e8 23 04 00 00       	call   4e0 <kill>
  bd:	e8 ee 03 00 00       	call   4b0 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 b4 08 00 00       	push   $0x8b4
  c9:	68 be 08 00 00       	push   $0x8be
  ce:	6a 01                	push   $0x1
  d0:	e8 30 05 00 00       	call   605 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 fd 08 00 00       	push   $0x8fd
  dd:	68 d1 08 00 00       	push   $0x8d1
  e2:	6a 01                	push   $0x1
  e4:	e8 1c 05 00 00       	call   605 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 e5 08 00 00       	push   $0x8e5
  f1:	6a 01                	push   $0x1
  f3:	e8 0d 05 00 00       	call   605 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 20 0d 00 00    	push   0xd20
 101:	e8 da 03 00 00       	call   4e0 <kill>
 106:	e8 a5 03 00 00       	call   4b0 <exit>

0000010b <main>:
{
 10b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
 112:	ff 71 fc             	push   -0x4(%ecx)
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	51                   	push   %ecx
 11a:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 11d:	e8 0e 04 00 00       	call   530 <getpid>
 122:	a3 20 0d 00 00       	mov    %eax,0xd20
   int arg1 = 42, arg2 = 24;
 127:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 12e:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8d 45 f0             	lea    -0x10(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 13f:	50                   	push   %eax
 140:	68 00 00 00 00       	push   $0x0
 145:	e8 d8 02 00 00       	call   422 <thread_create>
   assert(thread_pid > 0);
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	7e 65                	jle    1b6 <main+0xab>
 151:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 153:	e8 02 03 00 00       	call   45a <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d 1c 0d 00 00 02 	cmpl   $0x2,0xd1c
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 b4 08 00 00       	push   $0x8b4
 174:	68 be 08 00 00       	push   $0x8be
 179:	6a 01                	push   $0x1
 17b:	e8 85 04 00 00       	call   605 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 2f 09 00 00       	push   $0x92f
 188:	68 d1 08 00 00       	push   $0x8d1
 18d:	6a 01                	push   $0x1
 18f:	e8 71 04 00 00       	call   605 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 e5 08 00 00       	push   $0x8e5
 19c:	6a 01                	push   $0x1
 19e:	e8 62 04 00 00       	call   605 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 20 0d 00 00    	push   0xd20
 1ac:	e8 2f 03 00 00       	call   4e0 <kill>
 1b1:	e8 fa 02 00 00       	call   4b0 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 b4 08 00 00       	push   $0x8b4
 1bd:	68 be 08 00 00       	push   $0x8be
 1c2:	6a 01                	push   $0x1
 1c4:	e8 3c 04 00 00       	call   605 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 09 09 00 00       	push   $0x909
 1d1:	68 d1 08 00 00       	push   $0x8d1
 1d6:	6a 01                	push   $0x1
 1d8:	e8 28 04 00 00       	call   605 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 e5 08 00 00       	push   $0x8e5
 1e5:	6a 01                	push   $0x1
 1e7:	e8 19 04 00 00       	call   605 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 20 0d 00 00    	push   0xd20
 1f5:	e8 e6 02 00 00       	call   4e0 <kill>
 1fa:	e8 b1 02 00 00       	call   4b0 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 b4 08 00 00       	push   $0x8b4
 206:	68 be 08 00 00       	push   $0x8be
 20b:	6a 01                	push   $0x1
 20d:	e8 f3 03 00 00       	call   605 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 18 09 00 00       	push   $0x918
 21a:	68 d1 08 00 00       	push   $0x8d1
 21f:	6a 01                	push   $0x1
 221:	e8 df 03 00 00       	call   605 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 e5 08 00 00       	push   $0x8e5
 22e:	6a 01                	push   $0x1
 230:	e8 d0 03 00 00       	call   605 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 20 0d 00 00    	push   0xd20
 23e:	e8 9d 02 00 00       	call   4e0 <kill>
 243:	e8 68 02 00 00       	call   4b0 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 3b 09 00 00       	push   $0x93b
 250:	6a 01                	push   $0x1
 252:	e8 ae 03 00 00       	call   605 <printf>
   exit();
 257:	e8 54 02 00 00       	call   4b0 <exit>

0000025c <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	56                   	push   %esi
 260:	53                   	push   %ebx
 261:	8b 75 08             	mov    0x8(%ebp),%esi
 264:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 267:	89 f0                	mov    %esi,%eax
 269:	89 d1                	mov    %edx,%ecx
 26b:	83 c2 01             	add    $0x1,%edx
 26e:	89 c3                	mov    %eax,%ebx
 270:	83 c0 01             	add    $0x1,%eax
 273:	0f b6 09             	movzbl (%ecx),%ecx
 276:	88 0b                	mov    %cl,(%ebx)
 278:	84 c9                	test   %cl,%cl
 27a:	75 ed                	jne    269 <strcpy+0xd>
    ;
  return os;
}
 27c:	89 f0                	mov    %esi,%eax
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    

00000282 <strcmp>:

int strcmp(const char *p, const char *q)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	8b 4d 08             	mov    0x8(%ebp),%ecx
 288:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 28b:	eb 06                	jmp    293 <strcmp+0x11>
    p++, q++;
 28d:	83 c1 01             	add    $0x1,%ecx
 290:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 293:	0f b6 01             	movzbl (%ecx),%eax
 296:	84 c0                	test   %al,%al
 298:	74 04                	je     29e <strcmp+0x1c>
 29a:	3a 02                	cmp    (%edx),%al
 29c:	74 ef                	je     28d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 29e:	0f b6 c0             	movzbl %al,%eax
 2a1:	0f b6 12             	movzbl (%edx),%edx
 2a4:	29 d0                	sub    %edx,%eax
}
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    

000002a8 <strlen>:

uint strlen(const char *s)
{
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 2ae:	b8 00 00 00 00       	mov    $0x0,%eax
 2b3:	eb 03                	jmp    2b8 <strlen+0x10>
 2b5:	83 c0 01             	add    $0x1,%eax
 2b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2bc:	75 f7                	jne    2b5 <strlen+0xd>
    ;
  return n;
}
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    

000002c0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	89 d7                	mov    %edx,%edi
 2c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <strchr>:

char *
strchr(const char *s, char c)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 2e3:	eb 03                	jmp    2e8 <strchr+0xf>
 2e5:	83 c0 01             	add    $0x1,%eax
 2e8:	0f b6 10             	movzbl (%eax),%edx
 2eb:	84 d2                	test   %dl,%dl
 2ed:	74 06                	je     2f5 <strchr+0x1c>
    if (*s == c)
 2ef:	38 ca                	cmp    %cl,%dl
 2f1:	75 f2                	jne    2e5 <strchr+0xc>
 2f3:	eb 05                	jmp    2fa <strchr+0x21>
      return (char *)s;
  return 0;
 2f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    

000002fc <gets>:

char *
gets(char *buf, int max)
{
 2fc:	55                   	push   %ebp
 2fd:	89 e5                	mov    %esp,%ebp
 2ff:	57                   	push   %edi
 300:	56                   	push   %esi
 301:	53                   	push   %ebx
 302:	83 ec 1c             	sub    $0x1c,%esp
 305:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 308:	bb 00 00 00 00       	mov    $0x0,%ebx
 30d:	89 de                	mov    %ebx,%esi
 30f:	83 c3 01             	add    $0x1,%ebx
 312:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 315:	7d 2e                	jge    345 <gets+0x49>
  {
    cc = read(0, &c, 1);
 317:	83 ec 04             	sub    $0x4,%esp
 31a:	6a 01                	push   $0x1
 31c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 31f:	50                   	push   %eax
 320:	6a 00                	push   $0x0
 322:	e8 a1 01 00 00       	call   4c8 <read>
    if (cc < 1)
 327:	83 c4 10             	add    $0x10,%esp
 32a:	85 c0                	test   %eax,%eax
 32c:	7e 17                	jle    345 <gets+0x49>
      break;
    buf[i++] = c;
 32e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 332:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 335:	3c 0a                	cmp    $0xa,%al
 337:	0f 94 c2             	sete   %dl
 33a:	3c 0d                	cmp    $0xd,%al
 33c:	0f 94 c0             	sete   %al
 33f:	08 c2                	or     %al,%dl
 341:	74 ca                	je     30d <gets+0x11>
    buf[i++] = c;
 343:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 345:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 349:	89 f8                	mov    %edi,%eax
 34b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34e:	5b                   	pop    %ebx
 34f:	5e                   	pop    %esi
 350:	5f                   	pop    %edi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    

00000353 <stat>:

int stat(const char *n, struct stat *st)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	56                   	push   %esi
 357:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 358:	83 ec 08             	sub    $0x8,%esp
 35b:	6a 00                	push   $0x0
 35d:	ff 75 08             	push   0x8(%ebp)
 360:	e8 8b 01 00 00       	call   4f0 <open>
  if (fd < 0)
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	78 24                	js     390 <stat+0x3d>
 36c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 36e:	83 ec 08             	sub    $0x8,%esp
 371:	ff 75 0c             	push   0xc(%ebp)
 374:	50                   	push   %eax
 375:	e8 8e 01 00 00       	call   508 <fstat>
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	89 1c 24             	mov    %ebx,(%esp)
 37f:	e8 54 01 00 00       	call   4d8 <close>
  return r;
 384:	83 c4 10             	add    $0x10,%esp
}
 387:	89 f0                	mov    %esi,%eax
 389:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb f0                	jmp    387 <stat+0x34>

00000397 <atoi>:

int atoi(const char *s)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	53                   	push   %ebx
 39b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 39e:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 3a3:	eb 10                	jmp    3b5 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 3a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ab:	83 c1 01             	add    $0x1,%ecx
 3ae:	0f be c0             	movsbl %al,%eax
 3b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 3b5:	0f b6 01             	movzbl (%ecx),%eax
 3b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3bb:	80 fb 09             	cmp    $0x9,%bl
 3be:	76 e5                	jbe    3a5 <atoi+0xe>
  return n;
}
 3c0:	89 d0                	mov    %edx,%eax
 3c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c5:	c9                   	leave  
 3c6:	c3                   	ret    

000003c7 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
 3cc:	8b 75 08             	mov    0x8(%ebp),%esi
 3cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 3d7:	eb 0d                	jmp    3e6 <memmove+0x1f>
    *dst++ = *src++;
 3d9:	0f b6 01             	movzbl (%ecx),%eax
 3dc:	88 02                	mov    %al,(%edx)
 3de:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e1:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 3e4:	89 d8                	mov    %ebx,%eax
 3e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3e9:	85 c0                	test   %eax,%eax
 3eb:	7f ec                	jg     3d9 <memmove+0x12>
  return vdst;
}
 3ed:	89 f0                	mov    %esi,%eax
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    

000003f3 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 3f9:	83 38 01             	cmpl   $0x1,(%eax)
 3fc:	74 fb                	je     3f9 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 3fe:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 404:	5d                   	pop    %ebp
 405:	c3                   	ret    

00000406 <lock_release>:
void lock_release(lock_t *lock)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 409:	8b 45 08             	mov    0x8(%ebp),%eax
 40c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    

00000414 <lock_init>:
void lock_init(lock_t *lock)
{
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 420:	5d                   	pop    %ebp
 421:	c3                   	ret    

00000422 <thread_create>:
{
 422:	55                   	push   %ebp
 423:	89 e5                	mov    %esp,%ebp
 425:	53                   	push   %ebx
 426:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 429:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 42c:	53                   	push   %ebx
 42d:	e8 e2 ff ff ff       	call   414 <lock_init>
  lock_acquire(&lock);
 432:	89 1c 24             	mov    %ebx,(%esp)
 435:	e8 b9 ff ff ff       	call   3f3 <lock_acquire>
  void *stack = malloc(4096 * 2);
 43a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 441:	e8 e5 03 00 00       	call   82b <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 446:	50                   	push   %eax
 447:	ff 75 10             	push   0x10(%ebp)
 44a:	ff 75 0c             	push   0xc(%ebp)
 44d:	ff 75 08             	push   0x8(%ebp)
 450:	e8 fb 00 00 00       	call   550 <clone>
}
 455:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 458:	c9                   	leave  
 459:	c3                   	ret    

0000045a <thread_join>:
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	56                   	push   %esi
 45e:	53                   	push   %ebx
 45f:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 462:	6a 04                	push   $0x4
 464:	e8 c2 03 00 00       	call   82b <malloc>
 469:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 46c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46f:	89 04 24             	mov    %eax,(%esp)
 472:	e8 e1 00 00 00       	call   558 <join>
 477:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 479:	8d 75 f0             	lea    -0x10(%ebp),%esi
 47c:	89 34 24             	mov    %esi,(%esp)
 47f:	e8 90 ff ff ff       	call   414 <lock_init>
  lock_acquire(&lock);
 484:	89 34 24             	mov    %esi,(%esp)
 487:	e8 67 ff ff ff       	call   3f3 <lock_acquire>
  free(stack);
 48c:	83 c4 04             	add    $0x4,%esp
 48f:	ff 75 f4             	push   -0xc(%ebp)
 492:	e8 d4 02 00 00       	call   76b <free>
  lock_release(&lock);
 497:	89 34 24             	mov    %esi,(%esp)
 49a:	e8 67 ff ff ff       	call   406 <lock_release>
}
 49f:	89 d8                	mov    %ebx,%eax
 4a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a4:	5b                   	pop    %ebx
 4a5:	5e                   	pop    %esi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    

000004a8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a8:	b8 01 00 00 00       	mov    $0x1,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <exit>:
SYSCALL(exit)
 4b0:	b8 02 00 00 00       	mov    $0x2,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <wait>:
SYSCALL(wait)
 4b8:	b8 03 00 00 00       	mov    $0x3,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <pipe>:
SYSCALL(pipe)
 4c0:	b8 04 00 00 00       	mov    $0x4,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <read>:
SYSCALL(read)
 4c8:	b8 05 00 00 00       	mov    $0x5,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <write>:
SYSCALL(write)
 4d0:	b8 10 00 00 00       	mov    $0x10,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <close>:
SYSCALL(close)
 4d8:	b8 15 00 00 00       	mov    $0x15,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <kill>:
SYSCALL(kill)
 4e0:	b8 06 00 00 00       	mov    $0x6,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <exec>:
SYSCALL(exec)
 4e8:	b8 07 00 00 00       	mov    $0x7,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <open>:
SYSCALL(open)
 4f0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <mknod>:
SYSCALL(mknod)
 4f8:	b8 11 00 00 00       	mov    $0x11,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <unlink>:
SYSCALL(unlink)
 500:	b8 12 00 00 00       	mov    $0x12,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <fstat>:
SYSCALL(fstat)
 508:	b8 08 00 00 00       	mov    $0x8,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <link>:
SYSCALL(link)
 510:	b8 13 00 00 00       	mov    $0x13,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <mkdir>:
SYSCALL(mkdir)
 518:	b8 14 00 00 00       	mov    $0x14,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <chdir>:
SYSCALL(chdir)
 520:	b8 09 00 00 00       	mov    $0x9,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <dup>:
SYSCALL(dup)
 528:	b8 0a 00 00 00       	mov    $0xa,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <getpid>:
SYSCALL(getpid)
 530:	b8 0b 00 00 00       	mov    $0xb,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <sbrk>:
SYSCALL(sbrk)
 538:	b8 0c 00 00 00       	mov    $0xc,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <sleep>:
SYSCALL(sleep)
 540:	b8 0d 00 00 00       	mov    $0xd,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <uptime>:
SYSCALL(uptime)
 548:	b8 0e 00 00 00       	mov    $0xe,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <clone>:
SYSCALL(clone)
 550:	b8 16 00 00 00       	mov    $0x16,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <join>:
 558:	b8 17 00 00 00       	mov    $0x17,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	83 ec 1c             	sub    $0x1c,%esp
 566:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 569:	6a 01                	push   $0x1
 56b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 56e:	52                   	push   %edx
 56f:	50                   	push   %eax
 570:	e8 5b ff ff ff       	call   4d0 <write>
}
 575:	83 c4 10             	add    $0x10,%esp
 578:	c9                   	leave  
 579:	c3                   	ret    

0000057a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 57a:	55                   	push   %ebp
 57b:	89 e5                	mov    %esp,%ebp
 57d:	57                   	push   %edi
 57e:	56                   	push   %esi
 57f:	53                   	push   %ebx
 580:	83 ec 2c             	sub    $0x2c,%esp
 583:	89 45 d0             	mov    %eax,-0x30(%ebp)
 586:	89 d0                	mov    %edx,%eax
 588:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 58a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 58e:	0f 95 c1             	setne  %cl
 591:	c1 ea 1f             	shr    $0x1f,%edx
 594:	84 d1                	test   %dl,%cl
 596:	74 44                	je     5dc <printint+0x62>
    neg = 1;
    x = -xx;
 598:	f7 d8                	neg    %eax
 59a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 59c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5a3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5a8:	89 c8                	mov    %ecx,%eax
 5aa:	ba 00 00 00 00       	mov    $0x0,%edx
 5af:	f7 f6                	div    %esi
 5b1:	89 df                	mov    %ebx,%edi
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	0f b6 92 a8 09 00 00 	movzbl 0x9a8(%edx),%edx
 5bd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5c1:	89 ca                	mov    %ecx,%edx
 5c3:	89 c1                	mov    %eax,%ecx
 5c5:	39 d6                	cmp    %edx,%esi
 5c7:	76 df                	jbe    5a8 <printint+0x2e>
  if(neg)
 5c9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5cd:	74 31                	je     600 <printint+0x86>
    buf[i++] = '-';
 5cf:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5d4:	8d 5f 02             	lea    0x2(%edi),%ebx
 5d7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5da:	eb 17                	jmp    5f3 <printint+0x79>
    x = xx;
 5dc:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5de:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5e5:	eb bc                	jmp    5a3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5e7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5ec:	89 f0                	mov    %esi,%eax
 5ee:	e8 6d ff ff ff       	call   560 <putc>
  while(--i >= 0)
 5f3:	83 eb 01             	sub    $0x1,%ebx
 5f6:	79 ef                	jns    5e7 <printint+0x6d>
}
 5f8:	83 c4 2c             	add    $0x2c,%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    
 600:	8b 75 d0             	mov    -0x30(%ebp),%esi
 603:	eb ee                	jmp    5f3 <printint+0x79>

00000605 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 60e:	8d 45 10             	lea    0x10(%ebp),%eax
 611:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 614:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 619:	bb 00 00 00 00       	mov    $0x0,%ebx
 61e:	eb 14                	jmp    634 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 620:	89 fa                	mov    %edi,%edx
 622:	8b 45 08             	mov    0x8(%ebp),%eax
 625:	e8 36 ff ff ff       	call   560 <putc>
 62a:	eb 05                	jmp    631 <printf+0x2c>
      }
    } else if(state == '%'){
 62c:	83 fe 25             	cmp    $0x25,%esi
 62f:	74 25                	je     656 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 631:	83 c3 01             	add    $0x1,%ebx
 634:	8b 45 0c             	mov    0xc(%ebp),%eax
 637:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 63b:	84 c0                	test   %al,%al
 63d:	0f 84 20 01 00 00    	je     763 <printf+0x15e>
    c = fmt[i] & 0xff;
 643:	0f be f8             	movsbl %al,%edi
 646:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 649:	85 f6                	test   %esi,%esi
 64b:	75 df                	jne    62c <printf+0x27>
      if(c == '%'){
 64d:	83 f8 25             	cmp    $0x25,%eax
 650:	75 ce                	jne    620 <printf+0x1b>
        state = '%';
 652:	89 c6                	mov    %eax,%esi
 654:	eb db                	jmp    631 <printf+0x2c>
      if(c == 'd'){
 656:	83 f8 25             	cmp    $0x25,%eax
 659:	0f 84 cf 00 00 00    	je     72e <printf+0x129>
 65f:	0f 8c dd 00 00 00    	jl     742 <printf+0x13d>
 665:	83 f8 78             	cmp    $0x78,%eax
 668:	0f 8f d4 00 00 00    	jg     742 <printf+0x13d>
 66e:	83 f8 63             	cmp    $0x63,%eax
 671:	0f 8c cb 00 00 00    	jl     742 <printf+0x13d>
 677:	83 e8 63             	sub    $0x63,%eax
 67a:	83 f8 15             	cmp    $0x15,%eax
 67d:	0f 87 bf 00 00 00    	ja     742 <printf+0x13d>
 683:	ff 24 85 50 09 00 00 	jmp    *0x950(,%eax,4)
        printint(fd, *ap, 10, 1);
 68a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68d:	8b 17                	mov    (%edi),%edx
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	6a 01                	push   $0x1
 694:	b9 0a 00 00 00       	mov    $0xa,%ecx
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	e8 d9 fe ff ff       	call   57a <printint>
        ap++;
 6a1:	83 c7 04             	add    $0x4,%edi
 6a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6aa:	be 00 00 00 00       	mov    $0x0,%esi
 6af:	eb 80                	jmp    631 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b4:	8b 17                	mov    (%edi),%edx
 6b6:	83 ec 0c             	sub    $0xc,%esp
 6b9:	6a 00                	push   $0x0
 6bb:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	e8 b2 fe ff ff       	call   57a <printint>
        ap++;
 6c8:	83 c7 04             	add    $0x4,%edi
 6cb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ce:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d1:	be 00 00 00 00       	mov    $0x0,%esi
 6d6:	e9 56 ff ff ff       	jmp    631 <printf+0x2c>
        s = (char*)*ap;
 6db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6de:	8b 30                	mov    (%eax),%esi
        ap++;
 6e0:	83 c0 04             	add    $0x4,%eax
 6e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6e6:	85 f6                	test   %esi,%esi
 6e8:	75 15                	jne    6ff <printf+0xfa>
          s = "(null)";
 6ea:	be 48 09 00 00       	mov    $0x948,%esi
 6ef:	eb 0e                	jmp    6ff <printf+0xfa>
          putc(fd, *s);
 6f1:	0f be d2             	movsbl %dl,%edx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 64 fe ff ff       	call   560 <putc>
          s++;
 6fc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6ff:	0f b6 16             	movzbl (%esi),%edx
 702:	84 d2                	test   %dl,%dl
 704:	75 eb                	jne    6f1 <printf+0xec>
      state = 0;
 706:	be 00 00 00 00       	mov    $0x0,%esi
 70b:	e9 21 ff ff ff       	jmp    631 <printf+0x2c>
        putc(fd, *ap);
 710:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 713:	0f be 17             	movsbl (%edi),%edx
 716:	8b 45 08             	mov    0x8(%ebp),%eax
 719:	e8 42 fe ff ff       	call   560 <putc>
        ap++;
 71e:	83 c7 04             	add    $0x4,%edi
 721:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 724:	be 00 00 00 00       	mov    $0x0,%esi
 729:	e9 03 ff ff ff       	jmp    631 <printf+0x2c>
        putc(fd, c);
 72e:	89 fa                	mov    %edi,%edx
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	e8 28 fe ff ff       	call   560 <putc>
      state = 0;
 738:	be 00 00 00 00       	mov    $0x0,%esi
 73d:	e9 ef fe ff ff       	jmp    631 <printf+0x2c>
        putc(fd, '%');
 742:	ba 25 00 00 00       	mov    $0x25,%edx
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	e8 11 fe ff ff       	call   560 <putc>
        putc(fd, c);
 74f:	89 fa                	mov    %edi,%edx
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	e8 07 fe ff ff       	call   560 <putc>
      state = 0;
 759:	be 00 00 00 00       	mov    $0x0,%esi
 75e:	e9 ce fe ff ff       	jmp    631 <printf+0x2c>
    }
  }
}
 763:	8d 65 f4             	lea    -0xc(%ebp),%esp
 766:	5b                   	pop    %ebx
 767:	5e                   	pop    %esi
 768:	5f                   	pop    %edi
 769:	5d                   	pop    %ebp
 76a:	c3                   	ret    

0000076b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 76b:	55                   	push   %ebp
 76c:	89 e5                	mov    %esp,%ebp
 76e:	57                   	push   %edi
 76f:	56                   	push   %esi
 770:	53                   	push   %ebx
 771:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 774:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 777:	a1 24 0d 00 00       	mov    0xd24,%eax
 77c:	eb 02                	jmp    780 <free+0x15>
 77e:	89 d0                	mov    %edx,%eax
 780:	39 c8                	cmp    %ecx,%eax
 782:	73 04                	jae    788 <free+0x1d>
 784:	39 08                	cmp    %ecx,(%eax)
 786:	77 12                	ja     79a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	8b 10                	mov    (%eax),%edx
 78a:	39 c2                	cmp    %eax,%edx
 78c:	77 f0                	ja     77e <free+0x13>
 78e:	39 c8                	cmp    %ecx,%eax
 790:	72 08                	jb     79a <free+0x2f>
 792:	39 ca                	cmp    %ecx,%edx
 794:	77 04                	ja     79a <free+0x2f>
 796:	89 d0                	mov    %edx,%eax
 798:	eb e6                	jmp    780 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 79a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7a0:	8b 10                	mov    (%eax),%edx
 7a2:	39 d7                	cmp    %edx,%edi
 7a4:	74 19                	je     7bf <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a9:	8b 50 04             	mov    0x4(%eax),%edx
 7ac:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7af:	39 ce                	cmp    %ecx,%esi
 7b1:	74 1b                	je     7ce <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b5:	a3 24 0d 00 00       	mov    %eax,0xd24
}
 7ba:	5b                   	pop    %ebx
 7bb:	5e                   	pop    %esi
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
 7be:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7bf:	03 72 04             	add    0x4(%edx),%esi
 7c2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c5:	8b 10                	mov    (%eax),%edx
 7c7:	8b 12                	mov    (%edx),%edx
 7c9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7cc:	eb db                	jmp    7a9 <free+0x3e>
    p->s.size += bp->s.size;
 7ce:	03 53 fc             	add    -0x4(%ebx),%edx
 7d1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d7:	89 10                	mov    %edx,(%eax)
 7d9:	eb da                	jmp    7b5 <free+0x4a>

000007db <morecore>:

static Header*
morecore(uint nu)
{
 7db:	55                   	push   %ebp
 7dc:	89 e5                	mov    %esp,%ebp
 7de:	53                   	push   %ebx
 7df:	83 ec 04             	sub    $0x4,%esp
 7e2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7e4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7e9:	77 05                	ja     7f0 <morecore+0x15>
    nu = 4096;
 7eb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7f0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7f7:	83 ec 0c             	sub    $0xc,%esp
 7fa:	50                   	push   %eax
 7fb:	e8 38 fd ff ff       	call   538 <sbrk>
  if(p == (char*)-1)
 800:	83 c4 10             	add    $0x10,%esp
 803:	83 f8 ff             	cmp    $0xffffffff,%eax
 806:	74 1c                	je     824 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 808:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 80b:	83 c0 08             	add    $0x8,%eax
 80e:	83 ec 0c             	sub    $0xc,%esp
 811:	50                   	push   %eax
 812:	e8 54 ff ff ff       	call   76b <free>
  return freep;
 817:	a1 24 0d 00 00       	mov    0xd24,%eax
 81c:	83 c4 10             	add    $0x10,%esp
}
 81f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 822:	c9                   	leave  
 823:	c3                   	ret    
    return 0;
 824:	b8 00 00 00 00       	mov    $0x0,%eax
 829:	eb f4                	jmp    81f <morecore+0x44>

0000082b <malloc>:

void*
malloc(uint nbytes)
{
 82b:	55                   	push   %ebp
 82c:	89 e5                	mov    %esp,%ebp
 82e:	53                   	push   %ebx
 82f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	8d 58 07             	lea    0x7(%eax),%ebx
 838:	c1 eb 03             	shr    $0x3,%ebx
 83b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 83e:	8b 0d 24 0d 00 00    	mov    0xd24,%ecx
 844:	85 c9                	test   %ecx,%ecx
 846:	74 04                	je     84c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 01                	mov    (%ecx),%eax
 84a:	eb 4a                	jmp    896 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 84c:	c7 05 24 0d 00 00 28 	movl   $0xd28,0xd24
 853:	0d 00 00 
 856:	c7 05 28 0d 00 00 28 	movl   $0xd28,0xd28
 85d:	0d 00 00 
    base.s.size = 0;
 860:	c7 05 2c 0d 00 00 00 	movl   $0x0,0xd2c
 867:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 86a:	b9 28 0d 00 00       	mov    $0xd28,%ecx
 86f:	eb d7                	jmp    848 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 871:	74 19                	je     88c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 873:	29 da                	sub    %ebx,%edx
 875:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 878:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 87b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 87e:	89 0d 24 0d 00 00    	mov    %ecx,0xd24
      return (void*)(p + 1);
 884:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 887:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 88a:	c9                   	leave  
 88b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 88c:	8b 10                	mov    (%eax),%edx
 88e:	89 11                	mov    %edx,(%ecx)
 890:	eb ec                	jmp    87e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 892:	89 c1                	mov    %eax,%ecx
 894:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 896:	8b 50 04             	mov    0x4(%eax),%edx
 899:	39 da                	cmp    %ebx,%edx
 89b:	73 d4                	jae    871 <malloc+0x46>
    if(p == freep)
 89d:	39 05 24 0d 00 00    	cmp    %eax,0xd24
 8a3:	75 ed                	jne    892 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8a5:	89 d8                	mov    %ebx,%eax
 8a7:	e8 2f ff ff ff       	call   7db <morecore>
 8ac:	85 c0                	test   %eax,%eax
 8ae:	75 e2                	jne    892 <malloc+0x67>
 8b0:	eb d5                	jmp    887 <malloc+0x5c>
