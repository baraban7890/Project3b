
_test_5:     file format elf32-i386


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
  1c:	a1 10 0e 00 00       	mov    0xe10,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 8c 09 00 00       	push   $0x98c
  31:	68 95 09 00 00       	push   $0x995
  36:	6a 01                	push   $0x1
  38:	e8 a2 06 00 00       	call   6df <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 d4 09 00 00       	push   $0x9d4
  45:	68 a8 09 00 00       	push   $0x9a8
  4a:	6a 01                	push   $0x1
  4c:	e8 8e 06 00 00       	call   6df <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 bc 09 00 00       	push   $0x9bc
  59:	6a 01                	push   $0x1
  5b:	e8 7f 06 00 00       	call   6df <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 14 0e 00 00    	push   0xe14
  69:	e8 4c 05 00 00       	call   5ba <kill>
  6e:	e8 17 05 00 00       	call   58a <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 8c 09 00 00       	push   $0x98c
  7a:	68 95 09 00 00       	push   $0x995
  7f:	6a 01                	push   $0x1
  81:	e8 59 06 00 00       	call   6df <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 9d 09 00 00       	push   $0x99d
  8e:	68 a8 09 00 00       	push   $0x9a8
  93:	6a 01                	push   $0x1
  95:	e8 45 06 00 00       	call   6df <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 bc 09 00 00       	push   $0x9bc
  a2:	6a 01                	push   $0x1
  a4:	e8 36 06 00 00       	call   6df <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 14 0e 00 00    	push   0xe14
  b2:	e8 03 05 00 00       	call   5ba <kill>
  b7:	e8 ce 04 00 00       	call   58a <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 8c 09 00 00       	push   $0x98c
  c3:	68 95 09 00 00       	push   $0x995
  c8:	6a 01                	push   $0x1
  ca:	e8 10 06 00 00       	call   6df <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 c9 09 00 00       	push   $0x9c9
  d7:	68 a8 09 00 00       	push   $0x9a8
  dc:	6a 01                	push   $0x1
  de:	e8 fc 05 00 00       	call   6df <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 bc 09 00 00       	push   $0x9bc
  eb:	6a 01                	push   $0x1
  ed:	e8 ed 05 00 00       	call   6df <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 14 0e 00 00    	push   0xe14
  fb:	e8 ba 04 00 00       	call   5ba <kill>
 100:	e8 85 04 00 00       	call   58a <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 10 0e 00 00       	mov    %eax,0xe10
   exit();
 10d:	e8 78 04 00 00       	call   58a <exit>

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
 126:	e8 df 04 00 00       	call   60a <getpid>
 12b:	a3 14 0e 00 00       	mov    %eax,0xe14
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 c8 07 00 00       	call   905 <malloc>
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
 15a:	68 8c 09 00 00       	push   $0x98c
 15f:	68 95 09 00 00       	push   $0x995
 164:	6a 01                	push   $0x1
 166:	e8 74 05 00 00       	call   6df <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 e0 09 00 00       	push   $0x9e0
 173:	68 a8 09 00 00       	push   $0x9a8
 178:	6a 01                	push   $0x1
 17a:	e8 60 05 00 00       	call   6df <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 bc 09 00 00       	push   $0x9bc
 187:	6a 01                	push   $0x1
 189:	e8 51 05 00 00       	call   6df <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 14 0e 00 00    	push   0xe14
 197:	e8 1e 04 00 00       	call   5ba <kill>
 19c:	e8 e9 03 00 00       	call   58a <exit>
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
 1bf:	e8 66 04 00 00       	call   62a <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 59 04 00 00       	call   632 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 8c 09 00 00       	push   $0x98c
 1f4:	68 95 09 00 00       	push   $0x995
 1f9:	6a 01                	push   $0x1
 1fb:	e8 df 04 00 00       	call   6df <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 0e 0a 00 00       	push   $0xa0e
 208:	68 a8 09 00 00       	push   $0x9a8
 20d:	6a 01                	push   $0x1
 20f:	e8 cb 04 00 00       	call   6df <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 bc 09 00 00       	push   $0x9bc
 21c:	6a 01                	push   $0x1
 21e:	e8 bc 04 00 00       	call   6df <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 14 0e 00 00    	push   0xe14
 22c:	e8 89 03 00 00       	call   5ba <kill>
 231:	e8 54 03 00 00       	call   58a <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 8c 09 00 00       	push   $0x98c
 23d:	68 95 09 00 00       	push   $0x995
 242:	6a 01                	push   $0x1
 244:	e8 96 04 00 00       	call   6df <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 ea 09 00 00       	push   $0x9ea
 251:	68 a8 09 00 00       	push   $0x9a8
 256:	6a 01                	push   $0x1
 258:	e8 82 04 00 00       	call   6df <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 bc 09 00 00       	push   $0x9bc
 265:	6a 01                	push   $0x1
 267:	e8 73 04 00 00       	call   6df <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 14 0e 00 00    	push   0xe14
 275:	e8 40 03 00 00       	call   5ba <kill>
 27a:	e8 0b 03 00 00       	call   58a <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 8c 09 00 00       	push   $0x98c
 286:	68 95 09 00 00       	push   $0x995
 28b:	6a 01                	push   $0x1
 28d:	e8 4d 04 00 00       	call   6df <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 f8 09 00 00       	push   $0x9f8
 29a:	68 a8 09 00 00       	push   $0x9a8
 29f:	6a 01                	push   $0x1
 2a1:	e8 39 04 00 00       	call   6df <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 bc 09 00 00       	push   $0x9bc
 2ae:	6a 01                	push   $0x1
 2b0:	e8 2a 04 00 00       	call   6df <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 14 0e 00 00    	push   0xe14
 2be:	e8 f7 02 00 00       	call   5ba <kill>
 2c3:	e8 c2 02 00 00       	call   58a <exit>
   assert(global == 2);
 2c8:	83 3d 10 0e 00 00 02 	cmpl   $0x2,0xe10
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 8c 09 00 00       	push   $0x98c
 2d8:	68 95 09 00 00       	push   $0x995
 2dd:	6a 01                	push   $0x1
 2df:	e8 fb 03 00 00       	call   6df <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 22 0a 00 00       	push   $0xa22
 2ec:	68 a8 09 00 00       	push   $0x9a8
 2f1:	6a 01                	push   $0x1
 2f3:	e8 e7 03 00 00       	call   6df <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 bc 09 00 00       	push   $0x9bc
 300:	6a 01                	push   $0x1
 302:	e8 d8 03 00 00       	call   6df <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 14 0e 00 00    	push   0xe14
 310:	e8 a5 02 00 00       	call   5ba <kill>
 315:	e8 70 02 00 00       	call   58a <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 2e 0a 00 00       	push   $0xa2e
 322:	6a 01                	push   $0x1
 324:	e8 b6 03 00 00       	call   6df <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 14 05 00 00       	call   845 <free>
   exit();
 331:	e8 54 02 00 00       	call   58a <exit>

