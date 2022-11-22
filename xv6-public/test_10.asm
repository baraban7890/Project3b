
_test_10:     file format elf32-i386


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
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 24 0d 00 00       	mov    0xd24,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 bc 08 00 00       	push   $0x8bc
  31:	68 c6 08 00 00       	push   $0x8c6
  36:	6a 01                	push   $0x1
  38:	e8 cf 05 00 00       	call   60c <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 0d 09 00 00       	push   $0x90d
  45:	68 dd 08 00 00       	push   $0x8dd
  4a:	6a 01                	push   $0x1
  4c:	e8 bb 05 00 00       	call   60c <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 f1 08 00 00       	push   $0x8f1
  59:	6a 01                	push   $0x1
  5b:	e8 ac 05 00 00       	call   60c <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 28 0d 00 00    	push   0xd28
  69:	e8 79 04 00 00       	call   4e7 <kill>
  6e:	e8 44 04 00 00       	call   4b7 <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 bc 08 00 00       	push   $0x8bc
  7a:	68 c6 08 00 00       	push   $0x8c6
  7f:	6a 01                	push   $0x1
  81:	e8 86 05 00 00       	call   60c <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 ce 08 00 00       	push   $0x8ce
  8e:	68 dd 08 00 00       	push   $0x8dd
  93:	6a 01                	push   $0x1
  95:	e8 72 05 00 00       	call   60c <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 f1 08 00 00       	push   $0x8f1
  a2:	6a 01                	push   $0x1
  a4:	e8 63 05 00 00       	call   60c <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 28 0d 00 00    	push   0xd28
  b2:	e8 30 04 00 00       	call   4e7 <kill>
  b7:	e8 fb 03 00 00       	call   4b7 <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 bc 08 00 00       	push   $0x8bc
  c3:	68 c6 08 00 00       	push   $0x8c6
  c8:	6a 01                	push   $0x1
  ca:	e8 3d 05 00 00       	call   60c <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 fe 08 00 00       	push   $0x8fe
  d7:	68 dd 08 00 00       	push   $0x8dd
  dc:	6a 01                	push   $0x1
  de:	e8 29 05 00 00       	call   60c <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 f1 08 00 00       	push   $0x8f1
  eb:	6a 01                	push   $0x1
  ed:	e8 1a 05 00 00       	call   60c <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 28 0d 00 00    	push   0xd28
  fb:	e8 e7 03 00 00       	call   4e7 <kill>
 100:	e8 b2 03 00 00       	call   4b7 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 24 0d 00 00       	mov    %eax,0xd24
   exit();
 10d:	e8 a5 03 00 00       	call   4b7 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	51                   	push   %ecx
 121:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 124:	e8 0e 04 00 00       	call   537 <getpid>
 129:	a3 28 0d 00 00       	mov    %eax,0xd28
   int arg1 = 35;
 12e:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 135:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 142:	50                   	push   %eax
 143:	8d 45 f4             	lea    -0xc(%ebp),%eax
 146:	50                   	push   %eax
 147:	68 00 00 00 00       	push   $0x0
 14c:	e8 d8 02 00 00       	call   429 <thread_create>
   assert(thread_pid > 0);
 151:	83 c4 10             	add    $0x10,%esp
 154:	85 c0                	test   %eax,%eax
 156:	7e 65                	jle    1bd <main+0xab>
 158:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 15a:	e8 02 03 00 00       	call   461 <thread_join>
   assert(join_pid == thread_pid);
 15f:	39 c3                	cmp    %eax,%ebx
 161:	0f 85 9f 00 00 00    	jne    206 <main+0xf4>
   assert(global == 2);
 167:	83 3d 24 0d 00 00 02 	cmpl   $0x2,0xd24
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 bc 08 00 00       	push   $0x8bc
 17b:	68 c6 08 00 00       	push   $0x8c6
 180:	6a 01                	push   $0x1
 182:	e8 85 04 00 00       	call   60c <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 3f 09 00 00       	push   $0x93f
 18f:	68 dd 08 00 00       	push   $0x8dd
 194:	6a 01                	push   $0x1
 196:	e8 71 04 00 00       	call   60c <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 f1 08 00 00       	push   $0x8f1
 1a3:	6a 01                	push   $0x1
 1a5:	e8 62 04 00 00       	call   60c <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 28 0d 00 00    	push   0xd28
 1b3:	e8 2f 03 00 00       	call   4e7 <kill>
 1b8:	e8 fa 02 00 00       	call   4b7 <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 bc 08 00 00       	push   $0x8bc
 1c4:	68 c6 08 00 00       	push   $0x8c6
 1c9:	6a 01                	push   $0x1
 1cb:	e8 3c 04 00 00       	call   60c <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 19 09 00 00       	push   $0x919
 1d8:	68 dd 08 00 00       	push   $0x8dd
 1dd:	6a 01                	push   $0x1
 1df:	e8 28 04 00 00       	call   60c <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 f1 08 00 00       	push   $0x8f1
 1ec:	6a 01                	push   $0x1
 1ee:	e8 19 04 00 00       	call   60c <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 28 0d 00 00    	push   0xd28
 1fc:	e8 e6 02 00 00       	call   4e7 <kill>
 201:	e8 b1 02 00 00       	call   4b7 <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 bc 08 00 00       	push   $0x8bc
 20d:	68 c6 08 00 00       	push   $0x8c6
 212:	6a 01                	push   $0x1
 214:	e8 f3 03 00 00       	call   60c <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 28 09 00 00       	push   $0x928
 221:	68 dd 08 00 00       	push   $0x8dd
 226:	6a 01                	push   $0x1
 228:	e8 df 03 00 00       	call   60c <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 f1 08 00 00       	push   $0x8f1
 235:	6a 01                	push   $0x1
 237:	e8 d0 03 00 00       	call   60c <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 28 0d 00 00    	push   0xd28
 245:	e8 9d 02 00 00       	call   4e7 <kill>
 24a:	e8 68 02 00 00       	call   4b7 <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 4b 09 00 00       	push   $0x94b
 257:	6a 01                	push   $0x1
 259:	e8 ae 03 00 00       	call   60c <printf>
   exit();
 25e:	e8 54 02 00 00       	call   4b7 <exit>

