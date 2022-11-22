
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
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
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
  1c:	a1 f4 0e 00 00       	mov    0xef4,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 40 0a 00 00       	push   $0xa40
  31:	68 4a 0a 00 00       	push   $0xa4a
  36:	6a 01                	push   $0x1
  38:	e8 56 07 00 00       	call   793 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 91 0a 00 00       	push   $0xa91
  45:	68 61 0a 00 00       	push   $0xa61
  4a:	6a 01                	push   $0x1
  4c:	e8 42 07 00 00       	call   793 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 75 0a 00 00       	push   $0xa75
  59:	6a 01                	push   $0x1
  5b:	e8 33 07 00 00       	call   793 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 f8 0e 00 00    	push   0xef8
  69:	e8 00 06 00 00       	call   66e <kill>
  6e:	e8 cb 05 00 00       	call   63e <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 40 0a 00 00       	push   $0xa40
  7a:	68 4a 0a 00 00       	push   $0xa4a
  7f:	6a 01                	push   $0x1
  81:	e8 0d 07 00 00       	call   793 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 52 0a 00 00       	push   $0xa52
  8e:	68 61 0a 00 00       	push   $0xa61
  93:	6a 01                	push   $0x1
  95:	e8 f9 06 00 00       	call   793 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 75 0a 00 00       	push   $0xa75
  a2:	6a 01                	push   $0x1
  a4:	e8 ea 06 00 00       	call   793 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 f8 0e 00 00    	push   0xef8
  b2:	e8 b7 05 00 00       	call   66e <kill>
  b7:	e8 82 05 00 00       	call   63e <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 40 0a 00 00       	push   $0xa40
  c3:	68 4a 0a 00 00       	push   $0xa4a
  c8:	6a 01                	push   $0x1
  ca:	e8 c4 06 00 00       	call   793 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 82 0a 00 00       	push   $0xa82
  d7:	68 61 0a 00 00       	push   $0xa61
  dc:	6a 01                	push   $0x1
  de:	e8 b0 06 00 00       	call   793 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 75 0a 00 00       	push   $0xa75
  eb:	6a 01                	push   $0x1
  ed:	e8 a1 06 00 00       	call   793 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 f8 0e 00 00    	push   0xef8
  fb:	e8 6e 05 00 00       	call   66e <kill>
 100:	e8 39 05 00 00       	call   63e <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f4 0e 00 00       	mov    %eax,0xef4
   exit();
 10d:	e8 2c 05 00 00       	call   63e <exit>

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
 137:	a1 f4 0e 00 00       	mov    0xef4,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 40 0a 00 00       	push   $0xa40
 14c:	68 4a 0a 00 00       	push   $0xa4a
 151:	6a 01                	push   $0x1
 153:	e8 3b 06 00 00       	call   793 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 9d 0a 00 00       	push   $0xa9d
 160:	68 61 0a 00 00       	push   $0xa61
 165:	6a 01                	push   $0x1
 167:	e8 27 06 00 00       	call   793 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 75 0a 00 00       	push   $0xa75
 174:	6a 01                	push   $0x1
 176:	e8 18 06 00 00       	call   793 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 f8 0e 00 00    	push   0xef8
 184:	e8 e5 04 00 00       	call   66e <kill>
 189:	e8 b0 04 00 00       	call   63e <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 40 0a 00 00       	push   $0xa40
 195:	68 4a 0a 00 00       	push   $0xa4a
 19a:	6a 01                	push   $0x1
 19c:	e8 f2 05 00 00       	call   793 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 52 0a 00 00       	push   $0xa52
 1a9:	68 61 0a 00 00       	push   $0xa61
 1ae:	6a 01                	push   $0x1
 1b0:	e8 de 05 00 00       	call   793 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 75 0a 00 00       	push   $0xa75
 1bd:	6a 01                	push   $0x1
 1bf:	e8 cf 05 00 00       	call   793 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 f8 0e 00 00    	push   0xef8
 1cd:	e8 9c 04 00 00       	call   66e <kill>
 1d2:	e8 67 04 00 00       	call   63e <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 40 0a 00 00       	push   $0xa40
 1de:	68 4a 0a 00 00       	push   $0xa4a
 1e3:	6a 01                	push   $0x1
 1e5:	e8 a9 05 00 00       	call   793 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 82 0a 00 00       	push   $0xa82
 1f2:	68 61 0a 00 00       	push   $0xa61
 1f7:	6a 01                	push   $0x1
 1f9:	e8 95 05 00 00       	call   793 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 75 0a 00 00       	push   $0xa75
 206:	6a 01                	push   $0x1
 208:	e8 86 05 00 00       	call   793 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 f8 0e 00 00    	push   0xef8
 216:	e8 53 04 00 00       	call   66e <kill>
 21b:	e8 1e 04 00 00       	call   63e <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 f4 0e 00 00       	mov    %eax,0xef4
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 73 03 00 00       	call   5b0 <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 23f:	e8 a4 03 00 00       	call   5e8 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 40 0a 00 00       	push   $0xa40
 252:	68 4a 0a 00 00       	push   $0xa4a
 257:	6a 01                	push   $0x1
 259:	e8 35 05 00 00       	call   793 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 e8 0a 00 00       	push   $0xae8
 266:	68 61 0a 00 00       	push   $0xa61
 26b:	6a 01                	push   $0x1
 26d:	e8 21 05 00 00       	call   793 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 75 0a 00 00       	push   $0xa75
 27a:	6a 01                	push   $0x1
 27c:	e8 12 05 00 00       	call   793 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 f8 0e 00 00    	push   0xef8
 28a:	e8 df 03 00 00       	call   66e <kill>
 28f:	e8 aa 03 00 00       	call   63e <exit>
   exit();
 294:	e8 a5 03 00 00       	call   63e <exit>

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2ab:	e8 0e 04 00 00       	call   6be <getpid>
 2b0:	a3 f8 0e 00 00       	mov    %eax,0xef8
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 d8 02 00 00       	call   5b0 <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 2e1:	e8 02 03 00 00       	call   5e8 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d f4 0e 00 00 03 	cmpl   $0x3,0xef4
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 40 0a 00 00       	push   $0xa40
 302:	68 4a 0a 00 00       	push   $0xa4a
 307:	6a 01                	push   $0x1
 309:	e8 85 04 00 00       	call   793 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 cf 0a 00 00       	push   $0xacf
 316:	68 61 0a 00 00       	push   $0xa61
 31b:	6a 01                	push   $0x1
 31d:	e8 71 04 00 00       	call   793 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 75 0a 00 00       	push   $0xa75
 32a:	6a 01                	push   $0x1
 32c:	e8 62 04 00 00       	call   793 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 f8 0e 00 00    	push   0xef8
 33a:	e8 2f 03 00 00       	call   66e <kill>
 33f:	e8 fa 02 00 00       	call   63e <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 40 0a 00 00       	push   $0xa40
 34b:	68 4a 0a 00 00       	push   $0xa4a
 350:	6a 01                	push   $0x1
 352:	e8 3c 04 00 00       	call   793 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 a9 0a 00 00       	push   $0xaa9
 35f:	68 61 0a 00 00       	push   $0xa61
 364:	6a 01                	push   $0x1
 366:	e8 28 04 00 00       	call   793 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 75 0a 00 00       	push   $0xa75
 373:	6a 01                	push   $0x1
 375:	e8 19 04 00 00       	call   793 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 f8 0e 00 00    	push   0xef8
 383:	e8 e6 02 00 00       	call   66e <kill>
 388:	e8 b1 02 00 00       	call   63e <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 40 0a 00 00       	push   $0xa40
 394:	68 4a 0a 00 00       	push   $0xa4a
 399:	6a 01                	push   $0x1
 39b:	e8 f3 03 00 00       	call   793 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 b8 0a 00 00       	push   $0xab8
 3a8:	68 61 0a 00 00       	push   $0xa61
 3ad:	6a 01                	push   $0x1
 3af:	e8 df 03 00 00       	call   793 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 75 0a 00 00       	push   $0xa75
 3bc:	6a 01                	push   $0x1
 3be:	e8 d0 03 00 00       	call   793 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 f8 0e 00 00    	push   0xef8
 3cc:	e8 9d 02 00 00       	call   66e <kill>
 3d1:	e8 68 02 00 00       	call   63e <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 db 0a 00 00       	push   $0xadb
 3de:	6a 01                	push   $0x1
 3e0:	e8 ae 03 00 00       	call   793 <printf>
   exit();
 3e5:	e8 54 02 00 00       	call   63e <exit>

