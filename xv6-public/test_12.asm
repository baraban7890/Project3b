
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 4c 0f 00 00       	push   $0xf4c
   b:	e8 f5 05 00 00       	call   605 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 2e 07 00 00       	call   74a <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 50 0f 00 00    	cmp    0xf50,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 c4 0a 00 00       	push   $0xac4
  2e:	68 ce 0a 00 00       	push   $0xace
  33:	6a 01                	push   $0x1
  35:	e8 dd 07 00 00       	call   817 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 d6 0a 00 00       	push   $0xad6
  42:	68 f4 0a 00 00       	push   $0xaf4
  47:	6a 01                	push   $0x1
  49:	e8 c9 07 00 00       	call   817 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 08 0b 00 00       	push   $0xb08
  56:	6a 01                	push   $0x1
  58:	e8 ba 07 00 00       	call   817 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 58 0f 00 00    	push   0xf58
  66:	e8 87 06 00 00       	call   6f2 <kill>
  6b:	e8 52 06 00 00       	call   6c2 <exit>
   global++;
  70:	83 05 54 0f 00 00 01 	addl   $0x1,0xf54
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 4c 0f 00 00       	push   $0xf4c
  7f:	e8 94 05 00 00       	call   618 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
  8b:	e8 75 05 00 00       	call   605 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 ae 06 00 00       	call   74a <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 50 0f 00 00    	cmp    0xf50,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 c4 0a 00 00       	push   $0xac4
  ae:	68 ce 0a 00 00       	push   $0xace
  b3:	6a 01                	push   $0x1
  b5:	e8 5d 07 00 00       	call   817 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 d6 0a 00 00       	push   $0xad6
  c2:	68 f4 0a 00 00       	push   $0xaf4
  c7:	6a 01                	push   $0x1
  c9:	e8 49 07 00 00       	call   817 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 08 0b 00 00       	push   $0xb08
  d6:	6a 01                	push   $0x1
  d8:	e8 3a 07 00 00       	call   817 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 58 0f 00 00    	push   0xf58
  e6:	e8 07 06 00 00       	call   6f2 <kill>
  eb:	e8 d2 05 00 00       	call   6c2 <exit>
   global++;
  f0:	83 05 54 0f 00 00 01 	addl   $0x1,0xf54
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 46 06 00 00       	call   74a <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 3a 06 00 00       	call   74a <sbrk>
 110:	a3 50 0f 00 00       	mov    %eax,0xf50
   lock_release(&lock2);
 115:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 11c:	e8 f7 04 00 00       	call   618 <lock_release>



   exit();
 121:	e8 9c 05 00 00       	call   6c2 <exit>

