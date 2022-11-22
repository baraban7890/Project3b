
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
  57:	83 3d 44 0f 00 00 01 	cmpl   $0x1,0xf44
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 84 0a 00 00       	push   $0xa84
  6b:	68 8e 0a 00 00       	push   $0xa8e
  70:	6a 01                	push   $0x1
  72:	e8 5e 07 00 00       	call   7d5 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 cd 0a 00 00       	push   $0xacd
  7f:	68 a1 0a 00 00       	push   $0xaa1
  84:	6a 01                	push   $0x1
  86:	e8 4a 07 00 00       	call   7d5 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 b5 0a 00 00       	push   $0xab5
  93:	6a 01                	push   $0x1
  95:	e8 3b 07 00 00       	call   7d5 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 48 0f 00 00    	push   0xf48
  a3:	e8 08 06 00 00       	call   6b0 <kill>
  a8:	e8 d3 05 00 00       	call   680 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 84 0a 00 00       	push   $0xa84
  b4:	68 8e 0a 00 00       	push   $0xa8e
  b9:	6a 01                	push   $0x1
  bb:	e8 15 07 00 00       	call   7d5 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 96 0a 00 00       	push   $0xa96
  c8:	68 a1 0a 00 00       	push   $0xaa1
  cd:	6a 01                	push   $0x1
  cf:	e8 01 07 00 00       	call   7d5 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 b5 0a 00 00       	push   $0xab5
  dc:	6a 01                	push   $0x1
  de:	e8 f2 06 00 00       	call   7d5 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 48 0f 00 00    	push   0xf48
  ec:	e8 bf 05 00 00       	call   6b0 <kill>
  f1:	e8 8a 05 00 00       	call   680 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 84 0a 00 00       	push   $0xa84
  fd:	68 8e 0a 00 00       	push   $0xa8e
 102:	6a 01                	push   $0x1
 104:	e8 cc 06 00 00       	call   7d5 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 c2 0a 00 00       	push   $0xac2
 111:	68 a1 0a 00 00       	push   $0xaa1
 116:	6a 01                	push   $0x1
 118:	e8 b8 06 00 00       	call   7d5 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 b5 0a 00 00       	push   $0xab5
 125:	6a 01                	push   $0x1
 127:	e8 a9 06 00 00       	call   7d5 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 48 0f 00 00    	push   0xf48
 135:	e8 76 05 00 00       	call   6b0 <kill>
 13a:	e8 41 05 00 00       	call   680 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 84 0a 00 00       	push   $0xa84
 158:	68 8e 0a 00 00       	push   $0xa8e
 15d:	6a 01                	push   $0x1
 15f:	e8 71 06 00 00       	call   7d5 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 d9 0a 00 00       	push   $0xad9
 16c:	68 a1 0a 00 00       	push   $0xaa1
 171:	6a 01                	push   $0x1
 173:	e8 5d 06 00 00       	call   7d5 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 b5 0a 00 00       	push   $0xab5
 180:	6a 01                	push   $0x1
 182:	e8 4e 06 00 00       	call   7d5 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 48 0f 00 00    	push   0xf48
 190:	e8 1b 05 00 00       	call   6b0 <kill>
 195:	e8 e6 04 00 00       	call   680 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 84 0a 00 00       	push   $0xa84
 1b3:	68 8e 0a 00 00       	push   $0xa8e
 1b8:	6a 01                	push   $0x1
 1ba:	e8 16 06 00 00       	call   7d5 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 e5 0a 00 00       	push   $0xae5
 1c7:	68 a1 0a 00 00       	push   $0xaa1
 1cc:	6a 01                	push   $0x1
 1ce:	e8 02 06 00 00       	call   7d5 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 b5 0a 00 00       	push   $0xab5
 1db:	6a 01                	push   $0x1
 1dd:	e8 f3 05 00 00       	call   7d5 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 48 0f 00 00    	push   0xf48
 1eb:	e8 c0 04 00 00       	call   6b0 <kill>
 1f0:	e8 8b 04 00 00       	call   680 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 84 0a 00 00       	push   $0xa84
 20e:	68 8e 0a 00 00       	push   $0xa8e
 213:	6a 01                	push   $0x1
 215:	e8 bb 05 00 00       	call   7d5 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 f1 0a 00 00       	push   $0xaf1
 222:	68 a1 0a 00 00       	push   $0xaa1
 227:	6a 01                	push   $0x1
 229:	e8 a7 05 00 00       	call   7d5 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 b5 0a 00 00       	push   $0xab5
 236:	6a 01                	push   $0x1
 238:	e8 98 05 00 00       	call   7d5 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 48 0f 00 00    	push   0xf48
 246:	e8 65 04 00 00       	call   6b0 <kill>
 24b:	e8 30 04 00 00       	call   680 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 84 0a 00 00       	push   $0xa84
 26b:	68 8e 0a 00 00       	push   $0xa8e
 270:	6a 01                	push   $0x1
 272:	e8 5e 05 00 00       	call   7d5 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 fe 0a 00 00       	push   $0xafe
 27f:	68 a1 0a 00 00       	push   $0xaa1
 284:	6a 01                	push   $0x1
 286:	e8 4a 05 00 00       	call   7d5 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 b5 0a 00 00       	push   $0xab5
 293:	6a 01                	push   $0x1
 295:	e8 3b 05 00 00       	call   7d5 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 48 0f 00 00    	push   0xf48
 2a3:	e8 08 04 00 00       	call   6b0 <kill>
 2a8:	e8 d3 03 00 00       	call   680 <exit>
   exit();
 2ad:	e8 ce 03 00 00       	call   680 <exit>

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2c4:	e8 37 04 00 00       	call   700 <getpid>
 2c9:	a3 48 0f 00 00       	mov    %eax,0xf48
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f5:	39 1d 40 0f 00 00    	cmp    %ebx,0xf40
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 dc 02 00 00       	call   5f2 <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
 324:	68 84 0a 00 00       	push   $0xa84
 329:	68 8e 0a 00 00       	push   $0xa8e
 32e:	6a 01                	push   $0x1
 330:	e8 a0 04 00 00       	call   7d5 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 0d 0b 00 00       	push   $0xb0d
 33d:	68 a1 0a 00 00       	push   $0xaa1
 342:	6a 01                	push   $0x1
 344:	e8 8c 04 00 00       	call   7d5 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 b5 0a 00 00       	push   $0xab5
 351:	6a 01                	push   $0x1
 353:	e8 7d 04 00 00       	call   7d5 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 48 0f 00 00    	push   0xf48
 361:	e8 4a 03 00 00       	call   6b0 <kill>
 366:	e8 15 03 00 00       	call   680 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 84 0a 00 00       	push   $0xa84
 372:	68 8e 0a 00 00       	push   $0xa8e
 377:	6a 01                	push   $0x1
 379:	e8 57 04 00 00       	call   7d5 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 1f 0b 00 00       	push   $0xb1f
 386:	68 a1 0a 00 00       	push   $0xaa1
 38b:	6a 01                	push   $0x1
 38d:	e8 43 04 00 00       	call   7d5 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 b5 0a 00 00       	push   $0xab5
 39a:	6a 01                	push   $0x1
 39c:	e8 34 04 00 00       	call   7d5 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 48 0f 00 00    	push   0xf48
 3aa:	e8 01 03 00 00       	call   6b0 <kill>
 3af:	e8 cc 02 00 00       	call   680 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 40 0f 00 00    	cmp    %ebx,0xf40
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 64 02 00 00       	call   62a <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 84 0a 00 00       	push   $0xa84
 3d6:	68 8e 0a 00 00       	push   $0xa8e
 3db:	6a 01                	push   $0x1
 3dd:	e8 f3 03 00 00       	call   7d5 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 2e 0b 00 00       	push   $0xb2e
 3ea:	68 a1 0a 00 00       	push   $0xaa1
 3ef:	6a 01                	push   $0x1
 3f1:	e8 df 03 00 00       	call   7d5 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 b5 0a 00 00       	push   $0xab5
 3fe:	6a 01                	push   $0x1
 400:	e8 d0 03 00 00       	call   7d5 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 48 0f 00 00    	push   0xf48
 40e:	e8 9d 02 00 00       	call   6b0 <kill>
 413:	e8 68 02 00 00       	call   680 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 3b 0b 00 00       	push   $0xb3b
 420:	6a 01                	push   $0x1
 422:	e8 ae 03 00 00       	call   7d5 <printf>
   exit();
 427:	e8 54 02 00 00       	call   680 <exit>

