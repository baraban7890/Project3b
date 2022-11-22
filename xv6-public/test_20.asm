
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 9c 0e 00 00       	push   $0xe9c
   b:	e8 46 05 00 00       	call   556 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 7f 06 00 00       	call   69b <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 a0 0e 00 00    	cmp    0xea0,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 18 0a 00 00       	push   $0xa18
  2e:	68 22 0a 00 00       	push   $0xa22
  33:	6a 01                	push   $0x1
  35:	e8 2e 07 00 00       	call   768 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 2a 0a 00 00       	push   $0xa2a
  42:	68 48 0a 00 00       	push   $0xa48
  47:	6a 01                	push   $0x1
  49:	e8 1a 07 00 00       	call   768 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 5c 0a 00 00       	push   $0xa5c
  56:	6a 01                	push   $0x1
  58:	e8 0b 07 00 00       	call   768 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 a8 0e 00 00    	push   0xea8
  66:	e8 d8 05 00 00       	call   643 <kill>
  6b:	e8 a3 05 00 00       	call   613 <exit>
   global++;
  70:	83 05 a4 0e 00 00 01 	addl   $0x1,0xea4
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 9c 0e 00 00       	push   $0xe9c
  7f:	e8 e5 04 00 00       	call   569 <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 98 0e 00 00 	movl   $0xe98,(%esp)
  8b:	e8 c6 04 00 00       	call   556 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 ff 05 00 00       	call   69b <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 a0 0e 00 00    	cmp    0xea0,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 18 0a 00 00       	push   $0xa18
  ae:	68 22 0a 00 00       	push   $0xa22
  b3:	6a 01                	push   $0x1
  b5:	e8 ae 06 00 00       	call   768 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 2a 0a 00 00       	push   $0xa2a
  c2:	68 48 0a 00 00       	push   $0xa48
  c7:	6a 01                	push   $0x1
  c9:	e8 9a 06 00 00       	call   768 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 5c 0a 00 00       	push   $0xa5c
  d6:	6a 01                	push   $0x1
  d8:	e8 8b 06 00 00       	call   768 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 a8 0e 00 00    	push   0xea8
  e6:	e8 58 05 00 00       	call   643 <kill>
  eb:	e8 23 05 00 00       	call   613 <exit>
   global++;
  f0:	83 05 a4 0e 00 00 01 	addl   $0x1,0xea4
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 98 0e 00 00       	push   $0xe98
  ff:	e8 65 04 00 00       	call   569 <lock_release>

   
   exit();
 104:	e8 0a 05 00 00       	call   613 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 9c 0e 00 00       	push   $0xe9c
 114:	e8 5e 04 00 00       	call   577 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 98 0e 00 00 	movl   $0xe98,(%esp)
 120:	e8 52 04 00 00       	call   577 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 9c 0e 00 00 	movl   $0xe9c,(%esp)
 12c:	e8 25 04 00 00       	call   556 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 98 0e 00 00 	movl   $0xe98,(%esp)
 138:	e8 19 04 00 00       	call   556 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 37 04 00 00       	call   585 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
 15a:	e8 3c 05 00 00       	call   69b <sbrk>
 15f:	a3 a0 0e 00 00       	mov    %eax,0xea0

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 18 0a 00 00       	push   $0xa18
 170:	68 22 0a 00 00       	push   $0xa22
 175:	6a 01                	push   $0x1
 177:	e8 ec 05 00 00       	call   768 <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 69 0a 00 00       	push   $0xa69
 184:	68 48 0a 00 00       	push   $0xa48
 189:	6a 01                	push   $0x1
 18b:	e8 d8 05 00 00       	call   768 <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 5c 0a 00 00       	push   $0xa5c
 198:	6a 01                	push   $0x1
 19a:	e8 c9 05 00 00       	call   768 <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 a8 0e 00 00    	push   0xea8
 1a8:	e8 96 04 00 00       	call   643 <kill>
 1ad:	e8 61 04 00 00       	call   613 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 9c 0e 00 00       	push   $0xe9c
 1ba:	e8 aa 03 00 00       	call   569 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 d8 04 00 00       	call   6a3 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 9c 0e 00 00 	movl   $0xe9c,(%esp)
 1d2:	e8 7f 03 00 00       	call   556 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 94 0e 00 00       	mov    0xe94,%eax
 1df:	39 05 a4 0e 00 00    	cmp    %eax,0xea4
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 a4 0e 00 00 00 	movl   $0x0,0xea4
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 9d 04 00 00       	call   69b <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 91 04 00 00       	call   69b <sbrk>
 20a:	a3 a0 0e 00 00       	mov    %eax,0xea0
   lock_release(&lock);
 20f:	c7 04 24 9c 0e 00 00 	movl   $0xe9c,(%esp)
 216:	e8 4e 03 00 00       	call   569 <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 98 0e 00 00       	push   $0xe98
 228:	e8 3c 03 00 00       	call   569 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 6a 04 00 00       	call   6a3 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 98 0e 00 00 	movl   $0xe98,(%esp)
 240:	e8 11 03 00 00       	call   556 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 94 0e 00 00       	mov    0xe94,%eax
 24d:	39 05 a4 0e 00 00    	cmp    %eax,0xea4
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 98 0e 00 00       	push   $0xe98
 25d:	e8 07 03 00 00       	call   569 <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 56 03 00 00       	call   5bd <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 a0 03 00 00       	call   613 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 18 0a 00 00       	push   $0xa18
 27a:	68 22 0a 00 00       	push   $0xa22
 27f:	6a 01                	push   $0x1
 281:	e8 e2 04 00 00       	call   768 <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 7e 0a 00 00       	push   $0xa7e
 28e:	68 48 0a 00 00       	push   $0xa48
 293:	6a 01                	push   $0x1
 295:	e8 ce 04 00 00       	call   768 <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 5c 0a 00 00       	push   $0xa5c
 2a2:	6a 01                	push   $0x1
 2a4:	e8 bf 04 00 00       	call   768 <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 a8 0e 00 00    	push   0xea8
 2b2:	e8 8c 03 00 00       	call   643 <kill>
 2b7:	e8 57 03 00 00       	call   613 <exit>

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
 2cd:	e8 c1 03 00 00       	call   693 <getpid>
 2d2:	a3 a8 0e 00 00       	mov    %eax,0xea8
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 ac 03 00 00       	call   69b <sbrk>
 2ef:	a3 a0 0e 00 00       	mov    %eax,0xea0
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 7c 02 00 00       	call   585 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
 310:	e8 a8 02 00 00       	call   5bd <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 a1 0a 00 00       	push   $0xaa1
 321:	6a 01                	push   $0x1
 323:	e8 40 04 00 00       	call   768 <printf>
   exit();
 328:	e8 e6 02 00 00       	call   613 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 18 0a 00 00       	push   $0xa18
 334:	68 22 0a 00 00       	push   $0xa22
 339:	6a 01                	push   $0x1
 33b:	e8 28 04 00 00       	call   768 <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 92 0a 00 00       	push   $0xa92
 348:	68 48 0a 00 00       	push   $0xa48
 34d:	6a 01                	push   $0x1
 34f:	e8 14 04 00 00       	call   768 <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 5c 0a 00 00       	push   $0xa5c
 35c:	6a 01                	push   $0x1
 35e:	e8 05 04 00 00       	call   768 <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 a8 0e 00 00    	push   0xea8
 36c:	e8 d2 02 00 00       	call   643 <kill>
 371:	e8 9d 02 00 00       	call   613 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 18 0a 00 00       	push   $0xa18
 37d:	68 22 0a 00 00       	push   $0xa22
 382:	6a 01                	push   $0x1
 384:	e8 df 03 00 00       	call   768 <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 85 0a 00 00       	push   $0xa85
 391:	68 48 0a 00 00       	push   $0xa48
 396:	6a 01                	push   $0x1
 398:	e8 cb 03 00 00       	call   768 <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 5c 0a 00 00       	push   $0xa5c
 3a5:	6a 01                	push   $0x1
 3a7:	e8 bc 03 00 00       	call   768 <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 a8 0e 00 00    	push   0xea8
 3b5:	e8 89 02 00 00       	call   643 <kill>
 3ba:	e8 54 02 00 00       	call   613 <exit>

