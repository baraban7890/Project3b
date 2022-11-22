
_test_9:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   6:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   9:	8b 45 08             	mov    0x8(%ebp),%eax
   c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  12:	39 d1                	cmp    %edx,%ecx
  14:	75 67                	jne    7d <worker+0x7d>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  16:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  1c:	8d 4d 08             	lea    0x8(%ebp),%ecx
  1f:	39 d1                	cmp    %edx,%ecx
  21:	0f 85 9f 00 00 00    	jne    c6 <worker+0xc6>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  27:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  2e:	0f 84 db 00 00 00    	je     10f <worker+0x10f>
  34:	6a 32                	push   $0x32
  36:	68 f4 08 00 00       	push   $0x8f4
  3b:	68 fd 08 00 00       	push   $0x8fd
  40:	6a 01                	push   $0x1
  42:	e8 fd 05 00 00       	call   644 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 bc 09 00 00       	push   $0x9bc
  4f:	68 05 09 00 00       	push   $0x905
  54:	6a 01                	push   $0x1
  56:	e8 e9 05 00 00       	call   644 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 19 09 00 00       	push   $0x919
  63:	6a 01                	push   $0x1
  65:	e8 da 05 00 00       	call   644 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 c0 0d 00 00    	push   0xdc0
  73:	e8 a7 04 00 00       	call   51f <kill>
  78:	e8 72 04 00 00       	call   4ef <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 f4 08 00 00       	push   $0x8f4
  84:	68 fd 08 00 00       	push   $0x8fd
  89:	6a 01                	push   $0x1
  8b:	e8 b4 05 00 00       	call   644 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 64 09 00 00       	push   $0x964
  98:	68 05 09 00 00       	push   $0x905
  9d:	6a 01                	push   $0x1
  9f:	e8 a0 05 00 00       	call   644 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 19 09 00 00       	push   $0x919
  ac:	6a 01                	push   $0x1
  ae:	e8 91 05 00 00       	call   644 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 c0 0d 00 00    	push   0xdc0
  bc:	e8 5e 04 00 00       	call   51f <kill>
  c1:	e8 29 04 00 00       	call   4ef <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 f4 08 00 00       	push   $0x8f4
  cd:	68 fd 08 00 00       	push   $0x8fd
  d2:	6a 01                	push   $0x1
  d4:	e8 6b 05 00 00       	call   644 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 90 09 00 00       	push   $0x990
  e1:	68 05 09 00 00       	push   $0x905
  e6:	6a 01                	push   $0x1
  e8:	e8 57 05 00 00       	call   644 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 19 09 00 00       	push   $0x919
  f5:	6a 01                	push   $0x1
  f7:	e8 48 05 00 00       	call   644 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 c0 0d 00 00    	push   0xdc0
 105:	e8 15 04 00 00       	call   51f <kill>
 10a:	e8 e0 03 00 00       	call   4ef <exit>
   global = 5;
 10f:	c7 05 bc 0d 00 00 05 	movl   $0x5,0xdbc
 116:	00 00 00 
   exit();
 119:	e8 d1 03 00 00       	call   4ef <exit>