00000336 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	56                   	push   %esi
 33a:	53                   	push   %ebx
 33b:	8b 75 08             	mov    0x8(%ebp),%esi
 33e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 341:	89 f0                	mov    %esi,%eax
 343:	89 d1                	mov    %edx,%ecx
 345:	83 c2 01             	add    $0x1,%edx
 348:	89 c3                	mov    %eax,%ebx
 34a:	83 c0 01             	add    $0x1,%eax
 34d:	0f b6 09             	movzbl (%ecx),%ecx
 350:	88 0b                	mov    %cl,(%ebx)
 352:	84 c9                	test   %cl,%cl
 354:	75 ed                	jne    343 <strcpy+0xd>
    ;
  return os;
}
 356:	89 f0                	mov    %esi,%eax
 358:	5b                   	pop    %ebx
 359:	5e                   	pop    %esi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcmp>:

int strcmp(const char *p, const char *q)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 362:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 365:	eb 06                	jmp    36d <strcmp+0x11>
    p++, q++;
 367:	83 c1 01             	add    $0x1,%ecx
 36a:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 36d:	0f b6 01             	movzbl (%ecx),%eax
 370:	84 c0                	test   %al,%al
 372:	74 04                	je     378 <strcmp+0x1c>
 374:	3a 02                	cmp    (%edx),%al
 376:	74 ef                	je     367 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 378:	0f b6 c0             	movzbl %al,%eax
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	29 d0                	sub    %edx,%eax
}
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <strlen>:

uint strlen(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 388:	b8 00 00 00 00       	mov    $0x0,%eax
 38d:	eb 03                	jmp    392 <strlen+0x10>
 38f:	83 c0 01             	add    $0x1,%eax
 392:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 396:	75 f7                	jne    38f <strlen+0xd>
    ;
  return n;
}
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <memset>:

void *
memset(void *dst, int c, uint n)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	57                   	push   %edi
 39e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a1:	89 d7                	mov    %edx,%edi
 3a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	fc                   	cld    
 3aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ac:	89 d0                	mov    %edx,%eax
 3ae:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3b1:	c9                   	leave  
 3b2:	c3                   	ret    

000003b3 <strchr>:

char *
strchr(const char *s, char c)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 3bd:	eb 03                	jmp    3c2 <strchr+0xf>
 3bf:	83 c0 01             	add    $0x1,%eax
 3c2:	0f b6 10             	movzbl (%eax),%edx
 3c5:	84 d2                	test   %dl,%dl
 3c7:	74 06                	je     3cf <strchr+0x1c>
    if (*s == c)
 3c9:	38 ca                	cmp    %cl,%dl
 3cb:	75 f2                	jne    3bf <strchr+0xc>
 3cd:	eb 05                	jmp    3d4 <strchr+0x21>
      return (char *)s;
  return 0;
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <gets>:

char *
gets(char *buf, int max)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	57                   	push   %edi
 3da:	56                   	push   %esi
 3db:	53                   	push   %ebx
 3dc:	83 ec 1c             	sub    $0x1c,%esp
 3df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 3e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e7:	89 de                	mov    %ebx,%esi
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ef:	7d 2e                	jge    41f <gets+0x49>
  {
    cc = read(0, &c, 1);
 3f1:	83 ec 04             	sub    $0x4,%esp
 3f4:	6a 01                	push   $0x1
 3f6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f9:	50                   	push   %eax
 3fa:	6a 00                	push   $0x0
 3fc:	e8 a1 01 00 00       	call   5a2 <read>
    if (cc < 1)
 401:	83 c4 10             	add    $0x10,%esp
 404:	85 c0                	test   %eax,%eax
 406:	7e 17                	jle    41f <gets+0x49>
      break;
    buf[i++] = c;
 408:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 40c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	0f 94 c2             	sete   %dl
 414:	3c 0d                	cmp    $0xd,%al
 416:	0f 94 c0             	sete   %al
 419:	08 c2                	or     %al,%dl
 41b:	74 ca                	je     3e7 <gets+0x11>
    buf[i++] = c;
 41d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 41f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 423:	89 f8                	mov    %edi,%eax
 425:	8d 65 f4             	lea    -0xc(%ebp),%esp
 428:	5b                   	pop    %ebx
 429:	5e                   	pop    %esi
 42a:	5f                   	pop    %edi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    

0000042d <stat>:

int stat(const char *n, struct stat *st)
{
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 432:	83 ec 08             	sub    $0x8,%esp
 435:	6a 00                	push   $0x0
 437:	ff 75 08             	push   0x8(%ebp)
 43a:	e8 8b 01 00 00       	call   5ca <open>
  if (fd < 0)
 43f:	83 c4 10             	add    $0x10,%esp
 442:	85 c0                	test   %eax,%eax
 444:	78 24                	js     46a <stat+0x3d>
 446:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	ff 75 0c             	push   0xc(%ebp)
 44e:	50                   	push   %eax
 44f:	e8 8e 01 00 00       	call   5e2 <fstat>
 454:	89 c6                	mov    %eax,%esi
  close(fd);
 456:	89 1c 24             	mov    %ebx,(%esp)
 459:	e8 54 01 00 00       	call   5b2 <close>
  return r;
 45e:	83 c4 10             	add    $0x10,%esp
}
 461:	89 f0                	mov    %esi,%eax
 463:	8d 65 f8             	lea    -0x8(%ebp),%esp
 466:	5b                   	pop    %ebx
 467:	5e                   	pop    %esi
 468:	5d                   	pop    %ebp
 469:	c3                   	ret    
    return -1;
 46a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46f:	eb f0                	jmp    461 <stat+0x34>

00000471 <atoi>:

int atoi(const char *s)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	53                   	push   %ebx
 475:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 478:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 47d:	eb 10                	jmp    48f <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 47f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 482:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 485:	83 c1 01             	add    $0x1,%ecx
 488:	0f be c0             	movsbl %al,%eax
 48b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 48f:	0f b6 01             	movzbl (%ecx),%eax
 492:	8d 58 d0             	lea    -0x30(%eax),%ebx
 495:	80 fb 09             	cmp    $0x9,%bl
 498:	76 e5                	jbe    47f <atoi+0xe>
  return n;
}
 49a:	89 d0                	mov    %edx,%eax
 49c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49f:	c9                   	leave  
 4a0:	c3                   	ret    