0000042c <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	8b 75 08             	mov    0x8(%ebp),%esi
 434:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 437:	89 f0                	mov    %esi,%eax
 439:	89 d1                	mov    %edx,%ecx
 43b:	83 c2 01             	add    $0x1,%edx
 43e:	89 c3                	mov    %eax,%ebx
 440:	83 c0 01             	add    $0x1,%eax
 443:	0f b6 09             	movzbl (%ecx),%ecx
 446:	88 0b                	mov    %cl,(%ebx)
 448:	84 c9                	test   %cl,%cl
 44a:	75 ed                	jne    439 <strcpy+0xd>
    ;
  return os;
}
 44c:	89 f0                	mov    %esi,%eax
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    

00000452 <strcmp>:

int strcmp(const char *p, const char *q)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	8b 4d 08             	mov    0x8(%ebp),%ecx
 458:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 45b:	eb 06                	jmp    463 <strcmp+0x11>
    p++, q++;
 45d:	83 c1 01             	add    $0x1,%ecx
 460:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 463:	0f b6 01             	movzbl (%ecx),%eax
 466:	84 c0                	test   %al,%al
 468:	74 04                	je     46e <strcmp+0x1c>
 46a:	3a 02                	cmp    (%edx),%al
 46c:	74 ef                	je     45d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 46e:	0f b6 c0             	movzbl %al,%eax
 471:	0f b6 12             	movzbl (%edx),%edx
 474:	29 d0                	sub    %edx,%eax
}
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    