000003ea <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	56                   	push   %esi
 3ee:	53                   	push   %ebx
 3ef:	8b 75 08             	mov    0x8(%ebp),%esi
 3f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 3f5:	89 f0                	mov    %esi,%eax
 3f7:	89 d1                	mov    %edx,%ecx
 3f9:	83 c2 01             	add    $0x1,%edx
 3fc:	89 c3                	mov    %eax,%ebx
 3fe:	83 c0 01             	add    $0x1,%eax
 401:	0f b6 09             	movzbl (%ecx),%ecx
 404:	88 0b                	mov    %cl,(%ebx)
 406:	84 c9                	test   %cl,%cl
 408:	75 ed                	jne    3f7 <strcpy+0xd>
    ;
  return os;
}
 40a:	89 f0                	mov    %esi,%eax
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    

00000410 <strcmp>:

int strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 4d 08             	mov    0x8(%ebp),%ecx
 416:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 419:	eb 06                	jmp    421 <strcmp+0x11>
    p++, q++;
 41b:	83 c1 01             	add    $0x1,%ecx
 41e:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 421:	0f b6 01             	movzbl (%ecx),%eax
 424:	84 c0                	test   %al,%al
 426:	74 04                	je     42c <strcmp+0x1c>
 428:	3a 02                	cmp    (%edx),%al
 42a:	74 ef                	je     41b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 42c:	0f b6 c0             	movzbl %al,%eax
 42f:	0f b6 12             	movzbl (%edx),%edx
 432:	29 d0                	sub    %edx,%eax
}
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <strlen>:

uint strlen(const char *s)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 43c:	b8 00 00 00 00       	mov    $0x0,%eax
 441:	eb 03                	jmp    446 <strlen+0x10>
 443:	83 c0 01             	add    $0x1,%eax
 446:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 44a:	75 f7                	jne    443 <strlen+0xd>
    ;
  return n;
}
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    

0000044e <memset>:

void *
memset(void *dst, int c, uint n)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	57                   	push   %edi
 452:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 455:	89 d7                	mov    %edx,%edi
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	fc                   	cld    
 45e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 460:	89 d0                	mov    %edx,%eax
 462:	8b 7d fc             	mov    -0x4(%ebp),%edi
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <strchr>:

char *
strchr(const char *s, char c)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 471:	eb 03                	jmp    476 <strchr+0xf>
 473:	83 c0 01             	add    $0x1,%eax
 476:	0f b6 10             	movzbl (%eax),%edx
 479:	84 d2                	test   %dl,%dl
 47b:	74 06                	je     483 <strchr+0x1c>
    if (*s == c)
 47d:	38 ca                	cmp    %cl,%dl
 47f:	75 f2                	jne    473 <strchr+0xc>
 481:	eb 05                	jmp    488 <strchr+0x21>
      return (char *)s;
  return 0;
 483:	b8 00 00 00 00       	mov    $0x0,%eax
}
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <gets>:

char *
gets(char *buf, int max)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	57                   	push   %edi
 48e:	56                   	push   %esi
 48f:	53                   	push   %ebx
 490:	83 ec 1c             	sub    $0x1c,%esp
 493:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 496:	bb 00 00 00 00       	mov    $0x0,%ebx
 49b:	89 de                	mov    %ebx,%esi
 49d:	83 c3 01             	add    $0x1,%ebx
 4a0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a3:	7d 2e                	jge    4d3 <gets+0x49>
  {
    cc = read(0, &c, 1);
 4a5:	83 ec 04             	sub    $0x4,%esp
 4a8:	6a 01                	push   $0x1
 4aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ad:	50                   	push   %eax
 4ae:	6a 00                	push   $0x0
 4b0:	e8 a1 01 00 00       	call   656 <read>
    if (cc < 1)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	85 c0                	test   %eax,%eax
 4ba:	7e 17                	jle    4d3 <gets+0x49>
      break;
    buf[i++] = c;
 4bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 4c3:	3c 0a                	cmp    $0xa,%al
 4c5:	0f 94 c2             	sete   %dl
 4c8:	3c 0d                	cmp    $0xd,%al
 4ca:	0f 94 c0             	sete   %al
 4cd:	08 c2                	or     %al,%dl
 4cf:	74 ca                	je     49b <gets+0x11>
    buf[i++] = c;
 4d1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4d3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d7:	89 f8                	mov    %edi,%eax
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret    

000004e1 <stat>:

int stat(const char *n, struct stat *st)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e6:	83 ec 08             	sub    $0x8,%esp
 4e9:	6a 00                	push   $0x0
 4eb:	ff 75 08             	push   0x8(%ebp)
 4ee:	e8 8b 01 00 00       	call   67e <open>
  if (fd < 0)
 4f3:	83 c4 10             	add    $0x10,%esp
 4f6:	85 c0                	test   %eax,%eax
 4f8:	78 24                	js     51e <stat+0x3d>
 4fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4fc:	83 ec 08             	sub    $0x8,%esp
 4ff:	ff 75 0c             	push   0xc(%ebp)
 502:	50                   	push   %eax
 503:	e8 8e 01 00 00       	call   696 <fstat>
 508:	89 c6                	mov    %eax,%esi
  close(fd);
 50a:	89 1c 24             	mov    %ebx,(%esp)
 50d:	e8 54 01 00 00       	call   666 <close>
  return r;
 512:	83 c4 10             	add    $0x10,%esp
}
 515:	89 f0                	mov    %esi,%eax
 517:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51a:	5b                   	pop    %ebx
 51b:	5e                   	pop    %esi
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    
    return -1;
 51e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 523:	eb f0                	jmp    515 <stat+0x34>

