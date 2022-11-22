
_test_8:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 80 0e 00 00       	mov    0xe80,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 f0 09 00 00       	push   $0x9f0
  31:	68 f9 09 00 00       	push   $0x9f9
  36:	6a 01                	push   $0x1
  38:	e8 05 07 00 00       	call   742 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 38 0a 00 00       	push   $0xa38
  45:	68 0c 0a 00 00       	push   $0xa0c
  4a:	6a 01                	push   $0x1
  4c:	e8 f1 06 00 00       	call   742 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 20 0a 00 00       	push   $0xa20
  59:	6a 01                	push   $0x1
  5b:	e8 e2 06 00 00       	call   742 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 84 0e 00 00    	push   0xe84
  69:	e8 af 05 00 00       	call   61d <kill>
  6e:	e8 7a 05 00 00       	call   5ed <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 f0 09 00 00       	push   $0x9f0
  7a:	68 f9 09 00 00       	push   $0x9f9
  7f:	6a 01                	push   $0x1
  81:	e8 bc 06 00 00       	call   742 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 01 0a 00 00       	push   $0xa01
  8e:	68 0c 0a 00 00       	push   $0xa0c
  93:	6a 01                	push   $0x1
  95:	e8 a8 06 00 00       	call   742 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 20 0a 00 00       	push   $0xa20
  a2:	6a 01                	push   $0x1
  a4:	e8 99 06 00 00       	call   742 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 84 0e 00 00    	push   0xe84
  b2:	e8 66 05 00 00       	call   61d <kill>
  b7:	e8 31 05 00 00       	call   5ed <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 f0 09 00 00       	push   $0x9f0
  c3:	68 f9 09 00 00       	push   $0x9f9
  c8:	6a 01                	push   $0x1
  ca:	e8 73 06 00 00       	call   742 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 2d 0a 00 00       	push   $0xa2d
  d7:	68 0c 0a 00 00       	push   $0xa0c
  dc:	6a 01                	push   $0x1
  de:	e8 5f 06 00 00       	call   742 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 20 0a 00 00       	push   $0xa20
  eb:	6a 01                	push   $0x1
  ed:	e8 50 06 00 00       	call   742 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 84 0e 00 00    	push   0xe84
  fb:	e8 1d 05 00 00       	call   61d <kill>
 100:	e8 e8 04 00 00       	call   5ed <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 80 0e 00 00       	mov    %eax,0xe80
   exit();
 10d:	e8 db 04 00 00       	call   5ed <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 42 05 00 00       	call   66d <getpid>
 12b:	a3 84 0e 00 00       	mov    %eax,0xe84
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 2b 08 00 00       	call   968 <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 f0 09 00 00       	push   $0x9f0
 15f:	68 f9 09 00 00       	push   $0x9f9
 164:	6a 01                	push   $0x1
 166:	e8 d7 05 00 00       	call   742 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 44 0a 00 00       	push   $0xa44
 173:	68 0c 0a 00 00       	push   $0xa0c
 178:	6a 01                	push   $0x1
 17a:	e8 c3 05 00 00       	call   742 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 20 0a 00 00       	push   $0xa20
 187:	6a 01                	push   $0x1
 189:	e8 b4 05 00 00       	call   742 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 84 0e 00 00    	push   0xe84
 197:	e8 81 04 00 00       	call   61d <kill>
 19c:	e8 4c 04 00 00       	call   5ed <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 c9 04 00 00       	call   68d <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 a3 04 00 00       	call   67d <sleep>
   assert(wait() == -1);
 1da:	e8 16 04 00 00       	call   5f5 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 f0 09 00 00       	push   $0x9f0
 1f2:	68 f9 09 00 00       	push   $0x9f9
 1f7:	6a 01                	push   $0x1
 1f9:	e8 44 05 00 00       	call   742 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 5c 0a 00 00       	push   $0xa5c
 206:	68 0c 0a 00 00       	push   $0xa0c
 20b:	6a 01                	push   $0x1
 20d:	e8 30 05 00 00       	call   742 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 20 0a 00 00       	push   $0xa20
 21a:	6a 01                	push   $0x1
 21c:	e8 21 05 00 00       	call   742 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 84 0e 00 00    	push   0xe84
 22a:	e8 ee 03 00 00       	call   61d <kill>
 22f:	e8 b9 03 00 00       	call   5ed <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 f0 09 00 00       	push   $0x9f0
 23b:	68 f9 09 00 00       	push   $0x9f9
 240:	6a 01                	push   $0x1
 242:	e8 fb 04 00 00       	call   742 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 4e 0a 00 00       	push   $0xa4e
 24f:	68 0c 0a 00 00       	push   $0xa0c
 254:	6a 01                	push   $0x1
 256:	e8 e7 04 00 00       	call   742 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 20 0a 00 00       	push   $0xa20
 263:	6a 01                	push   $0x1
 265:	e8 d8 04 00 00       	call   742 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 84 0e 00 00    	push   0xe84
 273:	e8 a5 03 00 00       	call   61d <kill>
 278:	e8 70 03 00 00       	call   5ed <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 0c 04 00 00       	call   695 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 f0 09 00 00       	push   $0x9f0
 2a0:	68 f9 09 00 00       	push   $0x9f9
 2a5:	6a 01                	push   $0x1
 2a7:	e8 96 04 00 00       	call   742 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 7f 0a 00 00       	push   $0xa7f
 2b4:	68 0c 0a 00 00       	push   $0xa0c
 2b9:	6a 01                	push   $0x1
 2bb:	e8 82 04 00 00       	call   742 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 20 0a 00 00       	push   $0xa20
 2c8:	6a 01                	push   $0x1
 2ca:	e8 73 04 00 00       	call   742 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 84 0e 00 00    	push   0xe84
 2d8:	e8 40 03 00 00       	call   61d <kill>
 2dd:	e8 0b 03 00 00       	call   5ed <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 f0 09 00 00       	push   $0x9f0
 2e9:	68 f9 09 00 00       	push   $0x9f9
 2ee:	6a 01                	push   $0x1
 2f0:	e8 4d 04 00 00       	call   742 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 69 0a 00 00       	push   $0xa69
 2fd:	68 0c 0a 00 00       	push   $0xa0c
 302:	6a 01                	push   $0x1
 304:	e8 39 04 00 00       	call   742 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 20 0a 00 00       	push   $0xa20
 311:	6a 01                	push   $0x1
 313:	e8 2a 04 00 00       	call   742 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 84 0e 00 00    	push   0xe84
 321:	e8 f7 02 00 00       	call   61d <kill>
 326:	e8 c2 02 00 00       	call   5ed <exit>
   assert(global == 2);
 32b:	83 3d 80 0e 00 00 02 	cmpl   $0x2,0xe80
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 f0 09 00 00       	push   $0x9f0
 33b:	68 f9 09 00 00       	push   $0x9f9
 340:	6a 01                	push   $0x1
 342:	e8 fb 03 00 00       	call   742 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 93 0a 00 00       	push   $0xa93
 34f:	68 0c 0a 00 00       	push   $0xa0c
 354:	6a 01                	push   $0x1
 356:	e8 e7 03 00 00       	call   742 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 20 0a 00 00       	push   $0xa20
 363:	6a 01                	push   $0x1
 365:	e8 d8 03 00 00       	call   742 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 84 0e 00 00    	push   0xe84
 373:	e8 a5 02 00 00       	call   61d <kill>
 378:	e8 70 02 00 00       	call   5ed <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 9f 0a 00 00       	push   $0xa9f
 385:	6a 01                	push   $0x1
 387:	e8 b6 03 00 00       	call   742 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 14 05 00 00       	call   8a8 <free>
   exit();
 394:	e8 54 02 00 00       	call   5ed <exit>