00000478 <strlen>:

uint strlen(const char *s)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 47e:	b8 00 00 00 00       	mov    $0x0,%eax
 483:	eb 03                	jmp    488 <strlen+0x10>
 485:	83 c0 01             	add    $0x1,%eax
 488:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 48c:	75 f7                	jne    485 <strlen+0xd>
    ;
  return n;
}
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <memset>:

void *
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	89 d7                	mov    %edx,%edi
 499:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49c:	8b 45 0c             	mov    0xc(%ebp),%eax
 49f:	fc                   	cld    
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a7:	c9                   	leave  
 4a8:	c3                   	ret    

000004a9 <strchr>:

char *
strchr(const char *s, char c)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 4b3:	eb 03                	jmp    4b8 <strchr+0xf>
 4b5:	83 c0 01             	add    $0x1,%eax
 4b8:	0f b6 10             	movzbl (%eax),%edx
 4bb:	84 d2                	test   %dl,%dl
 4bd:	74 06                	je     4c5 <strchr+0x1c>
    if (*s == c)
 4bf:	38 ca                	cmp    %cl,%dl
 4c1:	75 f2                	jne    4b5 <strchr+0xc>
 4c3:	eb 05                	jmp    4ca <strchr+0x21>
      return (char *)s;
  return 0;
 4c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <gets>:

char *
gets(char *buf, int max)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	53                   	push   %ebx
 4d2:	83 ec 1c             	sub    $0x1c,%esp
 4d5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 4d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dd:	89 de                	mov    %ebx,%esi
 4df:	83 c3 01             	add    $0x1,%ebx
 4e2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4e5:	7d 2e                	jge    515 <gets+0x49>
  {
    cc = read(0, &c, 1);
 4e7:	83 ec 04             	sub    $0x4,%esp
 4ea:	6a 01                	push   $0x1
 4ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ef:	50                   	push   %eax
 4f0:	6a 00                	push   $0x0
 4f2:	e8 a1 01 00 00       	call   698 <read>
    if (cc < 1)
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	85 c0                	test   %eax,%eax
 4fc:	7e 17                	jle    515 <gets+0x49>
      break;
    buf[i++] = c;
 4fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 502:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 505:	3c 0a                	cmp    $0xa,%al
 507:	0f 94 c2             	sete   %dl
 50a:	3c 0d                	cmp    $0xd,%al
 50c:	0f 94 c0             	sete   %al
 50f:	08 c2                	or     %al,%dl
 511:	74 ca                	je     4dd <gets+0x11>
    buf[i++] = c;
 513:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 515:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 519:	89 f8                	mov    %edi,%eax
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <stat>:

int stat(const char *n, struct stat *st)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	56                   	push   %esi
 527:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 528:	83 ec 08             	sub    $0x8,%esp
 52b:	6a 00                	push   $0x0
 52d:	ff 75 08             	push   0x8(%ebp)
 530:	e8 8b 01 00 00       	call   6c0 <open>
  if (fd < 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	85 c0                	test   %eax,%eax
 53a:	78 24                	js     560 <stat+0x3d>
 53c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	ff 75 0c             	push   0xc(%ebp)
 544:	50                   	push   %eax
 545:	e8 8e 01 00 00       	call   6d8 <fstat>
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	89 1c 24             	mov    %ebx,(%esp)
 54f:	e8 54 01 00 00       	call   6a8 <close>
  return r;
 554:	83 c4 10             	add    $0x10,%esp
}
 557:	89 f0                	mov    %esi,%eax
 559:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
    return -1;
 560:	be ff ff ff ff       	mov    $0xffffffff,%esi
 565:	eb f0                	jmp    557 <stat+0x34>

00000567 <atoi>:

int atoi(const char *s)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	53                   	push   %ebx
 56b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 56e:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 573:	eb 10                	jmp    585 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 575:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 578:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 57b:	83 c1 01             	add    $0x1,%ecx
 57e:	0f be c0             	movsbl %al,%eax
 581:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 585:	0f b6 01             	movzbl (%ecx),%eax
 588:	8d 58 d0             	lea    -0x30(%eax),%ebx
 58b:	80 fb 09             	cmp    $0x9,%bl
 58e:	76 e5                	jbe    575 <atoi+0xe>
  return n;
}
 590:	89 d0                	mov    %edx,%eax
 592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	8b 75 08             	mov    0x8(%ebp),%esi
 59f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5a5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 5a7:	eb 0d                	jmp    5b6 <memmove+0x1f>
    *dst++ = *src++;
 5a9:	0f b6 01             	movzbl (%ecx),%eax
 5ac:	88 02                	mov    %al,(%edx)
 5ae:	8d 49 01             	lea    0x1(%ecx),%ecx
 5b1:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 5b4:	89 d8                	mov    %ebx,%eax
 5b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5b9:	85 c0                	test   %eax,%eax
 5bb:	7f ec                	jg     5a9 <memmove+0x12>
  return vdst;
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    