00000263 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 26e:	89 f0                	mov    %esi,%eax
 270:	89 d1                	mov    %edx,%ecx
 272:	83 c2 01             	add    $0x1,%edx
 275:	89 c3                	mov    %eax,%ebx
 277:	83 c0 01             	add    $0x1,%eax
 27a:	0f b6 09             	movzbl (%ecx),%ecx
 27d:	88 0b                	mov    %cl,(%ebx)
 27f:	84 c9                	test   %cl,%cl
 281:	75 ed                	jne    270 <strcpy+0xd>
    ;
  return os;
}
 283:	89 f0                	mov    %esi,%eax
 285:	5b                   	pop    %ebx
 286:	5e                   	pop    %esi
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    

00000289 <strcmp>:

int strcmp(const char *p, const char *q)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 292:	eb 06                	jmp    29a <strcmp+0x11>
    p++, q++;
 294:	83 c1 01             	add    $0x1,%ecx
 297:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 29a:	0f b6 01             	movzbl (%ecx),%eax
 29d:	84 c0                	test   %al,%al
 29f:	74 04                	je     2a5 <strcmp+0x1c>
 2a1:	3a 02                	cmp    (%edx),%al
 2a3:	74 ef                	je     294 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2a5:	0f b6 c0             	movzbl %al,%eax
 2a8:	0f b6 12             	movzbl (%edx),%edx
 2ab:	29 d0                	sub    %edx,%eax
}
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <strlen>:

uint strlen(const char *s)
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 2b5:	b8 00 00 00 00       	mov    $0x0,%eax
 2ba:	eb 03                	jmp    2bf <strlen+0x10>
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2c3:	75 f7                	jne    2bc <strlen+0xd>
    ;
  return n;
}
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    

000002c7 <memset>:

void *
memset(void *dst, int c, uint n)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ce:	89 d7                	mov    %edx,%edi
 2d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d6:	fc                   	cld    
 2d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d9:	89 d0                	mov    %edx,%eax
 2db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2de:	c9                   	leave  
 2df:	c3                   	ret    

000002e0 <strchr>:

char *
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 2ea:	eb 03                	jmp    2ef <strchr+0xf>
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	0f b6 10             	movzbl (%eax),%edx
 2f2:	84 d2                	test   %dl,%dl
 2f4:	74 06                	je     2fc <strchr+0x1c>
    if (*s == c)
 2f6:	38 ca                	cmp    %cl,%dl
 2f8:	75 f2                	jne    2ec <strchr+0xc>
 2fa:	eb 05                	jmp    301 <strchr+0x21>
      return (char *)s;
  return 0;
 2fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    

00000303 <gets>:

char *
gets(char *buf, int max)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	57                   	push   %edi
 307:	56                   	push   %esi
 308:	53                   	push   %ebx
 309:	83 ec 1c             	sub    $0x1c,%esp
 30c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 30f:	bb 00 00 00 00       	mov    $0x0,%ebx
 314:	89 de                	mov    %ebx,%esi
 316:	83 c3 01             	add    $0x1,%ebx
 319:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31c:	7d 2e                	jge    34c <gets+0x49>
  {
    cc = read(0, &c, 1);
 31e:	83 ec 04             	sub    $0x4,%esp
 321:	6a 01                	push   $0x1
 323:	8d 45 e7             	lea    -0x19(%ebp),%eax
 326:	50                   	push   %eax
 327:	6a 00                	push   $0x0
 329:	e8 a1 01 00 00       	call   4cf <read>
    if (cc < 1)
 32e:	83 c4 10             	add    $0x10,%esp
 331:	85 c0                	test   %eax,%eax
 333:	7e 17                	jle    34c <gets+0x49>
      break;
    buf[i++] = c;
 335:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 339:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 33c:	3c 0a                	cmp    $0xa,%al
 33e:	0f 94 c2             	sete   %dl
 341:	3c 0d                	cmp    $0xd,%al
 343:	0f 94 c0             	sete   %al
 346:	08 c2                	or     %al,%dl
 348:	74 ca                	je     314 <gets+0x11>
    buf[i++] = c;
 34a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 34c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 350:	89 f8                	mov    %edi,%eax
 352:	8d 65 f4             	lea    -0xc(%ebp),%esp
 355:	5b                   	pop    %ebx
 356:	5e                   	pop    %esi
 357:	5f                   	pop    %edi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <stat>:

int stat(const char *n, struct stat *st)
{
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 35f:	83 ec 08             	sub    $0x8,%esp
 362:	6a 00                	push   $0x0
 364:	ff 75 08             	push   0x8(%ebp)
 367:	e8 8b 01 00 00       	call   4f7 <open>
  if (fd < 0)
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	85 c0                	test   %eax,%eax
 371:	78 24                	js     397 <stat+0x3d>
 373:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	ff 75 0c             	push   0xc(%ebp)
 37b:	50                   	push   %eax
 37c:	e8 8e 01 00 00       	call   50f <fstat>
 381:	89 c6                	mov    %eax,%esi
  close(fd);
 383:	89 1c 24             	mov    %ebx,(%esp)
 386:	e8 54 01 00 00       	call   4df <close>
  return r;
 38b:	83 c4 10             	add    $0x10,%esp
}
 38e:	89 f0                	mov    %esi,%eax
 390:	8d 65 f8             	lea    -0x8(%ebp),%esp
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
    return -1;
 397:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39c:	eb f0                	jmp    38e <stat+0x34>

0000039e <atoi>:

int atoi(const char *s)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	53                   	push   %ebx
 3a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 3aa:	eb 10                	jmp    3bc <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 3ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b2:	83 c1 01             	add    $0x1,%ecx
 3b5:	0f be c0             	movsbl %al,%eax
 3b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 3bc:	0f b6 01             	movzbl (%ecx),%eax
 3bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c2:	80 fb 09             	cmp    $0x9,%bl
 3c5:	76 e5                	jbe    3ac <atoi+0xe>
  return n;
}
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cc:	c9                   	leave  
 3cd:	c3                   	ret    