0000011e <main>:
{
 11e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 122:	83 e4 f0             	and    $0xfffffff0,%esp
 125:	ff 71 fc             	push   -0x4(%ecx)
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	56                   	push   %esi
 12c:	53                   	push   %ebx
 12d:	51                   	push   %ecx
 12e:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 131:	e8 39 04 00 00       	call   56f <getpid>
 136:	a3 c0 0d 00 00       	mov    %eax,0xdc0
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 22 07 00 00       	call   86a <malloc>
   assert(p != NULL);
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 84 a8 00 00 00    	je     1fb <main+0xdd>
 153:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 155:	89 c2                	mov    %eax,%edx
 157:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 15d:	74 09                	je     168 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 15f:	b8 00 10 00 00       	mov    $0x1000,%eax
 164:	29 d0                	sub    %edx,%eax
 166:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	50                   	push   %eax
 16c:	68 00 00 00 00       	push   $0x0
 171:	e8 19 04 00 00       	call   58f <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 bc 0d 00 00       	mov    0xdbc,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 3e 09 00 00       	push   $0x93e
 195:	6a 01                	push   $0x1
 197:	e8 a8 04 00 00       	call   644 <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 f0 03 00 00       	call   597 <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 f4 08 00 00       	push   $0x8f4
 1b9:	68 fd 08 00 00       	push   $0x8fd
 1be:	6a 01                	push   $0x1
 1c0:	e8 7f 04 00 00       	call   644 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 4b 09 00 00       	push   $0x94b
 1cd:	68 05 09 00 00       	push   $0x905
 1d2:	6a 01                	push   $0x1
 1d4:	e8 6b 04 00 00       	call   644 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 19 09 00 00       	push   $0x919
 1e1:	6a 01                	push   $0x1
 1e3:	e8 5c 04 00 00       	call   644 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 c0 0d 00 00    	push   0xdc0
 1f1:	e8 29 03 00 00       	call   51f <kill>
 1f6:	e8 f4 02 00 00       	call   4ef <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 f4 08 00 00       	push   $0x8f4
 202:	68 fd 08 00 00       	push   $0x8fd
 207:	6a 01                	push   $0x1
 209:	e8 36 04 00 00       	call   644 <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 26 09 00 00       	push   $0x926
 216:	68 05 09 00 00       	push   $0x905
 21b:	6a 01                	push   $0x1
 21d:	e8 22 04 00 00       	call   644 <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 19 09 00 00       	push   $0x919
 22a:	6a 01                	push   $0x1
 22c:	e8 13 04 00 00       	call   644 <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 c0 0d 00 00    	push   0xdc0
 23a:	e8 e0 02 00 00       	call   51f <kill>
 23f:	e8 ab 02 00 00       	call   4ef <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 f4 08 00 00       	push   $0x8f4
 24b:	68 fd 08 00 00       	push   $0x8fd
 250:	6a 01                	push   $0x1
 252:	e8 ed 03 00 00       	call   644 <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 30 09 00 00       	push   $0x930
 25f:	68 05 09 00 00       	push   $0x905
 264:	6a 01                	push   $0x1
 266:	e8 d9 03 00 00       	call   644 <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 19 09 00 00       	push   $0x919
 273:	6a 01                	push   $0x1
 275:	e8 ca 03 00 00       	call   644 <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 c0 0d 00 00    	push   0xdc0
 283:	e8 97 02 00 00       	call   51f <kill>
 288:	e8 62 02 00 00       	call   4ef <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 14 05 00 00       	call   7aa <free>
   exit();
 296:	e8 54 02 00 00       	call   4ef <exit>

0000029b <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	56                   	push   %esi
 29f:	53                   	push   %ebx
 2a0:	8b 75 08             	mov    0x8(%ebp),%esi
 2a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2a6:	89 f0                	mov    %esi,%eax
 2a8:	89 d1                	mov    %edx,%ecx
 2aa:	83 c2 01             	add    $0x1,%edx
 2ad:	89 c3                	mov    %eax,%ebx
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 09             	movzbl (%ecx),%ecx
 2b5:	88 0b                	mov    %cl,(%ebx)
 2b7:	84 c9                	test   %cl,%cl
 2b9:	75 ed                	jne    2a8 <strcpy+0xd>
    ;
  return os;
}
 2bb:	89 f0                	mov    %esi,%eax
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    

000002c1 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 2ca:	eb 06                	jmp    2d2 <strcmp+0x11>
    p++, q++;
 2cc:	83 c1 01             	add    $0x1,%ecx
 2cf:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 2d2:	0f b6 01             	movzbl (%ecx),%eax
 2d5:	84 c0                	test   %al,%al
 2d7:	74 04                	je     2dd <strcmp+0x1c>
 2d9:	3a 02                	cmp    (%edx),%al
 2db:	74 ef                	je     2cc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2dd:	0f b6 c0             	movzbl %al,%eax
 2e0:	0f b6 12             	movzbl (%edx),%edx
 2e3:	29 d0                	sub    %edx,%eax
}
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    

000002e7 <strlen>:

uint strlen(const char *s)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 2ed:	b8 00 00 00 00       	mov    $0x0,%eax
 2f2:	eb 03                	jmp    2f7 <strlen+0x10>
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2fb:	75 f7                	jne    2f4 <strlen+0xd>
    ;
  return n;
}
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    