000005c3 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 5c9:	83 38 01             	cmpl   $0x1,(%eax)
 5cc:	74 fb                	je     5c9 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 5ce:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 5d4:	5d                   	pop    %ebp
 5d5:	c3                   	ret    

000005d6 <lock_release>:
void lock_release(lock_t *lock)
{
 5d6:	55                   	push   %ebp
 5d7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    

000005e4 <lock_init>:
void lock_init(lock_t *lock)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5f0:	5d                   	pop    %ebp
 5f1:	c3                   	ret    

000005f2 <thread_create>:
{
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	53                   	push   %ebx
 5f6:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 5f9:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 5fc:	53                   	push   %ebx
 5fd:	e8 e2 ff ff ff       	call   5e4 <lock_init>
  lock_acquire(&lock);
 602:	89 1c 24             	mov    %ebx,(%esp)
 605:	e8 b9 ff ff ff       	call   5c3 <lock_acquire>
  void *stack = malloc(4096 * 2);
 60a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 611:	e8 e5 03 00 00       	call   9fb <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 616:	50                   	push   %eax
 617:	ff 75 10             	push   0x10(%ebp)
 61a:	ff 75 0c             	push   0xc(%ebp)
 61d:	ff 75 08             	push   0x8(%ebp)
 620:	e8 fb 00 00 00       	call   720 <clone>
}
 625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 628:	c9                   	leave  
 629:	c3                   	ret    

0000062a <thread_join>:
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	56                   	push   %esi
 62e:	53                   	push   %ebx
 62f:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 632:	6a 04                	push   $0x4
 634:	e8 c2 03 00 00       	call   9fb <malloc>
 639:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 63c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 63f:	89 04 24             	mov    %eax,(%esp)
 642:	e8 e1 00 00 00       	call   728 <join>
 647:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 649:	8d 75 f0             	lea    -0x10(%ebp),%esi
 64c:	89 34 24             	mov    %esi,(%esp)
 64f:	e8 90 ff ff ff       	call   5e4 <lock_init>
  lock_acquire(&lock);
 654:	89 34 24             	mov    %esi,(%esp)
 657:	e8 67 ff ff ff       	call   5c3 <lock_acquire>
  free(stack);
 65c:	83 c4 04             	add    $0x4,%esp
 65f:	ff 75 f4             	push   -0xc(%ebp)
 662:	e8 d4 02 00 00       	call   93b <free>
  lock_release(&lock);
 667:	89 34 24             	mov    %esi,(%esp)
 66a:	e8 67 ff ff ff       	call   5d6 <lock_release>
}
 66f:	89 d8                	mov    %ebx,%eax
 671:	8d 65 f8             	lea    -0x8(%ebp),%esp
 674:	5b                   	pop    %ebx
 675:	5e                   	pop    %esi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    