000003bf <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
 3c4:	8b 75 08             	mov    0x8(%ebp),%esi
 3c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 3ca:	89 f0                	mov    %esi,%eax
 3cc:	89 d1                	mov    %edx,%ecx
 3ce:	83 c2 01             	add    $0x1,%edx
 3d1:	89 c3                	mov    %eax,%ebx
 3d3:	83 c0 01             	add    $0x1,%eax
 3d6:	0f b6 09             	movzbl (%ecx),%ecx
 3d9:	88 0b                	mov    %cl,(%ebx)
 3db:	84 c9                	test   %cl,%cl
 3dd:	75 ed                	jne    3cc <strcpy+0xd>
    ;
  return os;
}
 3df:	89 f0                	mov    %esi,%eax
 3e1:	5b                   	pop    %ebx
 3e2:	5e                   	pop    %esi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strcmp>:

int strcmp(const char *p, const char *q)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 3ee:	eb 06                	jmp    3f6 <strcmp+0x11>
    p++, q++;
 3f0:	83 c1 01             	add    $0x1,%ecx
 3f3:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 3f6:	0f b6 01             	movzbl (%ecx),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	74 04                	je     401 <strcmp+0x1c>
 3fd:	3a 02                	cmp    (%edx),%al
 3ff:	74 ef                	je     3f0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 401:	0f b6 c0             	movzbl %al,%eax
 404:	0f b6 12             	movzbl (%edx),%edx
 407:	29 d0                	sub    %edx,%eax
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <strlen>:

uint strlen(const char *s)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 411:	b8 00 00 00 00       	mov    $0x0,%eax
 416:	eb 03                	jmp    41b <strlen+0x10>
 418:	83 c0 01             	add    $0x1,%eax
 41b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41f:	75 f7                	jne    418 <strlen+0xd>
    ;
  return n;
}
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    

00000423 <memset>:

void *
memset(void *dst, int c, uint n)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	57                   	push   %edi
 427:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 42a:	89 d7                	mov    %edx,%edi
 42c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42f:	8b 45 0c             	mov    0xc(%ebp),%eax
 432:	fc                   	cld    
 433:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 435:	89 d0                	mov    %edx,%eax
 437:	8b 7d fc             	mov    -0x4(%ebp),%edi
 43a:	c9                   	leave  
 43b:	c3                   	ret    

0000043c <strchr>:

char *
strchr(const char *s, char c)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 446:	eb 03                	jmp    44b <strchr+0xf>
 448:	83 c0 01             	add    $0x1,%eax
 44b:	0f b6 10             	movzbl (%eax),%edx
 44e:	84 d2                	test   %dl,%dl
 450:	74 06                	je     458 <strchr+0x1c>
    if (*s == c)
 452:	38 ca                	cmp    %cl,%dl
 454:	75 f2                	jne    448 <strchr+0xc>
 456:	eb 05                	jmp    45d <strchr+0x21>
      return (char *)s;
  return 0;
 458:	b8 00 00 00 00       	mov    $0x0,%eax
}
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <gets>:

char *
gets(char *buf, int max)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	57                   	push   %edi
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	83 ec 1c             	sub    $0x1c,%esp
 468:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 46b:	bb 00 00 00 00       	mov    $0x0,%ebx
 470:	89 de                	mov    %ebx,%esi
 472:	83 c3 01             	add    $0x1,%ebx
 475:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 478:	7d 2e                	jge    4a8 <gets+0x49>
  {
    cc = read(0, &c, 1);
 47a:	83 ec 04             	sub    $0x4,%esp
 47d:	6a 01                	push   $0x1
 47f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 482:	50                   	push   %eax
 483:	6a 00                	push   $0x0
 485:	e8 a1 01 00 00       	call   62b <read>
    if (cc < 1)
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	85 c0                	test   %eax,%eax
 48f:	7e 17                	jle    4a8 <gets+0x49>
      break;
    buf[i++] = c;
 491:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 495:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 498:	3c 0a                	cmp    $0xa,%al
 49a:	0f 94 c2             	sete   %dl
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	0f 94 c0             	sete   %al
 4a2:	08 c2                	or     %al,%dl
 4a4:	74 ca                	je     470 <gets+0x11>
    buf[i++] = c;
 4a6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4ac:	89 f8                	mov    %edi,%eax
 4ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b1:	5b                   	pop    %ebx
 4b2:	5e                   	pop    %esi
 4b3:	5f                   	pop    %edi
 4b4:	5d                   	pop    %ebp
 4b5:	c3                   	ret    

000004b6 <stat>:

int stat(const char *n, struct stat *st)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	56                   	push   %esi
 4ba:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4bb:	83 ec 08             	sub    $0x8,%esp
 4be:	6a 00                	push   $0x0
 4c0:	ff 75 08             	push   0x8(%ebp)
 4c3:	e8 8b 01 00 00       	call   653 <open>
  if (fd < 0)
 4c8:	83 c4 10             	add    $0x10,%esp
 4cb:	85 c0                	test   %eax,%eax
 4cd:	78 24                	js     4f3 <stat+0x3d>
 4cf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	ff 75 0c             	push   0xc(%ebp)
 4d7:	50                   	push   %eax
 4d8:	e8 8e 01 00 00       	call   66b <fstat>
 4dd:	89 c6                	mov    %eax,%esi
  close(fd);
 4df:	89 1c 24             	mov    %ebx,(%esp)
 4e2:	e8 54 01 00 00       	call   63b <close>
  return r;
 4e7:	83 c4 10             	add    $0x10,%esp
}
 4ea:	89 f0                	mov    %esi,%eax
 4ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    
    return -1;
 4f3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f8:	eb f0                	jmp    4ea <stat+0x34>