000002ff <memset>:

void *
memset(void *dst, int c, uint n)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	57                   	push   %edi
 303:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 306:	89 d7                	mov    %edx,%edi
 308:	8b 4d 10             	mov    0x10(%ebp),%ecx
 30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 30e:	fc                   	cld    
 30f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 311:	89 d0                	mov    %edx,%eax
 313:	8b 7d fc             	mov    -0x4(%ebp),%edi
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <strchr>:

char *
strchr(const char *s, char c)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 322:	eb 03                	jmp    327 <strchr+0xf>
 324:	83 c0 01             	add    $0x1,%eax
 327:	0f b6 10             	movzbl (%eax),%edx
 32a:	84 d2                	test   %dl,%dl
 32c:	74 06                	je     334 <strchr+0x1c>
    if (*s == c)
 32e:	38 ca                	cmp    %cl,%dl
 330:	75 f2                	jne    324 <strchr+0xc>
 332:	eb 05                	jmp    339 <strchr+0x21>
      return (char *)s;
  return 0;
 334:	b8 00 00 00 00       	mov    $0x0,%eax
}
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <gets>:

char *
gets(char *buf, int max)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	57                   	push   %edi
 33f:	56                   	push   %esi
 340:	53                   	push   %ebx
 341:	83 ec 1c             	sub    $0x1c,%esp
 344:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 347:	bb 00 00 00 00       	mov    $0x0,%ebx
 34c:	89 de                	mov    %ebx,%esi
 34e:	83 c3 01             	add    $0x1,%ebx
 351:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 354:	7d 2e                	jge    384 <gets+0x49>
  {
    cc = read(0, &c, 1);
 356:	83 ec 04             	sub    $0x4,%esp
 359:	6a 01                	push   $0x1
 35b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 35e:	50                   	push   %eax
 35f:	6a 00                	push   $0x0
 361:	e8 a1 01 00 00       	call   507 <read>
    if (cc < 1)
 366:	83 c4 10             	add    $0x10,%esp
 369:	85 c0                	test   %eax,%eax
 36b:	7e 17                	jle    384 <gets+0x49>
      break;
    buf[i++] = c;
 36d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 371:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 374:	3c 0a                	cmp    $0xa,%al
 376:	0f 94 c2             	sete   %dl
 379:	3c 0d                	cmp    $0xd,%al
 37b:	0f 94 c0             	sete   %al
 37e:	08 c2                	or     %al,%dl
 380:	74 ca                	je     34c <gets+0x11>
    buf[i++] = c;
 382:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 384:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 388:	89 f8                	mov    %edi,%eax
 38a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <stat>:

int stat(const char *n, struct stat *st)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	56                   	push   %esi
 396:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 397:	83 ec 08             	sub    $0x8,%esp
 39a:	6a 00                	push   $0x0
 39c:	ff 75 08             	push   0x8(%ebp)
 39f:	e8 8b 01 00 00       	call   52f <open>
  if (fd < 0)
 3a4:	83 c4 10             	add    $0x10,%esp
 3a7:	85 c0                	test   %eax,%eax
 3a9:	78 24                	js     3cf <stat+0x3d>
 3ab:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	ff 75 0c             	push   0xc(%ebp)
 3b3:	50                   	push   %eax
 3b4:	e8 8e 01 00 00       	call   547 <fstat>
 3b9:	89 c6                	mov    %eax,%esi
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
 3be:	e8 54 01 00 00       	call   517 <close>
  return r;
 3c3:	83 c4 10             	add    $0x10,%esp
}
 3c6:	89 f0                	mov    %esi,%eax
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	5b                   	pop    %ebx
 3cc:	5e                   	pop    %esi
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    
    return -1;
 3cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d4:	eb f0                	jmp    3c6 <stat+0x34>

000003d6 <atoi>:

int atoi(const char *s)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	53                   	push   %ebx
 3da:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3dd:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 3e2:	eb 10                	jmp    3f4 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 3e4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3e7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ea:	83 c1 01             	add    $0x1,%ecx
 3ed:	0f be c0             	movsbl %al,%eax
 3f0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 3f4:	0f b6 01             	movzbl (%ecx),%eax
 3f7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3fa:	80 fb 09             	cmp    $0x9,%bl
 3fd:	76 e5                	jbe    3e4 <atoi+0xe>
  return n;
}
 3ff:	89 d0                	mov    %edx,%eax
 401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	56                   	push   %esi
 40a:	53                   	push   %ebx
 40b:	8b 75 08             	mov    0x8(%ebp),%esi
 40e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 411:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 414:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 416:	eb 0d                	jmp    425 <memmove+0x1f>
    *dst++ = *src++;
 418:	0f b6 01             	movzbl (%ecx),%eax
 41b:	88 02                	mov    %al,(%edx)
 41d:	8d 49 01             	lea    0x1(%ecx),%ecx
 420:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 58 ff             	lea    -0x1(%eax),%ebx
 428:	85 c0                	test   %eax,%eax
 42a:	7f ec                	jg     418 <memmove+0x12>
  return vdst;
}
 42c:	89 f0                	mov    %esi,%eax
 42e:	5b                   	pop    %ebx
 42f:	5e                   	pop    %esi
 430:	5d                   	pop    %ebp
 431:	c3                   	ret    

00000432 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 438:	83 38 01             	cmpl   $0x1,(%eax)
 43b:	74 fb                	je     438 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 43d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 443:	5d                   	pop    %ebp
 444:	c3                   	ret    

00000445 <lock_release>:
void lock_release(lock_t *lock)
{
 445:	55                   	push   %ebp
 446:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    

00000453 <lock_init>:
void lock_init(lock_t *lock)
{
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    

00000461 <thread_create>:
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	53                   	push   %ebx
 465:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 468:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 46b:	53                   	push   %ebx
 46c:	e8 e2 ff ff ff       	call   453 <lock_init>
  lock_acquire(&lock);
 471:	89 1c 24             	mov    %ebx,(%esp)
 474:	e8 b9 ff ff ff       	call   432 <lock_acquire>
  void *stack = malloc(4096 * 2);
 479:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 480:	e8 e5 03 00 00       	call   86a <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 485:	50                   	push   %eax
 486:	ff 75 10             	push   0x10(%ebp)
 489:	ff 75 0c             	push   0xc(%ebp)
 48c:	ff 75 08             	push   0x8(%ebp)
 48f:	e8 fb 00 00 00       	call   58f <clone>
}
 494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <thread_join>:
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 4a1:	6a 04                	push   $0x4
 4a3:	e8 c2 03 00 00       	call   86a <malloc>
 4a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 4ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ae:	89 04 24             	mov    %eax,(%esp)
 4b1:	e8 e1 00 00 00       	call   597 <join>
 4b6:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 4b8:	8d 75 f0             	lea    -0x10(%ebp),%esi
 4bb:	89 34 24             	mov    %esi,(%esp)
 4be:	e8 90 ff ff ff       	call   453 <lock_init>
  lock_acquire(&lock);
 4c3:	89 34 24             	mov    %esi,(%esp)
 4c6:	e8 67 ff ff ff       	call   432 <lock_acquire>
  free(stack);
 4cb:	83 c4 04             	add    $0x4,%esp
 4ce:	ff 75 f4             	push   -0xc(%ebp)
 4d1:	e8 d4 02 00 00       	call   7aa <free>
  lock_release(&lock);
 4d6:	89 34 24             	mov    %esi,(%esp)
 4d9:	e8 67 ff ff ff       	call   445 <lock_release>
}
 4de:	89 d8                	mov    %ebx,%eax
 4e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    

000004e7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4e7:	b8 01 00 00 00       	mov    $0x1,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <exit>:
SYSCALL(exit)
 4ef:	b8 02 00 00 00       	mov    $0x2,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <wait>:
SYSCALL(wait)
 4f7:	b8 03 00 00 00       	mov    $0x3,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <pipe>:
SYSCALL(pipe)
 4ff:	b8 04 00 00 00       	mov    $0x4,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <read>:
SYSCALL(read)
 507:	b8 05 00 00 00       	mov    $0x5,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <write>:
SYSCALL(write)
 50f:	b8 10 00 00 00       	mov    $0x10,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <close>:
SYSCALL(close)
 517:	b8 15 00 00 00       	mov    $0x15,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <kill>:
SYSCALL(kill)
 51f:	b8 06 00 00 00       	mov    $0x6,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <exec>:
SYSCALL(exec)
 527:	b8 07 00 00 00       	mov    $0x7,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <open>:
SYSCALL(open)
 52f:	b8 0f 00 00 00       	mov    $0xf,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <mknod>:
SYSCALL(mknod)
 537:	b8 11 00 00 00       	mov    $0x11,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <unlink>:
SYSCALL(unlink)
 53f:	b8 12 00 00 00       	mov    $0x12,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <fstat>:
SYSCALL(fstat)
 547:	b8 08 00 00 00       	mov    $0x8,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <link>:
SYSCALL(link)
 54f:	b8 13 00 00 00       	mov    $0x13,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <mkdir>:
SYSCALL(mkdir)
 557:	b8 14 00 00 00       	mov    $0x14,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <chdir>:
SYSCALL(chdir)
 55f:	b8 09 00 00 00       	mov    $0x9,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <dup>:
SYSCALL(dup)
 567:	b8 0a 00 00 00       	mov    $0xa,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <getpid>:
SYSCALL(getpid)
 56f:	b8 0b 00 00 00       	mov    $0xb,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <sbrk>:
SYSCALL(sbrk)
 577:	b8 0c 00 00 00       	mov    $0xc,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <sleep>:
SYSCALL(sleep)
 57f:	b8 0d 00 00 00       	mov    $0xd,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <uptime>:
SYSCALL(uptime)
 587:	b8 0e 00 00 00       	mov    $0xe,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <clone>:
SYSCALL(clone)
 58f:	b8 16 00 00 00       	mov    $0x16,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <join>:
 597:	b8 17 00 00 00       	mov    $0x17,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 59f:	55                   	push   %ebp
 5a0:	89 e5                	mov    %esp,%ebp
 5a2:	83 ec 1c             	sub    $0x1c,%esp
 5a5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5a8:	6a 01                	push   $0x1
 5aa:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5ad:	52                   	push   %edx
 5ae:	50                   	push   %eax
 5af:	e8 5b ff ff ff       	call   50f <write>
}
 5b4:	83 c4 10             	add    $0x10,%esp
 5b7:	c9                   	leave  
 5b8:	c3                   	ret    

000005b9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b9:	55                   	push   %ebp
 5ba:	89 e5                	mov    %esp,%ebp
 5bc:	57                   	push   %edi
 5bd:	56                   	push   %esi
 5be:	53                   	push   %ebx
 5bf:	83 ec 2c             	sub    $0x2c,%esp
 5c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c5:	89 d0                	mov    %edx,%eax
 5c7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5c9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5cd:	0f 95 c1             	setne  %cl
 5d0:	c1 ea 1f             	shr    $0x1f,%edx
 5d3:	84 d1                	test   %dl,%cl
 5d5:	74 44                	je     61b <printint+0x62>
    neg = 1;
    x = -xx;
 5d7:	f7 d8                	neg    %eax
 5d9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5db:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5e7:	89 c8                	mov    %ecx,%eax
 5e9:	ba 00 00 00 00       	mov    $0x0,%edx
 5ee:	f7 f6                	div    %esi
 5f0:	89 df                	mov    %ebx,%edi
 5f2:	83 c3 01             	add    $0x1,%ebx
 5f5:	0f b6 92 4c 0a 00 00 	movzbl 0xa4c(%edx),%edx
 5fc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 600:	89 ca                	mov    %ecx,%edx
 602:	89 c1                	mov    %eax,%ecx
 604:	39 d6                	cmp    %edx,%esi
 606:	76 df                	jbe    5e7 <printint+0x2e>
  if(neg)
 608:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 60c:	74 31                	je     63f <printint+0x86>
    buf[i++] = '-';
 60e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 613:	8d 5f 02             	lea    0x2(%edi),%ebx
 616:	8b 75 d0             	mov    -0x30(%ebp),%esi
 619:	eb 17                	jmp    632 <printint+0x79>
    x = xx;
 61b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 61d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 624:	eb bc                	jmp    5e2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 626:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 62b:	89 f0                	mov    %esi,%eax
 62d:	e8 6d ff ff ff       	call   59f <putc>
  while(--i >= 0)
 632:	83 eb 01             	sub    $0x1,%ebx
 635:	79 ef                	jns    626 <printint+0x6d>
}
 637:	83 c4 2c             	add    $0x2c,%esp
 63a:	5b                   	pop    %ebx
 63b:	5e                   	pop    %esi
 63c:	5f                   	pop    %edi
 63d:	5d                   	pop    %ebp
 63e:	c3                   	ret    
 63f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 642:	eb ee                	jmp    632 <printint+0x79>