00000678 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 678:	b8 01 00 00 00       	mov    $0x1,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <exit>:
SYSCALL(exit)
 680:	b8 02 00 00 00       	mov    $0x2,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <wait>:
SYSCALL(wait)
 688:	b8 03 00 00 00       	mov    $0x3,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <pipe>:
SYSCALL(pipe)
 690:	b8 04 00 00 00       	mov    $0x4,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <read>:
SYSCALL(read)
 698:	b8 05 00 00 00       	mov    $0x5,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <write>:
SYSCALL(write)
 6a0:	b8 10 00 00 00       	mov    $0x10,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <close>:
SYSCALL(close)
 6a8:	b8 15 00 00 00       	mov    $0x15,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <kill>:
SYSCALL(kill)
 6b0:	b8 06 00 00 00       	mov    $0x6,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <exec>:
SYSCALL(exec)
 6b8:	b8 07 00 00 00       	mov    $0x7,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <open>:
SYSCALL(open)
 6c0:	b8 0f 00 00 00       	mov    $0xf,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <mknod>:
SYSCALL(mknod)
 6c8:	b8 11 00 00 00       	mov    $0x11,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <unlink>:
SYSCALL(unlink)
 6d0:	b8 12 00 00 00       	mov    $0x12,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <fstat>:
SYSCALL(fstat)
 6d8:	b8 08 00 00 00       	mov    $0x8,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <link>:
SYSCALL(link)
 6e0:	b8 13 00 00 00       	mov    $0x13,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <mkdir>:
SYSCALL(mkdir)
 6e8:	b8 14 00 00 00       	mov    $0x14,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <chdir>:
SYSCALL(chdir)
 6f0:	b8 09 00 00 00       	mov    $0x9,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <dup>:
SYSCALL(dup)
 6f8:	b8 0a 00 00 00       	mov    $0xa,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <getpid>:
SYSCALL(getpid)
 700:	b8 0b 00 00 00       	mov    $0xb,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <sbrk>:
SYSCALL(sbrk)
 708:	b8 0c 00 00 00       	mov    $0xc,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <sleep>:
SYSCALL(sleep)
 710:	b8 0d 00 00 00       	mov    $0xd,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <uptime>:
SYSCALL(uptime)
 718:	b8 0e 00 00 00       	mov    $0xe,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <clone>:
SYSCALL(clone)
 720:	b8 16 00 00 00       	mov    $0x16,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <join>:
 728:	b8 17 00 00 00       	mov    $0x17,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	83 ec 1c             	sub    $0x1c,%esp
 736:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 739:	6a 01                	push   $0x1
 73b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 73e:	52                   	push   %edx
 73f:	50                   	push   %eax
 740:	e8 5b ff ff ff       	call   6a0 <write>
}
 745:	83 c4 10             	add    $0x10,%esp
 748:	c9                   	leave  
 749:	c3                   	ret    

0000074a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 74a:	55                   	push   %ebp
 74b:	89 e5                	mov    %esp,%ebp
 74d:	57                   	push   %edi
 74e:	56                   	push   %esi
 74f:	53                   	push   %ebx
 750:	83 ec 2c             	sub    $0x2c,%esp
 753:	89 45 d0             	mov    %eax,-0x30(%ebp)
 756:	89 d0                	mov    %edx,%eax
 758:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 75a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 75e:	0f 95 c1             	setne  %cl
 761:	c1 ea 1f             	shr    $0x1f,%edx
 764:	84 d1                	test   %dl,%cl
 766:	74 44                	je     7ac <printint+0x62>
    neg = 1;
    x = -xx;
 768:	f7 d8                	neg    %eax
 76a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 76c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 773:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 778:	89 c8                	mov    %ecx,%eax
 77a:	ba 00 00 00 00       	mov    $0x0,%edx
 77f:	f7 f6                	div    %esi
 781:	89 df                	mov    %ebx,%edi
 783:	83 c3 01             	add    $0x1,%ebx
 786:	0f b6 92 a8 0b 00 00 	movzbl 0xba8(%edx),%edx
 78d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 791:	89 ca                	mov    %ecx,%edx
 793:	89 c1                	mov    %eax,%ecx
 795:	39 d6                	cmp    %edx,%esi
 797:	76 df                	jbe    778 <printint+0x2e>
  if(neg)
 799:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 79d:	74 31                	je     7d0 <printint+0x86>
    buf[i++] = '-';
 79f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7a4:	8d 5f 02             	lea    0x2(%edi),%ebx
 7a7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7aa:	eb 17                	jmp    7c3 <printint+0x79>
    x = xx;
 7ac:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7ae:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7b5:	eb bc                	jmp    773 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7b7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7bc:	89 f0                	mov    %esi,%eax
 7be:	e8 6d ff ff ff       	call   730 <putc>
  while(--i >= 0)
 7c3:	83 eb 01             	sub    $0x1,%ebx
 7c6:	79 ef                	jns    7b7 <printint+0x6d>
}
 7c8:	83 c4 2c             	add    $0x2c,%esp
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
 7d0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7d3:	eb ee                	jmp    7c3 <printint+0x79>