000004a1 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	8b 75 08             	mov    0x8(%ebp),%esi
 4a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ac:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4af:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 4b1:	eb 0d                	jmp    4c0 <memmove+0x1f>
    *dst++ = *src++;
 4b3:	0f b6 01             	movzbl (%ecx),%eax
 4b6:	88 02                	mov    %al,(%edx)
 4b8:	8d 49 01             	lea    0x1(%ecx),%ecx
 4bb:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 4be:	89 d8                	mov    %ebx,%eax
 4c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4c3:	85 c0                	test   %eax,%eax
 4c5:	7f ec                	jg     4b3 <memmove+0x12>
  return vdst;
}
 4c7:	89 f0                	mov    %esi,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    

000004cd <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 4d3:	83 38 01             	cmpl   $0x1,(%eax)
 4d6:	74 fb                	je     4d3 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 4d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

000004e0 <lock_release>:
void lock_release(lock_t *lock)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    

000004ee <lock_init>:
void lock_init(lock_t *lock)
{
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 4fa:	5d                   	pop    %ebp
 4fb:	c3                   	ret    

000004fc <thread_create>:
{
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	53                   	push   %ebx
 500:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 503:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 506:	53                   	push   %ebx
 507:	e8 e2 ff ff ff       	call   4ee <lock_init>
  lock_acquire(&lock);
 50c:	89 1c 24             	mov    %ebx,(%esp)
 50f:	e8 b9 ff ff ff       	call   4cd <lock_acquire>
  void *stack = malloc(4096 * 2);
 514:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 51b:	e8 e5 03 00 00       	call   905 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 520:	50                   	push   %eax
 521:	ff 75 10             	push   0x10(%ebp)
 524:	ff 75 0c             	push   0xc(%ebp)
 527:	ff 75 08             	push   0x8(%ebp)
 52a:	e8 fb 00 00 00       	call   62a <clone>
}
 52f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 532:	c9                   	leave  
 533:	c3                   	ret    

00000534 <thread_join>:
{
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	56                   	push   %esi
 538:	53                   	push   %ebx
 539:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 53c:	6a 04                	push   $0x4
 53e:	e8 c2 03 00 00       	call   905 <malloc>
 543:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 546:	8d 45 f4             	lea    -0xc(%ebp),%eax
 549:	89 04 24             	mov    %eax,(%esp)
 54c:	e8 e1 00 00 00       	call   632 <join>
 551:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 553:	8d 75 f0             	lea    -0x10(%ebp),%esi
 556:	89 34 24             	mov    %esi,(%esp)
 559:	e8 90 ff ff ff       	call   4ee <lock_init>
  lock_acquire(&lock);
 55e:	89 34 24             	mov    %esi,(%esp)
 561:	e8 67 ff ff ff       	call   4cd <lock_acquire>
  free(stack);
 566:	83 c4 04             	add    $0x4,%esp
 569:	ff 75 f4             	push   -0xc(%ebp)
 56c:	e8 d4 02 00 00       	call   845 <free>
  lock_release(&lock);
 571:	89 34 24             	mov    %esi,(%esp)
 574:	e8 67 ff ff ff       	call   4e0 <lock_release>
}
 579:	89 d8                	mov    %ebx,%eax
 57b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 57e:	5b                   	pop    %ebx
 57f:	5e                   	pop    %esi
 580:	5d                   	pop    %ebp
 581:	c3                   	ret    

00000582 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 582:	b8 01 00 00 00       	mov    $0x1,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <exit>:
SYSCALL(exit)
 58a:	b8 02 00 00 00       	mov    $0x2,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <wait>:
SYSCALL(wait)
 592:	b8 03 00 00 00       	mov    $0x3,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <pipe>:
SYSCALL(pipe)
 59a:	b8 04 00 00 00       	mov    $0x4,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <read>:
SYSCALL(read)
 5a2:	b8 05 00 00 00       	mov    $0x5,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <write>:
SYSCALL(write)
 5aa:	b8 10 00 00 00       	mov    $0x10,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <close>:
SYSCALL(close)
 5b2:	b8 15 00 00 00       	mov    $0x15,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <kill>:
SYSCALL(kill)
 5ba:	b8 06 00 00 00       	mov    $0x6,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <exec>:
SYSCALL(exec)
 5c2:	b8 07 00 00 00       	mov    $0x7,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <open>:
SYSCALL(open)
 5ca:	b8 0f 00 00 00       	mov    $0xf,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <mknod>:
SYSCALL(mknod)
 5d2:	b8 11 00 00 00       	mov    $0x11,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <unlink>:
SYSCALL(unlink)
 5da:	b8 12 00 00 00       	mov    $0x12,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <fstat>:
SYSCALL(fstat)
 5e2:	b8 08 00 00 00       	mov    $0x8,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <link>:
SYSCALL(link)
 5ea:	b8 13 00 00 00       	mov    $0x13,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <mkdir>:
SYSCALL(mkdir)
 5f2:	b8 14 00 00 00       	mov    $0x14,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <chdir>:
SYSCALL(chdir)
 5fa:	b8 09 00 00 00       	mov    $0x9,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <dup>:
SYSCALL(dup)
 602:	b8 0a 00 00 00       	mov    $0xa,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <getpid>:
SYSCALL(getpid)
 60a:	b8 0b 00 00 00       	mov    $0xb,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <sbrk>:
SYSCALL(sbrk)
 612:	b8 0c 00 00 00       	mov    $0xc,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <sleep>:
SYSCALL(sleep)
 61a:	b8 0d 00 00 00       	mov    $0xd,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <uptime>:
SYSCALL(uptime)
 622:	b8 0e 00 00 00       	mov    $0xe,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <clone>:
SYSCALL(clone)
 62a:	b8 16 00 00 00       	mov    $0x16,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <join>:
 632:	b8 17 00 00 00       	mov    $0x17,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	83 ec 1c             	sub    $0x1c,%esp
 640:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 643:	6a 01                	push   $0x1
 645:	8d 55 f4             	lea    -0xc(%ebp),%edx
 648:	52                   	push   %edx
 649:	50                   	push   %eax
 64a:	e8 5b ff ff ff       	call   5aa <write>
}
 64f:	83 c4 10             	add    $0x10,%esp
 652:	c9                   	leave  
 653:	c3                   	ret    