00000644 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 64d:	8d 45 10             	lea    0x10(%ebp),%eax
 650:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 653:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 658:	bb 00 00 00 00       	mov    $0x0,%ebx
 65d:	eb 14                	jmp    673 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 65f:	89 fa                	mov    %edi,%edx
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	e8 36 ff ff ff       	call   59f <putc>
 669:	eb 05                	jmp    670 <printf+0x2c>
      }
    } else if(state == '%'){
 66b:	83 fe 25             	cmp    $0x25,%esi
 66e:	74 25                	je     695 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 670:	83 c3 01             	add    $0x1,%ebx
 673:	8b 45 0c             	mov    0xc(%ebp),%eax
 676:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 67a:	84 c0                	test   %al,%al
 67c:	0f 84 20 01 00 00    	je     7a2 <printf+0x15e>
    c = fmt[i] & 0xff;
 682:	0f be f8             	movsbl %al,%edi
 685:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 688:	85 f6                	test   %esi,%esi
 68a:	75 df                	jne    66b <printf+0x27>
      if(c == '%'){
 68c:	83 f8 25             	cmp    $0x25,%eax
 68f:	75 ce                	jne    65f <printf+0x1b>
        state = '%';
 691:	89 c6                	mov    %eax,%esi
 693:	eb db                	jmp    670 <printf+0x2c>
      if(c == 'd'){
 695:	83 f8 25             	cmp    $0x25,%eax
 698:	0f 84 cf 00 00 00    	je     76d <printf+0x129>
 69e:	0f 8c dd 00 00 00    	jl     781 <printf+0x13d>
 6a4:	83 f8 78             	cmp    $0x78,%eax
 6a7:	0f 8f d4 00 00 00    	jg     781 <printf+0x13d>
 6ad:	83 f8 63             	cmp    $0x63,%eax
 6b0:	0f 8c cb 00 00 00    	jl     781 <printf+0x13d>
 6b6:	83 e8 63             	sub    $0x63,%eax
 6b9:	83 f8 15             	cmp    $0x15,%eax
 6bc:	0f 87 bf 00 00 00    	ja     781 <printf+0x13d>
 6c2:	ff 24 85 f4 09 00 00 	jmp    *0x9f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6c9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6cc:	8b 17                	mov    (%edi),%edx
 6ce:	83 ec 0c             	sub    $0xc,%esp
 6d1:	6a 01                	push   $0x1
 6d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 d9 fe ff ff       	call   5b9 <printint>
        ap++;
 6e0:	83 c7 04             	add    $0x4,%edi
 6e3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6e9:	be 00 00 00 00       	mov    $0x0,%esi
 6ee:	eb 80                	jmp    670 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f3:	8b 17                	mov    (%edi),%edx
 6f5:	83 ec 0c             	sub    $0xc,%esp
 6f8:	6a 00                	push   $0x0
 6fa:	b9 10 00 00 00       	mov    $0x10,%ecx
 6ff:	8b 45 08             	mov    0x8(%ebp),%eax
 702:	e8 b2 fe ff ff       	call   5b9 <printint>
        ap++;
 707:	83 c7 04             	add    $0x4,%edi
 70a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 70d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 710:	be 00 00 00 00       	mov    $0x0,%esi
 715:	e9 56 ff ff ff       	jmp    670 <printf+0x2c>
        s = (char*)*ap;
 71a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71d:	8b 30                	mov    (%eax),%esi
        ap++;
 71f:	83 c0 04             	add    $0x4,%eax
 722:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 725:	85 f6                	test   %esi,%esi
 727:	75 15                	jne    73e <printf+0xfa>
          s = "(null)";
 729:	be ea 09 00 00       	mov    $0x9ea,%esi
 72e:	eb 0e                	jmp    73e <printf+0xfa>
          putc(fd, *s);
 730:	0f be d2             	movsbl %dl,%edx
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	e8 64 fe ff ff       	call   59f <putc>
          s++;
 73b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 73e:	0f b6 16             	movzbl (%esi),%edx
 741:	84 d2                	test   %dl,%dl
 743:	75 eb                	jne    730 <printf+0xec>
      state = 0;
 745:	be 00 00 00 00       	mov    $0x0,%esi
 74a:	e9 21 ff ff ff       	jmp    670 <printf+0x2c>
        putc(fd, *ap);
 74f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 752:	0f be 17             	movsbl (%edi),%edx
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	e8 42 fe ff ff       	call   59f <putc>
        ap++;
 75d:	83 c7 04             	add    $0x4,%edi
 760:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 763:	be 00 00 00 00       	mov    $0x0,%esi
 768:	e9 03 ff ff ff       	jmp    670 <printf+0x2c>
        putc(fd, c);
 76d:	89 fa                	mov    %edi,%edx
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	e8 28 fe ff ff       	call   59f <putc>
      state = 0;
 777:	be 00 00 00 00       	mov    $0x0,%esi
 77c:	e9 ef fe ff ff       	jmp    670 <printf+0x2c>
        putc(fd, '%');
 781:	ba 25 00 00 00       	mov    $0x25,%edx
 786:	8b 45 08             	mov    0x8(%ebp),%eax
 789:	e8 11 fe ff ff       	call   59f <putc>
        putc(fd, c);
 78e:	89 fa                	mov    %edi,%edx
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	e8 07 fe ff ff       	call   59f <putc>
      state = 0;
 798:	be 00 00 00 00       	mov    $0x0,%esi
 79d:	e9 ce fe ff ff       	jmp    670 <printf+0x2c>
    }
  }
}
 7a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a5:	5b                   	pop    %ebx
 7a6:	5e                   	pop    %esi
 7a7:	5f                   	pop    %edi
 7a8:	5d                   	pop    %ebp
 7a9:	c3                   	ret    