000007d5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7d5:	55                   	push   %ebp
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	53                   	push   %ebx
 7db:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7de:	8d 45 10             	lea    0x10(%ebp),%eax
 7e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7e4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7e9:	bb 00 00 00 00       	mov    $0x0,%ebx
 7ee:	eb 14                	jmp    804 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7f0:	89 fa                	mov    %edi,%edx
 7f2:	8b 45 08             	mov    0x8(%ebp),%eax
 7f5:	e8 36 ff ff ff       	call   730 <putc>
 7fa:	eb 05                	jmp    801 <printf+0x2c>
      }
    } else if(state == '%'){
 7fc:	83 fe 25             	cmp    $0x25,%esi
 7ff:	74 25                	je     826 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 801:	83 c3 01             	add    $0x1,%ebx
 804:	8b 45 0c             	mov    0xc(%ebp),%eax
 807:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 80b:	84 c0                	test   %al,%al
 80d:	0f 84 20 01 00 00    	je     933 <printf+0x15e>
    c = fmt[i] & 0xff;
 813:	0f be f8             	movsbl %al,%edi
 816:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 819:	85 f6                	test   %esi,%esi
 81b:	75 df                	jne    7fc <printf+0x27>
      if(c == '%'){
 81d:	83 f8 25             	cmp    $0x25,%eax
 820:	75 ce                	jne    7f0 <printf+0x1b>
        state = '%';
 822:	89 c6                	mov    %eax,%esi
 824:	eb db                	jmp    801 <printf+0x2c>
      if(c == 'd'){
 826:	83 f8 25             	cmp    $0x25,%eax
 829:	0f 84 cf 00 00 00    	je     8fe <printf+0x129>
 82f:	0f 8c dd 00 00 00    	jl     912 <printf+0x13d>
 835:	83 f8 78             	cmp    $0x78,%eax
 838:	0f 8f d4 00 00 00    	jg     912 <printf+0x13d>
 83e:	83 f8 63             	cmp    $0x63,%eax
 841:	0f 8c cb 00 00 00    	jl     912 <printf+0x13d>
 847:	83 e8 63             	sub    $0x63,%eax
 84a:	83 f8 15             	cmp    $0x15,%eax
 84d:	0f 87 bf 00 00 00    	ja     912 <printf+0x13d>
 853:	ff 24 85 50 0b 00 00 	jmp    *0xb50(,%eax,4)
        printint(fd, *ap, 10, 1);
 85a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 85d:	8b 17                	mov    (%edi),%edx
 85f:	83 ec 0c             	sub    $0xc,%esp
 862:	6a 01                	push   $0x1
 864:	b9 0a 00 00 00       	mov    $0xa,%ecx
 869:	8b 45 08             	mov    0x8(%ebp),%eax
 86c:	e8 d9 fe ff ff       	call   74a <printint>
        ap++;
 871:	83 c7 04             	add    $0x4,%edi
 874:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 877:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 87a:	be 00 00 00 00       	mov    $0x0,%esi
 87f:	eb 80                	jmp    801 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 881:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 884:	8b 17                	mov    (%edi),%edx
 886:	83 ec 0c             	sub    $0xc,%esp
 889:	6a 00                	push   $0x0
 88b:	b9 10 00 00 00       	mov    $0x10,%ecx
 890:	8b 45 08             	mov    0x8(%ebp),%eax
 893:	e8 b2 fe ff ff       	call   74a <printint>
        ap++;
 898:	83 c7 04             	add    $0x4,%edi
 89b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 89e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8a1:	be 00 00 00 00       	mov    $0x0,%esi
 8a6:	e9 56 ff ff ff       	jmp    801 <printf+0x2c>
        s = (char*)*ap;
 8ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ae:	8b 30                	mov    (%eax),%esi
        ap++;
 8b0:	83 c0 04             	add    $0x4,%eax
 8b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8b6:	85 f6                	test   %esi,%esi
 8b8:	75 15                	jne    8cf <printf+0xfa>
          s = "(null)";
 8ba:	be 48 0b 00 00       	mov    $0xb48,%esi
 8bf:	eb 0e                	jmp    8cf <printf+0xfa>
          putc(fd, *s);
 8c1:	0f be d2             	movsbl %dl,%edx
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	e8 64 fe ff ff       	call   730 <putc>
          s++;
 8cc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8cf:	0f b6 16             	movzbl (%esi),%edx
 8d2:	84 d2                	test   %dl,%dl
 8d4:	75 eb                	jne    8c1 <printf+0xec>
      state = 0;
 8d6:	be 00 00 00 00       	mov    $0x0,%esi
 8db:	e9 21 ff ff ff       	jmp    801 <printf+0x2c>
        putc(fd, *ap);
 8e0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8e3:	0f be 17             	movsbl (%edi),%edx
 8e6:	8b 45 08             	mov    0x8(%ebp),%eax
 8e9:	e8 42 fe ff ff       	call   730 <putc>
        ap++;
 8ee:	83 c7 04             	add    $0x4,%edi
 8f1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8f4:	be 00 00 00 00       	mov    $0x0,%esi
 8f9:	e9 03 ff ff ff       	jmp    801 <printf+0x2c>
        putc(fd, c);
 8fe:	89 fa                	mov    %edi,%edx
 900:	8b 45 08             	mov    0x8(%ebp),%eax
 903:	e8 28 fe ff ff       	call   730 <putc>
      state = 0;
 908:	be 00 00 00 00       	mov    $0x0,%esi
 90d:	e9 ef fe ff ff       	jmp    801 <printf+0x2c>
        putc(fd, '%');
 912:	ba 25 00 00 00       	mov    $0x25,%edx
 917:	8b 45 08             	mov    0x8(%ebp),%eax
 91a:	e8 11 fe ff ff       	call   730 <putc>
        putc(fd, c);
 91f:	89 fa                	mov    %edi,%edx
 921:	8b 45 08             	mov    0x8(%ebp),%eax
 924:	e8 07 fe ff ff       	call   730 <putc>
      state = 0;
 929:	be 00 00 00 00       	mov    $0x0,%esi
 92e:	e9 ce fe ff ff       	jmp    801 <printf+0x2c>
    }
  }
}
 933:	8d 65 f4             	lea    -0xc(%ebp),%esp
 936:	5b                   	pop    %ebx
 937:	5e                   	pop    %esi
 938:	5f                   	pop    %edi
 939:	5d                   	pop    %ebp
 93a:	c3                   	ret    