00000399 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	8b 75 08             	mov    0x8(%ebp),%esi
 3a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 3a4:	89 f0                	mov    %esi,%eax
 3a6:	89 d1                	mov    %edx,%ecx
 3a8:	83 c2 01             	add    $0x1,%edx
 3ab:	89 c3                	mov    %eax,%ebx
 3ad:	83 c0 01             	add    $0x1,%eax
 3b0:	0f b6 09             	movzbl (%ecx),%ecx
 3b3:	88 0b                	mov    %cl,(%ebx)
 3b5:	84 c9                	test   %cl,%cl
 3b7:	75 ed                	jne    3a6 <strcpy+0xd>
    ;
  return os;
}
 3b9:	89 f0                	mov    %esi,%eax
 3bb:	5b                   	pop    %ebx
 3bc:	5e                   	pop    %esi
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <strcmp>:

int strcmp(const char *p, const char *q)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 3c8:	eb 06                	jmp    3d0 <strcmp+0x11>
    p++, q++;
 3ca:	83 c1 01             	add    $0x1,%ecx
 3cd:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 3d0:	0f b6 01             	movzbl (%ecx),%eax
 3d3:	84 c0                	test   %al,%al
 3d5:	74 04                	je     3db <strcmp+0x1c>
 3d7:	3a 02                	cmp    (%edx),%al
 3d9:	74 ef                	je     3ca <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3db:	0f b6 c0             	movzbl %al,%eax
 3de:	0f b6 12             	movzbl (%edx),%edx
 3e1:	29 d0                	sub    %edx,%eax
}
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strlen>:

uint strlen(const char *s)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 3eb:	b8 00 00 00 00       	mov    $0x0,%eax
 3f0:	eb 03                	jmp    3f5 <strlen+0x10>
 3f2:	83 c0 01             	add    $0x1,%eax
 3f5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3f9:	75 f7                	jne    3f2 <strlen+0xd>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <memset>:

void *
memset(void *dst, int c, uint n)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	57                   	push   %edi
 401:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 404:	89 d7                	mov    %edx,%edi
 406:	8b 4d 10             	mov    0x10(%ebp),%ecx
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	fc                   	cld    
 40d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 7d fc             	mov    -0x4(%ebp),%edi
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <strchr>:

char *
strchr(const char *s, char c)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 420:	eb 03                	jmp    425 <strchr+0xf>
 422:	83 c0 01             	add    $0x1,%eax
 425:	0f b6 10             	movzbl (%eax),%edx
 428:	84 d2                	test   %dl,%dl
 42a:	74 06                	je     432 <strchr+0x1c>
    if (*s == c)
 42c:	38 ca                	cmp    %cl,%dl
 42e:	75 f2                	jne    422 <strchr+0xc>
 430:	eb 05                	jmp    437 <strchr+0x21>
      return (char *)s;
  return 0;
 432:	b8 00 00 00 00       	mov    $0x0,%eax
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <gets>:

char *
gets(char *buf, int max)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	83 ec 1c             	sub    $0x1c,%esp
 442:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 445:	bb 00 00 00 00       	mov    $0x0,%ebx
 44a:	89 de                	mov    %ebx,%esi
 44c:	83 c3 01             	add    $0x1,%ebx
 44f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 452:	7d 2e                	jge    482 <gets+0x49>
  {
    cc = read(0, &c, 1);
 454:	83 ec 04             	sub    $0x4,%esp
 457:	6a 01                	push   $0x1
 459:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45c:	50                   	push   %eax
 45d:	6a 00                	push   $0x0
 45f:	e8 a1 01 00 00       	call   605 <read>
    if (cc < 1)
 464:	83 c4 10             	add    $0x10,%esp
 467:	85 c0                	test   %eax,%eax
 469:	7e 17                	jle    482 <gets+0x49>
      break;
    buf[i++] = c;
 46b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 46f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 472:	3c 0a                	cmp    $0xa,%al
 474:	0f 94 c2             	sete   %dl
 477:	3c 0d                	cmp    $0xd,%al
 479:	0f 94 c0             	sete   %al
 47c:	08 c2                	or     %al,%dl
 47e:	74 ca                	je     44a <gets+0x11>
    buf[i++] = c;
 480:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 482:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 486:	89 f8                	mov    %edi,%eax
 488:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48b:	5b                   	pop    %ebx
 48c:	5e                   	pop    %esi
 48d:	5f                   	pop    %edi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <stat>:

int stat(const char *n, struct stat *st)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	56                   	push   %esi
 494:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 00                	push   $0x0
 49a:	ff 75 08             	push   0x8(%ebp)
 49d:	e8 8b 01 00 00       	call   62d <open>
  if (fd < 0)
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 24                	js     4cd <stat+0x3d>
 4a9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ab:	83 ec 08             	sub    $0x8,%esp
 4ae:	ff 75 0c             	push   0xc(%ebp)
 4b1:	50                   	push   %eax
 4b2:	e8 8e 01 00 00       	call   645 <fstat>
 4b7:	89 c6                	mov    %eax,%esi
  close(fd);
 4b9:	89 1c 24             	mov    %ebx,(%esp)
 4bc:	e8 54 01 00 00       	call   615 <close>
  return r;
 4c1:	83 c4 10             	add    $0x10,%esp
}
 4c4:	89 f0                	mov    %esi,%eax
 4c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
    return -1;
 4cd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d2:	eb f0                	jmp    4c4 <stat+0x34>

