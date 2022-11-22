
_test_11:     file format elf32-i386


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
   assert(global == 1);
   6:	a1 08 0d 00 00       	mov    0xd08,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 7c 08 00 00       	push   $0x87c
  17:	68 86 08 00 00       	push   $0x886
  1c:	6a 01                	push   $0x1
  1e:	e8 ac 05 00 00       	call   5cf <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 8e 08 00 00       	push   $0x88e
  2b:	68 9a 08 00 00       	push   $0x89a
  30:	6a 01                	push   $0x1
  32:	e8 98 05 00 00       	call   5cf <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 ae 08 00 00       	push   $0x8ae
  3f:	6a 01                	push   $0x1
  41:	e8 89 05 00 00       	call   5cf <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 0c 0d 00 00    	push   0xd0c
  4f:	e8 56 04 00 00       	call   4aa <kill>
  54:	e8 21 04 00 00       	call   47a <exit>
   global += 4;
  59:	a1 08 0d 00 00       	mov    0xd08,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 08 0d 00 00       	mov    %eax,0xd08
   exit();
  66:	e8 0f 04 00 00       	call   47a <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 77 04 00 00       	call   4fa <getpid>
  83:	a3 0c 0d 00 00       	mov    %eax,0xd0c
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 08 0d 00 00 01 	movl   $0x1,0xd08
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 3b 03 00 00       	call   3ec <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 65 03 00 00       	call   424 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 08 0d 00 00       	mov    0xd08,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 27 04 00 00       	call   502 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 7c 08 00 00       	push   $0x87c
  f5:	68 86 08 00 00       	push   $0x886
  fa:	6a 01                	push   $0x1
  fc:	e8 ce 04 00 00       	call   5cf <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 bb 08 00 00       	push   $0x8bb
 109:	68 9a 08 00 00       	push   $0x89a
 10e:	6a 01                	push   $0x1
 110:	e8 ba 04 00 00       	call   5cf <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 ae 08 00 00       	push   $0x8ae
 11d:	6a 01                	push   $0x1
 11f:	e8 ab 04 00 00       	call   5cf <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 0c 0d 00 00    	push   0xd0c
 12d:	e8 78 03 00 00       	call   4aa <kill>
 132:	e8 43 03 00 00       	call   47a <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 7c 08 00 00       	push   $0x87c
 13e:	68 86 08 00 00       	push   $0x886
 143:	6a 01                	push   $0x1
 145:	e8 85 04 00 00       	call   5cf <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 ca 08 00 00       	push   $0x8ca
 152:	68 9a 08 00 00       	push   $0x89a
 157:	6a 01                	push   $0x1
 159:	e8 71 04 00 00       	call   5cf <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 ae 08 00 00       	push   $0x8ae
 166:	6a 01                	push   $0x1
 168:	e8 62 04 00 00       	call   5cf <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 0c 0d 00 00    	push   0xd0c
 176:	e8 2f 03 00 00       	call   4aa <kill>
 17b:	e8 fa 02 00 00       	call   47a <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 7c 08 00 00       	push   $0x87c
 187:	68 86 08 00 00       	push   $0x886
 18c:	6a 01                	push   $0x1
 18e:	e8 3c 04 00 00       	call   5cf <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 e1 08 00 00       	push   $0x8e1
 19b:	68 9a 08 00 00       	push   $0x89a
 1a0:	6a 01                	push   $0x1
 1a2:	e8 28 04 00 00       	call   5cf <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 ae 08 00 00       	push   $0x8ae
 1af:	6a 01                	push   $0x1
 1b1:	e8 19 04 00 00       	call   5cf <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 0c 0d 00 00    	push   0xd0c
 1bf:	e8 e6 02 00 00       	call   4aa <kill>
 1c4:	e8 b1 02 00 00       	call   47a <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 7c 08 00 00       	push   $0x87c
 1d0:	68 86 08 00 00       	push   $0x886
 1d5:	6a 01                	push   $0x1
 1d7:	e8 f3 03 00 00       	call   5cf <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 fc 08 00 00       	push   $0x8fc
 1e4:	68 9a 08 00 00       	push   $0x89a
 1e9:	6a 01                	push   $0x1
 1eb:	e8 df 03 00 00       	call   5cf <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 ae 08 00 00       	push   $0x8ae
 1f8:	6a 01                	push   $0x1
 1fa:	e8 d0 03 00 00       	call   5cf <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 0c 0d 00 00    	push   0xd0c
 208:	e8 9d 02 00 00       	call   4aa <kill>
 20d:	e8 68 02 00 00       	call   47a <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 ed 08 00 00       	push   $0x8ed
 21a:	6a 01                	push   $0x1
 21c:	e8 ae 03 00 00       	call   5cf <printf>
   exit();
 221:	e8 54 02 00 00       	call   47a <exit>