000004fa <atoi>:

int atoi(const char *s)
{
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	53                   	push   %ebx
 4fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 501:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 506:	eb 10                	jmp    518 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 508:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 50b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 50e:	83 c1 01             	add    $0x1,%ecx
 511:	0f be c0             	movsbl %al,%eax
 514:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 518:	0f b6 01             	movzbl (%ecx),%eax
 51b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 51e:	80 fb 09             	cmp    $0x9,%bl
 521:	76 e5                	jbe    508 <atoi+0xe>
  return n;
}
 523:	89 d0                	mov    %edx,%eax
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	c9                   	leave  
 529:	c3                   	ret    

0000052a <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	56                   	push   %esi
 52e:	53                   	push   %ebx
 52f:	8b 75 08             	mov    0x8(%ebp),%esi
 532:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 535:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 538:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 53a:	eb 0d                	jmp    549 <memmove+0x1f>
    *dst++ = *src++;
 53c:	0f b6 01             	movzbl (%ecx),%eax
 53f:	88 02                	mov    %al,(%edx)
 541:	8d 49 01             	lea    0x1(%ecx),%ecx
 544:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 547:	89 d8                	mov    %ebx,%eax
 549:	8d 58 ff             	lea    -0x1(%eax),%ebx
 54c:	85 c0                	test   %eax,%eax
 54e:	7f ec                	jg     53c <memmove+0x12>
  return vdst;
}
 550:	89 f0                	mov    %esi,%eax
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 55c:	83 38 01             	cmpl   $0x1,(%eax)
 55f:	74 fb                	je     55c <lock_acquire+0x6>
    ;
  lock->flag = 1;
 561:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 567:	5d                   	pop    %ebp
 568:	c3                   	ret    