00000126 <main>:
{
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	push   -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	51                   	push   %ecx
 135:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 138:	e8 05 06 00 00       	call   742 <getpid>
 13d:	a3 58 0f 00 00       	mov    %eax,0xf58
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 4c 0f 00 00       	push   $0xf4c
 158:	e8 c9 04 00 00       	call   626 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 164:	e8 bd 04 00 00       	call   626 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 170:	e8 90 04 00 00       	call   605 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 17c:	e8 84 04 00 00       	call   605 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 44 0f 00 00    	cmp    %ebx,0xf44
 194:	7e 65                	jle    1fb <main+0xd5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	8d 45 f0             	lea    -0x10(%ebp),%eax
 19c:	50                   	push   %eax
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	68 00 00 00 00       	push   $0x0
 1a6:	e8 89 04 00 00       	call   634 <thread_create>
      assert(thread_pid > 0);
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7f d9                	jg     18b <main+0x65>
 1b2:	6a 28                	push   $0x28
 1b4:	68 c4 0a 00 00       	push   $0xac4
 1b9:	68 ce 0a 00 00       	push   $0xace
 1be:	6a 01                	push   $0x1
 1c0:	e8 52 06 00 00       	call   817 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 15 0b 00 00       	push   $0xb15
 1cd:	68 f4 0a 00 00       	push   $0xaf4
 1d2:	6a 01                	push   $0x1
 1d4:	e8 3e 06 00 00       	call   817 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 08 0b 00 00       	push   $0xb08
 1e1:	6a 01                	push   $0x1
 1e3:	e8 2f 06 00 00       	call   817 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 58 0f 00 00    	push   0xf58
 1f1:	e8 fc 04 00 00       	call   6f2 <kill>
 1f6:	e8 c7 04 00 00       	call   6c2 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 45 05 00 00       	call   74a <sbrk>
 205:	a3 50 0f 00 00       	mov    %eax,0xf50
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 44 0f 00 00       	mov    0xf44,%eax
 212:	39 05 54 0f 00 00    	cmp    %eax,0xf54
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 4c 0f 00 00       	push   $0xf4c
 222:	e8 f1 03 00 00       	call   618 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 1f 05 00 00       	call   752 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 23a:	e8 c6 03 00 00       	call   605 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 54 0f 00 00 00 	movl   $0x0,0xf54
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 ef 04 00 00       	call   74a <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 e3 04 00 00       	call   74a <sbrk>
 267:	a3 50 0f 00 00       	mov    %eax,0xf50
   lock_release(&lock);
 26c:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 273:	e8 a0 03 00 00       	call   618 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 44 0f 00 00       	mov    0xf44,%eax
 280:	39 05 54 0f 00 00    	cmp    %eax,0xf54
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 48 0f 00 00       	push   $0xf48
 290:	e8 83 03 00 00       	call   618 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 b1 04 00 00       	call   752 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 2a8:	e8 58 03 00 00       	call   605 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 48 0f 00 00       	push   $0xf48
 2ba:	e8 59 03 00 00       	call   618 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 44 0f 00 00    	cmp    %ebx,0xf44
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 98 03 00 00       	call   66c <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 c4 0a 00 00       	push   $0xac4
 2e4:	68 ce 0a 00 00       	push   $0xace
 2e9:	6a 01                	push   $0x1
 2eb:	e8 27 05 00 00       	call   817 <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 24 0b 00 00       	push   $0xb24
 2f8:	68 f4 0a 00 00       	push   $0xaf4
 2fd:	6a 01                	push   $0x1
 2ff:	e8 13 05 00 00       	call   817 <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 08 0b 00 00       	push   $0xb08
 30c:	6a 01                	push   $0x1
 30e:	e8 04 05 00 00       	call   817 <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 58 0f 00 00    	push   0xf58
 31c:	e8 d1 03 00 00       	call   6f2 <kill>
 321:	e8 9c 03 00 00       	call   6c2 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 31 0b 00 00       	push   $0xb31
 32e:	6a 01                	push   $0x1
 330:	e8 e2 04 00 00       	call   817 <printf>
   exit();
 335:	e8 88 03 00 00       	call   6c2 <exit>

0000033a <worker2>:
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	83 38 0b             	cmpl   $0xb,(%eax)
 34b:	75 52                	jne    39f <worker2+0x65>
   assert(arg2_int == 22);
 34d:	83 fa 16             	cmp    $0x16,%edx
 350:	0f 84 92 00 00 00    	je     3e8 <worker2+0xae>
 356:	6a 4d                	push   $0x4d
 358:	68 c4 0a 00 00       	push   $0xac4
 35d:	68 ce 0a 00 00       	push   $0xace
 362:	6a 01                	push   $0x1
 364:	e8 ae 04 00 00       	call   817 <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 4d 0b 00 00       	push   $0xb4d
 371:	68 f4 0a 00 00       	push   $0xaf4
 376:	6a 01                	push   $0x1
 378:	e8 9a 04 00 00       	call   817 <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 08 0b 00 00       	push   $0xb08
 385:	6a 01                	push   $0x1
 387:	e8 8b 04 00 00       	call   817 <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 58 0f 00 00    	push   0xf58
 395:	e8 58 03 00 00       	call   6f2 <kill>
 39a:	e8 23 03 00 00       	call   6c2 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 c4 0a 00 00       	push   $0xac4
 3a6:	68 ce 0a 00 00       	push   $0xace
 3ab:	6a 01                	push   $0x1
 3ad:	e8 65 04 00 00       	call   817 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 3e 0b 00 00       	push   $0xb3e
 3ba:	68 f4 0a 00 00       	push   $0xaf4
 3bf:	6a 01                	push   $0x1
 3c1:	e8 51 04 00 00       	call   817 <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 08 0b 00 00       	push   $0xb08
 3ce:	6a 01                	push   $0x1
 3d0:	e8 42 04 00 00       	call   817 <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 58 0f 00 00    	push   0xf58
 3de:	e8 0f 03 00 00       	call   6f2 <kill>
 3e3:	e8 da 02 00 00       	call   6c2 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 48 0f 00 00       	push   $0xf48
 3f0:	e8 10 02 00 00       	call   605 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 49 03 00 00       	call   74a <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 50 0f 00 00    	cmp    0xf50,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 c4 0a 00 00       	push   $0xac4
 413:	68 ce 0a 00 00       	push   $0xace
 418:	6a 01                	push   $0x1
 41a:	e8 f8 03 00 00       	call   817 <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 d6 0a 00 00       	push   $0xad6
 427:	68 f4 0a 00 00       	push   $0xaf4
 42c:	6a 01                	push   $0x1
 42e:	e8 e4 03 00 00       	call   817 <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 08 0b 00 00       	push   $0xb08
 43b:	6a 01                	push   $0x1
 43d:	e8 d5 03 00 00       	call   817 <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 58 0f 00 00    	push   0xf58
 44b:	e8 a2 02 00 00       	call   6f2 <kill>
 450:	e8 6d 02 00 00       	call   6c2 <exit>
   global++;
 455:	83 05 54 0f 00 00 01 	addl   $0x1,0xf54
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 48 0f 00 00       	push   $0xf48
 464:	e8 af 01 00 00       	call   618 <lock_release>
   exit();
 469:	e8 54 02 00 00       	call   6c2 <exit>

0000046e <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	56                   	push   %esi
 472:	53                   	push   %ebx
 473:	8b 75 08             	mov    0x8(%ebp),%esi
 476:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 479:	89 f0                	mov    %esi,%eax
 47b:	89 d1                	mov    %edx,%ecx
 47d:	83 c2 01             	add    $0x1,%edx
 480:	89 c3                	mov    %eax,%ebx
 482:	83 c0 01             	add    $0x1,%eax
 485:	0f b6 09             	movzbl (%ecx),%ecx
 488:	88 0b                	mov    %cl,(%ebx)
 48a:	84 c9                	test   %cl,%cl
 48c:	75 ed                	jne    47b <strcpy+0xd>
    ;
  return os;
}
 48e:	89 f0                	mov    %esi,%eax
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    