000003ce <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	8b 75 08             	mov    0x8(%ebp),%esi
 3d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 3de:	eb 0d                	jmp    3ed <memmove+0x1f>
    *dst++ = *src++;
 3e0:	0f b6 01             	movzbl (%ecx),%eax
 3e3:	88 02                	mov    %al,(%edx)
 3e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e8:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 3eb:	89 d8                	mov    %ebx,%eax
 3ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7f ec                	jg     3e0 <memmove+0x12>
  return vdst;
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    

000003fa <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 400:	83 38 01             	cmpl   $0x1,(%eax)
 403:	74 fb                	je     400 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 405:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    

0000040d <lock_release>:
void lock_release(lock_t *lock)
{
 40d:	55                   	push   %ebp
 40e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    

0000041b <lock_init>:
void lock_init(lock_t *lock)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 41e:	8b 45 08             	mov    0x8(%ebp),%eax
 421:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <thread_create>:
{
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	53                   	push   %ebx
 42d:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 430:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 433:	53                   	push   %ebx
 434:	e8 e2 ff ff ff       	call   41b <lock_init>
  lock_acquire(&lock);
 439:	89 1c 24             	mov    %ebx,(%esp)
 43c:	e8 b9 ff ff ff       	call   3fa <lock_acquire>
  void *stack = malloc(4096 * 2);
 441:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 448:	e8 e5 03 00 00       	call   832 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 44d:	50                   	push   %eax
 44e:	ff 75 10             	push   0x10(%ebp)
 451:	ff 75 0c             	push   0xc(%ebp)
 454:	ff 75 08             	push   0x8(%ebp)
 457:	e8 fb 00 00 00       	call   557 <clone>
}
 45c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45f:	c9                   	leave  
 460:	c3                   	ret    

00000461 <thread_join>:
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 469:	6a 04                	push   $0x4
 46b:	e8 c2 03 00 00       	call   832 <malloc>
 470:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 473:	8d 45 f4             	lea    -0xc(%ebp),%eax
 476:	89 04 24             	mov    %eax,(%esp)
 479:	e8 e1 00 00 00       	call   55f <join>
 47e:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 480:	8d 75 f0             	lea    -0x10(%ebp),%esi
 483:	89 34 24             	mov    %esi,(%esp)
 486:	e8 90 ff ff ff       	call   41b <lock_init>
  lock_acquire(&lock);
 48b:	89 34 24             	mov    %esi,(%esp)
 48e:	e8 67 ff ff ff       	call   3fa <lock_acquire>
  free(stack);
 493:	83 c4 04             	add    $0x4,%esp
 496:	ff 75 f4             	push   -0xc(%ebp)
 499:	e8 d4 02 00 00       	call   772 <free>
  lock_release(&lock);
 49e:	89 34 24             	mov    %esi,(%esp)
 4a1:	e8 67 ff ff ff       	call   40d <lock_release>
}
 4a6:	89 d8                	mov    %ebx,%eax
 4a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    

000004af <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4af:	b8 01 00 00 00       	mov    $0x1,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <exit>:
SYSCALL(exit)
 4b7:	b8 02 00 00 00       	mov    $0x2,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <wait>:
SYSCALL(wait)
 4bf:	b8 03 00 00 00       	mov    $0x3,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <pipe>:
SYSCALL(pipe)
 4c7:	b8 04 00 00 00       	mov    $0x4,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <read>:
SYSCALL(read)
 4cf:	b8 05 00 00 00       	mov    $0x5,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <write>:
SYSCALL(write)
 4d7:	b8 10 00 00 00       	mov    $0x10,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <close>:
SYSCALL(close)
 4df:	b8 15 00 00 00       	mov    $0x15,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <kill>:
SYSCALL(kill)
 4e7:	b8 06 00 00 00       	mov    $0x6,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <exec>:
SYSCALL(exec)
 4ef:	b8 07 00 00 00       	mov    $0x7,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <open>:
SYSCALL(open)
 4f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <mknod>:
SYSCALL(mknod)
 4ff:	b8 11 00 00 00       	mov    $0x11,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <unlink>:
SYSCALL(unlink)
 507:	b8 12 00 00 00       	mov    $0x12,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <fstat>:
SYSCALL(fstat)
 50f:	b8 08 00 00 00       	mov    $0x8,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <link>:
SYSCALL(link)
 517:	b8 13 00 00 00       	mov    $0x13,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <mkdir>:
SYSCALL(mkdir)
 51f:	b8 14 00 00 00       	mov    $0x14,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <chdir>:
SYSCALL(chdir)
 527:	b8 09 00 00 00       	mov    $0x9,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <dup>:
SYSCALL(dup)
 52f:	b8 0a 00 00 00       	mov    $0xa,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <getpid>:
SYSCALL(getpid)
 537:	b8 0b 00 00 00       	mov    $0xb,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <sbrk>:
SYSCALL(sbrk)
 53f:	b8 0c 00 00 00       	mov    $0xc,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <sleep>:
SYSCALL(sleep)
 547:	b8 0d 00 00 00       	mov    $0xd,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <uptime>:
SYSCALL(uptime)
 54f:	b8 0e 00 00 00       	mov    $0xe,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <clone>:
SYSCALL(clone)
 557:	b8 16 00 00 00       	mov    $0x16,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <join>:
 55f:	b8 17 00 00 00       	mov    $0x17,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	83 ec 1c             	sub    $0x1c,%esp
 56d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 570:	6a 01                	push   $0x1
 572:	8d 55 f4             	lea    -0xc(%ebp),%edx
 575:	52                   	push   %edx
 576:	50                   	push   %eax
 577:	e8 5b ff ff ff       	call   4d7 <write>
}
 57c:	83 c4 10             	add    $0x10,%esp
 57f:	c9                   	leave  
 580:	c3                   	ret    

00000581 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	57                   	push   %edi
 585:	56                   	push   %esi
 586:	53                   	push   %ebx
 587:	83 ec 2c             	sub    $0x2c,%esp
 58a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 58d:	89 d0                	mov    %edx,%eax
 58f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 591:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 595:	0f 95 c1             	setne  %cl
 598:	c1 ea 1f             	shr    $0x1f,%edx
 59b:	84 d1                	test   %dl,%cl
 59d:	74 44                	je     5e3 <printint+0x62>
    neg = 1;
    x = -xx;
 59f:	f7 d8                	neg    %eax
 5a1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5a3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5aa:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5af:	89 c8                	mov    %ecx,%eax
 5b1:	ba 00 00 00 00       	mov    $0x0,%edx
 5b6:	f7 f6                	div    %esi
 5b8:	89 df                	mov    %ebx,%edi
 5ba:	83 c3 01             	add    $0x1,%ebx
 5bd:	0f b6 92 b8 09 00 00 	movzbl 0x9b8(%edx),%edx
 5c4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5c8:	89 ca                	mov    %ecx,%edx
 5ca:	89 c1                	mov    %eax,%ecx
 5cc:	39 d6                	cmp    %edx,%esi
 5ce:	76 df                	jbe    5af <printint+0x2e>
  if(neg)
 5d0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5d4:	74 31                	je     607 <printint+0x86>
    buf[i++] = '-';
 5d6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5db:	8d 5f 02             	lea    0x2(%edi),%ebx
 5de:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e1:	eb 17                	jmp    5fa <printint+0x79>
    x = xx;
 5e3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5e5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5ec:	eb bc                	jmp    5aa <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5ee:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5f3:	89 f0                	mov    %esi,%eax
 5f5:	e8 6d ff ff ff       	call   567 <putc>
  while(--i >= 0)
 5fa:	83 eb 01             	sub    $0x1,%ebx
 5fd:	79 ef                	jns    5ee <printint+0x6d>
}
 5ff:	83 c4 2c             	add    $0x2c,%esp
 602:	5b                   	pop    %ebx
 603:	5e                   	pop    %esi
 604:	5f                   	pop    %edi
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    
 607:	8b 75 d0             	mov    -0x30(%ebp),%esi
 60a:	eb ee                	jmp    5fa <printint+0x79>