00000654 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	57                   	push   %edi
 658:	56                   	push   %esi
 659:	53                   	push   %ebx
 65a:	83 ec 2c             	sub    $0x2c,%esp
 65d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 660:	89 d0                	mov    %edx,%eax
 662:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 664:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 668:	0f 95 c1             	setne  %cl
 66b:	c1 ea 1f             	shr    $0x1f,%edx
 66e:	84 d1                	test   %dl,%cl
 670:	74 44                	je     6b6 <printint+0x62>
    neg = 1;
    x = -xx;
 672:	f7 d8                	neg    %eax
 674:	89 c1                	mov    %eax,%ecx
    neg = 1;
 676:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 67d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 682:	89 c8                	mov    %ecx,%eax
 684:	ba 00 00 00 00       	mov    $0x0,%edx
 689:	f7 f6                	div    %esi
 68b:	89 df                	mov    %ebx,%edi
 68d:	83 c3 01             	add    $0x1,%ebx
 690:	0f b6 92 9c 0a 00 00 	movzbl 0xa9c(%edx),%edx
 697:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 69b:	89 ca                	mov    %ecx,%edx
 69d:	89 c1                	mov    %eax,%ecx
 69f:	39 d6                	cmp    %edx,%esi
 6a1:	76 df                	jbe    682 <printint+0x2e>
  if(neg)
 6a3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6a7:	74 31                	je     6da <printint+0x86>
    buf[i++] = '-';
 6a9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6ae:	8d 5f 02             	lea    0x2(%edi),%ebx
 6b1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6b4:	eb 17                	jmp    6cd <printint+0x79>
    x = xx;
 6b6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6bf:	eb bc                	jmp    67d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6c1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6c6:	89 f0                	mov    %esi,%eax
 6c8:	e8 6d ff ff ff       	call   63a <putc>
  while(--i >= 0)
 6cd:	83 eb 01             	sub    $0x1,%ebx
 6d0:	79 ef                	jns    6c1 <printint+0x6d>
}
 6d2:	83 c4 2c             	add    $0x2c,%esp
 6d5:	5b                   	pop    %ebx
 6d6:	5e                   	pop    %esi
 6d7:	5f                   	pop    %edi
 6d8:	5d                   	pop    %ebp
 6d9:	c3                   	ret    
 6da:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6dd:	eb ee                	jmp    6cd <printint+0x79>