000004d4 <atoi>:

int atoi(const char *s)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	53                   	push   %ebx
 4d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4db:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 4e0:	eb 10                	jmp    4f2 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 4e2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4e5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 4f2:	0f b6 01             	movzbl (%ecx),%eax
 4f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f8:	80 fb 09             	cmp    $0x9,%bl
 4fb:	76 e5                	jbe    4e2 <atoi+0xe>
  return n;
}
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 502:	c9                   	leave  
 503:	c3                   	ret    

00000504 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	56                   	push   %esi
 508:	53                   	push   %ebx
 509:	8b 75 08             	mov    0x8(%ebp),%esi
 50c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 50f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 512:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 514:	eb 0d                	jmp    523 <memmove+0x1f>
    *dst++ = *src++;
 516:	0f b6 01             	movzbl (%ecx),%eax
 519:	88 02                	mov    %al,(%edx)
 51b:	8d 49 01             	lea    0x1(%ecx),%ecx
 51e:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 521:	89 d8                	mov    %ebx,%eax
 523:	8d 58 ff             	lea    -0x1(%eax),%ebx
 526:	85 c0                	test   %eax,%eax
 528:	7f ec                	jg     516 <memmove+0x12>
  return vdst;
}
 52a:	89 f0                	mov    %esi,%eax
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 536:	83 38 01             	cmpl   $0x1,(%eax)
 539:	74 fb                	je     536 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 53b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 541:	5d                   	pop    %ebp
 542:	c3                   	ret    

00000543 <lock_release>:
void lock_release(lock_t *lock)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    

00000551 <lock_init>:
void lock_init(lock_t *lock)
{
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 55d:	5d                   	pop    %ebp
 55e:	c3                   	ret    

0000055f <thread_create>:
{
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	53                   	push   %ebx
 563:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 566:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 569:	53                   	push   %ebx
 56a:	e8 e2 ff ff ff       	call   551 <lock_init>
  lock_acquire(&lock);
 56f:	89 1c 24             	mov    %ebx,(%esp)
 572:	e8 b9 ff ff ff       	call   530 <lock_acquire>
  void *stack = malloc(4096 * 2);
 577:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 57e:	e8 e5 03 00 00       	call   968 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 583:	50                   	push   %eax
 584:	ff 75 10             	push   0x10(%ebp)
 587:	ff 75 0c             	push   0xc(%ebp)
 58a:	ff 75 08             	push   0x8(%ebp)
 58d:	e8 fb 00 00 00       	call   68d <clone>
}
 592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <thread_join>:
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 59f:	6a 04                	push   $0x4
 5a1:	e8 c2 03 00 00       	call   968 <malloc>
 5a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 5a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5ac:	89 04 24             	mov    %eax,(%esp)
 5af:	e8 e1 00 00 00       	call   695 <join>
 5b4:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 5b6:	8d 75 f0             	lea    -0x10(%ebp),%esi
 5b9:	89 34 24             	mov    %esi,(%esp)
 5bc:	e8 90 ff ff ff       	call   551 <lock_init>
  lock_acquire(&lock);
 5c1:	89 34 24             	mov    %esi,(%esp)
 5c4:	e8 67 ff ff ff       	call   530 <lock_acquire>
  free(stack);
 5c9:	83 c4 04             	add    $0x4,%esp
 5cc:	ff 75 f4             	push   -0xc(%ebp)
 5cf:	e8 d4 02 00 00       	call   8a8 <free>
  lock_release(&lock);
 5d4:	89 34 24             	mov    %esi,(%esp)
 5d7:	e8 67 ff ff ff       	call   543 <lock_release>
}
 5dc:	89 d8                	mov    %ebx,%eax
 5de:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5e1:	5b                   	pop    %ebx
 5e2:	5e                   	pop    %esi
 5e3:	5d                   	pop    %ebp
 5e4:	c3                   	ret    

000005e5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5e5:	b8 01 00 00 00       	mov    $0x1,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <exit>:
SYSCALL(exit)
 5ed:	b8 02 00 00 00       	mov    $0x2,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <wait>:
SYSCALL(wait)
 5f5:	b8 03 00 00 00       	mov    $0x3,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <pipe>:
SYSCALL(pipe)
 5fd:	b8 04 00 00 00       	mov    $0x4,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <read>:
SYSCALL(read)
 605:	b8 05 00 00 00       	mov    $0x5,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <write>:
SYSCALL(write)
 60d:	b8 10 00 00 00       	mov    $0x10,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <close>:
SYSCALL(close)
 615:	b8 15 00 00 00       	mov    $0x15,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <kill>:
SYSCALL(kill)
 61d:	b8 06 00 00 00       	mov    $0x6,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <exec>:
SYSCALL(exec)
 625:	b8 07 00 00 00       	mov    $0x7,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <open>:
SYSCALL(open)
 62d:	b8 0f 00 00 00       	mov    $0xf,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <mknod>:
SYSCALL(mknod)
 635:	b8 11 00 00 00       	mov    $0x11,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <unlink>:
SYSCALL(unlink)
 63d:	b8 12 00 00 00       	mov    $0x12,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <fstat>:
SYSCALL(fstat)
 645:	b8 08 00 00 00       	mov    $0x8,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <link>:
SYSCALL(link)
 64d:	b8 13 00 00 00       	mov    $0x13,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <mkdir>:
SYSCALL(mkdir)
 655:	b8 14 00 00 00       	mov    $0x14,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <chdir>:
SYSCALL(chdir)
 65d:	b8 09 00 00 00       	mov    $0x9,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <dup>:
SYSCALL(dup)
 665:	b8 0a 00 00 00       	mov    $0xa,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <getpid>:
SYSCALL(getpid)
 66d:	b8 0b 00 00 00       	mov    $0xb,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <sbrk>:
SYSCALL(sbrk)
 675:	b8 0c 00 00 00       	mov    $0xc,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <sleep>:
SYSCALL(sleep)
 67d:	b8 0d 00 00 00       	mov    $0xd,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <uptime>:
SYSCALL(uptime)
 685:	b8 0e 00 00 00       	mov    $0xe,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <clone>:
SYSCALL(clone)
 68d:	b8 16 00 00 00       	mov    $0x16,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <join>:
 695:	b8 17 00 00 00       	mov    $0x17,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	83 ec 1c             	sub    $0x1c,%esp
 6a3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6a6:	6a 01                	push   $0x1
 6a8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6ab:	52                   	push   %edx
 6ac:	50                   	push   %eax
 6ad:	e8 5b ff ff ff       	call   60d <write>
}
 6b2:	83 c4 10             	add    $0x10,%esp
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    

000006b7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	57                   	push   %edi
 6bb:	56                   	push   %esi
 6bc:	53                   	push   %ebx
 6bd:	83 ec 2c             	sub    $0x2c,%esp
 6c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c3:	89 d0                	mov    %edx,%eax
 6c5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6c7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6cb:	0f 95 c1             	setne  %cl
 6ce:	c1 ea 1f             	shr    $0x1f,%edx
 6d1:	84 d1                	test   %dl,%cl
 6d3:	74 44                	je     719 <printint+0x62>
    neg = 1;
    x = -xx;
 6d5:	f7 d8                	neg    %eax
 6d7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6e0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6e5:	89 c8                	mov    %ecx,%eax
 6e7:	ba 00 00 00 00       	mov    $0x0,%edx
 6ec:	f7 f6                	div    %esi
 6ee:	89 df                	mov    %ebx,%edi
 6f0:	83 c3 01             	add    $0x1,%ebx
 6f3:	0f b6 92 0c 0b 00 00 	movzbl 0xb0c(%edx),%edx
 6fa:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6fe:	89 ca                	mov    %ecx,%edx
 700:	89 c1                	mov    %eax,%ecx
 702:	39 d6                	cmp    %edx,%esi
 704:	76 df                	jbe    6e5 <printint+0x2e>
  if(neg)
 706:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 70a:	74 31                	je     73d <printint+0x86>
    buf[i++] = '-';
 70c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 711:	8d 5f 02             	lea    0x2(%edi),%ebx
 714:	8b 75 d0             	mov    -0x30(%ebp),%esi
 717:	eb 17                	jmp    730 <printint+0x79>
    x = xx;
 719:	89 c1                	mov    %eax,%ecx
  neg = 0;
 71b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 722:	eb bc                	jmp    6e0 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 724:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 729:	89 f0                	mov    %esi,%eax
 72b:	e8 6d ff ff ff       	call   69d <putc>
  while(--i >= 0)
 730:	83 eb 01             	sub    $0x1,%ebx
 733:	79 ef                	jns    724 <printint+0x6d>
}
 735:	83 c4 2c             	add    $0x2c,%esp
 738:	5b                   	pop    %ebx
 739:	5e                   	pop    %esi
 73a:	5f                   	pop    %edi
 73b:	5d                   	pop    %ebp
 73c:	c3                   	ret    
 73d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 740:	eb ee                	jmp    730 <printint+0x79>