00000569 <lock_release>:
void lock_release(lock_t *lock)
{
 569:	55                   	push   %ebp
 56a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    

00000577 <lock_init>:
void lock_init(lock_t *lock)
{
 577:	55                   	push   %ebp
 578:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 57a:	8b 45 08             	mov    0x8(%ebp),%eax
 57d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 583:	5d                   	pop    %ebp
 584:	c3                   	ret    

00000585 <thread_create>:
{
 585:	55                   	push   %ebp
 586:	89 e5                	mov    %esp,%ebp
 588:	53                   	push   %ebx
 589:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 58c:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 58f:	53                   	push   %ebx
 590:	e8 e2 ff ff ff       	call   577 <lock_init>
  lock_acquire(&lock);
 595:	89 1c 24             	mov    %ebx,(%esp)
 598:	e8 b9 ff ff ff       	call   556 <lock_acquire>
  void *stack = malloc(4096 * 2);
 59d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 5a4:	e8 e5 03 00 00       	call   98e <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 5a9:	50                   	push   %eax
 5aa:	ff 75 10             	push   0x10(%ebp)
 5ad:	ff 75 0c             	push   0xc(%ebp)
 5b0:	ff 75 08             	push   0x8(%ebp)
 5b3:	e8 fb 00 00 00       	call   6b3 <clone>
}
 5b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    

000005bd <thread_join>:
{
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	56                   	push   %esi
 5c1:	53                   	push   %ebx
 5c2:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 5c5:	6a 04                	push   $0x4
 5c7:	e8 c2 03 00 00       	call   98e <malloc>
 5cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 5cf:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5d2:	89 04 24             	mov    %eax,(%esp)
 5d5:	e8 e1 00 00 00       	call   6bb <join>
 5da:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 5dc:	8d 75 f0             	lea    -0x10(%ebp),%esi
 5df:	89 34 24             	mov    %esi,(%esp)
 5e2:	e8 90 ff ff ff       	call   577 <lock_init>
  lock_acquire(&lock);
 5e7:	89 34 24             	mov    %esi,(%esp)
 5ea:	e8 67 ff ff ff       	call   556 <lock_acquire>
  free(stack);
 5ef:	83 c4 04             	add    $0x4,%esp
 5f2:	ff 75 f4             	push   -0xc(%ebp)
 5f5:	e8 d4 02 00 00       	call   8ce <free>
  lock_release(&lock);
 5fa:	89 34 24             	mov    %esi,(%esp)
 5fd:	e8 67 ff ff ff       	call   569 <lock_release>
}
 602:	89 d8                	mov    %ebx,%eax
 604:	8d 65 f8             	lea    -0x8(%ebp),%esp
 607:	5b                   	pop    %ebx
 608:	5e                   	pop    %esi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret    

0000060b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 60b:	b8 01 00 00 00       	mov    $0x1,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <exit>:
SYSCALL(exit)
 613:	b8 02 00 00 00       	mov    $0x2,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <wait>:
SYSCALL(wait)
 61b:	b8 03 00 00 00       	mov    $0x3,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <pipe>:
SYSCALL(pipe)
 623:	b8 04 00 00 00       	mov    $0x4,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <read>:
SYSCALL(read)
 62b:	b8 05 00 00 00       	mov    $0x5,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <write>:
SYSCALL(write)
 633:	b8 10 00 00 00       	mov    $0x10,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <close>:
SYSCALL(close)
 63b:	b8 15 00 00 00       	mov    $0x15,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <kill>:
SYSCALL(kill)
 643:	b8 06 00 00 00       	mov    $0x6,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <exec>:
SYSCALL(exec)
 64b:	b8 07 00 00 00       	mov    $0x7,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <open>:
SYSCALL(open)
 653:	b8 0f 00 00 00       	mov    $0xf,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <mknod>:
SYSCALL(mknod)
 65b:	b8 11 00 00 00       	mov    $0x11,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <unlink>:
SYSCALL(unlink)
 663:	b8 12 00 00 00       	mov    $0x12,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <fstat>:
SYSCALL(fstat)
 66b:	b8 08 00 00 00       	mov    $0x8,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <link>:
SYSCALL(link)
 673:	b8 13 00 00 00       	mov    $0x13,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <mkdir>:
SYSCALL(mkdir)
 67b:	b8 14 00 00 00       	mov    $0x14,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <chdir>:
SYSCALL(chdir)
 683:	b8 09 00 00 00       	mov    $0x9,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <dup>:
SYSCALL(dup)
 68b:	b8 0a 00 00 00       	mov    $0xa,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <getpid>:
SYSCALL(getpid)
 693:	b8 0b 00 00 00       	mov    $0xb,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <sbrk>:
SYSCALL(sbrk)
 69b:	b8 0c 00 00 00       	mov    $0xc,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <sleep>:
SYSCALL(sleep)
 6a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <uptime>:
SYSCALL(uptime)
 6ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <clone>:
SYSCALL(clone)
 6b3:	b8 16 00 00 00       	mov    $0x16,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <join>:
 6bb:	b8 17 00 00 00       	mov    $0x17,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6c3:	55                   	push   %ebp
 6c4:	89 e5                	mov    %esp,%ebp
 6c6:	83 ec 1c             	sub    $0x1c,%esp
 6c9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6cc:	6a 01                	push   $0x1
 6ce:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6d1:	52                   	push   %edx
 6d2:	50                   	push   %eax
 6d3:	e8 5b ff ff ff       	call   633 <write>
}
 6d8:	83 c4 10             	add    $0x10,%esp
 6db:	c9                   	leave  
 6dc:	c3                   	ret    

000006dd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6dd:	55                   	push   %ebp
 6de:	89 e5                	mov    %esp,%ebp
 6e0:	57                   	push   %edi
 6e1:	56                   	push   %esi
 6e2:	53                   	push   %ebx
 6e3:	83 ec 2c             	sub    $0x2c,%esp
 6e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e9:	89 d0                	mov    %edx,%eax
 6eb:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6f1:	0f 95 c1             	setne  %cl
 6f4:	c1 ea 1f             	shr    $0x1f,%edx
 6f7:	84 d1                	test   %dl,%cl
 6f9:	74 44                	je     73f <printint+0x62>
    neg = 1;
    x = -xx;
 6fb:	f7 d8                	neg    %eax
 6fd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6ff:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 706:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 70b:	89 c8                	mov    %ecx,%eax
 70d:	ba 00 00 00 00       	mov    $0x0,%edx
 712:	f7 f6                	div    %esi
 714:	89 df                	mov    %ebx,%edi
 716:	83 c3 01             	add    $0x1,%ebx
 719:	0f b6 92 10 0b 00 00 	movzbl 0xb10(%edx),%edx
 720:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 724:	89 ca                	mov    %ecx,%edx
 726:	89 c1                	mov    %eax,%ecx
 728:	39 d6                	cmp    %edx,%esi
 72a:	76 df                	jbe    70b <printint+0x2e>
  if(neg)
 72c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 730:	74 31                	je     763 <printint+0x86>
    buf[i++] = '-';
 732:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 737:	8d 5f 02             	lea    0x2(%edi),%ebx
 73a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 73d:	eb 17                	jmp    756 <printint+0x79>
    x = xx;
 73f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 741:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 748:	eb bc                	jmp    706 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 74a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 74f:	89 f0                	mov    %esi,%eax
 751:	e8 6d ff ff ff       	call   6c3 <putc>
  while(--i >= 0)
 756:	83 eb 01             	sub    $0x1,%ebx
 759:	79 ef                	jns    74a <printint+0x6d>
}
 75b:	83 c4 2c             	add    $0x2c,%esp
 75e:	5b                   	pop    %ebx
 75f:	5e                   	pop    %esi
 760:	5f                   	pop    %edi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    
 763:	8b 75 d0             	mov    -0x30(%ebp),%esi
 766:	eb ee                	jmp    756 <printint+0x79>