00000494 <strcmp>:

int strcmp(const char *p, const char *q)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	8b 4d 08             	mov    0x8(%ebp),%ecx
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 49d:	eb 06                	jmp    4a5 <strcmp+0x11>
    p++, q++;
 49f:	83 c1 01             	add    $0x1,%ecx
 4a2:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 4a5:	0f b6 01             	movzbl (%ecx),%eax
 4a8:	84 c0                	test   %al,%al
 4aa:	74 04                	je     4b0 <strcmp+0x1c>
 4ac:	3a 02                	cmp    (%edx),%al
 4ae:	74 ef                	je     49f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4b0:	0f b6 c0             	movzbl %al,%eax
 4b3:	0f b6 12             	movzbl (%edx),%edx
 4b6:	29 d0                	sub    %edx,%eax
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <strlen>:

uint strlen(const char *s)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 4c0:	b8 00 00 00 00       	mov    $0x0,%eax
 4c5:	eb 03                	jmp    4ca <strlen+0x10>
 4c7:	83 c0 01             	add    $0x1,%eax
 4ca:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4ce:	75 f7                	jne    4c7 <strlen+0xd>
    ;
  return n;
}
 4d0:	5d                   	pop    %ebp
 4d1:	c3                   	ret    

000004d2 <memset>:

void *
memset(void *dst, int c, uint n)
{
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	57                   	push   %edi
 4d6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4d9:	89 d7                	mov    %edx,%edi
 4db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4de:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e1:	fc                   	cld    
 4e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4e4:	89 d0                	mov    %edx,%eax
 4e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    

000004eb <strchr>:

char *
strchr(const char *s, char c)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 4f5:	eb 03                	jmp    4fa <strchr+0xf>
 4f7:	83 c0 01             	add    $0x1,%eax
 4fa:	0f b6 10             	movzbl (%eax),%edx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	74 06                	je     507 <strchr+0x1c>
    if (*s == c)
 501:	38 ca                	cmp    %cl,%dl
 503:	75 f2                	jne    4f7 <strchr+0xc>
 505:	eb 05                	jmp    50c <strchr+0x21>
      return (char *)s;
  return 0;
 507:	b8 00 00 00 00       	mov    $0x0,%eax
}
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    

0000050e <gets>:

char *
gets(char *buf, int max)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	57                   	push   %edi
 512:	56                   	push   %esi
 513:	53                   	push   %ebx
 514:	83 ec 1c             	sub    $0x1c,%esp
 517:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 51a:	bb 00 00 00 00       	mov    $0x0,%ebx
 51f:	89 de                	mov    %ebx,%esi
 521:	83 c3 01             	add    $0x1,%ebx
 524:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 527:	7d 2e                	jge    557 <gets+0x49>
  {
    cc = read(0, &c, 1);
 529:	83 ec 04             	sub    $0x4,%esp
 52c:	6a 01                	push   $0x1
 52e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 531:	50                   	push   %eax
 532:	6a 00                	push   $0x0
 534:	e8 a1 01 00 00       	call   6da <read>
    if (cc < 1)
 539:	83 c4 10             	add    $0x10,%esp
 53c:	85 c0                	test   %eax,%eax
 53e:	7e 17                	jle    557 <gets+0x49>
      break;
    buf[i++] = c;
 540:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 544:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 547:	3c 0a                	cmp    $0xa,%al
 549:	0f 94 c2             	sete   %dl
 54c:	3c 0d                	cmp    $0xd,%al
 54e:	0f 94 c0             	sete   %al
 551:	08 c2                	or     %al,%dl
 553:	74 ca                	je     51f <gets+0x11>
    buf[i++] = c;
 555:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 557:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 55b:	89 f8                	mov    %edi,%eax
 55d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    

00000565 <stat>:

int stat(const char *n, struct stat *st)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 56a:	83 ec 08             	sub    $0x8,%esp
 56d:	6a 00                	push   $0x0
 56f:	ff 75 08             	push   0x8(%ebp)
 572:	e8 8b 01 00 00       	call   702 <open>
  if (fd < 0)
 577:	83 c4 10             	add    $0x10,%esp
 57a:	85 c0                	test   %eax,%eax
 57c:	78 24                	js     5a2 <stat+0x3d>
 57e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 580:	83 ec 08             	sub    $0x8,%esp
 583:	ff 75 0c             	push   0xc(%ebp)
 586:	50                   	push   %eax
 587:	e8 8e 01 00 00       	call   71a <fstat>
 58c:	89 c6                	mov    %eax,%esi
  close(fd);
 58e:	89 1c 24             	mov    %ebx,(%esp)
 591:	e8 54 01 00 00       	call   6ea <close>
  return r;
 596:	83 c4 10             	add    $0x10,%esp
}
 599:	89 f0                	mov    %esi,%eax
 59b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 59e:	5b                   	pop    %ebx
 59f:	5e                   	pop    %esi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    
    return -1;
 5a2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5a7:	eb f0                	jmp    599 <stat+0x34>