00000742 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 742:	55                   	push   %ebp
 743:	89 e5                	mov    %esp,%ebp
 745:	57                   	push   %edi
 746:	56                   	push   %esi
 747:	53                   	push   %ebx
 748:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 74b:	8d 45 10             	lea    0x10(%ebp),%eax
 74e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 751:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 756:	bb 00 00 00 00       	mov    $0x0,%ebx
 75b:	eb 14                	jmp    771 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 75d:	89 fa                	mov    %edi,%edx
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	e8 36 ff ff ff       	call   69d <putc>
 767:	eb 05                	jmp    76e <printf+0x2c>
      }
    } else if(state == '%'){
 769:	83 fe 25             	cmp    $0x25,%esi
 76c:	74 25                	je     793 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 76e:	83 c3 01             	add    $0x1,%ebx
 771:	8b 45 0c             	mov    0xc(%ebp),%eax
 774:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 778:	84 c0                	test   %al,%al
 77a:	0f 84 20 01 00 00    	je     8a0 <printf+0x15e>
    c = fmt[i] & 0xff;
 780:	0f be f8             	movsbl %al,%edi
 783:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 786:	85 f6                	test   %esi,%esi
 788:	75 df                	jne    769 <printf+0x27>
      if(c == '%'){
 78a:	83 f8 25             	cmp    $0x25,%eax
 78d:	75 ce                	jne    75d <printf+0x1b>
        state = '%';
 78f:	89 c6                	mov    %eax,%esi
 791:	eb db                	jmp    76e <printf+0x2c>
      if(c == 'd'){
 793:	83 f8 25             	cmp    $0x25,%eax
 796:	0f 84 cf 00 00 00    	je     86b <printf+0x129>
 79c:	0f 8c dd 00 00 00    	jl     87f <printf+0x13d>
 7a2:	83 f8 78             	cmp    $0x78,%eax
 7a5:	0f 8f d4 00 00 00    	jg     87f <printf+0x13d>
 7ab:	83 f8 63             	cmp    $0x63,%eax
 7ae:	0f 8c cb 00 00 00    	jl     87f <printf+0x13d>
 7b4:	83 e8 63             	sub    $0x63,%eax
 7b7:	83 f8 15             	cmp    $0x15,%eax
 7ba:	0f 87 bf 00 00 00    	ja     87f <printf+0x13d>
 7c0:	ff 24 85 b4 0a 00 00 	jmp    *0xab4(,%eax,4)
        printint(fd, *ap, 10, 1);
 7c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ca:	8b 17                	mov    (%edi),%edx
 7cc:	83 ec 0c             	sub    $0xc,%esp
 7cf:	6a 01                	push   $0x1
 7d1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	e8 d9 fe ff ff       	call   6b7 <printint>
        ap++;
 7de:	83 c7 04             	add    $0x4,%edi
 7e1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e4:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e7:	be 00 00 00 00       	mov    $0x0,%esi
 7ec:	eb 80                	jmp    76e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7ee:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f1:	8b 17                	mov    (%edi),%edx
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	6a 00                	push   $0x0
 7f8:	b9 10 00 00 00       	mov    $0x10,%ecx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	e8 b2 fe ff ff       	call   6b7 <printint>
        ap++;
 805:	83 c7 04             	add    $0x4,%edi
 808:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 80e:	be 00 00 00 00       	mov    $0x0,%esi
 813:	e9 56 ff ff ff       	jmp    76e <printf+0x2c>
        s = (char*)*ap;
 818:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 81b:	8b 30                	mov    (%eax),%esi
        ap++;
 81d:	83 c0 04             	add    $0x4,%eax
 820:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 823:	85 f6                	test   %esi,%esi
 825:	75 15                	jne    83c <printf+0xfa>
          s = "(null)";
 827:	be ac 0a 00 00       	mov    $0xaac,%esi
 82c:	eb 0e                	jmp    83c <printf+0xfa>
          putc(fd, *s);
 82e:	0f be d2             	movsbl %dl,%edx
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	e8 64 fe ff ff       	call   69d <putc>
          s++;
 839:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 83c:	0f b6 16             	movzbl (%esi),%edx
 83f:	84 d2                	test   %dl,%dl
 841:	75 eb                	jne    82e <printf+0xec>
      state = 0;
 843:	be 00 00 00 00       	mov    $0x0,%esi
 848:	e9 21 ff ff ff       	jmp    76e <printf+0x2c>
        putc(fd, *ap);
 84d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 850:	0f be 17             	movsbl (%edi),%edx
 853:	8b 45 08             	mov    0x8(%ebp),%eax
 856:	e8 42 fe ff ff       	call   69d <putc>
        ap++;
 85b:	83 c7 04             	add    $0x4,%edi
 85e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 861:	be 00 00 00 00       	mov    $0x0,%esi
 866:	e9 03 ff ff ff       	jmp    76e <printf+0x2c>
        putc(fd, c);
 86b:	89 fa                	mov    %edi,%edx
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	e8 28 fe ff ff       	call   69d <putc>
      state = 0;
 875:	be 00 00 00 00       	mov    $0x0,%esi
 87a:	e9 ef fe ff ff       	jmp    76e <printf+0x2c>
        putc(fd, '%');
 87f:	ba 25 00 00 00       	mov    $0x25,%edx
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	e8 11 fe ff ff       	call   69d <putc>
        putc(fd, c);
 88c:	89 fa                	mov    %edi,%edx
 88e:	8b 45 08             	mov    0x8(%ebp),%eax
 891:	e8 07 fe ff ff       	call   69d <putc>
      state = 0;
 896:	be 00 00 00 00       	mov    $0x0,%esi
 89b:	e9 ce fe ff ff       	jmp    76e <printf+0x2c>
    }
  }
}
 8a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a3:	5b                   	pop    %ebx
 8a4:	5e                   	pop    %esi
 8a5:	5f                   	pop    %edi
 8a6:	5d                   	pop    %ebp
 8a7:	c3                   	ret    