0000093b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 93b:	55                   	push   %ebp
 93c:	89 e5                	mov    %esp,%ebp
 93e:	57                   	push   %edi
 93f:	56                   	push   %esi
 940:	53                   	push   %ebx
 941:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 944:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 947:	a1 4c 0f 00 00       	mov    0xf4c,%eax
 94c:	eb 02                	jmp    950 <free+0x15>
 94e:	89 d0                	mov    %edx,%eax
 950:	39 c8                	cmp    %ecx,%eax
 952:	73 04                	jae    958 <free+0x1d>
 954:	39 08                	cmp    %ecx,(%eax)
 956:	77 12                	ja     96a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 958:	8b 10                	mov    (%eax),%edx
 95a:	39 c2                	cmp    %eax,%edx
 95c:	77 f0                	ja     94e <free+0x13>
 95e:	39 c8                	cmp    %ecx,%eax
 960:	72 08                	jb     96a <free+0x2f>
 962:	39 ca                	cmp    %ecx,%edx
 964:	77 04                	ja     96a <free+0x2f>
 966:	89 d0                	mov    %edx,%eax
 968:	eb e6                	jmp    950 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 96a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 96d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 970:	8b 10                	mov    (%eax),%edx
 972:	39 d7                	cmp    %edx,%edi
 974:	74 19                	je     98f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 976:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 979:	8b 50 04             	mov    0x4(%eax),%edx
 97c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 97f:	39 ce                	cmp    %ecx,%esi
 981:	74 1b                	je     99e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 983:	89 08                	mov    %ecx,(%eax)
  freep = p;
 985:	a3 4c 0f 00 00       	mov    %eax,0xf4c
}
 98a:	5b                   	pop    %ebx
 98b:	5e                   	pop    %esi
 98c:	5f                   	pop    %edi
 98d:	5d                   	pop    %ebp
 98e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 98f:	03 72 04             	add    0x4(%edx),%esi
 992:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 995:	8b 10                	mov    (%eax),%edx
 997:	8b 12                	mov    (%edx),%edx
 999:	89 53 f8             	mov    %edx,-0x8(%ebx)
 99c:	eb db                	jmp    979 <free+0x3e>
    p->s.size += bp->s.size;
 99e:	03 53 fc             	add    -0x4(%ebx),%edx
 9a1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9a4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9a7:	89 10                	mov    %edx,(%eax)
 9a9:	eb da                	jmp    985 <free+0x4a>