00000768 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 768:	55                   	push   %ebp
 769:	89 e5                	mov    %esp,%ebp
 76b:	57                   	push   %edi
 76c:	56                   	push   %esi
 76d:	53                   	push   %ebx
 76e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 771:	8d 45 10             	lea    0x10(%ebp),%eax
 774:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 777:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 77c:	bb 00 00 00 00       	mov    $0x0,%ebx
 781:	eb 14                	jmp    797 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 783:	89 fa                	mov    %edi,%edx
 785:	8b 45 08             	mov    0x8(%ebp),%eax
 788:	e8 36 ff ff ff       	call   6c3 <putc>
 78d:	eb 05                	jmp    794 <printf+0x2c>
      }
    } else if(state == '%'){
 78f:	83 fe 25             	cmp    $0x25,%esi
 792:	74 25                	je     7b9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 794:	83 c3 01             	add    $0x1,%ebx
 797:	8b 45 0c             	mov    0xc(%ebp),%eax
 79a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 79e:	84 c0                	test   %al,%al
 7a0:	0f 84 20 01 00 00    	je     8c6 <printf+0x15e>
    c = fmt[i] & 0xff;
 7a6:	0f be f8             	movsbl %al,%edi
 7a9:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7ac:	85 f6                	test   %esi,%esi
 7ae:	75 df                	jne    78f <printf+0x27>
      if(c == '%'){
 7b0:	83 f8 25             	cmp    $0x25,%eax
 7b3:	75 ce                	jne    783 <printf+0x1b>
        state = '%';
 7b5:	89 c6                	mov    %eax,%esi
 7b7:	eb db                	jmp    794 <printf+0x2c>
      if(c == 'd'){
 7b9:	83 f8 25             	cmp    $0x25,%eax
 7bc:	0f 84 cf 00 00 00    	je     891 <printf+0x129>
 7c2:	0f 8c dd 00 00 00    	jl     8a5 <printf+0x13d>
 7c8:	83 f8 78             	cmp    $0x78,%eax
 7cb:	0f 8f d4 00 00 00    	jg     8a5 <printf+0x13d>
 7d1:	83 f8 63             	cmp    $0x63,%eax
 7d4:	0f 8c cb 00 00 00    	jl     8a5 <printf+0x13d>
 7da:	83 e8 63             	sub    $0x63,%eax
 7dd:	83 f8 15             	cmp    $0x15,%eax
 7e0:	0f 87 bf 00 00 00    	ja     8a5 <printf+0x13d>
 7e6:	ff 24 85 b8 0a 00 00 	jmp    *0xab8(,%eax,4)
        printint(fd, *ap, 10, 1);
 7ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f0:	8b 17                	mov    (%edi),%edx
 7f2:	83 ec 0c             	sub    $0xc,%esp
 7f5:	6a 01                	push   $0x1
 7f7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7fc:	8b 45 08             	mov    0x8(%ebp),%eax
 7ff:	e8 d9 fe ff ff       	call   6dd <printint>
        ap++;
 804:	83 c7 04             	add    $0x4,%edi
 807:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 80d:	be 00 00 00 00       	mov    $0x0,%esi
 812:	eb 80                	jmp    794 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 814:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 817:	8b 17                	mov    (%edi),%edx
 819:	83 ec 0c             	sub    $0xc,%esp
 81c:	6a 00                	push   $0x0
 81e:	b9 10 00 00 00       	mov    $0x10,%ecx
 823:	8b 45 08             	mov    0x8(%ebp),%eax
 826:	e8 b2 fe ff ff       	call   6dd <printint>
        ap++;
 82b:	83 c7 04             	add    $0x4,%edi
 82e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 831:	83 c4 10             	add    $0x10,%esp
      state = 0;
 834:	be 00 00 00 00       	mov    $0x0,%esi
 839:	e9 56 ff ff ff       	jmp    794 <printf+0x2c>
        s = (char*)*ap;
 83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 841:	8b 30                	mov    (%eax),%esi
        ap++;
 843:	83 c0 04             	add    $0x4,%eax
 846:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 849:	85 f6                	test   %esi,%esi
 84b:	75 15                	jne    862 <printf+0xfa>
          s = "(null)";
 84d:	be ae 0a 00 00       	mov    $0xaae,%esi
 852:	eb 0e                	jmp    862 <printf+0xfa>
          putc(fd, *s);
 854:	0f be d2             	movsbl %dl,%edx
 857:	8b 45 08             	mov    0x8(%ebp),%eax
 85a:	e8 64 fe ff ff       	call   6c3 <putc>
          s++;
 85f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 862:	0f b6 16             	movzbl (%esi),%edx
 865:	84 d2                	test   %dl,%dl
 867:	75 eb                	jne    854 <printf+0xec>
      state = 0;
 869:	be 00 00 00 00       	mov    $0x0,%esi
 86e:	e9 21 ff ff ff       	jmp    794 <printf+0x2c>
        putc(fd, *ap);
 873:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 876:	0f be 17             	movsbl (%edi),%edx
 879:	8b 45 08             	mov    0x8(%ebp),%eax
 87c:	e8 42 fe ff ff       	call   6c3 <putc>
        ap++;
 881:	83 c7 04             	add    $0x4,%edi
 884:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 887:	be 00 00 00 00       	mov    $0x0,%esi
 88c:	e9 03 ff ff ff       	jmp    794 <printf+0x2c>
        putc(fd, c);
 891:	89 fa                	mov    %edi,%edx
 893:	8b 45 08             	mov    0x8(%ebp),%eax
 896:	e8 28 fe ff ff       	call   6c3 <putc>
      state = 0;
 89b:	be 00 00 00 00       	mov    $0x0,%esi
 8a0:	e9 ef fe ff ff       	jmp    794 <printf+0x2c>
        putc(fd, '%');
 8a5:	ba 25 00 00 00       	mov    $0x25,%edx
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	e8 11 fe ff ff       	call   6c3 <putc>
        putc(fd, c);
 8b2:	89 fa                	mov    %edi,%edx
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	e8 07 fe ff ff       	call   6c3 <putc>
      state = 0;
 8bc:	be 00 00 00 00       	mov    $0x0,%esi
 8c1:	e9 ce fe ff ff       	jmp    794 <printf+0x2c>
    }
  }
}
 8c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c9:	5b                   	pop    %ebx
 8ca:	5e                   	pop    %esi
 8cb:	5f                   	pop    %edi
 8cc:	5d                   	pop    %ebp
 8cd:	c3                   	ret    