00000525 <atoi>:

int atoi(const char *s)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	53                   	push   %ebx
 529:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 52c:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 531:	eb 10                	jmp    543 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 533:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 536:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 539:	83 c1 01             	add    $0x1,%ecx
 53c:	0f be c0             	movsbl %al,%eax
 53f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 543:	0f b6 01             	movzbl (%ecx),%eax
 546:	8d 58 d0             	lea    -0x30(%eax),%ebx
 549:	80 fb 09             	cmp    $0x9,%bl
 54c:	76 e5                	jbe    533 <atoi+0xe>
  return n;
}
 54e:	89 d0                	mov    %edx,%eax
 550:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	8b 75 08             	mov    0x8(%ebp),%esi
 55d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 560:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 563:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 565:	eb 0d                	jmp    574 <memmove+0x1f>
    *dst++ = *src++;
 567:	0f b6 01             	movzbl (%ecx),%eax
 56a:	88 02                	mov    %al,(%edx)
 56c:	8d 49 01             	lea    0x1(%ecx),%ecx
 56f:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 572:	89 d8                	mov    %ebx,%eax
 574:	8d 58 ff             	lea    -0x1(%eax),%ebx
 577:	85 c0                	test   %eax,%eax
 579:	7f ec                	jg     567 <memmove+0x12>
  return vdst;
}
 57b:	89 f0                	mov    %esi,%eax
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    

00000581 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 587:	83 38 01             	cmpl   $0x1,(%eax)
 58a:	74 fb                	je     587 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 58c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    

00000594 <lock_release>:
void lock_release(lock_t *lock)
{
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    

000005a2 <lock_init>:
void lock_init(lock_t *lock)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5ae:	5d                   	pop    %ebp
 5af:	c3                   	ret    

000005b0 <thread_create>:
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	53                   	push   %ebx
 5b4:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 5b7:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 5ba:	53                   	push   %ebx
 5bb:	e8 e2 ff ff ff       	call   5a2 <lock_init>
  lock_acquire(&lock);
 5c0:	89 1c 24             	mov    %ebx,(%esp)
 5c3:	e8 b9 ff ff ff       	call   581 <lock_acquire>
  void *stack = malloc(4096 * 2);
 5c8:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 5cf:	e8 e5 03 00 00       	call   9b9 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 5d4:	50                   	push   %eax
 5d5:	ff 75 10             	push   0x10(%ebp)
 5d8:	ff 75 0c             	push   0xc(%ebp)
 5db:	ff 75 08             	push   0x8(%ebp)
 5de:	e8 fb 00 00 00       	call   6de <clone>
}
 5e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5e6:	c9                   	leave  
 5e7:	c3                   	ret    

000005e8 <thread_join>:
{
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	56                   	push   %esi
 5ec:	53                   	push   %ebx
 5ed:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 5f0:	6a 04                	push   $0x4
 5f2:	e8 c2 03 00 00       	call   9b9 <malloc>
 5f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 5fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 e1 00 00 00       	call   6e6 <join>
 605:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 607:	8d 75 f0             	lea    -0x10(%ebp),%esi
 60a:	89 34 24             	mov    %esi,(%esp)
 60d:	e8 90 ff ff ff       	call   5a2 <lock_init>
  lock_acquire(&lock);
 612:	89 34 24             	mov    %esi,(%esp)
 615:	e8 67 ff ff ff       	call   581 <lock_acquire>
  free(stack);
 61a:	83 c4 04             	add    $0x4,%esp
 61d:	ff 75 f4             	push   -0xc(%ebp)
 620:	e8 d4 02 00 00       	call   8f9 <free>
  lock_release(&lock);
 625:	89 34 24             	mov    %esi,(%esp)
 628:	e8 67 ff ff ff       	call   594 <lock_release>
}
 62d:	89 d8                	mov    %ebx,%eax
 62f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 632:	5b                   	pop    %ebx
 633:	5e                   	pop    %esi
 634:	5d                   	pop    %ebp
 635:	c3                   	ret    

00000636 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 636:	b8 01 00 00 00       	mov    $0x1,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <exit>:
SYSCALL(exit)
 63e:	b8 02 00 00 00       	mov    $0x2,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <wait>:
SYSCALL(wait)
 646:	b8 03 00 00 00       	mov    $0x3,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <pipe>:
SYSCALL(pipe)
 64e:	b8 04 00 00 00       	mov    $0x4,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <read>:
SYSCALL(read)
 656:	b8 05 00 00 00       	mov    $0x5,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <write>:
SYSCALL(write)
 65e:	b8 10 00 00 00       	mov    $0x10,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <close>:
SYSCALL(close)
 666:	b8 15 00 00 00       	mov    $0x15,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <kill>:
SYSCALL(kill)
 66e:	b8 06 00 00 00       	mov    $0x6,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <exec>:
SYSCALL(exec)
 676:	b8 07 00 00 00       	mov    $0x7,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <open>:
SYSCALL(open)
 67e:	b8 0f 00 00 00       	mov    $0xf,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <mknod>:
SYSCALL(mknod)
 686:	b8 11 00 00 00       	mov    $0x11,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <unlink>:
SYSCALL(unlink)
 68e:	b8 12 00 00 00       	mov    $0x12,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <fstat>:
SYSCALL(fstat)
 696:	b8 08 00 00 00       	mov    $0x8,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <link>:
SYSCALL(link)
 69e:	b8 13 00 00 00       	mov    $0x13,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <mkdir>:
SYSCALL(mkdir)
 6a6:	b8 14 00 00 00       	mov    $0x14,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <chdir>:
SYSCALL(chdir)
 6ae:	b8 09 00 00 00       	mov    $0x9,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <dup>:
SYSCALL(dup)
 6b6:	b8 0a 00 00 00       	mov    $0xa,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <getpid>:
SYSCALL(getpid)
 6be:	b8 0b 00 00 00       	mov    $0xb,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <sbrk>:
SYSCALL(sbrk)
 6c6:	b8 0c 00 00 00       	mov    $0xc,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <sleep>:
SYSCALL(sleep)
 6ce:	b8 0d 00 00 00       	mov    $0xd,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <uptime>:
SYSCALL(uptime)
 6d6:	b8 0e 00 00 00       	mov    $0xe,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <clone>:
SYSCALL(clone)
 6de:	b8 16 00 00 00       	mov    $0x16,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <join>:
 6e6:	b8 17 00 00 00       	mov    $0x17,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6ee:	55                   	push   %ebp
 6ef:	89 e5                	mov    %esp,%ebp
 6f1:	83 ec 1c             	sub    $0x1c,%esp
 6f4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6f7:	6a 01                	push   $0x1
 6f9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6fc:	52                   	push   %edx
 6fd:	50                   	push   %eax
 6fe:	e8 5b ff ff ff       	call   65e <write>
}
 703:	83 c4 10             	add    $0x10,%esp
 706:	c9                   	leave  
 707:	c3                   	ret    

00000708 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 708:	55                   	push   %ebp
 709:	89 e5                	mov    %esp,%ebp
 70b:	57                   	push   %edi
 70c:	56                   	push   %esi
 70d:	53                   	push   %ebx
 70e:	83 ec 2c             	sub    $0x2c,%esp
 711:	89 45 d0             	mov    %eax,-0x30(%ebp)
 714:	89 d0                	mov    %edx,%eax
 716:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 718:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 71c:	0f 95 c1             	setne  %cl
 71f:	c1 ea 1f             	shr    $0x1f,%edx
 722:	84 d1                	test   %dl,%cl
 724:	74 44                	je     76a <printint+0x62>
    neg = 1;
    x = -xx;
 726:	f7 d8                	neg    %eax
 728:	89 c1                	mov    %eax,%ecx
    neg = 1;
 72a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 731:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 736:	89 c8                	mov    %ecx,%eax
 738:	ba 00 00 00 00       	mov    $0x0,%edx
 73d:	f7 f6                	div    %esi
 73f:	89 df                	mov    %ebx,%edi
 741:	83 c3 01             	add    $0x1,%ebx
 744:	0f b6 92 6c 0b 00 00 	movzbl 0xb6c(%edx),%edx
 74b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 74f:	89 ca                	mov    %ecx,%edx
 751:	89 c1                	mov    %eax,%ecx
 753:	39 d6                	cmp    %edx,%esi
 755:	76 df                	jbe    736 <printint+0x2e>
  if(neg)
 757:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 75b:	74 31                	je     78e <printint+0x86>
    buf[i++] = '-';
 75d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 762:	8d 5f 02             	lea    0x2(%edi),%ebx
 765:	8b 75 d0             	mov    -0x30(%ebp),%esi
 768:	eb 17                	jmp    781 <printint+0x79>
    x = xx;
 76a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 76c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 773:	eb bc                	jmp    731 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 775:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 77a:	89 f0                	mov    %esi,%eax
 77c:	e8 6d ff ff ff       	call   6ee <putc>
  while(--i >= 0)
 781:	83 eb 01             	sub    $0x1,%ebx
 784:	79 ef                	jns    775 <printint+0x6d>
}
 786:	83 c4 2c             	add    $0x2c,%esp
 789:	5b                   	pop    %ebx
 78a:	5e                   	pop    %esi
 78b:	5f                   	pop    %edi
 78c:	5d                   	pop    %ebp
 78d:	c3                   	ret    
 78e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 791:	eb ee                	jmp    781 <printint+0x79>