000005a9 <atoi>:

int atoi(const char *s)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	53                   	push   %ebx
 5ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5b0:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 5b5:	eb 10                	jmp    5c7 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 5b7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ba:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5bd:	83 c1 01             	add    $0x1,%ecx
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 5c7:	0f b6 01             	movzbl (%ecx),%eax
 5ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5cd:	80 fb 09             	cmp    $0x9,%bl
 5d0:	76 e5                	jbe    5b7 <atoi+0xe>
  return n;
}
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    

000005d9 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	56                   	push   %esi
 5dd:	53                   	push   %ebx
 5de:	8b 75 08             	mov    0x8(%ebp),%esi
 5e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5e7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 5e9:	eb 0d                	jmp    5f8 <memmove+0x1f>
    *dst++ = *src++;
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	88 02                	mov    %al,(%edx)
 5f0:	8d 49 01             	lea    0x1(%ecx),%ecx
 5f3:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 5f6:	89 d8                	mov    %ebx,%eax
 5f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5fb:	85 c0                	test   %eax,%eax
 5fd:	7f ec                	jg     5eb <memmove+0x12>
  return vdst;
}
 5ff:	89 f0                	mov    %esi,%eax
 601:	5b                   	pop    %ebx
 602:	5e                   	pop    %esi
 603:	5d                   	pop    %ebp
 604:	c3                   	ret    

00000605 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 60b:	83 38 01             	cmpl   $0x1,(%eax)
 60e:	74 fb                	je     60b <lock_acquire+0x6>
    ;
  lock->flag = 1;
 610:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 616:	5d                   	pop    %ebp
 617:	c3                   	ret    