000008ce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8ce:	55                   	push   %ebp
 8cf:	89 e5                	mov    %esp,%ebp
 8d1:	57                   	push   %edi
 8d2:	56                   	push   %esi
 8d3:	53                   	push   %ebx
 8d4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8da:	a1 ac 0e 00 00       	mov    0xeac,%eax
 8df:	eb 02                	jmp    8e3 <free+0x15>
 8e1:	89 d0                	mov    %edx,%eax
 8e3:	39 c8                	cmp    %ecx,%eax
 8e5:	73 04                	jae    8eb <free+0x1d>
 8e7:	39 08                	cmp    %ecx,(%eax)
 8e9:	77 12                	ja     8fd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8eb:	8b 10                	mov    (%eax),%edx
 8ed:	39 c2                	cmp    %eax,%edx
 8ef:	77 f0                	ja     8e1 <free+0x13>
 8f1:	39 c8                	cmp    %ecx,%eax
 8f3:	72 08                	jb     8fd <free+0x2f>
 8f5:	39 ca                	cmp    %ecx,%edx
 8f7:	77 04                	ja     8fd <free+0x2f>
 8f9:	89 d0                	mov    %edx,%eax
 8fb:	eb e6                	jmp    8e3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8fd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 900:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 903:	8b 10                	mov    (%eax),%edx
 905:	39 d7                	cmp    %edx,%edi
 907:	74 19                	je     922 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 909:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 90c:	8b 50 04             	mov    0x4(%eax),%edx
 90f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 912:	39 ce                	cmp    %ecx,%esi
 914:	74 1b                	je     931 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 916:	89 08                	mov    %ecx,(%eax)
  freep = p;
 918:	a3 ac 0e 00 00       	mov    %eax,0xeac
}
 91d:	5b                   	pop    %ebx
 91e:	5e                   	pop    %esi
 91f:	5f                   	pop    %edi
 920:	5d                   	pop    %ebp
 921:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 922:	03 72 04             	add    0x4(%edx),%esi
 925:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 928:	8b 10                	mov    (%eax),%edx
 92a:	8b 12                	mov    (%edx),%edx
 92c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 92f:	eb db                	jmp    90c <free+0x3e>
    p->s.size += bp->s.size;
 931:	03 53 fc             	add    -0x4(%ebx),%edx
 934:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 937:	8b 53 f8             	mov    -0x8(%ebx),%edx
 93a:	89 10                	mov    %edx,(%eax)
 93c:	eb da                	jmp    918 <free+0x4a>