00000226 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	56                   	push   %esi
 22a:	53                   	push   %ebx
 22b:	8b 75 08             	mov    0x8(%ebp),%esi
 22e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 231:	89 f0                	mov    %esi,%eax
 233:	89 d1                	mov    %edx,%ecx
 235:	83 c2 01             	add    $0x1,%edx
 238:	89 c3                	mov    %eax,%ebx
 23a:	83 c0 01             	add    $0x1,%eax
 23d:	0f b6 09             	movzbl (%ecx),%ecx
 240:	88 0b                	mov    %cl,(%ebx)
 242:	84 c9                	test   %cl,%cl
 244:	75 ed                	jne    233 <strcpy+0xd>
    ;
  return os;
}
 246:	89 f0                	mov    %esi,%eax
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <strcmp>:

int strcmp(const char *p, const char *q)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 252:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 255:	eb 06                	jmp    25d <strcmp+0x11>
    p++, q++;
 257:	83 c1 01             	add    $0x1,%ecx
 25a:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 25d:	0f b6 01             	movzbl (%ecx),%eax
 260:	84 c0                	test   %al,%al
 262:	74 04                	je     268 <strcmp+0x1c>
 264:	3a 02                	cmp    (%edx),%al
 266:	74 ef                	je     257 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 268:	0f b6 c0             	movzbl %al,%eax
 26b:	0f b6 12             	movzbl (%edx),%edx
 26e:	29 d0                	sub    %edx,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strlen>:

uint strlen(const char *s)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 278:	b8 00 00 00 00       	mov    $0x0,%eax
 27d:	eb 03                	jmp    282 <strlen+0x10>
 27f:	83 c0 01             	add    $0x1,%eax
 282:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 286:	75 f7                	jne    27f <strlen+0xd>
    ;
  return n;
}
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <memset>:

void *
memset(void *dst, int c, uint n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	57                   	push   %edi
 28e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 291:	89 d7                	mov    %edx,%edi
 293:	8b 4d 10             	mov    0x10(%ebp),%ecx
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	fc                   	cld    
 29a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 29c:	89 d0                	mov    %edx,%eax
 29e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <strchr>:

char *
strchr(const char *s, char c)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 2ad:	eb 03                	jmp    2b2 <strchr+0xf>
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 10             	movzbl (%eax),%edx
 2b5:	84 d2                	test   %dl,%dl
 2b7:	74 06                	je     2bf <strchr+0x1c>
    if (*s == c)
 2b9:	38 ca                	cmp    %cl,%dl
 2bb:	75 f2                	jne    2af <strchr+0xc>
 2bd:	eb 05                	jmp    2c4 <strchr+0x21>
      return (char *)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <gets>:

char *
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	57                   	push   %edi
 2ca:	56                   	push   %esi
 2cb:	53                   	push   %ebx
 2cc:	83 ec 1c             	sub    $0x1c,%esp
 2cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 2d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7d 2e                	jge    30f <gets+0x49>
  {
    cc = read(0, &c, 1);
 2e1:	83 ec 04             	sub    $0x4,%esp
 2e4:	6a 01                	push   $0x1
 2e6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e9:	50                   	push   %eax
 2ea:	6a 00                	push   $0x0
 2ec:	e8 a1 01 00 00       	call   492 <read>
    if (cc < 1)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	7e 17                	jle    30f <gets+0x49>
      break;
    buf[i++] = c;
 2f8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	0f 94 c2             	sete   %dl
 304:	3c 0d                	cmp    $0xd,%al
 306:	0f 94 c0             	sete   %al
 309:	08 c2                	or     %al,%dl
 30b:	74 ca                	je     2d7 <gets+0x11>
    buf[i++] = c;
 30d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 313:	89 f8                	mov    %edi,%eax
 315:	8d 65 f4             	lea    -0xc(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5f                   	pop    %edi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    

0000031d <stat>:

int stat(const char *n, struct stat *st)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	56                   	push   %esi
 321:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 322:	83 ec 08             	sub    $0x8,%esp
 325:	6a 00                	push   $0x0
 327:	ff 75 08             	push   0x8(%ebp)
 32a:	e8 8b 01 00 00       	call   4ba <open>
  if (fd < 0)
 32f:	83 c4 10             	add    $0x10,%esp
 332:	85 c0                	test   %eax,%eax
 334:	78 24                	js     35a <stat+0x3d>
 336:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 338:	83 ec 08             	sub    $0x8,%esp
 33b:	ff 75 0c             	push   0xc(%ebp)
 33e:	50                   	push   %eax
 33f:	e8 8e 01 00 00       	call   4d2 <fstat>
 344:	89 c6                	mov    %eax,%esi
  close(fd);
 346:	89 1c 24             	mov    %ebx,(%esp)
 349:	e8 54 01 00 00       	call   4a2 <close>
  return r;
 34e:	83 c4 10             	add    $0x10,%esp
}
 351:	89 f0                	mov    %esi,%eax
 353:	8d 65 f8             	lea    -0x8(%ebp),%esp
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
    return -1;
 35a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35f:	eb f0                	jmp    351 <stat+0x34>

00000361 <atoi>:

int atoi(const char *s)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	53                   	push   %ebx
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 368:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 36d:	eb 10                	jmp    37f <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 36f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 372:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 375:	83 c1 01             	add    $0x1,%ecx
 378:	0f be c0             	movsbl %al,%eax
 37b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 37f:	0f b6 01             	movzbl (%ecx),%eax
 382:	8d 58 d0             	lea    -0x30(%eax),%ebx
 385:	80 fb 09             	cmp    $0x9,%bl
 388:	76 e5                	jbe    36f <atoi+0xe>
  return n;
}
 38a:	89 d0                	mov    %edx,%eax
 38c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38f:	c9                   	leave  
 390:	c3                   	ret    

00000391 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	8b 75 08             	mov    0x8(%ebp),%esi
 399:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 39c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 39f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 3a1:	eb 0d                	jmp    3b0 <memmove+0x1f>
    *dst++ = *src++;
 3a3:	0f b6 01             	movzbl (%ecx),%eax
 3a6:	88 02                	mov    %al,(%edx)
 3a8:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ab:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 3ae:	89 d8                	mov    %ebx,%eax
 3b0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b3:	85 c0                	test   %eax,%eax
 3b5:	7f ec                	jg     3a3 <memmove+0x12>
  return vdst;
}
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    

000003bd <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 3bd:	55                   	push   %ebp
 3be:	89 e5                	mov    %esp,%ebp
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 3c3:	83 38 01             	cmpl   $0x1,(%eax)
 3c6:	74 fb                	je     3c3 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 3c8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 3ce:	5d                   	pop    %ebp
 3cf:	c3                   	ret    

000003d0 <lock_release>:
void lock_release(lock_t *lock)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3dc:	5d                   	pop    %ebp
 3dd:	c3                   	ret    