000008a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a8:	55                   	push   %ebp
 8a9:	89 e5                	mov    %esp,%ebp
 8ab:	57                   	push   %edi
 8ac:	56                   	push   %esi
 8ad:	53                   	push   %ebx
 8ae:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8b1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b4:	a1 88 0e 00 00       	mov    0xe88,%eax
 8b9:	eb 02                	jmp    8bd <free+0x15>
 8bb:	89 d0                	mov    %edx,%eax
 8bd:	39 c8                	cmp    %ecx,%eax
 8bf:	73 04                	jae    8c5 <free+0x1d>
 8c1:	39 08                	cmp    %ecx,(%eax)
 8c3:	77 12                	ja     8d7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c5:	8b 10                	mov    (%eax),%edx
 8c7:	39 c2                	cmp    %eax,%edx
 8c9:	77 f0                	ja     8bb <free+0x13>
 8cb:	39 c8                	cmp    %ecx,%eax
 8cd:	72 08                	jb     8d7 <free+0x2f>
 8cf:	39 ca                	cmp    %ecx,%edx
 8d1:	77 04                	ja     8d7 <free+0x2f>
 8d3:	89 d0                	mov    %edx,%eax
 8d5:	eb e6                	jmp    8bd <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8da:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8dd:	8b 10                	mov    (%eax),%edx
 8df:	39 d7                	cmp    %edx,%edi
 8e1:	74 19                	je     8fc <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8e3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8e6:	8b 50 04             	mov    0x4(%eax),%edx
 8e9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8ec:	39 ce                	cmp    %ecx,%esi
 8ee:	74 1b                	je     90b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8f0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8f2:	a3 88 0e 00 00       	mov    %eax,0xe88
}
 8f7:	5b                   	pop    %ebx
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8fc:	03 72 04             	add    0x4(%edx),%esi
 8ff:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 902:	8b 10                	mov    (%eax),%edx
 904:	8b 12                	mov    (%edx),%edx
 906:	89 53 f8             	mov    %edx,-0x8(%ebx)
 909:	eb db                	jmp    8e6 <free+0x3e>
    p->s.size += bp->s.size;
 90b:	03 53 fc             	add    -0x4(%ebx),%edx
 90e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 911:	8b 53 f8             	mov    -0x8(%ebx),%edx
 914:	89 10                	mov    %edx,(%eax)
 916:	eb da                	jmp    8f2 <free+0x4a>