00000618 <lock_release>:
void lock_release(lock_t *lock)
{
 618:	55                   	push   %ebp
 619:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 624:	5d                   	pop    %ebp
 625:	c3                   	ret    

00000626 <lock_init>:
void lock_init(lock_t *lock)
{
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    

00000634 <thread_create>:
{
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	53                   	push   %ebx
 638:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 63b:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 63e:	53                   	push   %ebx
 63f:	e8 e2 ff ff ff       	call   626 <lock_init>
  lock_acquire(&lock);
 644:	89 1c 24             	mov    %ebx,(%esp)
 647:	e8 b9 ff ff ff       	call   605 <lock_acquire>
  void *stack = malloc(4096 * 2);
 64c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 653:	e8 e5 03 00 00       	call   a3d <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 658:	50                   	push   %eax
 659:	ff 75 10             	push   0x10(%ebp)
 65c:	ff 75 0c             	push   0xc(%ebp)
 65f:	ff 75 08             	push   0x8(%ebp)
 662:	e8 fb 00 00 00       	call   762 <clone>
}
 667:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66a:	c9                   	leave  
 66b:	c3                   	ret    

0000066c <thread_join>:
{
 66c:	55                   	push   %ebp
 66d:	89 e5                	mov    %esp,%ebp
 66f:	56                   	push   %esi
 670:	53                   	push   %ebx
 671:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 674:	6a 04                	push   $0x4
 676:	e8 c2 03 00 00       	call   a3d <malloc>
 67b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 67e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 681:	89 04 24             	mov    %eax,(%esp)
 684:	e8 e1 00 00 00       	call   76a <join>
 689:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 68b:	8d 75 f0             	lea    -0x10(%ebp),%esi
 68e:	89 34 24             	mov    %esi,(%esp)
 691:	e8 90 ff ff ff       	call   626 <lock_init>
  lock_acquire(&lock);
 696:	89 34 24             	mov    %esi,(%esp)
 699:	e8 67 ff ff ff       	call   605 <lock_acquire>
  free(stack);
 69e:	83 c4 04             	add    $0x4,%esp
 6a1:	ff 75 f4             	push   -0xc(%ebp)
 6a4:	e8 d4 02 00 00       	call   97d <free>
  lock_release(&lock);
 6a9:	89 34 24             	mov    %esi,(%esp)
 6ac:	e8 67 ff ff ff       	call   618 <lock_release>
}
 6b1:	89 d8                	mov    %ebx,%eax
 6b3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6b6:	5b                   	pop    %ebx
 6b7:	5e                   	pop    %esi
 6b8:	5d                   	pop    %ebp
 6b9:	c3                   	ret    

000006ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ba:	b8 01 00 00 00       	mov    $0x1,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <exit>:
SYSCALL(exit)
 6c2:	b8 02 00 00 00       	mov    $0x2,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <wait>:
SYSCALL(wait)
 6ca:	b8 03 00 00 00       	mov    $0x3,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <pipe>:
SYSCALL(pipe)
 6d2:	b8 04 00 00 00       	mov    $0x4,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <read>:
SYSCALL(read)
 6da:	b8 05 00 00 00       	mov    $0x5,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <write>:
SYSCALL(write)
 6e2:	b8 10 00 00 00       	mov    $0x10,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <close>:
SYSCALL(close)
 6ea:	b8 15 00 00 00       	mov    $0x15,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <kill>:
SYSCALL(kill)
 6f2:	b8 06 00 00 00       	mov    $0x6,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <exec>:
SYSCALL(exec)
 6fa:	b8 07 00 00 00       	mov    $0x7,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <open>:
SYSCALL(open)
 702:	b8 0f 00 00 00       	mov    $0xf,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <mknod>:
SYSCALL(mknod)
 70a:	b8 11 00 00 00       	mov    $0x11,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <unlink>:
SYSCALL(unlink)
 712:	b8 12 00 00 00       	mov    $0x12,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <fstat>:
SYSCALL(fstat)
 71a:	b8 08 00 00 00       	mov    $0x8,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <link>:
SYSCALL(link)
 722:	b8 13 00 00 00       	mov    $0x13,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <mkdir>:
SYSCALL(mkdir)
 72a:	b8 14 00 00 00       	mov    $0x14,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <chdir>:
SYSCALL(chdir)
 732:	b8 09 00 00 00       	mov    $0x9,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <dup>:
SYSCALL(dup)
 73a:	b8 0a 00 00 00       	mov    $0xa,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <getpid>:
SYSCALL(getpid)
 742:	b8 0b 00 00 00       	mov    $0xb,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <sbrk>:
SYSCALL(sbrk)
 74a:	b8 0c 00 00 00       	mov    $0xc,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <sleep>:
SYSCALL(sleep)
 752:	b8 0d 00 00 00       	mov    $0xd,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <uptime>:
SYSCALL(uptime)
 75a:	b8 0e 00 00 00       	mov    $0xe,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <clone>:
SYSCALL(clone)
 762:	b8 16 00 00 00       	mov    $0x16,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <join>:
 76a:	b8 17 00 00 00       	mov    $0x17,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 772:	55                   	push   %ebp
 773:	89 e5                	mov    %esp,%ebp
 775:	83 ec 1c             	sub    $0x1c,%esp
 778:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 77b:	6a 01                	push   $0x1
 77d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 780:	52                   	push   %edx
 781:	50                   	push   %eax
 782:	e8 5b ff ff ff       	call   6e2 <write>
}
 787:	83 c4 10             	add    $0x10,%esp
 78a:	c9                   	leave  
 78b:	c3                   	ret    

0000078c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 78c:	55                   	push   %ebp
 78d:	89 e5                	mov    %esp,%ebp
 78f:	57                   	push   %edi
 790:	56                   	push   %esi
 791:	53                   	push   %ebx
 792:	83 ec 2c             	sub    $0x2c,%esp
 795:	89 45 d0             	mov    %eax,-0x30(%ebp)
 798:	89 d0                	mov    %edx,%eax
 79a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 79c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7a0:	0f 95 c1             	setne  %cl
 7a3:	c1 ea 1f             	shr    $0x1f,%edx
 7a6:	84 d1                	test   %dl,%cl
 7a8:	74 44                	je     7ee <printint+0x62>
    neg = 1;
    x = -xx;
 7aa:	f7 d8                	neg    %eax
 7ac:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7ae:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7b5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7ba:	89 c8                	mov    %ecx,%eax
 7bc:	ba 00 00 00 00       	mov    $0x0,%edx
 7c1:	f7 f6                	div    %esi
 7c3:	89 df                	mov    %ebx,%edi
 7c5:	83 c3 01             	add    $0x1,%ebx
 7c8:	0f b6 92 bc 0b 00 00 	movzbl 0xbbc(%edx),%edx
 7cf:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7d3:	89 ca                	mov    %ecx,%edx
 7d5:	89 c1                	mov    %eax,%ecx
 7d7:	39 d6                	cmp    %edx,%esi
 7d9:	76 df                	jbe    7ba <printint+0x2e>
  if(neg)
 7db:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7df:	74 31                	je     812 <printint+0x86>
    buf[i++] = '-';
 7e1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7e6:	8d 5f 02             	lea    0x2(%edi),%ebx
 7e9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7ec:	eb 17                	jmp    805 <printint+0x79>
    x = xx;
 7ee:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7f0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7f7:	eb bc                	jmp    7b5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7f9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7fe:	89 f0                	mov    %esi,%eax
 800:	e8 6d ff ff ff       	call   772 <putc>
  while(--i >= 0)
 805:	83 eb 01             	sub    $0x1,%ebx
 808:	79 ef                	jns    7f9 <printint+0x6d>
}
 80a:	83 c4 2c             	add    $0x2c,%esp
 80d:	5b                   	pop    %ebx
 80e:	5e                   	pop    %esi
 80f:	5f                   	pop    %edi
 810:	5d                   	pop    %ebp
 811:	c3                   	ret    
 812:	8b 75 d0             	mov    -0x30(%ebp),%esi
 815:	eb ee                	jmp    805 <printint+0x79>