000003de <lock_init>:
void lock_init(lock_t *lock)
{
 3de:	55                   	push   %ebp
 3df:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    

000003ec <thread_create>:
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	53                   	push   %ebx
 3f0:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 3f3:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 3f6:	53                   	push   %ebx
 3f7:	e8 e2 ff ff ff       	call   3de <lock_init>
  lock_acquire(&lock);
 3fc:	89 1c 24             	mov    %ebx,(%esp)
 3ff:	e8 b9 ff ff ff       	call   3bd <lock_acquire>
  void *stack = malloc(4096 * 2);
 404:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 40b:	e8 e5 03 00 00       	call   7f5 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 410:	50                   	push   %eax
 411:	ff 75 10             	push   0x10(%ebp)
 414:	ff 75 0c             	push   0xc(%ebp)
 417:	ff 75 08             	push   0x8(%ebp)
 41a:	e8 fb 00 00 00       	call   51a <clone>
}
 41f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 422:	c9                   	leave  
 423:	c3                   	ret    

00000424 <thread_join>:
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	56                   	push   %esi
 428:	53                   	push   %ebx
 429:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 42c:	6a 04                	push   $0x4
 42e:	e8 c2 03 00 00       	call   7f5 <malloc>
 433:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 436:	8d 45 f4             	lea    -0xc(%ebp),%eax
 439:	89 04 24             	mov    %eax,(%esp)
 43c:	e8 e1 00 00 00       	call   522 <join>
 441:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 443:	8d 75 f0             	lea    -0x10(%ebp),%esi
 446:	89 34 24             	mov    %esi,(%esp)
 449:	e8 90 ff ff ff       	call   3de <lock_init>
  lock_acquire(&lock);
 44e:	89 34 24             	mov    %esi,(%esp)
 451:	e8 67 ff ff ff       	call   3bd <lock_acquire>
  free(stack);
 456:	83 c4 04             	add    $0x4,%esp
 459:	ff 75 f4             	push   -0xc(%ebp)
 45c:	e8 d4 02 00 00       	call   735 <free>
  lock_release(&lock);
 461:	89 34 24             	mov    %esi,(%esp)
 464:	e8 67 ff ff ff       	call   3d0 <lock_release>
}
 469:	89 d8                	mov    %ebx,%eax
 46b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 46e:	5b                   	pop    %ebx
 46f:	5e                   	pop    %esi
 470:	5d                   	pop    %ebp
 471:	c3                   	ret    

00000472 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 472:	b8 01 00 00 00       	mov    $0x1,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <exit>:
SYSCALL(exit)
 47a:	b8 02 00 00 00       	mov    $0x2,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <wait>:
SYSCALL(wait)
 482:	b8 03 00 00 00       	mov    $0x3,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <pipe>:
SYSCALL(pipe)
 48a:	b8 04 00 00 00       	mov    $0x4,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <read>:
SYSCALL(read)
 492:	b8 05 00 00 00       	mov    $0x5,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <write>:
SYSCALL(write)
 49a:	b8 10 00 00 00       	mov    $0x10,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <close>:
SYSCALL(close)
 4a2:	b8 15 00 00 00       	mov    $0x15,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <kill>:
SYSCALL(kill)
 4aa:	b8 06 00 00 00       	mov    $0x6,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <exec>:
SYSCALL(exec)
 4b2:	b8 07 00 00 00       	mov    $0x7,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <open>:
SYSCALL(open)
 4ba:	b8 0f 00 00 00       	mov    $0xf,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <mknod>:
SYSCALL(mknod)
 4c2:	b8 11 00 00 00       	mov    $0x11,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <unlink>:
SYSCALL(unlink)
 4ca:	b8 12 00 00 00       	mov    $0x12,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <fstat>:
SYSCALL(fstat)
 4d2:	b8 08 00 00 00       	mov    $0x8,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <link>:
SYSCALL(link)
 4da:	b8 13 00 00 00       	mov    $0x13,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <mkdir>:
SYSCALL(mkdir)
 4e2:	b8 14 00 00 00       	mov    $0x14,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <chdir>:
SYSCALL(chdir)
 4ea:	b8 09 00 00 00       	mov    $0x9,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <dup>:
SYSCALL(dup)
 4f2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <getpid>:
SYSCALL(getpid)
 4fa:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <sbrk>:
SYSCALL(sbrk)
 502:	b8 0c 00 00 00       	mov    $0xc,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <sleep>:
SYSCALL(sleep)
 50a:	b8 0d 00 00 00       	mov    $0xd,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <uptime>:
SYSCALL(uptime)
 512:	b8 0e 00 00 00       	mov    $0xe,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <clone>:
SYSCALL(clone)
 51a:	b8 16 00 00 00       	mov    $0x16,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <join>:
 522:	b8 17 00 00 00       	mov    $0x17,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	83 ec 1c             	sub    $0x1c,%esp
 530:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 533:	6a 01                	push   $0x1
 535:	8d 55 f4             	lea    -0xc(%ebp),%edx
 538:	52                   	push   %edx
 539:	50                   	push   %eax
 53a:	e8 5b ff ff ff       	call   49a <write>
}
 53f:	83 c4 10             	add    $0x10,%esp
 542:	c9                   	leave  
 543:	c3                   	ret    

00000544 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	57                   	push   %edi
 548:	56                   	push   %esi
 549:	53                   	push   %ebx
 54a:	83 ec 2c             	sub    $0x2c,%esp
 54d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 550:	89 d0                	mov    %edx,%eax
 552:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 554:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 558:	0f 95 c1             	setne  %cl
 55b:	c1 ea 1f             	shr    $0x1f,%edx
 55e:	84 d1                	test   %dl,%cl
 560:	74 44                	je     5a6 <printint+0x62>
    neg = 1;
    x = -xx;
 562:	f7 d8                	neg    %eax
 564:	89 c1                	mov    %eax,%ecx
    neg = 1;
 566:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 56d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 572:	89 c8                	mov    %ecx,%eax
 574:	ba 00 00 00 00       	mov    $0x0,%edx
 579:	f7 f6                	div    %esi
 57b:	89 df                	mov    %ebx,%edi
 57d:	83 c3 01             	add    $0x1,%ebx
 580:	0f b6 92 98 09 00 00 	movzbl 0x998(%edx),%edx
 587:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 58b:	89 ca                	mov    %ecx,%edx
 58d:	89 c1                	mov    %eax,%ecx
 58f:	39 d6                	cmp    %edx,%esi
 591:	76 df                	jbe    572 <printint+0x2e>
  if(neg)
 593:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 597:	74 31                	je     5ca <printint+0x86>
    buf[i++] = '-';
 599:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 59e:	8d 5f 02             	lea    0x2(%edi),%ebx
 5a1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5a4:	eb 17                	jmp    5bd <printint+0x79>
    x = xx;
 5a6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5a8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5af:	eb bc                	jmp    56d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5b1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5b6:	89 f0                	mov    %esi,%eax
 5b8:	e8 6d ff ff ff       	call   52a <putc>
  while(--i >= 0)
 5bd:	83 eb 01             	sub    $0x1,%ebx
 5c0:	79 ef                	jns    5b1 <printint+0x6d>
}
 5c2:	83 c4 2c             	add    $0x2c,%esp
 5c5:	5b                   	pop    %ebx
 5c6:	5e                   	pop    %esi
 5c7:	5f                   	pop    %edi
 5c8:	5d                   	pop    %ebp
 5c9:	c3                   	ret    
 5ca:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5cd:	eb ee                	jmp    5bd <printint+0x79>