000009ab <morecore>:

static Header*
morecore(uint nu)
{
 9ab:	55                   	push   %ebp
 9ac:	89 e5                	mov    %esp,%ebp
 9ae:	53                   	push   %ebx
 9af:	83 ec 04             	sub    $0x4,%esp
 9b2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9b4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9b9:	77 05                	ja     9c0 <morecore+0x15>
    nu = 4096;
 9bb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9c0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9c7:	83 ec 0c             	sub    $0xc,%esp
 9ca:	50                   	push   %eax
 9cb:	e8 38 fd ff ff       	call   708 <sbrk>
  if(p == (char*)-1)
 9d0:	83 c4 10             	add    $0x10,%esp
 9d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 9d6:	74 1c                	je     9f4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9db:	83 c0 08             	add    $0x8,%eax
 9de:	83 ec 0c             	sub    $0xc,%esp
 9e1:	50                   	push   %eax
 9e2:	e8 54 ff ff ff       	call   93b <free>
  return freep;
 9e7:	a1 4c 0f 00 00       	mov    0xf4c,%eax
 9ec:	83 c4 10             	add    $0x10,%esp
}
 9ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9f2:	c9                   	leave  
 9f3:	c3                   	ret    
    return 0;
 9f4:	b8 00 00 00 00       	mov    $0x0,%eax
 9f9:	eb f4                	jmp    9ef <morecore+0x44>

000009fb <malloc>:

void*
malloc(uint nbytes)
{
 9fb:	55                   	push   %ebp
 9fc:	89 e5                	mov    %esp,%ebp
 9fe:	53                   	push   %ebx
 9ff:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a02:	8b 45 08             	mov    0x8(%ebp),%eax
 a05:	8d 58 07             	lea    0x7(%eax),%ebx
 a08:	c1 eb 03             	shr    $0x3,%ebx
 a0b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a0e:	8b 0d 4c 0f 00 00    	mov    0xf4c,%ecx
 a14:	85 c9                	test   %ecx,%ecx
 a16:	74 04                	je     a1c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a18:	8b 01                	mov    (%ecx),%eax
 a1a:	eb 4a                	jmp    a66 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a1c:	c7 05 4c 0f 00 00 50 	movl   $0xf50,0xf4c
 a23:	0f 00 00 
 a26:	c7 05 50 0f 00 00 50 	movl   $0xf50,0xf50
 a2d:	0f 00 00 
    base.s.size = 0;
 a30:	c7 05 54 0f 00 00 00 	movl   $0x0,0xf54
 a37:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a3a:	b9 50 0f 00 00       	mov    $0xf50,%ecx
 a3f:	eb d7                	jmp    a18 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a41:	74 19                	je     a5c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a43:	29 da                	sub    %ebx,%edx
 a45:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a48:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a4b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a4e:	89 0d 4c 0f 00 00    	mov    %ecx,0xf4c
      return (void*)(p + 1);
 a54:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a5a:	c9                   	leave  
 a5b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a5c:	8b 10                	mov    (%eax),%edx
 a5e:	89 11                	mov    %edx,(%ecx)
 a60:	eb ec                	jmp    a4e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a62:	89 c1                	mov    %eax,%ecx
 a64:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a66:	8b 50 04             	mov    0x4(%eax),%edx
 a69:	39 da                	cmp    %ebx,%edx
 a6b:	73 d4                	jae    a41 <malloc+0x46>
    if(p == freep)
 a6d:	39 05 4c 0f 00 00    	cmp    %eax,0xf4c
 a73:	75 ed                	jne    a62 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a75:	89 d8                	mov    %ebx,%eax
 a77:	e8 2f ff ff ff       	call   9ab <morecore>
 a7c:	85 c0                	test   %eax,%eax
 a7e:	75 e2                	jne    a62 <malloc+0x67>
 a80:	eb d5                	jmp    a57 <malloc+0x5c>