000006df <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6df:	55                   	push   %ebp
 6e0:	89 e5                	mov    %esp,%ebp
 6e2:	57                   	push   %edi
 6e3:	56                   	push   %esi
 6e4:	53                   	push   %ebx
 6e5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e8:	8d 45 10             	lea    0x10(%ebp),%eax
 6eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6ee:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6f3:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f8:	eb 14                	jmp    70e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6fa:	89 fa                	mov    %edi,%edx
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	e8 36 ff ff ff       	call   63a <putc>
 704:	eb 05                	jmp    70b <printf+0x2c>
      }
    } else if(state == '%'){
 706:	83 fe 25             	cmp    $0x25,%esi
 709:	74 25                	je     730 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 70b:	83 c3 01             	add    $0x1,%ebx
 70e:	8b 45 0c             	mov    0xc(%ebp),%eax
 711:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 715:	84 c0                	test   %al,%al
 717:	0f 84 20 01 00 00    	je     83d <printf+0x15e>
    c = fmt[i] & 0xff;
 71d:	0f be f8             	movsbl %al,%edi
 720:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 723:	85 f6                	test   %esi,%esi
 725:	75 df                	jne    706 <printf+0x27>
      if(c == '%'){
 727:	83 f8 25             	cmp    $0x25,%eax
 72a:	75 ce                	jne    6fa <printf+0x1b>
        state = '%';
 72c:	89 c6                	mov    %eax,%esi
 72e:	eb db                	jmp    70b <printf+0x2c>
      if(c == 'd'){
 730:	83 f8 25             	cmp    $0x25,%eax
 733:	0f 84 cf 00 00 00    	je     808 <printf+0x129>
 739:	0f 8c dd 00 00 00    	jl     81c <printf+0x13d>
 73f:	83 f8 78             	cmp    $0x78,%eax
 742:	0f 8f d4 00 00 00    	jg     81c <printf+0x13d>
 748:	83 f8 63             	cmp    $0x63,%eax
 74b:	0f 8c cb 00 00 00    	jl     81c <printf+0x13d>
 751:	83 e8 63             	sub    $0x63,%eax
 754:	83 f8 15             	cmp    $0x15,%eax
 757:	0f 87 bf 00 00 00    	ja     81c <printf+0x13d>
 75d:	ff 24 85 44 0a 00 00 	jmp    *0xa44(,%eax,4)
        printint(fd, *ap, 10, 1);
 764:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 767:	8b 17                	mov    (%edi),%edx
 769:	83 ec 0c             	sub    $0xc,%esp
 76c:	6a 01                	push   $0x1
 76e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	e8 d9 fe ff ff       	call   654 <printint>
        ap++;
 77b:	83 c7 04             	add    $0x4,%edi
 77e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 781:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 784:	be 00 00 00 00       	mov    $0x0,%esi
 789:	eb 80                	jmp    70b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 78b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 78e:	8b 17                	mov    (%edi),%edx
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	6a 00                	push   $0x0
 795:	b9 10 00 00 00       	mov    $0x10,%ecx
 79a:	8b 45 08             	mov    0x8(%ebp),%eax
 79d:	e8 b2 fe ff ff       	call   654 <printint>
        ap++;
 7a2:	83 c7 04             	add    $0x4,%edi
 7a5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ab:	be 00 00 00 00       	mov    $0x0,%esi
 7b0:	e9 56 ff ff ff       	jmp    70b <printf+0x2c>
        s = (char*)*ap;
 7b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b8:	8b 30                	mov    (%eax),%esi
        ap++;
 7ba:	83 c0 04             	add    $0x4,%eax
 7bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7c0:	85 f6                	test   %esi,%esi
 7c2:	75 15                	jne    7d9 <printf+0xfa>
          s = "(null)";
 7c4:	be 3b 0a 00 00       	mov    $0xa3b,%esi
 7c9:	eb 0e                	jmp    7d9 <printf+0xfa>
          putc(fd, *s);
 7cb:	0f be d2             	movsbl %dl,%edx
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	e8 64 fe ff ff       	call   63a <putc>
          s++;
 7d6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7d9:	0f b6 16             	movzbl (%esi),%edx
 7dc:	84 d2                	test   %dl,%dl
 7de:	75 eb                	jne    7cb <printf+0xec>
      state = 0;
 7e0:	be 00 00 00 00       	mov    $0x0,%esi
 7e5:	e9 21 ff ff ff       	jmp    70b <printf+0x2c>
        putc(fd, *ap);
 7ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ed:	0f be 17             	movsbl (%edi),%edx
 7f0:	8b 45 08             	mov    0x8(%ebp),%eax
 7f3:	e8 42 fe ff ff       	call   63a <putc>
        ap++;
 7f8:	83 c7 04             	add    $0x4,%edi
 7fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7fe:	be 00 00 00 00       	mov    $0x0,%esi
 803:	e9 03 ff ff ff       	jmp    70b <printf+0x2c>
        putc(fd, c);
 808:	89 fa                	mov    %edi,%edx
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	e8 28 fe ff ff       	call   63a <putc>
      state = 0;
 812:	be 00 00 00 00       	mov    $0x0,%esi
 817:	e9 ef fe ff ff       	jmp    70b <printf+0x2c>
        putc(fd, '%');
 81c:	ba 25 00 00 00       	mov    $0x25,%edx
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	e8 11 fe ff ff       	call   63a <putc>
        putc(fd, c);
 829:	89 fa                	mov    %edi,%edx
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	e8 07 fe ff ff       	call   63a <putc>
      state = 0;
 833:	be 00 00 00 00       	mov    $0x0,%esi
 838:	e9 ce fe ff ff       	jmp    70b <printf+0x2c>
    }
  }
}
 83d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 840:	5b                   	pop    %ebx
 841:	5e                   	pop    %esi
 842:	5f                   	pop    %edi
 843:	5d                   	pop    %ebp
 844:	c3                   	ret    