000005cf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5cf:	55                   	push   %ebp
 5d0:	89 e5                	mov    %esp,%ebp
 5d2:	57                   	push   %edi
 5d3:	56                   	push   %esi
 5d4:	53                   	push   %ebx
 5d5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5d8:	8d 45 10             	lea    0x10(%ebp),%eax
 5db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5de:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5e3:	bb 00 00 00 00       	mov    $0x0,%ebx
 5e8:	eb 14                	jmp    5fe <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5ea:	89 fa                	mov    %edi,%edx
 5ec:	8b 45 08             	mov    0x8(%ebp),%eax
 5ef:	e8 36 ff ff ff       	call   52a <putc>
 5f4:	eb 05                	jmp    5fb <printf+0x2c>
      }
    } else if(state == '%'){
 5f6:	83 fe 25             	cmp    $0x25,%esi
 5f9:	74 25                	je     620 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5fb:	83 c3 01             	add    $0x1,%ebx
 5fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 601:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 605:	84 c0                	test   %al,%al
 607:	0f 84 20 01 00 00    	je     72d <printf+0x15e>
    c = fmt[i] & 0xff;
 60d:	0f be f8             	movsbl %al,%edi
 610:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 613:	85 f6                	test   %esi,%esi
 615:	75 df                	jne    5f6 <printf+0x27>
      if(c == '%'){
 617:	83 f8 25             	cmp    $0x25,%eax
 61a:	75 ce                	jne    5ea <printf+0x1b>
        state = '%';
 61c:	89 c6                	mov    %eax,%esi
 61e:	eb db                	jmp    5fb <printf+0x2c>
      if(c == 'd'){
 620:	83 f8 25             	cmp    $0x25,%eax
 623:	0f 84 cf 00 00 00    	je     6f8 <printf+0x129>
 629:	0f 8c dd 00 00 00    	jl     70c <printf+0x13d>
 62f:	83 f8 78             	cmp    $0x78,%eax
 632:	0f 8f d4 00 00 00    	jg     70c <printf+0x13d>
 638:	83 f8 63             	cmp    $0x63,%eax
 63b:	0f 8c cb 00 00 00    	jl     70c <printf+0x13d>
 641:	83 e8 63             	sub    $0x63,%eax
 644:	83 f8 15             	cmp    $0x15,%eax
 647:	0f 87 bf 00 00 00    	ja     70c <printf+0x13d>
 64d:	ff 24 85 40 09 00 00 	jmp    *0x940(,%eax,4)
        printint(fd, *ap, 10, 1);
 654:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 657:	8b 17                	mov    (%edi),%edx
 659:	83 ec 0c             	sub    $0xc,%esp
 65c:	6a 01                	push   $0x1
 65e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 663:	8b 45 08             	mov    0x8(%ebp),%eax
 666:	e8 d9 fe ff ff       	call   544 <printint>
        ap++;
 66b:	83 c7 04             	add    $0x4,%edi
 66e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 671:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 674:	be 00 00 00 00       	mov    $0x0,%esi
 679:	eb 80                	jmp    5fb <printf+0x2c>
        printint(fd, *ap, 16, 0);
 67b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 67e:	8b 17                	mov    (%edi),%edx
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	6a 00                	push   $0x0
 685:	b9 10 00 00 00       	mov    $0x10,%ecx
 68a:	8b 45 08             	mov    0x8(%ebp),%eax
 68d:	e8 b2 fe ff ff       	call   544 <printint>
        ap++;
 692:	83 c7 04             	add    $0x4,%edi
 695:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 698:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69b:	be 00 00 00 00       	mov    $0x0,%esi
 6a0:	e9 56 ff ff ff       	jmp    5fb <printf+0x2c>
        s = (char*)*ap;
 6a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a8:	8b 30                	mov    (%eax),%esi
        ap++;
 6aa:	83 c0 04             	add    $0x4,%eax
 6ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6b0:	85 f6                	test   %esi,%esi
 6b2:	75 15                	jne    6c9 <printf+0xfa>
          s = "(null)";
 6b4:	be 38 09 00 00       	mov    $0x938,%esi
 6b9:	eb 0e                	jmp    6c9 <printf+0xfa>
          putc(fd, *s);
 6bb:	0f be d2             	movsbl %dl,%edx
 6be:	8b 45 08             	mov    0x8(%ebp),%eax
 6c1:	e8 64 fe ff ff       	call   52a <putc>
          s++;
 6c6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6c9:	0f b6 16             	movzbl (%esi),%edx
 6cc:	84 d2                	test   %dl,%dl
 6ce:	75 eb                	jne    6bb <printf+0xec>
      state = 0;
 6d0:	be 00 00 00 00       	mov    $0x0,%esi
 6d5:	e9 21 ff ff ff       	jmp    5fb <printf+0x2c>
        putc(fd, *ap);
 6da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6dd:	0f be 17             	movsbl (%edi),%edx
 6e0:	8b 45 08             	mov    0x8(%ebp),%eax
 6e3:	e8 42 fe ff ff       	call   52a <putc>
        ap++;
 6e8:	83 c7 04             	add    $0x4,%edi
 6eb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6ee:	be 00 00 00 00       	mov    $0x0,%esi
 6f3:	e9 03 ff ff ff       	jmp    5fb <printf+0x2c>
        putc(fd, c);
 6f8:	89 fa                	mov    %edi,%edx
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	e8 28 fe ff ff       	call   52a <putc>
      state = 0;
 702:	be 00 00 00 00       	mov    $0x0,%esi
 707:	e9 ef fe ff ff       	jmp    5fb <printf+0x2c>
        putc(fd, '%');
 70c:	ba 25 00 00 00       	mov    $0x25,%edx
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	e8 11 fe ff ff       	call   52a <putc>
        putc(fd, c);
 719:	89 fa                	mov    %edi,%edx
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	e8 07 fe ff ff       	call   52a <putc>
      state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
 728:	e9 ce fe ff ff       	jmp    5fb <printf+0x2c>
    }
  }
}
 72d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 730:	5b                   	pop    %ebx
 731:	5e                   	pop    %esi
 732:	5f                   	pop    %edi
 733:	5d                   	pop    %ebp
 734:	c3                   	ret    