00000793 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 793:	55                   	push   %ebp
 794:	89 e5                	mov    %esp,%ebp
 796:	57                   	push   %edi
 797:	56                   	push   %esi
 798:	53                   	push   %ebx
 799:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 79c:	8d 45 10             	lea    0x10(%ebp),%eax
 79f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7a2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7a7:	bb 00 00 00 00       	mov    $0x0,%ebx
 7ac:	eb 14                	jmp    7c2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7ae:	89 fa                	mov    %edi,%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 36 ff ff ff       	call   6ee <putc>
 7b8:	eb 05                	jmp    7bf <printf+0x2c>
      }
    } else if(state == '%'){
 7ba:	83 fe 25             	cmp    $0x25,%esi
 7bd:	74 25                	je     7e4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7bf:	83 c3 01             	add    $0x1,%ebx
 7c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 7c5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7c9:	84 c0                	test   %al,%al
 7cb:	0f 84 20 01 00 00    	je     8f1 <printf+0x15e>
    c = fmt[i] & 0xff;
 7d1:	0f be f8             	movsbl %al,%edi
 7d4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7d7:	85 f6                	test   %esi,%esi
 7d9:	75 df                	jne    7ba <printf+0x27>
      if(c == '%'){
 7db:	83 f8 25             	cmp    $0x25,%eax
 7de:	75 ce                	jne    7ae <printf+0x1b>
        state = '%';
 7e0:	89 c6                	mov    %eax,%esi
 7e2:	eb db                	jmp    7bf <printf+0x2c>
      if(c == 'd'){
 7e4:	83 f8 25             	cmp    $0x25,%eax
 7e7:	0f 84 cf 00 00 00    	je     8bc <printf+0x129>
 7ed:	0f 8c dd 00 00 00    	jl     8d0 <printf+0x13d>
 7f3:	83 f8 78             	cmp    $0x78,%eax
 7f6:	0f 8f d4 00 00 00    	jg     8d0 <printf+0x13d>
 7fc:	83 f8 63             	cmp    $0x63,%eax
 7ff:	0f 8c cb 00 00 00    	jl     8d0 <printf+0x13d>
 805:	83 e8 63             	sub    $0x63,%eax
 808:	83 f8 15             	cmp    $0x15,%eax
 80b:	0f 87 bf 00 00 00    	ja     8d0 <printf+0x13d>
 811:	ff 24 85 14 0b 00 00 	jmp    *0xb14(,%eax,4)
        printint(fd, *ap, 10, 1);
 818:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 81b:	8b 17                	mov    (%edi),%edx
 81d:	83 ec 0c             	sub    $0xc,%esp
 820:	6a 01                	push   $0x1
 822:	b9 0a 00 00 00       	mov    $0xa,%ecx
 827:	8b 45 08             	mov    0x8(%ebp),%eax
 82a:	e8 d9 fe ff ff       	call   708 <printint>
        ap++;
 82f:	83 c7 04             	add    $0x4,%edi
 832:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 835:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 838:	be 00 00 00 00       	mov    $0x0,%esi
 83d:	eb 80                	jmp    7bf <printf+0x2c>
        printint(fd, *ap, 16, 0);
 83f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 842:	8b 17                	mov    (%edi),%edx
 844:	83 ec 0c             	sub    $0xc,%esp
 847:	6a 00                	push   $0x0
 849:	b9 10 00 00 00       	mov    $0x10,%ecx
 84e:	8b 45 08             	mov    0x8(%ebp),%eax
 851:	e8 b2 fe ff ff       	call   708 <printint>
        ap++;
 856:	83 c7 04             	add    $0x4,%edi
 859:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 85c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 85f:	be 00 00 00 00       	mov    $0x0,%esi
 864:	e9 56 ff ff ff       	jmp    7bf <printf+0x2c>
        s = (char*)*ap;
 869:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86c:	8b 30                	mov    (%eax),%esi
        ap++;
 86e:	83 c0 04             	add    $0x4,%eax
 871:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 874:	85 f6                	test   %esi,%esi
 876:	75 15                	jne    88d <printf+0xfa>
          s = "(null)";
 878:	be 0d 0b 00 00       	mov    $0xb0d,%esi
 87d:	eb 0e                	jmp    88d <printf+0xfa>
          putc(fd, *s);
 87f:	0f be d2             	movsbl %dl,%edx
 882:	8b 45 08             	mov    0x8(%ebp),%eax
 885:	e8 64 fe ff ff       	call   6ee <putc>
          s++;
 88a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 88d:	0f b6 16             	movzbl (%esi),%edx
 890:	84 d2                	test   %dl,%dl
 892:	75 eb                	jne    87f <printf+0xec>
      state = 0;
 894:	be 00 00 00 00       	mov    $0x0,%esi
 899:	e9 21 ff ff ff       	jmp    7bf <printf+0x2c>
        putc(fd, *ap);
 89e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a1:	0f be 17             	movsbl (%edi),%edx
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	e8 42 fe ff ff       	call   6ee <putc>
        ap++;
 8ac:	83 c7 04             	add    $0x4,%edi
 8af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8b2:	be 00 00 00 00       	mov    $0x0,%esi
 8b7:	e9 03 ff ff ff       	jmp    7bf <printf+0x2c>
        putc(fd, c);
 8bc:	89 fa                	mov    %edi,%edx
 8be:	8b 45 08             	mov    0x8(%ebp),%eax
 8c1:	e8 28 fe ff ff       	call   6ee <putc>
      state = 0;
 8c6:	be 00 00 00 00       	mov    $0x0,%esi
 8cb:	e9 ef fe ff ff       	jmp    7bf <printf+0x2c>
        putc(fd, '%');
 8d0:	ba 25 00 00 00       	mov    $0x25,%edx
 8d5:	8b 45 08             	mov    0x8(%ebp),%eax
 8d8:	e8 11 fe ff ff       	call   6ee <putc>
        putc(fd, c);
 8dd:	89 fa                	mov    %edi,%edx
 8df:	8b 45 08             	mov    0x8(%ebp),%eax
 8e2:	e8 07 fe ff ff       	call   6ee <putc>
      state = 0;
 8e7:	be 00 00 00 00       	mov    $0x0,%esi
 8ec:	e9 ce fe ff ff       	jmp    7bf <printf+0x2c>
    }
  }
}
 8f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8f4:	5b                   	pop    %ebx
 8f5:	5e                   	pop    %esi
 8f6:	5f                   	pop    %edi
 8f7:	5d                   	pop    %ebp
 8f8:	c3                   	ret    