0000093e <morecore>:

static Header*
morecore(uint nu)
{
 93e:	55                   	push   %ebp
 93f:	89 e5                	mov    %esp,%ebp
 941:	53                   	push   %ebx
 942:	83 ec 04             	sub    $0x4,%esp
 945:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 947:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 94c:	77 05                	ja     953 <morecore+0x15>
    nu = 4096;
 94e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 953:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 95a:	83 ec 0c             	sub    $0xc,%esp
 95d:	50                   	push   %eax
 95e:	e8 38 fd ff ff       	call   69b <sbrk>
  if(p == (char*)-1)
 963:	83 c4 10             	add    $0x10,%esp
 966:	83 f8 ff             	cmp    $0xffffffff,%eax
 969:	74 1c                	je     987 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 96b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 96e:	83 c0 08             	add    $0x8,%eax
 971:	83 ec 0c             	sub    $0xc,%esp
 974:	50                   	push   %eax
 975:	e8 54 ff ff ff       	call   8ce <free>
  return freep;
 97a:	a1 ac 0e 00 00       	mov    0xeac,%eax
 97f:	83 c4 10             	add    $0x10,%esp
}
 982:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 985:	c9                   	leave  
 986:	c3                   	ret    
    return 0;
 987:	b8 00 00 00 00       	mov    $0x0,%eax
 98c:	eb f4                	jmp    982 <morecore+0x44>

0000098e <malloc>:

void*
malloc(uint nbytes)
{
 98e:	55                   	push   %ebp
 98f:	89 e5                	mov    %esp,%ebp
 991:	53                   	push   %ebx
 992:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 995:	8b 45 08             	mov    0x8(%ebp),%eax
 998:	8d 58 07             	lea    0x7(%eax),%ebx
 99b:	c1 eb 03             	shr    $0x3,%ebx
 99e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9a1:	8b 0d ac 0e 00 00    	mov    0xeac,%ecx
 9a7:	85 c9                	test   %ecx,%ecx
 9a9:	74 04                	je     9af <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ab:	8b 01                	mov    (%ecx),%eax
 9ad:	eb 4a                	jmp    9f9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9af:	c7 05 ac 0e 00 00 b0 	movl   $0xeb0,0xeac
 9b6:	0e 00 00 
 9b9:	c7 05 b0 0e 00 00 b0 	movl   $0xeb0,0xeb0
 9c0:	0e 00 00 
    base.s.size = 0;
 9c3:	c7 05 b4 0e 00 00 00 	movl   $0x0,0xeb4
 9ca:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9cd:	b9 b0 0e 00 00       	mov    $0xeb0,%ecx
 9d2:	eb d7                	jmp    9ab <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9d4:	74 19                	je     9ef <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9d6:	29 da                	sub    %ebx,%edx
 9d8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9db:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9de:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9e1:	89 0d ac 0e 00 00    	mov    %ecx,0xeac
      return (void*)(p + 1);
 9e7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ed:	c9                   	leave  
 9ee:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9ef:	8b 10                	mov    (%eax),%edx
 9f1:	89 11                	mov    %edx,(%ecx)
 9f3:	eb ec                	jmp    9e1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f5:	89 c1                	mov    %eax,%ecx
 9f7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f9:	8b 50 04             	mov    0x4(%eax),%edx
 9fc:	39 da                	cmp    %ebx,%edx
 9fe:	73 d4                	jae    9d4 <malloc+0x46>
    if(p == freep)
 a00:	39 05 ac 0e 00 00    	cmp    %eax,0xeac
 a06:	75 ed                	jne    9f5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a08:	89 d8                	mov    %ebx,%eax
 a0a:	e8 2f ff ff ff       	call   93e <morecore>
 a0f:	85 c0                	test   %eax,%eax
 a11:	75 e2                	jne    9f5 <malloc+0x67>
 a13:	eb d5                	jmp    9ea <malloc+0x5c>