00000918 <morecore>:

static Header*
morecore(uint nu)
{
 918:	55                   	push   %ebp
 919:	89 e5                	mov    %esp,%ebp
 91b:	53                   	push   %ebx
 91c:	83 ec 04             	sub    $0x4,%esp
 91f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 921:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 926:	77 05                	ja     92d <morecore+0x15>
    nu = 4096;
 928:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 92d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 934:	83 ec 0c             	sub    $0xc,%esp
 937:	50                   	push   %eax
 938:	e8 38 fd ff ff       	call   675 <sbrk>
  if(p == (char*)-1)
 93d:	83 c4 10             	add    $0x10,%esp
 940:	83 f8 ff             	cmp    $0xffffffff,%eax
 943:	74 1c                	je     961 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 945:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 948:	83 c0 08             	add    $0x8,%eax
 94b:	83 ec 0c             	sub    $0xc,%esp
 94e:	50                   	push   %eax
 94f:	e8 54 ff ff ff       	call   8a8 <free>
  return freep;
 954:	a1 88 0e 00 00       	mov    0xe88,%eax
 959:	83 c4 10             	add    $0x10,%esp
}
 95c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95f:	c9                   	leave  
 960:	c3                   	ret    
    return 0;
 961:	b8 00 00 00 00       	mov    $0x0,%eax
 966:	eb f4                	jmp    95c <morecore+0x44>

00000968 <malloc>:

void*
malloc(uint nbytes)
{
 968:	55                   	push   %ebp
 969:	89 e5                	mov    %esp,%ebp
 96b:	53                   	push   %ebx
 96c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 96f:	8b 45 08             	mov    0x8(%ebp),%eax
 972:	8d 58 07             	lea    0x7(%eax),%ebx
 975:	c1 eb 03             	shr    $0x3,%ebx
 978:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 97b:	8b 0d 88 0e 00 00    	mov    0xe88,%ecx
 981:	85 c9                	test   %ecx,%ecx
 983:	74 04                	je     989 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 985:	8b 01                	mov    (%ecx),%eax
 987:	eb 4a                	jmp    9d3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 989:	c7 05 88 0e 00 00 8c 	movl   $0xe8c,0xe88
 990:	0e 00 00 
 993:	c7 05 8c 0e 00 00 8c 	movl   $0xe8c,0xe8c
 99a:	0e 00 00 
    base.s.size = 0;
 99d:	c7 05 90 0e 00 00 00 	movl   $0x0,0xe90
 9a4:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9a7:	b9 8c 0e 00 00       	mov    $0xe8c,%ecx
 9ac:	eb d7                	jmp    985 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9ae:	74 19                	je     9c9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9b0:	29 da                	sub    %ebx,%edx
 9b2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b5:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9b8:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9bb:	89 0d 88 0e 00 00    	mov    %ecx,0xe88
      return (void*)(p + 1);
 9c1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c7:	c9                   	leave  
 9c8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c9:	8b 10                	mov    (%eax),%edx
 9cb:	89 11                	mov    %edx,(%ecx)
 9cd:	eb ec                	jmp    9bb <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9cf:	89 c1                	mov    %eax,%ecx
 9d1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9d3:	8b 50 04             	mov    0x4(%eax),%edx
 9d6:	39 da                	cmp    %ebx,%edx
 9d8:	73 d4                	jae    9ae <malloc+0x46>
    if(p == freep)
 9da:	39 05 88 0e 00 00    	cmp    %eax,0xe88
 9e0:	75 ed                	jne    9cf <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9e2:	89 d8                	mov    %ebx,%eax
 9e4:	e8 2f ff ff ff       	call   918 <morecore>
 9e9:	85 c0                	test   %eax,%eax
 9eb:	75 e2                	jne    9cf <malloc+0x67>
 9ed:	eb d5                	jmp    9c4 <malloc+0x5c>