000007aa <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7aa:	55                   	push   %ebp
 7ab:	89 e5                	mov    %esp,%ebp
 7ad:	57                   	push   %edi
 7ae:	56                   	push   %esi
 7af:	53                   	push   %ebx
 7b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b6:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 7bb:	eb 02                	jmp    7bf <free+0x15>
 7bd:	89 d0                	mov    %edx,%eax
 7bf:	39 c8                	cmp    %ecx,%eax
 7c1:	73 04                	jae    7c7 <free+0x1d>
 7c3:	39 08                	cmp    %ecx,(%eax)
 7c5:	77 12                	ja     7d9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c7:	8b 10                	mov    (%eax),%edx
 7c9:	39 c2                	cmp    %eax,%edx
 7cb:	77 f0                	ja     7bd <free+0x13>
 7cd:	39 c8                	cmp    %ecx,%eax
 7cf:	72 08                	jb     7d9 <free+0x2f>
 7d1:	39 ca                	cmp    %ecx,%edx
 7d3:	77 04                	ja     7d9 <free+0x2f>
 7d5:	89 d0                	mov    %edx,%eax
 7d7:	eb e6                	jmp    7bf <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7dc:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7df:	8b 10                	mov    (%eax),%edx
 7e1:	39 d7                	cmp    %edx,%edi
 7e3:	74 19                	je     7fe <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7e5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7e8:	8b 50 04             	mov    0x4(%eax),%edx
 7eb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7ee:	39 ce                	cmp    %ecx,%esi
 7f0:	74 1b                	je     80d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7f2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7f4:	a3 c4 0d 00 00       	mov    %eax,0xdc4
}
 7f9:	5b                   	pop    %ebx
 7fa:	5e                   	pop    %esi
 7fb:	5f                   	pop    %edi
 7fc:	5d                   	pop    %ebp
 7fd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7fe:	03 72 04             	add    0x4(%edx),%esi
 801:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 804:	8b 10                	mov    (%eax),%edx
 806:	8b 12                	mov    (%edx),%edx
 808:	89 53 f8             	mov    %edx,-0x8(%ebx)
 80b:	eb db                	jmp    7e8 <free+0x3e>
    p->s.size += bp->s.size;
 80d:	03 53 fc             	add    -0x4(%ebx),%edx
 810:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 813:	8b 53 f8             	mov    -0x8(%ebx),%edx
 816:	89 10                	mov    %edx,(%eax)
 818:	eb da                	jmp    7f4 <free+0x4a>