00000817 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 817:	55                   	push   %ebp
 818:	89 e5                	mov    %esp,%ebp
 81a:	57                   	push   %edi
 81b:	56                   	push   %esi
 81c:	53                   	push   %ebx
 81d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 820:	8d 45 10             	lea    0x10(%ebp),%eax
 823:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 826:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 82b:	bb 00 00 00 00       	mov    $0x0,%ebx
 830:	eb 14                	jmp    846 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 832:	89 fa                	mov    %edi,%edx
 834:	8b 45 08             	mov    0x8(%ebp),%eax
 837:	e8 36 ff ff ff       	call   772 <putc>
 83c:	eb 05                	jmp    843 <printf+0x2c>
      }
    } else if(state == '%'){
 83e:	83 fe 25             	cmp    $0x25,%esi
 841:	74 25                	je     868 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 843:	83 c3 01             	add    $0x1,%ebx
 846:	8b 45 0c             	mov    0xc(%ebp),%eax
 849:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 84d:	84 c0                	test   %al,%al
 84f:	0f 84 20 01 00 00    	je     975 <printf+0x15e>
    c = fmt[i] & 0xff;
 855:	0f be f8             	movsbl %al,%edi
 858:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 85b:	85 f6                	test   %esi,%esi
 85d:	75 df                	jne    83e <printf+0x27>
      if(c == '%'){
 85f:	83 f8 25             	cmp    $0x25,%eax
 862:	75 ce                	jne    832 <printf+0x1b>
        state = '%';
 864:	89 c6                	mov    %eax,%esi
 866:	eb db                	jmp    843 <printf+0x2c>
      if(c == 'd'){
 868:	83 f8 25             	cmp    $0x25,%eax
 86b:	0f 84 cf 00 00 00    	je     940 <printf+0x129>
 871:	0f 8c dd 00 00 00    	jl     954 <printf+0x13d>
 877:	83 f8 78             	cmp    $0x78,%eax
 87a:	0f 8f d4 00 00 00    	jg     954 <printf+0x13d>
 880:	83 f8 63             	cmp    $0x63,%eax
 883:	0f 8c cb 00 00 00    	jl     954 <printf+0x13d>
 889:	83 e8 63             	sub    $0x63,%eax
 88c:	83 f8 15             	cmp    $0x15,%eax
 88f:	0f 87 bf 00 00 00    	ja     954 <printf+0x13d>
 895:	ff 24 85 64 0b 00 00 	jmp    *0xb64(,%eax,4)
        printint(fd, *ap, 10, 1);
 89c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 89f:	8b 17                	mov    (%edi),%edx
 8a1:	83 ec 0c             	sub    $0xc,%esp
 8a4:	6a 01                	push   $0x1
 8a6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8ab:	8b 45 08             	mov    0x8(%ebp),%eax
 8ae:	e8 d9 fe ff ff       	call   78c <printint>
        ap++;
 8b3:	83 c7 04             	add    $0x4,%edi
 8b6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8bc:	be 00 00 00 00       	mov    $0x0,%esi
 8c1:	eb 80                	jmp    843 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8c3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c6:	8b 17                	mov    (%edi),%edx
 8c8:	83 ec 0c             	sub    $0xc,%esp
 8cb:	6a 00                	push   $0x0
 8cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 8d2:	8b 45 08             	mov    0x8(%ebp),%eax
 8d5:	e8 b2 fe ff ff       	call   78c <printint>
        ap++;
 8da:	83 c7 04             	add    $0x4,%edi
 8dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8e0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8e3:	be 00 00 00 00       	mov    $0x0,%esi
 8e8:	e9 56 ff ff ff       	jmp    843 <printf+0x2c>
        s = (char*)*ap;
 8ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f0:	8b 30                	mov    (%eax),%esi
        ap++;
 8f2:	83 c0 04             	add    $0x4,%eax
 8f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8f8:	85 f6                	test   %esi,%esi
 8fa:	75 15                	jne    911 <printf+0xfa>
          s = "(null)";
 8fc:	be 5c 0b 00 00       	mov    $0xb5c,%esi
 901:	eb 0e                	jmp    911 <printf+0xfa>
          putc(fd, *s);
 903:	0f be d2             	movsbl %dl,%edx
 906:	8b 45 08             	mov    0x8(%ebp),%eax
 909:	e8 64 fe ff ff       	call   772 <putc>
          s++;
 90e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 911:	0f b6 16             	movzbl (%esi),%edx
 914:	84 d2                	test   %dl,%dl
 916:	75 eb                	jne    903 <printf+0xec>
      state = 0;
 918:	be 00 00 00 00       	mov    $0x0,%esi
 91d:	e9 21 ff ff ff       	jmp    843 <printf+0x2c>
        putc(fd, *ap);
 922:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 925:	0f be 17             	movsbl (%edi),%edx
 928:	8b 45 08             	mov    0x8(%ebp),%eax
 92b:	e8 42 fe ff ff       	call   772 <putc>
        ap++;
 930:	83 c7 04             	add    $0x4,%edi
 933:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 936:	be 00 00 00 00       	mov    $0x0,%esi
 93b:	e9 03 ff ff ff       	jmp    843 <printf+0x2c>
        putc(fd, c);
 940:	89 fa                	mov    %edi,%edx
 942:	8b 45 08             	mov    0x8(%ebp),%eax
 945:	e8 28 fe ff ff       	call   772 <putc>
      state = 0;
 94a:	be 00 00 00 00       	mov    $0x0,%esi
 94f:	e9 ef fe ff ff       	jmp    843 <printf+0x2c>
        putc(fd, '%');
 954:	ba 25 00 00 00       	mov    $0x25,%edx
 959:	8b 45 08             	mov    0x8(%ebp),%eax
 95c:	e8 11 fe ff ff       	call   772 <putc>
        putc(fd, c);
 961:	89 fa                	mov    %edi,%edx
 963:	8b 45 08             	mov    0x8(%ebp),%eax
 966:	e8 07 fe ff ff       	call   772 <putc>
      state = 0;
 96b:	be 00 00 00 00       	mov    $0x0,%esi
 970:	e9 ce fe ff ff       	jmp    843 <printf+0x2c>
    }
  }
}
 975:	8d 65 f4             	lea    -0xc(%ebp),%esp
 978:	5b                   	pop    %ebx
 979:	5e                   	pop    %esi
 97a:	5f                   	pop    %edi
 97b:	5d                   	pop    %ebp
 97c:	c3                   	ret    