0000060c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	57                   	push   %edi
 610:	56                   	push   %esi
 611:	53                   	push   %ebx
 612:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 615:	8d 45 10             	lea    0x10(%ebp),%eax
 618:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 61b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 620:	bb 00 00 00 00       	mov    $0x0,%ebx
 625:	eb 14                	jmp    63b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 627:	89 fa                	mov    %edi,%edx
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	e8 36 ff ff ff       	call   567 <putc>
 631:	eb 05                	jmp    638 <printf+0x2c>
      }
    } else if(state == '%'){
 633:	83 fe 25             	cmp    $0x25,%esi
 636:	74 25                	je     65d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 638:	83 c3 01             	add    $0x1,%ebx
 63b:	8b 45 0c             	mov    0xc(%ebp),%eax
 63e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 642:	84 c0                	test   %al,%al
 644:	0f 84 20 01 00 00    	je     76a <printf+0x15e>
    c = fmt[i] & 0xff;
 64a:	0f be f8             	movsbl %al,%edi
 64d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 650:	85 f6                	test   %esi,%esi
 652:	75 df                	jne    633 <printf+0x27>
      if(c == '%'){
 654:	83 f8 25             	cmp    $0x25,%eax
 657:	75 ce                	jne    627 <printf+0x1b>
        state = '%';
 659:	89 c6                	mov    %eax,%esi
 65b:	eb db                	jmp    638 <printf+0x2c>
      if(c == 'd'){
 65d:	83 f8 25             	cmp    $0x25,%eax
 660:	0f 84 cf 00 00 00    	je     735 <printf+0x129>
 666:	0f 8c dd 00 00 00    	jl     749 <printf+0x13d>
 66c:	83 f8 78             	cmp    $0x78,%eax
 66f:	0f 8f d4 00 00 00    	jg     749 <printf+0x13d>
 675:	83 f8 63             	cmp    $0x63,%eax
 678:	0f 8c cb 00 00 00    	jl     749 <printf+0x13d>
 67e:	83 e8 63             	sub    $0x63,%eax
 681:	83 f8 15             	cmp    $0x15,%eax
 684:	0f 87 bf 00 00 00    	ja     749 <printf+0x13d>
 68a:	ff 24 85 60 09 00 00 	jmp    *0x960(,%eax,4)
        printint(fd, *ap, 10, 1);
 691:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 694:	8b 17                	mov    (%edi),%edx
 696:	83 ec 0c             	sub    $0xc,%esp
 699:	6a 01                	push   $0x1
 69b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	e8 d9 fe ff ff       	call   581 <printint>
        ap++;
 6a8:	83 c7 04             	add    $0x4,%edi
 6ab:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ae:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6b1:	be 00 00 00 00       	mov    $0x0,%esi
 6b6:	eb 80                	jmp    638 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6bb:	8b 17                	mov    (%edi),%edx
 6bd:	83 ec 0c             	sub    $0xc,%esp
 6c0:	6a 00                	push   $0x0
 6c2:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	e8 b2 fe ff ff       	call   581 <printint>
        ap++;
 6cf:	83 c7 04             	add    $0x4,%edi
 6d2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6d5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
 6dd:	e9 56 ff ff ff       	jmp    638 <printf+0x2c>
        s = (char*)*ap;
 6e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e5:	8b 30                	mov    (%eax),%esi
        ap++;
 6e7:	83 c0 04             	add    $0x4,%eax
 6ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6ed:	85 f6                	test   %esi,%esi
 6ef:	75 15                	jne    706 <printf+0xfa>
          s = "(null)";
 6f1:	be 58 09 00 00       	mov    $0x958,%esi
 6f6:	eb 0e                	jmp    706 <printf+0xfa>
          putc(fd, *s);
 6f8:	0f be d2             	movsbl %dl,%edx
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	e8 64 fe ff ff       	call   567 <putc>
          s++;
 703:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 706:	0f b6 16             	movzbl (%esi),%edx
 709:	84 d2                	test   %dl,%dl
 70b:	75 eb                	jne    6f8 <printf+0xec>
      state = 0;
 70d:	be 00 00 00 00       	mov    $0x0,%esi
 712:	e9 21 ff ff ff       	jmp    638 <printf+0x2c>
        putc(fd, *ap);
 717:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71a:	0f be 17             	movsbl (%edi),%edx
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	e8 42 fe ff ff       	call   567 <putc>
        ap++;
 725:	83 c7 04             	add    $0x4,%edi
 728:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 72b:	be 00 00 00 00       	mov    $0x0,%esi
 730:	e9 03 ff ff ff       	jmp    638 <printf+0x2c>
        putc(fd, c);
 735:	89 fa                	mov    %edi,%edx
 737:	8b 45 08             	mov    0x8(%ebp),%eax
 73a:	e8 28 fe ff ff       	call   567 <putc>
      state = 0;
 73f:	be 00 00 00 00       	mov    $0x0,%esi
 744:	e9 ef fe ff ff       	jmp    638 <printf+0x2c>
        putc(fd, '%');
 749:	ba 25 00 00 00       	mov    $0x25,%edx
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	e8 11 fe ff ff       	call   567 <putc>
        putc(fd, c);
 756:	89 fa                	mov    %edi,%edx
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	e8 07 fe ff ff       	call   567 <putc>
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	e9 ce fe ff ff       	jmp    638 <printf+0x2c>
    }
  }
}
 76a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76d:	5b                   	pop    %ebx
 76e:	5e                   	pop    %esi
 76f:	5f                   	pop    %edi
 770:	5d                   	pop    %ebp
 771:	c3                   	ret    