0000081a <morecore>:

static Header*
morecore(uint nu)
{
 81a:	55                   	push   %ebp
 81b:	89 e5                	mov    %esp,%ebp
 81d:	53                   	push   %ebx
 81e:	83 ec 04             	sub    $0x4,%esp
 821:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 823:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 828:	77 05                	ja     82f <morecore+0x15>
    nu = 4096;
 82a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 82f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 836:	83 ec 0c             	sub    $0xc,%esp
 839:	50                   	push   %eax
 83a:	e8 38 fd ff ff       	call   577 <sbrk>
  if(p == (char*)-1)
 83f:	83 c4 10             	add    $0x10,%esp
 842:	83 f8 ff             	cmp    $0xffffffff,%eax
 845:	74 1c                	je     863 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 847:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 84a:	83 c0 08             	add    $0x8,%eax
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	50                   	push   %eax
 851:	e8 54 ff ff ff       	call   7aa <free>
  return freep;
 856:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 85b:	83 c4 10             	add    $0x10,%esp
}
 85e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 861:	c9                   	leave  
 862:	c3                   	ret    
    return 0;
 863:	b8 00 00 00 00       	mov    $0x0,%eax
 868:	eb f4                	jmp    85e <morecore+0x44>

0000086a <malloc>:

void*
malloc(uint nbytes)
{
 86a:	55                   	push   %ebp
 86b:	89 e5                	mov    %esp,%ebp
 86d:	53                   	push   %ebx
 86e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 871:	8b 45 08             	mov    0x8(%ebp),%eax
 874:	8d 58 07             	lea    0x7(%eax),%ebx
 877:	c1 eb 03             	shr    $0x3,%ebx
 87a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 87d:	8b 0d c4 0d 00 00    	mov    0xdc4,%ecx
 883:	85 c9                	test   %ecx,%ecx
 885:	74 04                	je     88b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 887:	8b 01                	mov    (%ecx),%eax
 889:	eb 4a                	jmp    8d5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 88b:	c7 05 c4 0d 00 00 c8 	movl   $0xdc8,0xdc4
 892:	0d 00 00 
 895:	c7 05 c8 0d 00 00 c8 	movl   $0xdc8,0xdc8
 89c:	0d 00 00 
    base.s.size = 0;
 89f:	c7 05 cc 0d 00 00 00 	movl   $0x0,0xdcc
 8a6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8a9:	b9 c8 0d 00 00       	mov    $0xdc8,%ecx
 8ae:	eb d7                	jmp    887 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b0:	74 19                	je     8cb <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8b2:	29 da                	sub    %ebx,%edx
 8b4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ba:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8bd:	89 0d c4 0d 00 00    	mov    %ecx,0xdc4
      return (void*)(p + 1);
 8c3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c9:	c9                   	leave  
 8ca:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8cb:	8b 10                	mov    (%eax),%edx
 8cd:	89 11                	mov    %edx,(%ecx)
 8cf:	eb ec                	jmp    8bd <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d1:	89 c1                	mov    %eax,%ecx
 8d3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8d5:	8b 50 04             	mov    0x4(%eax),%edx
 8d8:	39 da                	cmp    %ebx,%edx
 8da:	73 d4                	jae    8b0 <malloc+0x46>
    if(p == freep)
 8dc:	39 05 c4 0d 00 00    	cmp    %eax,0xdc4
 8e2:	75 ed                	jne    8d1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8e4:	89 d8                	mov    %ebx,%eax
 8e6:	e8 2f ff ff ff       	call   81a <morecore>
 8eb:	85 c0                	test   %eax,%eax
 8ed:	75 e2                	jne    8d1 <malloc+0x67>
 8ef:	eb d5                	jmp    8c6 <malloc+0x5c>