0000097d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 97d:	55                   	push   %ebp
 97e:	89 e5                	mov    %esp,%ebp
 980:	57                   	push   %edi
 981:	56                   	push   %esi
 982:	53                   	push   %ebx
 983:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 986:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 989:	a1 5c 0f 00 00       	mov    0xf5c,%eax
 98e:	eb 02                	jmp    992 <free+0x15>
 990:	89 d0                	mov    %edx,%eax
 992:	39 c8                	cmp    %ecx,%eax
 994:	73 04                	jae    99a <free+0x1d>
 996:	39 08                	cmp    %ecx,(%eax)
 998:	77 12                	ja     9ac <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 99a:	8b 10                	mov    (%eax),%edx
 99c:	39 c2                	cmp    %eax,%edx
 99e:	77 f0                	ja     990 <free+0x13>
 9a0:	39 c8                	cmp    %ecx,%eax
 9a2:	72 08                	jb     9ac <free+0x2f>
 9a4:	39 ca                	cmp    %ecx,%edx
 9a6:	77 04                	ja     9ac <free+0x2f>
 9a8:	89 d0                	mov    %edx,%eax
 9aa:	eb e6                	jmp    992 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9ac:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9af:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9b2:	8b 10                	mov    (%eax),%edx
 9b4:	39 d7                	cmp    %edx,%edi
 9b6:	74 19                	je     9d1 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9b8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bb:	8b 50 04             	mov    0x4(%eax),%edx
 9be:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9c1:	39 ce                	cmp    %ecx,%esi
 9c3:	74 1b                	je     9e0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9c5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9c7:	a3 5c 0f 00 00       	mov    %eax,0xf5c
}
 9cc:	5b                   	pop    %ebx
 9cd:	5e                   	pop    %esi
 9ce:	5f                   	pop    %edi
 9cf:	5d                   	pop    %ebp
 9d0:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9d1:	03 72 04             	add    0x4(%edx),%esi
 9d4:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d7:	8b 10                	mov    (%eax),%edx
 9d9:	8b 12                	mov    (%edx),%edx
 9db:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9de:	eb db                	jmp    9bb <free+0x3e>
    p->s.size += bp->s.size;
 9e0:	03 53 fc             	add    -0x4(%ebx),%edx
 9e3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9e9:	89 10                	mov    %edx,(%eax)
 9eb:	eb da                	jmp    9c7 <free+0x4a>