00000735 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 735:	55                   	push   %ebp
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 10 0d 00 00       	mov    0xd10,%eax
 746:	eb 02                	jmp    74a <free+0x15>
 748:	89 d0                	mov    %edx,%eax
 74a:	39 c8                	cmp    %ecx,%eax
 74c:	73 04                	jae    752 <free+0x1d>
 74e:	39 08                	cmp    %ecx,(%eax)
 750:	77 12                	ja     764 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	8b 10                	mov    (%eax),%edx
 754:	39 c2                	cmp    %eax,%edx
 756:	77 f0                	ja     748 <free+0x13>
 758:	39 c8                	cmp    %ecx,%eax
 75a:	72 08                	jb     764 <free+0x2f>
 75c:	39 ca                	cmp    %ecx,%edx
 75e:	77 04                	ja     764 <free+0x2f>
 760:	89 d0                	mov    %edx,%eax
 762:	eb e6                	jmp    74a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 764:	8b 73 fc             	mov    -0x4(%ebx),%esi
 767:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76a:	8b 10                	mov    (%eax),%edx
 76c:	39 d7                	cmp    %edx,%edi
 76e:	74 19                	je     789 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 770:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 773:	8b 50 04             	mov    0x4(%eax),%edx
 776:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 779:	39 ce                	cmp    %ecx,%esi
 77b:	74 1b                	je     798 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 77d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 77f:	a3 10 0d 00 00       	mov    %eax,0xd10
}
 784:	5b                   	pop    %ebx
 785:	5e                   	pop    %esi
 786:	5f                   	pop    %edi
 787:	5d                   	pop    %ebp
 788:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 789:	03 72 04             	add    0x4(%edx),%esi
 78c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 78f:	8b 10                	mov    (%eax),%edx
 791:	8b 12                	mov    (%edx),%edx
 793:	89 53 f8             	mov    %edx,-0x8(%ebx)
 796:	eb db                	jmp    773 <free+0x3e>
    p->s.size += bp->s.size;
 798:	03 53 fc             	add    -0x4(%ebx),%edx
 79b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 79e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7a1:	89 10                	mov    %edx,(%eax)
 7a3:	eb da                	jmp    77f <free+0x4a>