000008f9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f9:	55                   	push   %ebp
 8fa:	89 e5                	mov    %esp,%ebp
 8fc:	57                   	push   %edi
 8fd:	56                   	push   %esi
 8fe:	53                   	push   %ebx
 8ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 902:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 905:	a1 fc 0e 00 00       	mov    0xefc,%eax
 90a:	eb 02                	jmp    90e <free+0x15>
 90c:	89 d0                	mov    %edx,%eax
 90e:	39 c8                	cmp    %ecx,%eax
 910:	73 04                	jae    916 <free+0x1d>
 912:	39 08                	cmp    %ecx,(%eax)
 914:	77 12                	ja     928 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 916:	8b 10                	mov    (%eax),%edx
 918:	39 c2                	cmp    %eax,%edx
 91a:	77 f0                	ja     90c <free+0x13>
 91c:	39 c8                	cmp    %ecx,%eax
 91e:	72 08                	jb     928 <free+0x2f>
 920:	39 ca                	cmp    %ecx,%edx
 922:	77 04                	ja     928 <free+0x2f>
 924:	89 d0                	mov    %edx,%eax
 926:	eb e6                	jmp    90e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 928:	8b 73 fc             	mov    -0x4(%ebx),%esi
 92b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 92e:	8b 10                	mov    (%eax),%edx
 930:	39 d7                	cmp    %edx,%edi
 932:	74 19                	je     94d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 934:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 937:	8b 50 04             	mov    0x4(%eax),%edx
 93a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 93d:	39 ce                	cmp    %ecx,%esi
 93f:	74 1b                	je     95c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 941:	89 08                	mov    %ecx,(%eax)
  freep = p;
 943:	a3 fc 0e 00 00       	mov    %eax,0xefc
}
 948:	5b                   	pop    %ebx
 949:	5e                   	pop    %esi
 94a:	5f                   	pop    %edi
 94b:	5d                   	pop    %ebp
 94c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 94d:	03 72 04             	add    0x4(%edx),%esi
 950:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 953:	8b 10                	mov    (%eax),%edx
 955:	8b 12                	mov    (%edx),%edx
 957:	89 53 f8             	mov    %edx,-0x8(%ebx)
 95a:	eb db                	jmp    937 <free+0x3e>
    p->s.size += bp->s.size;
 95c:	03 53 fc             	add    -0x4(%ebx),%edx
 95f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 962:	8b 53 f8             	mov    -0x8(%ebx),%edx
 965:	89 10                	mov    %edx,(%eax)
 967:	eb da                	jmp    943 <free+0x4a>