00000772 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 772:	55                   	push   %ebp
 773:	89 e5                	mov    %esp,%ebp
 775:	57                   	push   %edi
 776:	56                   	push   %esi
 777:	53                   	push   %ebx
 778:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 77b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77e:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 783:	eb 02                	jmp    787 <free+0x15>
 785:	89 d0                	mov    %edx,%eax
 787:	39 c8                	cmp    %ecx,%eax
 789:	73 04                	jae    78f <free+0x1d>
 78b:	39 08                	cmp    %ecx,(%eax)
 78d:	77 12                	ja     7a1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78f:	8b 10                	mov    (%eax),%edx
 791:	39 c2                	cmp    %eax,%edx
 793:	77 f0                	ja     785 <free+0x13>
 795:	39 c8                	cmp    %ecx,%eax
 797:	72 08                	jb     7a1 <free+0x2f>
 799:	39 ca                	cmp    %ecx,%edx
 79b:	77 04                	ja     7a1 <free+0x2f>
 79d:	89 d0                	mov    %edx,%eax
 79f:	eb e6                	jmp    787 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7a4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7a7:	8b 10                	mov    (%eax),%edx
 7a9:	39 d7                	cmp    %edx,%edi
 7ab:	74 19                	je     7c6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7b0:	8b 50 04             	mov    0x4(%eax),%edx
 7b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b6:	39 ce                	cmp    %ecx,%esi
 7b8:	74 1b                	je     7d5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ba:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7bc:	a3 2c 0d 00 00       	mov    %eax,0xd2c
}
 7c1:	5b                   	pop    %ebx
 7c2:	5e                   	pop    %esi
 7c3:	5f                   	pop    %edi
 7c4:	5d                   	pop    %ebp
 7c5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7c6:	03 72 04             	add    0x4(%edx),%esi
 7c9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7cc:	8b 10                	mov    (%eax),%edx
 7ce:	8b 12                	mov    (%edx),%edx
 7d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7d3:	eb db                	jmp    7b0 <free+0x3e>
    p->s.size += bp->s.size;
 7d5:	03 53 fc             	add    -0x4(%ebx),%edx
 7d8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7db:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7de:	89 10                	mov    %edx,(%eax)
 7e0:	eb da                	jmp    7bc <free+0x4a>