000007a5 <morecore>:

static Header*
morecore(uint nu)
{
 7a5:	55                   	push   %ebp
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	53                   	push   %ebx
 7a9:	83 ec 04             	sub    $0x4,%esp
 7ac:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7ae:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7b3:	77 05                	ja     7ba <morecore+0x15>
    nu = 4096;
 7b5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7ba:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7c1:	83 ec 0c             	sub    $0xc,%esp
 7c4:	50                   	push   %eax
 7c5:	e8 38 fd ff ff       	call   502 <sbrk>
  if(p == (char*)-1)
 7ca:	83 c4 10             	add    $0x10,%esp
 7cd:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d0:	74 1c                	je     7ee <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7d2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7d5:	83 c0 08             	add    $0x8,%eax
 7d8:	83 ec 0c             	sub    $0xc,%esp
 7db:	50                   	push   %eax
 7dc:	e8 54 ff ff ff       	call   735 <free>
  return freep;
 7e1:	a1 10 0d 00 00       	mov    0xd10,%eax
 7e6:	83 c4 10             	add    $0x10,%esp
}
 7e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ec:	c9                   	leave  
 7ed:	c3                   	ret    
    return 0;
 7ee:	b8 00 00 00 00       	mov    $0x0,%eax
 7f3:	eb f4                	jmp    7e9 <morecore+0x44>

000007f5 <malloc>:

void*
malloc(uint nbytes)
{
 7f5:	55                   	push   %ebp
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	53                   	push   %ebx
 7f9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7fc:	8b 45 08             	mov    0x8(%ebp),%eax
 7ff:	8d 58 07             	lea    0x7(%eax),%ebx
 802:	c1 eb 03             	shr    $0x3,%ebx
 805:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 808:	8b 0d 10 0d 00 00    	mov    0xd10,%ecx
 80e:	85 c9                	test   %ecx,%ecx
 810:	74 04                	je     816 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 812:	8b 01                	mov    (%ecx),%eax
 814:	eb 4a                	jmp    860 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 816:	c7 05 10 0d 00 00 14 	movl   $0xd14,0xd10
 81d:	0d 00 00 
 820:	c7 05 14 0d 00 00 14 	movl   $0xd14,0xd14
 827:	0d 00 00 
    base.s.size = 0;
 82a:	c7 05 18 0d 00 00 00 	movl   $0x0,0xd18
 831:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 834:	b9 14 0d 00 00       	mov    $0xd14,%ecx
 839:	eb d7                	jmp    812 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 83b:	74 19                	je     856 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 83d:	29 da                	sub    %ebx,%edx
 83f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 842:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 845:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 848:	89 0d 10 0d 00 00    	mov    %ecx,0xd10
      return (void*)(p + 1);
 84e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 851:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 854:	c9                   	leave  
 855:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 856:	8b 10                	mov    (%eax),%edx
 858:	89 11                	mov    %edx,(%ecx)
 85a:	eb ec                	jmp    848 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85c:	89 c1                	mov    %eax,%ecx
 85e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 860:	8b 50 04             	mov    0x4(%eax),%edx
 863:	39 da                	cmp    %ebx,%edx
 865:	73 d4                	jae    83b <malloc+0x46>
    if(p == freep)
 867:	39 05 10 0d 00 00    	cmp    %eax,0xd10
 86d:	75 ed                	jne    85c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 86f:	89 d8                	mov    %ebx,%eax
 871:	e8 2f ff ff ff       	call   7a5 <morecore>
 876:	85 c0                	test   %eax,%eax
 878:	75 e2                	jne    85c <malloc+0x67>
 87a:	eb d5                	jmp    851 <malloc+0x5c>