000009ed <morecore>:

static Header*
morecore(uint nu)
{
 9ed:	55                   	push   %ebp
 9ee:	89 e5                	mov    %esp,%ebp
 9f0:	53                   	push   %ebx
 9f1:	83 ec 04             	sub    $0x4,%esp
 9f4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9f6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9fb:	77 05                	ja     a02 <morecore+0x15>
    nu = 4096;
 9fd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a02:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a09:	83 ec 0c             	sub    $0xc,%esp
 a0c:	50                   	push   %eax
 a0d:	e8 38 fd ff ff       	call   74a <sbrk>
  if(p == (char*)-1)
 a12:	83 c4 10             	add    $0x10,%esp
 a15:	83 f8 ff             	cmp    $0xffffffff,%eax
 a18:	74 1c                	je     a36 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a1a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a1d:	83 c0 08             	add    $0x8,%eax
 a20:	83 ec 0c             	sub    $0xc,%esp
 a23:	50                   	push   %eax
 a24:	e8 54 ff ff ff       	call   97d <free>
  return freep;
 a29:	a1 5c 0f 00 00       	mov    0xf5c,%eax
 a2e:	83 c4 10             	add    $0x10,%esp
}
 a31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a34:	c9                   	leave  
 a35:	c3                   	ret    
    return 0;
 a36:	b8 00 00 00 00       	mov    $0x0,%eax
 a3b:	eb f4                	jmp    a31 <morecore+0x44>

00000a3d <malloc>:

void*
malloc(uint nbytes)
{
 a3d:	55                   	push   %ebp
 a3e:	89 e5                	mov    %esp,%ebp
 a40:	53                   	push   %ebx
 a41:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a44:	8b 45 08             	mov    0x8(%ebp),%eax
 a47:	8d 58 07             	lea    0x7(%eax),%ebx
 a4a:	c1 eb 03             	shr    $0x3,%ebx
 a4d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a50:	8b 0d 5c 0f 00 00    	mov    0xf5c,%ecx
 a56:	85 c9                	test   %ecx,%ecx
 a58:	74 04                	je     a5e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a5a:	8b 01                	mov    (%ecx),%eax
 a5c:	eb 4a                	jmp    aa8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a5e:	c7 05 5c 0f 00 00 60 	movl   $0xf60,0xf5c
 a65:	0f 00 00 
 a68:	c7 05 60 0f 00 00 60 	movl   $0xf60,0xf60
 a6f:	0f 00 00 
    base.s.size = 0;
 a72:	c7 05 64 0f 00 00 00 	movl   $0x0,0xf64
 a79:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a7c:	b9 60 0f 00 00       	mov    $0xf60,%ecx
 a81:	eb d7                	jmp    a5a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a83:	74 19                	je     a9e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a85:	29 da                	sub    %ebx,%edx
 a87:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a8a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a8d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a90:	89 0d 5c 0f 00 00    	mov    %ecx,0xf5c
      return (void*)(p + 1);
 a96:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a99:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a9c:	c9                   	leave  
 a9d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a9e:	8b 10                	mov    (%eax),%edx
 aa0:	89 11                	mov    %edx,(%ecx)
 aa2:	eb ec                	jmp    a90 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa4:	89 c1                	mov    %eax,%ecx
 aa6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 aa8:	8b 50 04             	mov    0x4(%eax),%edx
 aab:	39 da                	cmp    %ebx,%edx
 aad:	73 d4                	jae    a83 <malloc+0x46>
    if(p == freep)
 aaf:	39 05 5c 0f 00 00    	cmp    %eax,0xf5c
 ab5:	75 ed                	jne    aa4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ab7:	89 d8                	mov    %ebx,%eax
 ab9:	e8 2f ff ff ff       	call   9ed <morecore>
 abe:	85 c0                	test   %eax,%eax
 ac0:	75 e2                	jne    aa4 <malloc+0x67>
 ac2:	eb d5                	jmp    a99 <malloc+0x5c>
