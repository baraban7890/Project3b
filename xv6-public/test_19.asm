
_test_19:     file format elf32-i386


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
   assert(arg1_int == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <nested_worker+0x30>
   assert(arg2_int == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <nested_worker+0x79>
   assert(global == 2);
  18:	a1 d4 0f 00 00       	mov    0xfd4,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 d4 0f 00 00       	mov    %eax,0xfd4
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 e8 0a 00 00       	push   $0xae8
  37:	68 f2 0a 00 00       	push   $0xaf2
  3c:	6a 01                	push   $0x1
  3e:	e8 f8 07 00 00       	call   83b <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 fa 0a 00 00       	push   $0xafa
  4b:	68 09 0b 00 00       	push   $0xb09
  50:	6a 01                	push   $0x1
  52:	e8 e4 07 00 00       	call   83b <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 1d 0b 00 00       	push   $0xb1d
  5f:	6a 01                	push   $0x1
  61:	e8 d5 07 00 00       	call   83b <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 d8 0f 00 00    	push   0xfd8
  6f:	e8 a2 06 00 00       	call   716 <kill>
  74:	e8 6d 06 00 00       	call   6e6 <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 e8 0a 00 00       	push   $0xae8
  80:	68 f2 0a 00 00       	push   $0xaf2
  85:	6a 01                	push   $0x1
  87:	e8 af 07 00 00       	call   83b <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 2a 0b 00 00       	push   $0xb2a
  94:	68 09 0b 00 00       	push   $0xb09
  99:	6a 01                	push   $0x1
  9b:	e8 9b 07 00 00       	call   83b <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 1d 0b 00 00       	push   $0xb1d
  a8:	6a 01                	push   $0x1
  aa:	e8 8c 07 00 00       	call   83b <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 d8 0f 00 00    	push   0xfd8
  b8:	e8 59 06 00 00       	call   716 <kill>
  bd:	e8 24 06 00 00       	call   6e6 <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 e8 0a 00 00       	push   $0xae8
  c9:	68 f2 0a 00 00       	push   $0xaf2
  ce:	6a 01                	push   $0x1
  d0:	e8 66 07 00 00       	call   83b <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 39 0b 00 00       	push   $0xb39
  dd:	68 09 0b 00 00       	push   $0xb09
  e2:	6a 01                	push   $0x1
  e4:	e8 52 07 00 00       	call   83b <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 1d 0b 00 00       	push   $0xb1d
  f1:	6a 01                	push   $0x1
  f3:	e8 43 07 00 00       	call   83b <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 d8 0f 00 00    	push   0xfd8
 101:	e8 10 06 00 00       	call   716 <kill>
 106:	e8 db 05 00 00       	call   6e6 <exit>

0000010b <worker>:

void
worker(void *arg1, void *arg2) {
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	53                   	push   %ebx
 10f:	83 ec 14             	sub    $0x14,%esp
   int tmp1 = *(int*)arg1;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	8b 00                	mov    (%eax),%eax
 117:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int tmp2 = *(int*)arg2;
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8b 12                	mov    (%edx),%edx
 11f:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(tmp1 == 42);
 122:	83 f8 2a             	cmp    $0x2a,%eax
 125:	75 60                	jne    187 <worker+0x7c>
   assert(tmp2 == 24);
 127:	83 fa 18             	cmp    $0x18,%edx
 12a:	0f 85 a0 00 00 00    	jne    1d0 <worker+0xc5>
   assert(global == 1);
 130:	a1 d4 0f 00 00       	mov    0xfd4,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 e8 0a 00 00       	push   $0xae8
 145:	68 f2 0a 00 00       	push   $0xaf2
 14a:	6a 01                	push   $0x1
 14c:	e8 ea 06 00 00       	call   83b <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 5b 0b 00 00       	push   $0xb5b
 159:	68 09 0b 00 00       	push   $0xb09
 15e:	6a 01                	push   $0x1
 160:	e8 d6 06 00 00       	call   83b <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 1d 0b 00 00       	push   $0xb1d
 16d:	6a 01                	push   $0x1
 16f:	e8 c7 06 00 00       	call   83b <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 d8 0f 00 00    	push   0xfd8
 17d:	e8 94 05 00 00       	call   716 <kill>
 182:	e8 5f 05 00 00       	call   6e6 <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 e8 0a 00 00       	push   $0xae8
 18e:	68 f2 0a 00 00       	push   $0xaf2
 193:	6a 01                	push   $0x1
 195:	e8 a1 06 00 00       	call   83b <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 45 0b 00 00       	push   $0xb45
 1a2:	68 09 0b 00 00       	push   $0xb09
 1a7:	6a 01                	push   $0x1
 1a9:	e8 8d 06 00 00       	call   83b <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 1d 0b 00 00       	push   $0xb1d
 1b6:	6a 01                	push   $0x1
 1b8:	e8 7e 06 00 00       	call   83b <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 d8 0f 00 00    	push   0xfd8
 1c6:	e8 4b 05 00 00       	call   716 <kill>
 1cb:	e8 16 05 00 00       	call   6e6 <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 e8 0a 00 00       	push   $0xae8
 1d7:	68 f2 0a 00 00       	push   $0xaf2
 1dc:	6a 01                	push   $0x1
 1de:	e8 58 06 00 00       	call   83b <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 50 0b 00 00       	push   $0xb50
 1eb:	68 09 0b 00 00       	push   $0xb09
 1f0:	6a 01                	push   $0x1
 1f2:	e8 44 06 00 00       	call   83b <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 1d 0b 00 00       	push   $0xb1d
 1ff:	6a 01                	push   $0x1
 201:	e8 35 06 00 00       	call   83b <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 d8 0f 00 00    	push   0xfd8
 20f:	e8 02 05 00 00       	call   716 <kill>
 214:	e8 cd 04 00 00       	call   6e6 <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 d4 0f 00 00       	mov    %eax,0xfd4

   int nested_thread_pid = thread_create(nested_worker, &tmp1, &tmp2);
 221:	83 ec 04             	sub    $0x4,%esp
 224:	8d 45 f0             	lea    -0x10(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 45 f4             	lea    -0xc(%ebp),%eax
 22b:	50                   	push   %eax
 22c:	68 00 00 00 00       	push   $0x0
 231:	e8 22 04 00 00       	call   658 <thread_create>
 236:	89 c3                	mov    %eax,%ebx
   assert(nested_thread_pid > 0);
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 07                	jle    246 <worker+0x13b>
   for(int j=0;j<10000;j++);
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	eb 4c                	jmp    292 <worker+0x187>
   assert(nested_thread_pid > 0);
 246:	6a 3c                	push   $0x3c
 248:	68 e8 0a 00 00       	push   $0xae8
 24d:	68 f2 0a 00 00       	push   $0xaf2
 252:	6a 01                	push   $0x1
 254:	e8 e2 05 00 00       	call   83b <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 67 0b 00 00       	push   $0xb67
 261:	68 09 0b 00 00       	push   $0xb09
 266:	6a 01                	push   $0x1
 268:	e8 ce 05 00 00       	call   83b <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 1d 0b 00 00       	push   $0xb1d
 275:	6a 01                	push   $0x1
 277:	e8 bf 05 00 00       	call   83b <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 d8 0f 00 00    	push   0xfd8
 285:	e8 8c 04 00 00       	call   716 <kill>
 28a:	e8 57 04 00 00       	call   6e6 <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 f2 03 00 00       	call   690 <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 e8 0a 00 00       	push   $0xae8
 2b1:	68 f2 0a 00 00       	push   $0xaf2
 2b6:	6a 01                	push   $0x1
 2b8:	e8 7e 05 00 00       	call   83b <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 c0 0b 00 00       	push   $0xbc0
 2c5:	68 09 0b 00 00       	push   $0xb09
 2ca:	6a 01                	push   $0x1
 2cc:	e8 6a 05 00 00       	call   83b <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 1d 0b 00 00       	push   $0xb1d
 2d9:	6a 01                	push   $0x1
 2db:	e8 5b 05 00 00       	call   83b <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 d8 0f 00 00    	push   0xfd8
 2e9:	e8 28 04 00 00       	call   716 <kill>
 2ee:	e8 f3 03 00 00       	call   6e6 <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 e8 0a 00 00       	push   $0xae8
 2fa:	68 f2 0a 00 00       	push   $0xaf2
 2ff:	6a 01                	push   $0x1
 301:	e8 35 05 00 00       	call   83b <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 7d 0b 00 00       	push   $0xb7d
 30e:	68 09 0b 00 00       	push   $0xb09
 313:	6a 01                	push   $0x1
 315:	e8 21 05 00 00       	call   83b <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 1d 0b 00 00       	push   $0xb1d
 322:	6a 01                	push   $0x1
 324:	e8 12 05 00 00       	call   83b <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 d8 0f 00 00    	push   0xfd8
 332:	e8 df 03 00 00       	call   716 <kill>
 337:	e8 aa 03 00 00       	call   6e6 <exit>
   exit();
 33c:	e8 a5 03 00 00       	call   6e6 <exit>

00000341 <main>:
{
 341:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 345:	83 e4 f0             	and    $0xfffffff0,%esp
 348:	ff 71 fc             	push   -0x4(%ecx)
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	51                   	push   %ecx
 350:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 353:	e8 0e 04 00 00       	call   766 <getpid>
 358:	a3 d8 0f 00 00       	mov    %eax,0xfd8
   int arg1 = 42, arg2 = 24;
 35d:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 364:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 371:	50                   	push   %eax
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	50                   	push   %eax
 376:	68 0b 01 00 00       	push   $0x10b
 37b:	e8 d8 02 00 00       	call   658 <thread_create>
   assert(thread_pid > 0);
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 65                	jle    3ec <main+0xab>
 387:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 389:	e8 02 03 00 00       	call   690 <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d d4 0f 00 00 03 	cmpl   $0x3,0xfd4
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 e8 0a 00 00       	push   $0xae8
 3aa:	68 f2 0a 00 00       	push   $0xaf2
 3af:	6a 01                	push   $0x1
 3b1:	e8 85 04 00 00       	call   83b <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 a4 0b 00 00       	push   $0xba4
 3be:	68 09 0b 00 00       	push   $0xb09
 3c3:	6a 01                	push   $0x1
 3c5:	e8 71 04 00 00       	call   83b <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 1d 0b 00 00       	push   $0xb1d
 3d2:	6a 01                	push   $0x1
 3d4:	e8 62 04 00 00       	call   83b <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 d8 0f 00 00    	push   0xfd8
 3e2:	e8 2f 03 00 00       	call   716 <kill>
 3e7:	e8 fa 02 00 00       	call   6e6 <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 e8 0a 00 00       	push   $0xae8
 3f3:	68 f2 0a 00 00       	push   $0xaf2
 3f8:	6a 01                	push   $0x1
 3fa:	e8 3c 04 00 00       	call   83b <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 6e 0b 00 00       	push   $0xb6e
 407:	68 09 0b 00 00       	push   $0xb09
 40c:	6a 01                	push   $0x1
 40e:	e8 28 04 00 00       	call   83b <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 1d 0b 00 00       	push   $0xb1d
 41b:	6a 01                	push   $0x1
 41d:	e8 19 04 00 00       	call   83b <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 d8 0f 00 00    	push   0xfd8
 42b:	e8 e6 02 00 00       	call   716 <kill>
 430:	e8 b1 02 00 00       	call   6e6 <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 e8 0a 00 00       	push   $0xae8
 43c:	68 f2 0a 00 00       	push   $0xaf2
 441:	6a 01                	push   $0x1
 443:	e8 f3 03 00 00       	call   83b <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 8d 0b 00 00       	push   $0xb8d
 450:	68 09 0b 00 00       	push   $0xb09
 455:	6a 01                	push   $0x1
 457:	e8 df 03 00 00       	call   83b <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 1d 0b 00 00       	push   $0xb1d
 464:	6a 01                	push   $0x1
 466:	e8 d0 03 00 00       	call   83b <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 d8 0f 00 00    	push   0xfd8
 474:	e8 9d 02 00 00       	call   716 <kill>
 479:	e8 68 02 00 00       	call   6e6 <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 b0 0b 00 00       	push   $0xbb0
 486:	6a 01                	push   $0x1
 488:	e8 ae 03 00 00       	call   83b <printf>
   exit();
 48d:	e8 54 02 00 00       	call   6e6 <exit>

00000492 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	8b 75 08             	mov    0x8(%ebp),%esi
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 49d:	89 f0                	mov    %esi,%eax
 49f:	89 d1                	mov    %edx,%ecx
 4a1:	83 c2 01             	add    $0x1,%edx
 4a4:	89 c3                	mov    %eax,%ebx
 4a6:	83 c0 01             	add    $0x1,%eax
 4a9:	0f b6 09             	movzbl (%ecx),%ecx
 4ac:	88 0b                	mov    %cl,(%ebx)
 4ae:	84 c9                	test   %cl,%cl
 4b0:	75 ed                	jne    49f <strcpy+0xd>
    ;
  return os;
}
 4b2:	89 f0                	mov    %esi,%eax
 4b4:	5b                   	pop    %ebx
 4b5:	5e                   	pop    %esi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    

000004b8 <strcmp>:

int strcmp(const char *p, const char *q)
{
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4be:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 4c1:	eb 06                	jmp    4c9 <strcmp+0x11>
    p++, q++;
 4c3:	83 c1 01             	add    $0x1,%ecx
 4c6:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 4c9:	0f b6 01             	movzbl (%ecx),%eax
 4cc:	84 c0                	test   %al,%al
 4ce:	74 04                	je     4d4 <strcmp+0x1c>
 4d0:	3a 02                	cmp    (%edx),%al
 4d2:	74 ef                	je     4c3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4d4:	0f b6 c0             	movzbl %al,%eax
 4d7:	0f b6 12             	movzbl (%edx),%edx
 4da:	29 d0                	sub    %edx,%eax
}
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <strlen>:

uint strlen(const char *s)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 4e4:	b8 00 00 00 00       	mov    $0x0,%eax
 4e9:	eb 03                	jmp    4ee <strlen+0x10>
 4eb:	83 c0 01             	add    $0x1,%eax
 4ee:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4f2:	75 f7                	jne    4eb <strlen+0xd>
    ;
  return n;
}
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <memset>:

void *
memset(void *dst, int c, uint n)
{
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	57                   	push   %edi
 4fa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4fd:	89 d7                	mov    %edx,%edi
 4ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	fc                   	cld    
 506:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 508:	89 d0                	mov    %edx,%eax
 50a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 50d:	c9                   	leave  
 50e:	c3                   	ret    

0000050f <strchr>:

char *
strchr(const char *s, char c)
{
 50f:	55                   	push   %ebp
 510:	89 e5                	mov    %esp,%ebp
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 519:	eb 03                	jmp    51e <strchr+0xf>
 51b:	83 c0 01             	add    $0x1,%eax
 51e:	0f b6 10             	movzbl (%eax),%edx
 521:	84 d2                	test   %dl,%dl
 523:	74 06                	je     52b <strchr+0x1c>
    if (*s == c)
 525:	38 ca                	cmp    %cl,%dl
 527:	75 f2                	jne    51b <strchr+0xc>
 529:	eb 05                	jmp    530 <strchr+0x21>
      return (char *)s;
  return 0;
 52b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    

00000532 <gets>:

char *
gets(char *buf, int max)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	83 ec 1c             	sub    $0x1c,%esp
 53b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 53e:	bb 00 00 00 00       	mov    $0x0,%ebx
 543:	89 de                	mov    %ebx,%esi
 545:	83 c3 01             	add    $0x1,%ebx
 548:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 54b:	7d 2e                	jge    57b <gets+0x49>
  {
    cc = read(0, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	6a 01                	push   $0x1
 552:	8d 45 e7             	lea    -0x19(%ebp),%eax
 555:	50                   	push   %eax
 556:	6a 00                	push   $0x0
 558:	e8 a1 01 00 00       	call   6fe <read>
    if (cc < 1)
 55d:	83 c4 10             	add    $0x10,%esp
 560:	85 c0                	test   %eax,%eax
 562:	7e 17                	jle    57b <gets+0x49>
      break;
    buf[i++] = c;
 564:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 568:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 56b:	3c 0a                	cmp    $0xa,%al
 56d:	0f 94 c2             	sete   %dl
 570:	3c 0d                	cmp    $0xd,%al
 572:	0f 94 c0             	sete   %al
 575:	08 c2                	or     %al,%dl
 577:	74 ca                	je     543 <gets+0x11>
    buf[i++] = c;
 579:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 57b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 57f:	89 f8                	mov    %edi,%eax
 581:	8d 65 f4             	lea    -0xc(%ebp),%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    

00000589 <stat>:

int stat(const char *n, struct stat *st)
{
 589:	55                   	push   %ebp
 58a:	89 e5                	mov    %esp,%ebp
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 58e:	83 ec 08             	sub    $0x8,%esp
 591:	6a 00                	push   $0x0
 593:	ff 75 08             	push   0x8(%ebp)
 596:	e8 8b 01 00 00       	call   726 <open>
  if (fd < 0)
 59b:	83 c4 10             	add    $0x10,%esp
 59e:	85 c0                	test   %eax,%eax
 5a0:	78 24                	js     5c6 <stat+0x3d>
 5a2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5a4:	83 ec 08             	sub    $0x8,%esp
 5a7:	ff 75 0c             	push   0xc(%ebp)
 5aa:	50                   	push   %eax
 5ab:	e8 8e 01 00 00       	call   73e <fstat>
 5b0:	89 c6                	mov    %eax,%esi
  close(fd);
 5b2:	89 1c 24             	mov    %ebx,(%esp)
 5b5:	e8 54 01 00 00       	call   70e <close>
  return r;
 5ba:	83 c4 10             	add    $0x10,%esp
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c2:	5b                   	pop    %ebx
 5c3:	5e                   	pop    %esi
 5c4:	5d                   	pop    %ebp
 5c5:	c3                   	ret    
    return -1;
 5c6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5cb:	eb f0                	jmp    5bd <stat+0x34>

000005cd <atoi>:

int atoi(const char *s)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	53                   	push   %ebx
 5d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5d4:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 5d9:	eb 10                	jmp    5eb <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 5db:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5de:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5e1:	83 c1 01             	add    $0x1,%ecx
 5e4:	0f be c0             	movsbl %al,%eax
 5e7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f1:	80 fb 09             	cmp    $0x9,%bl
 5f4:	76 e5                	jbe    5db <atoi+0xe>
  return n;
}
 5f6:	89 d0                	mov    %edx,%eax
 5f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    

000005fd <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	56                   	push   %esi
 601:	53                   	push   %ebx
 602:	8b 75 08             	mov    0x8(%ebp),%esi
 605:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 608:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 60b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 60d:	eb 0d                	jmp    61c <memmove+0x1f>
    *dst++ = *src++;
 60f:	0f b6 01             	movzbl (%ecx),%eax
 612:	88 02                	mov    %al,(%edx)
 614:	8d 49 01             	lea    0x1(%ecx),%ecx
 617:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 61a:	89 d8                	mov    %ebx,%eax
 61c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 61f:	85 c0                	test   %eax,%eax
 621:	7f ec                	jg     60f <memmove+0x12>
  return vdst;
}
 623:	89 f0                	mov    %esi,%eax
 625:	5b                   	pop    %ebx
 626:	5e                   	pop    %esi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    

00000629 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 62f:	83 38 01             	cmpl   $0x1,(%eax)
 632:	74 fb                	je     62f <lock_acquire+0x6>
    ;
  lock->flag = 1;
 634:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 63a:	5d                   	pop    %ebp
 63b:	c3                   	ret    

0000063c <lock_release>:
void lock_release(lock_t *lock)
{
 63c:	55                   	push   %ebp
 63d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 63f:	8b 45 08             	mov    0x8(%ebp),%eax
 642:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 648:	5d                   	pop    %ebp
 649:	c3                   	ret    

0000064a <lock_init>:
void lock_init(lock_t *lock)
{
 64a:	55                   	push   %ebp
 64b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 656:	5d                   	pop    %ebp
 657:	c3                   	ret    

00000658 <thread_create>:
{
 658:	55                   	push   %ebp
 659:	89 e5                	mov    %esp,%ebp
 65b:	53                   	push   %ebx
 65c:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 65f:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 662:	53                   	push   %ebx
 663:	e8 e2 ff ff ff       	call   64a <lock_init>
  lock_acquire(&lock);
 668:	89 1c 24             	mov    %ebx,(%esp)
 66b:	e8 b9 ff ff ff       	call   629 <lock_acquire>
  void *stack = malloc(4096 * 2);
 670:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 677:	e8 e5 03 00 00       	call   a61 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 67c:	50                   	push   %eax
 67d:	ff 75 10             	push   0x10(%ebp)
 680:	ff 75 0c             	push   0xc(%ebp)
 683:	ff 75 08             	push   0x8(%ebp)
 686:	e8 fb 00 00 00       	call   786 <clone>
}
 68b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 68e:	c9                   	leave  
 68f:	c3                   	ret    

00000690 <thread_join>:
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	56                   	push   %esi
 694:	53                   	push   %ebx
 695:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 698:	6a 04                	push   $0x4
 69a:	e8 c2 03 00 00       	call   a61 <malloc>
 69f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 6a2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6a5:	89 04 24             	mov    %eax,(%esp)
 6a8:	e8 e1 00 00 00       	call   78e <join>
 6ad:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 6af:	8d 75 f0             	lea    -0x10(%ebp),%esi
 6b2:	89 34 24             	mov    %esi,(%esp)
 6b5:	e8 90 ff ff ff       	call   64a <lock_init>
  lock_acquire(&lock);
 6ba:	89 34 24             	mov    %esi,(%esp)
 6bd:	e8 67 ff ff ff       	call   629 <lock_acquire>
  free(stack);
 6c2:	83 c4 04             	add    $0x4,%esp
 6c5:	ff 75 f4             	push   -0xc(%ebp)
 6c8:	e8 d4 02 00 00       	call   9a1 <free>
  lock_release(&lock);
 6cd:	89 34 24             	mov    %esi,(%esp)
 6d0:	e8 67 ff ff ff       	call   63c <lock_release>
}
 6d5:	89 d8                	mov    %ebx,%eax
 6d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6da:	5b                   	pop    %ebx
 6db:	5e                   	pop    %esi
 6dc:	5d                   	pop    %ebp
 6dd:	c3                   	ret    

000006de <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6de:	b8 01 00 00 00       	mov    $0x1,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <exit>:
SYSCALL(exit)
 6e6:	b8 02 00 00 00       	mov    $0x2,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <wait>:
SYSCALL(wait)
 6ee:	b8 03 00 00 00       	mov    $0x3,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <pipe>:
SYSCALL(pipe)
 6f6:	b8 04 00 00 00       	mov    $0x4,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <read>:
SYSCALL(read)
 6fe:	b8 05 00 00 00       	mov    $0x5,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <write>:
SYSCALL(write)
 706:	b8 10 00 00 00       	mov    $0x10,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <close>:
SYSCALL(close)
 70e:	b8 15 00 00 00       	mov    $0x15,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <kill>:
SYSCALL(kill)
 716:	b8 06 00 00 00       	mov    $0x6,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret    

0000071e <exec>:
SYSCALL(exec)
 71e:	b8 07 00 00 00       	mov    $0x7,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret    

00000726 <open>:
SYSCALL(open)
 726:	b8 0f 00 00 00       	mov    $0xf,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret    

0000072e <mknod>:
SYSCALL(mknod)
 72e:	b8 11 00 00 00       	mov    $0x11,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret    

00000736 <unlink>:
SYSCALL(unlink)
 736:	b8 12 00 00 00       	mov    $0x12,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <fstat>:
SYSCALL(fstat)
 73e:	b8 08 00 00 00       	mov    $0x8,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <link>:
SYSCALL(link)
 746:	b8 13 00 00 00       	mov    $0x13,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <mkdir>:
SYSCALL(mkdir)
 74e:	b8 14 00 00 00       	mov    $0x14,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <chdir>:
SYSCALL(chdir)
 756:	b8 09 00 00 00       	mov    $0x9,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret    

0000075e <dup>:
SYSCALL(dup)
 75e:	b8 0a 00 00 00       	mov    $0xa,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret    

00000766 <getpid>:
SYSCALL(getpid)
 766:	b8 0b 00 00 00       	mov    $0xb,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret    

0000076e <sbrk>:
SYSCALL(sbrk)
 76e:	b8 0c 00 00 00       	mov    $0xc,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret    

00000776 <sleep>:
SYSCALL(sleep)
 776:	b8 0d 00 00 00       	mov    $0xd,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret    

0000077e <uptime>:
SYSCALL(uptime)
 77e:	b8 0e 00 00 00       	mov    $0xe,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret    

00000786 <clone>:
SYSCALL(clone)
 786:	b8 16 00 00 00       	mov    $0x16,%eax
 78b:	cd 40                	int    $0x40
 78d:	c3                   	ret    

0000078e <join>:
 78e:	b8 17 00 00 00       	mov    $0x17,%eax
 793:	cd 40                	int    $0x40
 795:	c3                   	ret    

00000796 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 796:	55                   	push   %ebp
 797:	89 e5                	mov    %esp,%ebp
 799:	83 ec 1c             	sub    $0x1c,%esp
 79c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 79f:	6a 01                	push   $0x1
 7a1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7a4:	52                   	push   %edx
 7a5:	50                   	push   %eax
 7a6:	e8 5b ff ff ff       	call   706 <write>
}
 7ab:	83 c4 10             	add    $0x10,%esp
 7ae:	c9                   	leave  
 7af:	c3                   	ret    

000007b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 2c             	sub    $0x2c,%esp
 7b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7bc:	89 d0                	mov    %edx,%eax
 7be:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7c4:	0f 95 c1             	setne  %cl
 7c7:	c1 ea 1f             	shr    $0x1f,%edx
 7ca:	84 d1                	test   %dl,%cl
 7cc:	74 44                	je     812 <printint+0x62>
    neg = 1;
    x = -xx;
 7ce:	f7 d8                	neg    %eax
 7d0:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7d2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7d9:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7de:	89 c8                	mov    %ecx,%eax
 7e0:	ba 00 00 00 00       	mov    $0x0,%edx
 7e5:	f7 f6                	div    %esi
 7e7:	89 df                	mov    %ebx,%edi
 7e9:	83 c3 01             	add    $0x1,%ebx
 7ec:	0f b6 92 44 0c 00 00 	movzbl 0xc44(%edx),%edx
 7f3:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7f7:	89 ca                	mov    %ecx,%edx
 7f9:	89 c1                	mov    %eax,%ecx
 7fb:	39 d6                	cmp    %edx,%esi
 7fd:	76 df                	jbe    7de <printint+0x2e>
  if(neg)
 7ff:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 803:	74 31                	je     836 <printint+0x86>
    buf[i++] = '-';
 805:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 80a:	8d 5f 02             	lea    0x2(%edi),%ebx
 80d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 810:	eb 17                	jmp    829 <printint+0x79>
    x = xx;
 812:	89 c1                	mov    %eax,%ecx
  neg = 0;
 814:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 81b:	eb bc                	jmp    7d9 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 81d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 822:	89 f0                	mov    %esi,%eax
 824:	e8 6d ff ff ff       	call   796 <putc>
  while(--i >= 0)
 829:	83 eb 01             	sub    $0x1,%ebx
 82c:	79 ef                	jns    81d <printint+0x6d>
}
 82e:	83 c4 2c             	add    $0x2c,%esp
 831:	5b                   	pop    %ebx
 832:	5e                   	pop    %esi
 833:	5f                   	pop    %edi
 834:	5d                   	pop    %ebp
 835:	c3                   	ret    
 836:	8b 75 d0             	mov    -0x30(%ebp),%esi
 839:	eb ee                	jmp    829 <printint+0x79>

0000083b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 83b:	55                   	push   %ebp
 83c:	89 e5                	mov    %esp,%ebp
 83e:	57                   	push   %edi
 83f:	56                   	push   %esi
 840:	53                   	push   %ebx
 841:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 844:	8d 45 10             	lea    0x10(%ebp),%eax
 847:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 84a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 84f:	bb 00 00 00 00       	mov    $0x0,%ebx
 854:	eb 14                	jmp    86a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 856:	89 fa                	mov    %edi,%edx
 858:	8b 45 08             	mov    0x8(%ebp),%eax
 85b:	e8 36 ff ff ff       	call   796 <putc>
 860:	eb 05                	jmp    867 <printf+0x2c>
      }
    } else if(state == '%'){
 862:	83 fe 25             	cmp    $0x25,%esi
 865:	74 25                	je     88c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 867:	83 c3 01             	add    $0x1,%ebx
 86a:	8b 45 0c             	mov    0xc(%ebp),%eax
 86d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 871:	84 c0                	test   %al,%al
 873:	0f 84 20 01 00 00    	je     999 <printf+0x15e>
    c = fmt[i] & 0xff;
 879:	0f be f8             	movsbl %al,%edi
 87c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 87f:	85 f6                	test   %esi,%esi
 881:	75 df                	jne    862 <printf+0x27>
      if(c == '%'){
 883:	83 f8 25             	cmp    $0x25,%eax
 886:	75 ce                	jne    856 <printf+0x1b>
        state = '%';
 888:	89 c6                	mov    %eax,%esi
 88a:	eb db                	jmp    867 <printf+0x2c>
      if(c == 'd'){
 88c:	83 f8 25             	cmp    $0x25,%eax
 88f:	0f 84 cf 00 00 00    	je     964 <printf+0x129>
 895:	0f 8c dd 00 00 00    	jl     978 <printf+0x13d>
 89b:	83 f8 78             	cmp    $0x78,%eax
 89e:	0f 8f d4 00 00 00    	jg     978 <printf+0x13d>
 8a4:	83 f8 63             	cmp    $0x63,%eax
 8a7:	0f 8c cb 00 00 00    	jl     978 <printf+0x13d>
 8ad:	83 e8 63             	sub    $0x63,%eax
 8b0:	83 f8 15             	cmp    $0x15,%eax
 8b3:	0f 87 bf 00 00 00    	ja     978 <printf+0x13d>
 8b9:	ff 24 85 ec 0b 00 00 	jmp    *0xbec(,%eax,4)
        printint(fd, *ap, 10, 1);
 8c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c3:	8b 17                	mov    (%edi),%edx
 8c5:	83 ec 0c             	sub    $0xc,%esp
 8c8:	6a 01                	push   $0x1
 8ca:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8cf:	8b 45 08             	mov    0x8(%ebp),%eax
 8d2:	e8 d9 fe ff ff       	call   7b0 <printint>
        ap++;
 8d7:	83 c7 04             	add    $0x4,%edi
 8da:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8dd:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8e0:	be 00 00 00 00       	mov    $0x0,%esi
 8e5:	eb 80                	jmp    867 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8ea:	8b 17                	mov    (%edi),%edx
 8ec:	83 ec 0c             	sub    $0xc,%esp
 8ef:	6a 00                	push   $0x0
 8f1:	b9 10 00 00 00       	mov    $0x10,%ecx
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	e8 b2 fe ff ff       	call   7b0 <printint>
        ap++;
 8fe:	83 c7 04             	add    $0x4,%edi
 901:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 904:	83 c4 10             	add    $0x10,%esp
      state = 0;
 907:	be 00 00 00 00       	mov    $0x0,%esi
 90c:	e9 56 ff ff ff       	jmp    867 <printf+0x2c>
        s = (char*)*ap;
 911:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 914:	8b 30                	mov    (%eax),%esi
        ap++;
 916:	83 c0 04             	add    $0x4,%eax
 919:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 91c:	85 f6                	test   %esi,%esi
 91e:	75 15                	jne    935 <printf+0xfa>
          s = "(null)";
 920:	be e5 0b 00 00       	mov    $0xbe5,%esi
 925:	eb 0e                	jmp    935 <printf+0xfa>
          putc(fd, *s);
 927:	0f be d2             	movsbl %dl,%edx
 92a:	8b 45 08             	mov    0x8(%ebp),%eax
 92d:	e8 64 fe ff ff       	call   796 <putc>
          s++;
 932:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 935:	0f b6 16             	movzbl (%esi),%edx
 938:	84 d2                	test   %dl,%dl
 93a:	75 eb                	jne    927 <printf+0xec>
      state = 0;
 93c:	be 00 00 00 00       	mov    $0x0,%esi
 941:	e9 21 ff ff ff       	jmp    867 <printf+0x2c>
        putc(fd, *ap);
 946:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 949:	0f be 17             	movsbl (%edi),%edx
 94c:	8b 45 08             	mov    0x8(%ebp),%eax
 94f:	e8 42 fe ff ff       	call   796 <putc>
        ap++;
 954:	83 c7 04             	add    $0x4,%edi
 957:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 95a:	be 00 00 00 00       	mov    $0x0,%esi
 95f:	e9 03 ff ff ff       	jmp    867 <printf+0x2c>
        putc(fd, c);
 964:	89 fa                	mov    %edi,%edx
 966:	8b 45 08             	mov    0x8(%ebp),%eax
 969:	e8 28 fe ff ff       	call   796 <putc>
      state = 0;
 96e:	be 00 00 00 00       	mov    $0x0,%esi
 973:	e9 ef fe ff ff       	jmp    867 <printf+0x2c>
        putc(fd, '%');
 978:	ba 25 00 00 00       	mov    $0x25,%edx
 97d:	8b 45 08             	mov    0x8(%ebp),%eax
 980:	e8 11 fe ff ff       	call   796 <putc>
        putc(fd, c);
 985:	89 fa                	mov    %edi,%edx
 987:	8b 45 08             	mov    0x8(%ebp),%eax
 98a:	e8 07 fe ff ff       	call   796 <putc>
      state = 0;
 98f:	be 00 00 00 00       	mov    $0x0,%esi
 994:	e9 ce fe ff ff       	jmp    867 <printf+0x2c>
    }
  }
}
 999:	8d 65 f4             	lea    -0xc(%ebp),%esp
 99c:	5b                   	pop    %ebx
 99d:	5e                   	pop    %esi
 99e:	5f                   	pop    %edi
 99f:	5d                   	pop    %ebp
 9a0:	c3                   	ret    

000009a1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9a1:	55                   	push   %ebp
 9a2:	89 e5                	mov    %esp,%ebp
 9a4:	57                   	push   %edi
 9a5:	56                   	push   %esi
 9a6:	53                   	push   %ebx
 9a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9aa:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ad:	a1 dc 0f 00 00       	mov    0xfdc,%eax
 9b2:	eb 02                	jmp    9b6 <free+0x15>
 9b4:	89 d0                	mov    %edx,%eax
 9b6:	39 c8                	cmp    %ecx,%eax
 9b8:	73 04                	jae    9be <free+0x1d>
 9ba:	39 08                	cmp    %ecx,(%eax)
 9bc:	77 12                	ja     9d0 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9be:	8b 10                	mov    (%eax),%edx
 9c0:	39 c2                	cmp    %eax,%edx
 9c2:	77 f0                	ja     9b4 <free+0x13>
 9c4:	39 c8                	cmp    %ecx,%eax
 9c6:	72 08                	jb     9d0 <free+0x2f>
 9c8:	39 ca                	cmp    %ecx,%edx
 9ca:	77 04                	ja     9d0 <free+0x2f>
 9cc:	89 d0                	mov    %edx,%eax
 9ce:	eb e6                	jmp    9b6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9d6:	8b 10                	mov    (%eax),%edx
 9d8:	39 d7                	cmp    %edx,%edi
 9da:	74 19                	je     9f5 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9df:	8b 50 04             	mov    0x4(%eax),%edx
 9e2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9e5:	39 ce                	cmp    %ecx,%esi
 9e7:	74 1b                	je     a04 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9e9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9eb:	a3 dc 0f 00 00       	mov    %eax,0xfdc
}
 9f0:	5b                   	pop    %ebx
 9f1:	5e                   	pop    %esi
 9f2:	5f                   	pop    %edi
 9f3:	5d                   	pop    %ebp
 9f4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9f5:	03 72 04             	add    0x4(%edx),%esi
 9f8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9fb:	8b 10                	mov    (%eax),%edx
 9fd:	8b 12                	mov    (%edx),%edx
 9ff:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a02:	eb db                	jmp    9df <free+0x3e>
    p->s.size += bp->s.size;
 a04:	03 53 fc             	add    -0x4(%ebx),%edx
 a07:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a0a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a0d:	89 10                	mov    %edx,(%eax)
 a0f:	eb da                	jmp    9eb <free+0x4a>

00000a11 <morecore>:

static Header*
morecore(uint nu)
{
 a11:	55                   	push   %ebp
 a12:	89 e5                	mov    %esp,%ebp
 a14:	53                   	push   %ebx
 a15:	83 ec 04             	sub    $0x4,%esp
 a18:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a1a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a1f:	77 05                	ja     a26 <morecore+0x15>
    nu = 4096;
 a21:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a26:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a2d:	83 ec 0c             	sub    $0xc,%esp
 a30:	50                   	push   %eax
 a31:	e8 38 fd ff ff       	call   76e <sbrk>
  if(p == (char*)-1)
 a36:	83 c4 10             	add    $0x10,%esp
 a39:	83 f8 ff             	cmp    $0xffffffff,%eax
 a3c:	74 1c                	je     a5a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a3e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a41:	83 c0 08             	add    $0x8,%eax
 a44:	83 ec 0c             	sub    $0xc,%esp
 a47:	50                   	push   %eax
 a48:	e8 54 ff ff ff       	call   9a1 <free>
  return freep;
 a4d:	a1 dc 0f 00 00       	mov    0xfdc,%eax
 a52:	83 c4 10             	add    $0x10,%esp
}
 a55:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a58:	c9                   	leave  
 a59:	c3                   	ret    
    return 0;
 a5a:	b8 00 00 00 00       	mov    $0x0,%eax
 a5f:	eb f4                	jmp    a55 <morecore+0x44>

00000a61 <malloc>:

void*
malloc(uint nbytes)
{
 a61:	55                   	push   %ebp
 a62:	89 e5                	mov    %esp,%ebp
 a64:	53                   	push   %ebx
 a65:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a68:	8b 45 08             	mov    0x8(%ebp),%eax
 a6b:	8d 58 07             	lea    0x7(%eax),%ebx
 a6e:	c1 eb 03             	shr    $0x3,%ebx
 a71:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a74:	8b 0d dc 0f 00 00    	mov    0xfdc,%ecx
 a7a:	85 c9                	test   %ecx,%ecx
 a7c:	74 04                	je     a82 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a7e:	8b 01                	mov    (%ecx),%eax
 a80:	eb 4a                	jmp    acc <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a82:	c7 05 dc 0f 00 00 e0 	movl   $0xfe0,0xfdc
 a89:	0f 00 00 
 a8c:	c7 05 e0 0f 00 00 e0 	movl   $0xfe0,0xfe0
 a93:	0f 00 00 
    base.s.size = 0;
 a96:	c7 05 e4 0f 00 00 00 	movl   $0x0,0xfe4
 a9d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 aa0:	b9 e0 0f 00 00       	mov    $0xfe0,%ecx
 aa5:	eb d7                	jmp    a7e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 aa7:	74 19                	je     ac2 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 aa9:	29 da                	sub    %ebx,%edx
 aab:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aae:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 ab1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 ab4:	89 0d dc 0f 00 00    	mov    %ecx,0xfdc
      return (void*)(p + 1);
 aba:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 abd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ac0:	c9                   	leave  
 ac1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 ac2:	8b 10                	mov    (%eax),%edx
 ac4:	89 11                	mov    %edx,(%ecx)
 ac6:	eb ec                	jmp    ab4 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	89 c1                	mov    %eax,%ecx
 aca:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 acc:	8b 50 04             	mov    0x4(%eax),%edx
 acf:	39 da                	cmp    %ebx,%edx
 ad1:	73 d4                	jae    aa7 <malloc+0x46>
    if(p == freep)
 ad3:	39 05 dc 0f 00 00    	cmp    %eax,0xfdc
 ad9:	75 ed                	jne    ac8 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 adb:	89 d8                	mov    %ebx,%eax
 add:	e8 2f ff ff ff       	call   a11 <morecore>
 ae2:	85 c0                	test   %eax,%eax
 ae4:	75 e2                	jne    ac8 <malloc+0x67>
 ae6:	eb d5                	jmp    abd <malloc+0x5c>