000007e2 <morecore>:

static Header*
morecore(uint nu)
{
 7e2:	55                   	push   %ebp
 7e3:	89 e5                	mov    %esp,%ebp
 7e5:	53                   	push   %ebx
 7e6:	83 ec 04             	sub    $0x4,%esp
 7e9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7eb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7f0:	77 05                	ja     7f7 <morecore+0x15>
    nu = 4096;
 7f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7f7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7fe:	83 ec 0c             	sub    $0xc,%esp
 801:	50                   	push   %eax
 802:	e8 38 fd ff ff       	call   53f <sbrk>
  if(p == (char*)-1)
 807:	83 c4 10             	add    $0x10,%esp
 80a:	83 f8 ff             	cmp    $0xffffffff,%eax
 80d:	74 1c                	je     82b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 80f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 812:	83 c0 08             	add    $0x8,%eax
 815:	83 ec 0c             	sub    $0xc,%esp
 818:	50                   	push   %eax
 819:	e8 54 ff ff ff       	call   772 <free>
  return freep;
 81e:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 823:	83 c4 10             	add    $0x10,%esp
}
 826:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 829:	c9                   	leave  
 82a:	c3                   	ret    
    return 0;
 82b:	b8 00 00 00 00       	mov    $0x0,%eax
 830:	eb f4                	jmp    826 <morecore+0x44>

00000832 <malloc>:

void*
malloc(uint nbytes)
{
 832:	55                   	push   %ebp
 833:	89 e5                	mov    %esp,%ebp
 835:	53                   	push   %ebx
 836:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
 83c:	8d 58 07             	lea    0x7(%eax),%ebx
 83f:	c1 eb 03             	shr    $0x3,%ebx
 842:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 845:	8b 0d 2c 0d 00 00    	mov    0xd2c,%ecx
 84b:	85 c9                	test   %ecx,%ecx
 84d:	74 04                	je     853 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84f:	8b 01                	mov    (%ecx),%eax
 851:	eb 4a                	jmp    89d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 853:	c7 05 2c 0d 00 00 30 	movl   $0xd30,0xd2c
 85a:	0d 00 00 
 85d:	c7 05 30 0d 00 00 30 	movl   $0xd30,0xd30
 864:	0d 00 00 
    base.s.size = 0;
 867:	c7 05 34 0d 00 00 00 	movl   $0x0,0xd34
 86e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 871:	b9 30 0d 00 00       	mov    $0xd30,%ecx
 876:	eb d7                	jmp    84f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 878:	74 19                	je     893 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 87a:	29 da                	sub    %ebx,%edx
 87c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 87f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 882:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 885:	89 0d 2c 0d 00 00    	mov    %ecx,0xd2c
      return (void*)(p + 1);
 88b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 88e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 891:	c9                   	leave  
 892:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 893:	8b 10                	mov    (%eax),%edx
 895:	89 11                	mov    %edx,(%ecx)
 897:	eb ec                	jmp    885 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 899:	89 c1                	mov    %eax,%ecx
 89b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 89d:	8b 50 04             	mov    0x4(%eax),%edx
 8a0:	39 da                	cmp    %ebx,%edx
 8a2:	73 d4                	jae    878 <malloc+0x46>
    if(p == freep)
 8a4:	39 05 2c 0d 00 00    	cmp    %eax,0xd2c
 8aa:	75 ed                	jne    899 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ac:	89 d8                	mov    %ebx,%eax
 8ae:	e8 2f ff ff ff       	call   7e2 <morecore>
 8b3:	85 c0                	test   %eax,%eax
 8b5:	75 e2                	jne    899 <malloc+0x67>
 8b7:	eb d5                	jmp    88e <malloc+0x5c>