00000845 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 845:	55                   	push   %ebp
 846:	89 e5                	mov    %esp,%ebp
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	53                   	push   %ebx
 84b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 84e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	a1 18 0e 00 00       	mov    0xe18,%eax
 856:	eb 02                	jmp    85a <free+0x15>
 858:	89 d0                	mov    %edx,%eax
 85a:	39 c8                	cmp    %ecx,%eax
 85c:	73 04                	jae    862 <free+0x1d>
 85e:	39 08                	cmp    %ecx,(%eax)
 860:	77 12                	ja     874 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 862:	8b 10                	mov    (%eax),%edx
 864:	39 c2                	cmp    %eax,%edx
 866:	77 f0                	ja     858 <free+0x13>
 868:	39 c8                	cmp    %ecx,%eax
 86a:	72 08                	jb     874 <free+0x2f>
 86c:	39 ca                	cmp    %ecx,%edx
 86e:	77 04                	ja     874 <free+0x2f>
 870:	89 d0                	mov    %edx,%eax
 872:	eb e6                	jmp    85a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 874:	8b 73 fc             	mov    -0x4(%ebx),%esi
 877:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87a:	8b 10                	mov    (%eax),%edx
 87c:	39 d7                	cmp    %edx,%edi
 87e:	74 19                	je     899 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 880:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 883:	8b 50 04             	mov    0x4(%eax),%edx
 886:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 889:	39 ce                	cmp    %ecx,%esi
 88b:	74 1b                	je     8a8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 88d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 88f:	a3 18 0e 00 00       	mov    %eax,0xe18
}
 894:	5b                   	pop    %ebx
 895:	5e                   	pop    %esi
 896:	5f                   	pop    %edi
 897:	5d                   	pop    %ebp
 898:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 899:	03 72 04             	add    0x4(%edx),%esi
 89c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 89f:	8b 10                	mov    (%eax),%edx
 8a1:	8b 12                	mov    (%edx),%edx
 8a3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8a6:	eb db                	jmp    883 <free+0x3e>
    p->s.size += bp->s.size;
 8a8:	03 53 fc             	add    -0x4(%ebx),%edx
 8ab:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ae:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8b1:	89 10                	mov    %edx,(%eax)
 8b3:	eb da                	jmp    88f <free+0x4a>