00000969 <morecore>:

static Header*
morecore(uint nu)
{
 969:	55                   	push   %ebp
 96a:	89 e5                	mov    %esp,%ebp
 96c:	53                   	push   %ebx
 96d:	83 ec 04             	sub    $0x4,%esp
 970:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 972:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 977:	77 05                	ja     97e <morecore+0x15>
    nu = 4096;
 979:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 97e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 985:	83 ec 0c             	sub    $0xc,%esp
 988:	50                   	push   %eax
 989:	e8 38 fd ff ff       	call   6c6 <sbrk>
  if(p == (char*)-1)
 98e:	83 c4 10             	add    $0x10,%esp
 991:	83 f8 ff             	cmp    $0xffffffff,%eax
 994:	74 1c                	je     9b2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 996:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 999:	83 c0 08             	add    $0x8,%eax
 99c:	83 ec 0c             	sub    $0xc,%esp
 99f:	50                   	push   %eax
 9a0:	e8 54 ff ff ff       	call   8f9 <free>
  return freep;
 9a5:	a1 fc 0e 00 00       	mov    0xefc,%eax
 9aa:	83 c4 10             	add    $0x10,%esp
}
 9ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9b0:	c9                   	leave  
 9b1:	c3                   	ret    
    return 0;
 9b2:	b8 00 00 00 00       	mov    $0x0,%eax
 9b7:	eb f4                	jmp    9ad <morecore+0x44>

000009b9 <malloc>:

void*
malloc(uint nbytes)
{
 9b9:	55                   	push   %ebp
 9ba:	89 e5                	mov    %esp,%ebp
 9bc:	53                   	push   %ebx
 9bd:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c0:	8b 45 08             	mov    0x8(%ebp),%eax
 9c3:	8d 58 07             	lea    0x7(%eax),%ebx
 9c6:	c1 eb 03             	shr    $0x3,%ebx
 9c9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9cc:	8b 0d fc 0e 00 00    	mov    0xefc,%ecx
 9d2:	85 c9                	test   %ecx,%ecx
 9d4:	74 04                	je     9da <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d6:	8b 01                	mov    (%ecx),%eax
 9d8:	eb 4a                	jmp    a24 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9da:	c7 05 fc 0e 00 00 00 	movl   $0xf00,0xefc
 9e1:	0f 00 00 
 9e4:	c7 05 00 0f 00 00 00 	movl   $0xf00,0xf00
 9eb:	0f 00 00 
    base.s.size = 0;
 9ee:	c7 05 04 0f 00 00 00 	movl   $0x0,0xf04
 9f5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9f8:	b9 00 0f 00 00       	mov    $0xf00,%ecx
 9fd:	eb d7                	jmp    9d6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9ff:	74 19                	je     a1a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a01:	29 da                	sub    %ebx,%edx
 a03:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a06:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a09:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a0c:	89 0d fc 0e 00 00    	mov    %ecx,0xefc
      return (void*)(p + 1);
 a12:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a18:	c9                   	leave  
 a19:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a1a:	8b 10                	mov    (%eax),%edx
 a1c:	89 11                	mov    %edx,(%ecx)
 a1e:	eb ec                	jmp    a0c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a20:	89 c1                	mov    %eax,%ecx
 a22:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a24:	8b 50 04             	mov    0x4(%eax),%edx
 a27:	39 da                	cmp    %ebx,%edx
 a29:	73 d4                	jae    9ff <malloc+0x46>
    if(p == freep)
 a2b:	39 05 fc 0e 00 00    	cmp    %eax,0xefc
 a31:	75 ed                	jne    a20 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a33:	89 d8                	mov    %ebx,%eax
 a35:	e8 2f ff ff ff       	call   969 <morecore>
 a3a:	85 c0                	test   %eax,%eax
 a3c:	75 e2                	jne    a20 <malloc+0x67>
 a3e:	eb d5                	jmp    a15 <malloc+0x5c>