000008b5 <morecore>:

static Header*
morecore(uint nu)
{
 8b5:	55                   	push   %ebp
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	53                   	push   %ebx
 8b9:	83 ec 04             	sub    $0x4,%esp
 8bc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8be:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8c3:	77 05                	ja     8ca <morecore+0x15>
    nu = 4096;
 8c5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8ca:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8d1:	83 ec 0c             	sub    $0xc,%esp
 8d4:	50                   	push   %eax
 8d5:	e8 38 fd ff ff       	call   612 <sbrk>
  if(p == (char*)-1)
 8da:	83 c4 10             	add    $0x10,%esp
 8dd:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e0:	74 1c                	je     8fe <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8e2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8e5:	83 c0 08             	add    $0x8,%eax
 8e8:	83 ec 0c             	sub    $0xc,%esp
 8eb:	50                   	push   %eax
 8ec:	e8 54 ff ff ff       	call   845 <free>
  return freep;
 8f1:	a1 18 0e 00 00       	mov    0xe18,%eax
 8f6:	83 c4 10             	add    $0x10,%esp
}
 8f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8fc:	c9                   	leave  
 8fd:	c3                   	ret    
    return 0;
 8fe:	b8 00 00 00 00       	mov    $0x0,%eax
 903:	eb f4                	jmp    8f9 <morecore+0x44>

00000905 <malloc>:

void*
malloc(uint nbytes)
{
 905:	55                   	push   %ebp
 906:	89 e5                	mov    %esp,%ebp
 908:	53                   	push   %ebx
 909:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90c:	8b 45 08             	mov    0x8(%ebp),%eax
 90f:	8d 58 07             	lea    0x7(%eax),%ebx
 912:	c1 eb 03             	shr    $0x3,%ebx
 915:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 918:	8b 0d 18 0e 00 00    	mov    0xe18,%ecx
 91e:	85 c9                	test   %ecx,%ecx
 920:	74 04                	je     926 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 922:	8b 01                	mov    (%ecx),%eax
 924:	eb 4a                	jmp    970 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 926:	c7 05 18 0e 00 00 1c 	movl   $0xe1c,0xe18
 92d:	0e 00 00 
 930:	c7 05 1c 0e 00 00 1c 	movl   $0xe1c,0xe1c
 937:	0e 00 00 
    base.s.size = 0;
 93a:	c7 05 20 0e 00 00 00 	movl   $0x0,0xe20
 941:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 944:	b9 1c 0e 00 00       	mov    $0xe1c,%ecx
 949:	eb d7                	jmp    922 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 94b:	74 19                	je     966 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 94d:	29 da                	sub    %ebx,%edx
 94f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 952:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 955:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 958:	89 0d 18 0e 00 00    	mov    %ecx,0xe18
      return (void*)(p + 1);
 95e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 961:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 964:	c9                   	leave  
 965:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 966:	8b 10                	mov    (%eax),%edx
 968:	89 11                	mov    %edx,(%ecx)
 96a:	eb ec                	jmp    958 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96c:	89 c1                	mov    %eax,%ecx
 96e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 970:	8b 50 04             	mov    0x4(%eax),%edx
 973:	39 da                	cmp    %ebx,%edx
 975:	73 d4                	jae    94b <malloc+0x46>
    if(p == freep)
 977:	39 05 18 0e 00 00    	cmp    %eax,0xe18
 97d:	75 ed                	jne    96c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 97f:	89 d8                	mov    %ebx,%eax
 981:	e8 2f ff ff ff       	call   8b5 <morecore>
 986:	85 c0                	test   %eax,%eax
 988:	75 e2                	jne    96c <malloc+0x67>
 98a:	eb d5                	jmp    961 <malloc+0x5c>
