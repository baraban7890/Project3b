
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void worker(void *arg1, void *arg2);
void nested_worker(void *arg1, void *arg2);

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 1f 06 00 00       	call   636 <getpid>

   int arg1 = 35;
   int arg2 = 42;
   int thread_pid = thread_create(worker, &arg1, &arg2);
  17:	83 ec 04             	sub    $0x4,%esp
   int arg1 = 35;
  1a:	c7 45 f0 23 00 00 00 	movl   $0x23,-0x10(%ebp)
   ppid = getpid();
  21:	a3 00 0f 00 00       	mov    %eax,0xf00
   int thread_pid = thread_create(worker, &arg1, &arg2);
  26:	8d 45 f4             	lea    -0xc(%ebp),%eax
  29:	50                   	push   %eax
  2a:	8d 45 f0             	lea    -0x10(%ebp),%eax
  2d:	50                   	push   %eax
  2e:	68 c0 01 00 00       	push   $0x1c0
   int arg2 = 42;
  33:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
  3a:	e8 d1 04 00 00       	call   510 <thread_create>
   assert(thread_pid > 0);
  3f:	83 c4 10             	add    $0x10,%esp
  42:	85 c0                	test   %eax,%eax
  44:	7e 7b                	jle    c1 <main+0xc1>
  46:	89 c3                	mov    %eax,%ebx

   int join_pid = thread_join();
  48:	e8 f3 04 00 00       	call   540 <thread_join>
   assert(join_pid == thread_pid);
  4d:	39 c3                	cmp    %eax,%ebx
  4f:	75 2a                	jne    7b <main+0x7b>
   assert(global == 3);
  51:	83 3d fc 0e 00 00 03 	cmpl   $0x3,0xefc
  58:	0f 84 80 00 00 00    	je     de <main+0xde>
  5e:	6a 24                	push   $0x24
  60:	68 48 0a 00 00       	push   $0xa48
  65:	68 52 0a 00 00       	push   $0xa52
  6a:	6a 01                	push   $0x1
  6c:	e8 af 06 00 00       	call   720 <printf>
  71:	83 c4 0c             	add    $0xc,%esp
  74:	68 d7 0a 00 00       	push   $0xad7
  79:	eb 1b                	jmp    96 <main+0x96>
   assert(join_pid == thread_pid);
  7b:	6a 23                	push   $0x23
  7d:	68 48 0a 00 00       	push   $0xa48
  82:	68 52 0a 00 00       	push   $0xa52
  87:	6a 01                	push   $0x1
  89:	e8 92 06 00 00       	call   720 <printf>
  8e:	83 c4 0c             	add    $0xc,%esp
  91:	68 c0 0a 00 00       	push   $0xac0
  96:	68 69 0a 00 00       	push   $0xa69
  9b:	6a 01                	push   $0x1
  9d:	e8 7e 06 00 00       	call   720 <printf>
  a2:	5a                   	pop    %edx
  a3:	59                   	pop    %ecx
  a4:	68 7d 0a 00 00       	push   $0xa7d
  a9:	6a 01                	push   $0x1
  ab:	e8 70 06 00 00       	call   720 <printf>
  b0:	5b                   	pop    %ebx
  b1:	ff 35 00 0f 00 00    	push   0xf00
  b7:	e8 2a 05 00 00       	call   5e6 <kill>
  bc:	e8 f5 04 00 00       	call   5b6 <exit>
   assert(thread_pid > 0);
  c1:	6a 20                	push   $0x20
  c3:	68 48 0a 00 00       	push   $0xa48
  c8:	68 52 0a 00 00       	push   $0xa52
  cd:	6a 01                	push   $0x1
  cf:	e8 4c 06 00 00       	call   720 <printf>
  d4:	83 c4 0c             	add    $0xc,%esp
  d7:	68 b1 0a 00 00       	push   $0xab1
  dc:	eb b8                	jmp    96 <main+0x96>

   printf(1, "TEST PASSED\n");
  de:	50                   	push   %eax
  df:	50                   	push   %eax
  e0:	68 e3 0a 00 00       	push   $0xae3
  e5:	6a 01                	push   $0x1
  e7:	e8 34 06 00 00       	call   720 <printf>
   exit();
  ec:	e8 c5 04 00 00       	call   5b6 <exit>
  f1:	66 90                	xchg   %ax,%ax
  f3:	66 90                	xchg   %ax,%ax
  f5:	66 90                	xchg   %ax,%ax
  f7:	66 90                	xchg   %ax,%ax
  f9:	66 90                	xchg   %ax,%ax
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <nested_worker>:
}


void nested_worker(void *arg1, void *arg2){
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
 106:	8b 45 0c             	mov    0xc(%ebp),%eax
 109:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	83 38 23             	cmpl   $0x23,(%eax)
 111:	75 75                	jne    188 <nested_worker+0x88>
   assert(arg2_int == 42);
 113:	83 fa 2a             	cmp    $0x2a,%edx
 116:	75 2a                	jne    142 <nested_worker+0x42>
   assert(global == 2);
 118:	83 3d fc 0e 00 00 02 	cmpl   $0x2,0xefc
 11f:	0f 84 80 00 00 00    	je     1a5 <nested_worker+0xa5>
 125:	6a 30                	push   $0x30
 127:	68 48 0a 00 00       	push   $0xa48
 12c:	68 52 0a 00 00       	push   $0xa52
 131:	6a 01                	push   $0x1
 133:	e8 e8 05 00 00       	call   720 <printf>
 138:	83 c4 0c             	add    $0xc,%esp
 13b:	68 99 0a 00 00       	push   $0xa99
 140:	eb 1b                	jmp    15d <nested_worker+0x5d>
   assert(arg2_int == 42);
 142:	6a 2f                	push   $0x2f
 144:	68 48 0a 00 00       	push   $0xa48
 149:	68 52 0a 00 00       	push   $0xa52
 14e:	6a 01                	push   $0x1
 150:	e8 cb 05 00 00       	call   720 <printf>
 155:	83 c4 0c             	add    $0xc,%esp
 158:	68 8a 0a 00 00       	push   $0xa8a
 15d:	68 69 0a 00 00       	push   $0xa69
 162:	6a 01                	push   $0x1
 164:	e8 b7 05 00 00       	call   720 <printf>
 169:	58                   	pop    %eax
 16a:	5a                   	pop    %edx
 16b:	68 7d 0a 00 00       	push   $0xa7d
 170:	6a 01                	push   $0x1
 172:	e8 a9 05 00 00       	call   720 <printf>
 177:	59                   	pop    %ecx
 178:	ff 35 00 0f 00 00    	push   0xf00
 17e:	e8 63 04 00 00       	call   5e6 <kill>
 183:	e8 2e 04 00 00       	call   5b6 <exit>
   assert(arg1_int == 35);
 188:	6a 2e                	push   $0x2e
 18a:	68 48 0a 00 00       	push   $0xa48
 18f:	68 52 0a 00 00       	push   $0xa52
 194:	6a 01                	push   $0x1
 196:	e8 85 05 00 00       	call   720 <printf>
 19b:	83 c4 0c             	add    $0xc,%esp
 19e:	68 5a 0a 00 00       	push   $0xa5a
 1a3:	eb b8                	jmp    15d <nested_worker+0x5d>
   global++;
 1a5:	c7 05 fc 0e 00 00 03 	movl   $0x3,0xefc
 1ac:	00 00 00 
   exit();
 1af:	e8 02 04 00 00       	call   5b6 <exit>
 1b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <worker>:
}

void
worker(void *arg1, void *arg2) {
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
   int arg2_int = *(int*)arg2;
 1ca:	8b 55 0c             	mov    0xc(%ebp),%edx
   int arg1_int = *(int*)arg1;
 1cd:	8b 00                	mov    (%eax),%eax
   int arg2_int = *(int*)arg2;
 1cf:	8b 12                	mov    (%edx),%edx
   int arg1_int = *(int*)arg1;
 1d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   int arg2_int = *(int*)arg2;
 1d4:	89 55 f4             	mov    %edx,-0xc(%ebp)
   assert(arg1_int == 35);
 1d7:	83 f8 23             	cmp    $0x23,%eax
 1da:	75 75                	jne    251 <worker+0x91>
   assert(arg2_int == 42);
 1dc:	83 fa 2a             	cmp    $0x2a,%edx
 1df:	75 2a                	jne    20b <worker+0x4b>
   assert(global == 1);
 1e1:	83 3d fc 0e 00 00 01 	cmpl   $0x1,0xefc
 1e8:	0f 84 80 00 00 00    	je     26e <worker+0xae>
 1ee:	6a 3b                	push   $0x3b
 1f0:	68 48 0a 00 00       	push   $0xa48
 1f5:	68 52 0a 00 00       	push   $0xa52
 1fa:	6a 01                	push   $0x1
 1fc:	e8 1f 05 00 00       	call   720 <printf>
 201:	83 c4 0c             	add    $0xc,%esp
 204:	68 a5 0a 00 00       	push   $0xaa5
 209:	eb 1b                	jmp    226 <worker+0x66>
   assert(arg2_int == 42);
 20b:	6a 3a                	push   $0x3a
 20d:	68 48 0a 00 00       	push   $0xa48
 212:	68 52 0a 00 00       	push   $0xa52
 217:	6a 01                	push   $0x1
 219:	e8 02 05 00 00       	call   720 <printf>
 21e:	83 c4 0c             	add    $0xc,%esp
 221:	68 8a 0a 00 00       	push   $0xa8a
 226:	68 69 0a 00 00       	push   $0xa69
 22b:	6a 01                	push   $0x1
 22d:	e8 ee 04 00 00       	call   720 <printf>
 232:	5a                   	pop    %edx
 233:	59                   	pop    %ecx
 234:	68 7d 0a 00 00       	push   $0xa7d
 239:	6a 01                	push   $0x1
 23b:	e8 e0 04 00 00       	call   720 <printf>
 240:	5b                   	pop    %ebx
 241:	ff 35 00 0f 00 00    	push   0xf00
 247:	e8 9a 03 00 00       	call   5e6 <kill>
 24c:	e8 65 03 00 00       	call   5b6 <exit>
   assert(arg1_int == 35);
 251:	6a 39                	push   $0x39
 253:	68 48 0a 00 00       	push   $0xa48
 258:	68 52 0a 00 00       	push   $0xa52
 25d:	6a 01                	push   $0x1
 25f:	e8 bc 04 00 00       	call   720 <printf>
 264:	83 c4 0c             	add    $0xc,%esp
 267:	68 5a 0a 00 00       	push   $0xa5a
 26c:	eb b8                	jmp    226 <worker+0x66>
   global++;
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 26e:	50                   	push   %eax
 26f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 272:	50                   	push   %eax
 273:	8d 45 f0             	lea    -0x10(%ebp),%eax
 276:	50                   	push   %eax
 277:	68 00 01 00 00       	push   $0x100
   global++;
 27c:	c7 05 fc 0e 00 00 02 	movl   $0x2,0xefc
 283:	00 00 00 
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 286:	e8 85 02 00 00       	call   510 <thread_create>
 28b:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 28d:	e8 ae 02 00 00       	call   540 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 292:	83 c4 10             	add    $0x10,%esp
 295:	39 c3                	cmp    %eax,%ebx
 297:	74 20                	je     2b9 <worker+0xf9>
 299:	6a 3f                	push   $0x3f
 29b:	68 48 0a 00 00       	push   $0xa48
 2a0:	68 52 0a 00 00       	push   $0xa52
 2a5:	6a 01                	push   $0x1
 2a7:	e8 74 04 00 00       	call   720 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 f0 0a 00 00       	push   $0xaf0
 2b4:	e9 6d ff ff ff       	jmp    226 <worker+0x66>
   exit();
 2b9:	e8 f8 02 00 00       	call   5b6 <exit>
 2be:	66 90                	xchg   %ax,%ax

000002c0 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 2c0:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2c1:	31 c0                	xor    %eax,%eax
{
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	53                   	push   %ebx
 2c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 2d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2d7:	83 c0 01             	add    $0x1,%eax
 2da:	84 d2                	test   %dl,%dl
 2dc:	75 f2                	jne    2d0 <strcpy+0x10>
    ;
  return os;
}
 2de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e1:	89 c8                	mov    %ecx,%eax
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
 2f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 2fa:	0f b6 02             	movzbl (%edx),%eax
 2fd:	84 c0                	test   %al,%al
 2ff:	75 17                	jne    318 <strcmp+0x28>
 301:	eb 3a                	jmp    33d <strcmp+0x4d>
 303:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 307:	90                   	nop
 308:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 30c:	83 c2 01             	add    $0x1,%edx
 30f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 312:	84 c0                	test   %al,%al
 314:	74 1a                	je     330 <strcmp+0x40>
    p++, q++;
 316:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 318:	0f b6 19             	movzbl (%ecx),%ebx
 31b:	38 c3                	cmp    %al,%bl
 31d:	74 e9                	je     308 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 31f:	29 d8                	sub    %ebx,%eax
}
 321:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 324:	c9                   	leave  
 325:	c3                   	ret    
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 330:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 334:	31 c0                	xor    %eax,%eax
 336:	29 d8                	sub    %ebx,%eax
}
 338:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33b:	c9                   	leave  
 33c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 33d:	0f b6 19             	movzbl (%ecx),%ebx
 340:	31 c0                	xor    %eax,%eax
 342:	eb db                	jmp    31f <strcmp+0x2f>
 344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <strlen>:

uint strlen(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 356:	80 3a 00             	cmpb   $0x0,(%edx)
 359:	74 15                	je     370 <strlen+0x20>
 35b:	31 c0                	xor    %eax,%eax
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	83 c0 01             	add    $0x1,%eax
 363:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 367:	89 c1                	mov    %eax,%ecx
 369:	75 f5                	jne    360 <strlen+0x10>
    ;
  return n;
}
 36b:	89 c8                	mov    %ecx,%eax
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop
  for (n = 0; s[n]; n++)
 370:	31 c9                	xor    %ecx,%ecx
}
 372:	5d                   	pop    %ebp
 373:	89 c8                	mov    %ecx,%eax
 375:	c3                   	ret    
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <memset>:

void *
memset(void *dst, int c, uint n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 d7                	mov    %edx,%edi
 38f:	fc                   	cld    
 390:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 392:	8b 7d fc             	mov    -0x4(%ebp),%edi
 395:	89 d0                	mov    %edx,%eax
 397:	c9                   	leave  
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strchr>:

char *
strchr(const char *s, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 3aa:	0f b6 10             	movzbl (%eax),%edx
 3ad:	84 d2                	test   %dl,%dl
 3af:	75 12                	jne    3c3 <strchr+0x23>
 3b1:	eb 1d                	jmp    3d0 <strchr+0x30>
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3bc:	83 c0 01             	add    $0x1,%eax
 3bf:	84 d2                	test   %dl,%dl
 3c1:	74 0d                	je     3d0 <strchr+0x30>
    if (*s == c)
 3c3:	38 d1                	cmp    %dl,%cl
 3c5:	75 f1                	jne    3b8 <strchr+0x18>
      return (char *)s;
  return 0;
}
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <gets>:

char *
gets(char *buf, int max)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 3e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 3e8:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 3e9:	31 db                	xor    %ebx,%ebx
{
 3eb:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 3ee:	eb 27                	jmp    417 <gets+0x37>
    cc = read(0, &c, 1);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	6a 01                	push   $0x1
 3f5:	57                   	push   %edi
 3f6:	6a 00                	push   $0x0
 3f8:	e8 d1 01 00 00       	call   5ce <read>
    if (cc < 1)
 3fd:	83 c4 10             	add    $0x10,%esp
 400:	85 c0                	test   %eax,%eax
 402:	7e 1d                	jle    421 <gets+0x41>
      break;
    buf[i++] = c;
 404:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 408:	8b 55 08             	mov    0x8(%ebp),%edx
 40b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	74 1d                	je     430 <gets+0x50>
 413:	3c 0d                	cmp    $0xd,%al
 415:	74 19                	je     430 <gets+0x50>
  for (i = 0; i + 1 < max;)
 417:	89 de                	mov    %ebx,%esi
 419:	83 c3 01             	add    $0x1,%ebx
 41c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41f:	7c cf                	jl     3f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 428:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42b:	5b                   	pop    %ebx
 42c:	5e                   	pop    %esi
 42d:	5f                   	pop    %edi
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    
  buf[i] = '\0';
 430:	8b 45 08             	mov    0x8(%ebp),%eax
 433:	89 de                	mov    %ebx,%esi
 435:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 439:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5f                   	pop    %edi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <stat>:

int stat(const char *n, struct stat *st)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 455:	83 ec 08             	sub    $0x8,%esp
 458:	6a 00                	push   $0x0
 45a:	ff 75 08             	push   0x8(%ebp)
 45d:	e8 94 01 00 00       	call   5f6 <open>
  if (fd < 0)
 462:	83 c4 10             	add    $0x10,%esp
 465:	85 c0                	test   %eax,%eax
 467:	78 27                	js     490 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 469:	83 ec 08             	sub    $0x8,%esp
 46c:	ff 75 0c             	push   0xc(%ebp)
 46f:	89 c3                	mov    %eax,%ebx
 471:	50                   	push   %eax
 472:	e8 97 01 00 00       	call   60e <fstat>
  close(fd);
 477:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 47a:	89 c6                	mov    %eax,%esi
  close(fd);
 47c:	e8 5d 01 00 00       	call   5de <close>
  return r;
 481:	83 c4 10             	add    $0x10,%esp
}
 484:	8d 65 f8             	lea    -0x8(%ebp),%esp
 487:	89 f0                	mov    %esi,%eax
 489:	5b                   	pop    %ebx
 48a:	5e                   	pop    %esi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
 48d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 490:	be ff ff ff ff       	mov    $0xffffffff,%esi
 495:	eb ed                	jmp    484 <stat+0x34>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax

000004a0 <atoi>:

int atoi(const char *s)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 4a7:	0f be 02             	movsbl (%edx),%eax
 4aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 4b5:	77 1e                	ja     4d5 <atoi+0x35>
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 4c0:	83 c2 01             	add    $0x1,%edx
 4c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 4ca:	0f be 02             	movsbl (%edx),%eax
 4cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4d0:	80 fb 09             	cmp    $0x9,%bl
 4d3:	76 eb                	jbe    4c0 <atoi+0x20>
  return n;
}
 4d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d8:	89 c8                	mov    %ecx,%eax
 4da:	c9                   	leave  
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004e0 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	8b 45 10             	mov    0x10(%ebp),%eax
 4e7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ea:	56                   	push   %esi
 4eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 4ee:	85 c0                	test   %eax,%eax
 4f0:	7e 13                	jle    505 <memmove+0x25>
 4f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4f4:	89 d7                	mov    %edx,%edi
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 500:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 501:	39 f8                	cmp    %edi,%eax
 503:	75 fb                	jne    500 <memmove+0x20>
  return vdst;
}
 505:	5e                   	pop    %esi
 506:	89 d0                	mov    %edx,%eax
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    
 50b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 516:	68 00 20 00 00       	push   $0x2000
 51b:	e8 30 04 00 00       	call   950 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 520:	50                   	push   %eax
 521:	ff 75 10             	push   0x10(%ebp)
 524:	ff 75 0c             	push   0xc(%ebp)
 527:	ff 75 08             	push   0x8(%ebp)
 52a:	e8 27 01 00 00       	call   656 <clone>

  return pid;
}
 52f:	c9                   	leave  
 530:	c3                   	ret    
 531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop

00000540 <thread_join>:

int thread_join()
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	53                   	push   %ebx
 544:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 547:	6a 04                	push   $0x4
 549:	e8 02 04 00 00       	call   950 <malloc>
 54e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 551:	8d 45 f4             	lea    -0xc(%ebp),%eax
 554:	89 04 24             	mov    %eax,(%esp)
 557:	e8 02 01 00 00       	call   65e <join>
 55c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 55e:	58                   	pop    %eax
 55f:	ff 75 f4             	push   -0xc(%ebp)
 562:	e8 59 03 00 00       	call   8c0 <free>
  lock_release(&lock);

  return pid;
}
 567:	89 d8                	mov    %ebx,%eax
 569:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 56c:	c9                   	leave  
 56d:	c3                   	ret    
 56e:	66 90                	xchg   %ax,%ax

00000570 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 576:	83 38 01             	cmpl   $0x1,(%eax)
 579:	75 05                	jne    580 <lock_acquire+0x10>
 57b:	eb fe                	jmp    57b <lock_acquire+0xb>
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 580:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    
 588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <lock_release>:
void lock_release(lock_t *lock)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 593:	8b 45 08             	mov    0x8(%ebp),%eax
 596:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 59c:	5d                   	pop    %ebp
 59d:	c3                   	ret    
 59e:	66 90                	xchg   %ax,%ax

000005a0 <lock_init>:
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5ac:	5d                   	pop    %ebp
 5ad:	c3                   	ret    

000005ae <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ae:	b8 01 00 00 00       	mov    $0x1,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <exit>:
SYSCALL(exit)
 5b6:	b8 02 00 00 00       	mov    $0x2,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <wait>:
SYSCALL(wait)
 5be:	b8 03 00 00 00       	mov    $0x3,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <pipe>:
SYSCALL(pipe)
 5c6:	b8 04 00 00 00       	mov    $0x4,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <read>:
SYSCALL(read)
 5ce:	b8 05 00 00 00       	mov    $0x5,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <write>:
SYSCALL(write)
 5d6:	b8 10 00 00 00       	mov    $0x10,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <close>:
SYSCALL(close)
 5de:	b8 15 00 00 00       	mov    $0x15,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <kill>:
SYSCALL(kill)
 5e6:	b8 06 00 00 00       	mov    $0x6,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <exec>:
SYSCALL(exec)
 5ee:	b8 07 00 00 00       	mov    $0x7,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <open>:
SYSCALL(open)
 5f6:	b8 0f 00 00 00       	mov    $0xf,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <mknod>:
SYSCALL(mknod)
 5fe:	b8 11 00 00 00       	mov    $0x11,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <unlink>:
SYSCALL(unlink)
 606:	b8 12 00 00 00       	mov    $0x12,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <fstat>:
SYSCALL(fstat)
 60e:	b8 08 00 00 00       	mov    $0x8,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <link>:
SYSCALL(link)
 616:	b8 13 00 00 00       	mov    $0x13,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <mkdir>:
SYSCALL(mkdir)
 61e:	b8 14 00 00 00       	mov    $0x14,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <chdir>:
SYSCALL(chdir)
 626:	b8 09 00 00 00       	mov    $0x9,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <dup>:
SYSCALL(dup)
 62e:	b8 0a 00 00 00       	mov    $0xa,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <getpid>:
SYSCALL(getpid)
 636:	b8 0b 00 00 00       	mov    $0xb,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <sbrk>:
SYSCALL(sbrk)
 63e:	b8 0c 00 00 00       	mov    $0xc,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <sleep>:
SYSCALL(sleep)
 646:	b8 0d 00 00 00       	mov    $0xd,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <uptime>:
SYSCALL(uptime)
 64e:	b8 0e 00 00 00       	mov    $0xe,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <clone>:
SYSCALL(clone)
 656:	b8 16 00 00 00       	mov    $0x16,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <join>:
 65e:	b8 17 00 00 00       	mov    $0x17,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    
 666:	66 90                	xchg   %ax,%ax
 668:	66 90                	xchg   %ax,%ax
 66a:	66 90                	xchg   %ax,%ax
 66c:	66 90                	xchg   %ax,%ax
 66e:	66 90                	xchg   %ax,%ax

00000670 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 3c             	sub    $0x3c,%esp
 679:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 67c:	89 d1                	mov    %edx,%ecx
{
 67e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 681:	85 d2                	test   %edx,%edx
 683:	0f 89 7f 00 00 00    	jns    708 <printint+0x98>
 689:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 68d:	74 79                	je     708 <printint+0x98>
    neg = 1;
 68f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 696:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 698:	31 db                	xor    %ebx,%ebx
 69a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6a0:	89 c8                	mov    %ecx,%eax
 6a2:	31 d2                	xor    %edx,%edx
 6a4:	89 cf                	mov    %ecx,%edi
 6a6:	f7 75 c4             	divl   -0x3c(%ebp)
 6a9:	0f b6 92 74 0b 00 00 	movzbl 0xb74(%edx),%edx
 6b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6b3:	89 d8                	mov    %ebx,%eax
 6b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6c1:	76 dd                	jbe    6a0 <printint+0x30>
  if(neg)
 6c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6c6:	85 c9                	test   %ecx,%ecx
 6c8:	74 0c                	je     6d6 <printint+0x66>
    buf[i++] = '-';
 6ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6dd:	eb 07                	jmp    6e6 <printint+0x76>
 6df:	90                   	nop
    putc(fd, buf[i]);
 6e0:	0f b6 13             	movzbl (%ebx),%edx
 6e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6e6:	83 ec 04             	sub    $0x4,%esp
 6e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6ec:	6a 01                	push   $0x1
 6ee:	56                   	push   %esi
 6ef:	57                   	push   %edi
 6f0:	e8 e1 fe ff ff       	call   5d6 <write>
  while(--i >= 0)
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	39 de                	cmp    %ebx,%esi
 6fa:	75 e4                	jne    6e0 <printint+0x70>
}
 6fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ff:	5b                   	pop    %ebx
 700:	5e                   	pop    %esi
 701:	5f                   	pop    %edi
 702:	5d                   	pop    %ebp
 703:	c3                   	ret    
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 708:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 70f:	eb 87                	jmp    698 <printint+0x28>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop

00000720 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 729:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 72c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 72f:	0f b6 13             	movzbl (%ebx),%edx
 732:	84 d2                	test   %dl,%dl
 734:	74 6a                	je     7a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 736:	8d 45 10             	lea    0x10(%ebp),%eax
 739:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 73c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 73f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 741:	89 45 d0             	mov    %eax,-0x30(%ebp)
 744:	eb 36                	jmp    77c <printf+0x5c>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
 750:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 753:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 758:	83 f8 25             	cmp    $0x25,%eax
 75b:	74 15                	je     772 <printf+0x52>
  write(fd, &c, 1);
 75d:	83 ec 04             	sub    $0x4,%esp
 760:	88 55 e7             	mov    %dl,-0x19(%ebp)
 763:	6a 01                	push   $0x1
 765:	57                   	push   %edi
 766:	56                   	push   %esi
 767:	e8 6a fe ff ff       	call   5d6 <write>
 76c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 76f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 772:	0f b6 13             	movzbl (%ebx),%edx
 775:	83 c3 01             	add    $0x1,%ebx
 778:	84 d2                	test   %dl,%dl
 77a:	74 24                	je     7a0 <printf+0x80>
    c = fmt[i] & 0xff;
 77c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 77f:	85 c9                	test   %ecx,%ecx
 781:	74 cd                	je     750 <printf+0x30>
      }
    } else if(state == '%'){
 783:	83 f9 25             	cmp    $0x25,%ecx
 786:	75 ea                	jne    772 <printf+0x52>
      if(c == 'd'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	0f 84 07 01 00 00    	je     898 <printf+0x178>
 791:	83 e8 63             	sub    $0x63,%eax
 794:	83 f8 15             	cmp    $0x15,%eax
 797:	77 17                	ja     7b0 <printf+0x90>
 799:	ff 24 85 1c 0b 00 00 	jmp    *0xb1c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a3:	5b                   	pop    %ebx
 7a4:	5e                   	pop    %esi
 7a5:	5f                   	pop    %edi
 7a6:	5d                   	pop    %ebp
 7a7:	c3                   	ret    
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
  write(fd, &c, 1);
 7b0:	83 ec 04             	sub    $0x4,%esp
 7b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7b6:	6a 01                	push   $0x1
 7b8:	57                   	push   %edi
 7b9:	56                   	push   %esi
 7ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7be:	e8 13 fe ff ff       	call   5d6 <write>
        putc(fd, c);
 7c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7c7:	83 c4 0c             	add    $0xc,%esp
 7ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7cd:	6a 01                	push   $0x1
 7cf:	57                   	push   %edi
 7d0:	56                   	push   %esi
 7d1:	e8 00 fe ff ff       	call   5d6 <write>
        putc(fd, c);
 7d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7d9:	31 c9                	xor    %ecx,%ecx
 7db:	eb 95                	jmp    772 <printf+0x52>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e8:	6a 00                	push   $0x0
 7ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	89 f0                	mov    %esi,%eax
 7f1:	e8 7a fe ff ff       	call   670 <printint>
        ap++;
 7f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7fd:	31 c9                	xor    %ecx,%ecx
 7ff:	e9 6e ff ff ff       	jmp    772 <printf+0x52>
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 808:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80b:	8b 10                	mov    (%eax),%edx
        ap++;
 80d:	83 c0 04             	add    $0x4,%eax
 810:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 813:	85 d2                	test   %edx,%edx
 815:	0f 84 8d 00 00 00    	je     8a8 <printf+0x188>
        while(*s != 0){
 81b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 81e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 820:	84 c0                	test   %al,%al
 822:	0f 84 4a ff ff ff    	je     772 <printf+0x52>
 828:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 82b:	89 d3                	mov    %edx,%ebx
 82d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 830:	83 ec 04             	sub    $0x4,%esp
          s++;
 833:	83 c3 01             	add    $0x1,%ebx
 836:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 839:	6a 01                	push   $0x1
 83b:	57                   	push   %edi
 83c:	56                   	push   %esi
 83d:	e8 94 fd ff ff       	call   5d6 <write>
        while(*s != 0){
 842:	0f b6 03             	movzbl (%ebx),%eax
 845:	83 c4 10             	add    $0x10,%esp
 848:	84 c0                	test   %al,%al
 84a:	75 e4                	jne    830 <printf+0x110>
      state = 0;
 84c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 84f:	31 c9                	xor    %ecx,%ecx
 851:	e9 1c ff ff ff       	jmp    772 <printf+0x52>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 0a 00 00 00       	mov    $0xa,%ecx
 868:	6a 01                	push   $0x1
 86a:	e9 7b ff ff ff       	jmp    7ea <printf+0xca>
 86f:	90                   	nop
        putc(fd, *ap);
 870:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 873:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 876:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 878:	6a 01                	push   $0x1
 87a:	57                   	push   %edi
 87b:	56                   	push   %esi
        putc(fd, *ap);
 87c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 87f:	e8 52 fd ff ff       	call   5d6 <write>
        ap++;
 884:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 888:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88b:	31 c9                	xor    %ecx,%ecx
 88d:	e9 e0 fe ff ff       	jmp    772 <printf+0x52>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 898:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 89b:	83 ec 04             	sub    $0x4,%esp
 89e:	e9 2a ff ff ff       	jmp    7cd <printf+0xad>
 8a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8a7:	90                   	nop
          s = "(null)";
 8a8:	ba 15 0b 00 00       	mov    $0xb15,%edx
        while(*s != 0){
 8ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8b0:	b8 28 00 00 00       	mov    $0x28,%eax
 8b5:	89 d3                	mov    %edx,%ebx
 8b7:	e9 74 ff ff ff       	jmp    830 <printf+0x110>
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	a1 04 0f 00 00       	mov    0xf04,%eax
{
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	57                   	push   %edi
 8c9:	56                   	push   %esi
 8ca:	53                   	push   %ebx
 8cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8d8:	89 c2                	mov    %eax,%edx
 8da:	8b 00                	mov    (%eax),%eax
 8dc:	39 ca                	cmp    %ecx,%edx
 8de:	73 30                	jae    910 <free+0x50>
 8e0:	39 c1                	cmp    %eax,%ecx
 8e2:	72 04                	jb     8e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	39 c2                	cmp    %eax,%edx
 8e6:	72 f0                	jb     8d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ee:	39 f8                	cmp    %edi,%eax
 8f0:	74 30                	je     922 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8f5:	8b 42 04             	mov    0x4(%edx),%eax
 8f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8fb:	39 f1                	cmp    %esi,%ecx
 8fd:	74 3a                	je     939 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 901:	5b                   	pop    %ebx
  freep = p;
 902:	89 15 04 0f 00 00    	mov    %edx,0xf04
}
 908:	5e                   	pop    %esi
 909:	5f                   	pop    %edi
 90a:	5d                   	pop    %ebp
 90b:	c3                   	ret    
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 910:	39 c2                	cmp    %eax,%edx
 912:	72 c4                	jb     8d8 <free+0x18>
 914:	39 c1                	cmp    %eax,%ecx
 916:	73 c0                	jae    8d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 918:	8b 73 fc             	mov    -0x4(%ebx),%esi
 91b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 91e:	39 f8                	cmp    %edi,%eax
 920:	75 d0                	jne    8f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 922:	03 70 04             	add    0x4(%eax),%esi
 925:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 928:	8b 02                	mov    (%edx),%eax
 92a:	8b 00                	mov    (%eax),%eax
 92c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 92f:	8b 42 04             	mov    0x4(%edx),%eax
 932:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 935:	39 f1                	cmp    %esi,%ecx
 937:	75 c6                	jne    8ff <free+0x3f>
    p->s.size += bp->s.size;
 939:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 93c:	89 15 04 0f 00 00    	mov    %edx,0xf04
    p->s.size += bp->s.size;
 942:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 945:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 948:	89 0a                	mov    %ecx,(%edx)
}
 94a:	5b                   	pop    %ebx
 94b:	5e                   	pop    %esi
 94c:	5f                   	pop    %edi
 94d:	5d                   	pop    %ebp
 94e:	c3                   	ret    
 94f:	90                   	nop

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 95c:	8b 3d 04 0f 00 00    	mov    0xf04,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 962:	8d 70 07             	lea    0x7(%eax),%esi
 965:	c1 ee 03             	shr    $0x3,%esi
 968:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 96b:	85 ff                	test   %edi,%edi
 96d:	0f 84 9d 00 00 00    	je     a10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 973:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 975:	8b 4a 04             	mov    0x4(%edx),%ecx
 978:	39 f1                	cmp    %esi,%ecx
 97a:	73 6a                	jae    9e6 <malloc+0x96>
 97c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 981:	39 de                	cmp    %ebx,%esi
 983:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 986:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 98d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 990:	eb 17                	jmp    9a9 <malloc+0x59>
 992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 998:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 99a:	8b 48 04             	mov    0x4(%eax),%ecx
 99d:	39 f1                	cmp    %esi,%ecx
 99f:	73 4f                	jae    9f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a1:	8b 3d 04 0f 00 00    	mov    0xf04,%edi
 9a7:	89 c2                	mov    %eax,%edx
 9a9:	39 d7                	cmp    %edx,%edi
 9ab:	75 eb                	jne    998 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9ad:	83 ec 0c             	sub    $0xc,%esp
 9b0:	ff 75 e4             	push   -0x1c(%ebp)
 9b3:	e8 86 fc ff ff       	call   63e <sbrk>
  if(p == (char*)-1)
 9b8:	83 c4 10             	add    $0x10,%esp
 9bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 9be:	74 1c                	je     9dc <malloc+0x8c>
  hp->s.size = nu;
 9c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9c3:	83 ec 0c             	sub    $0xc,%esp
 9c6:	83 c0 08             	add    $0x8,%eax
 9c9:	50                   	push   %eax
 9ca:	e8 f1 fe ff ff       	call   8c0 <free>
  return freep;
 9cf:	8b 15 04 0f 00 00    	mov    0xf04,%edx
      if((p = morecore(nunits)) == 0)
 9d5:	83 c4 10             	add    $0x10,%esp
 9d8:	85 d2                	test   %edx,%edx
 9da:	75 bc                	jne    998 <malloc+0x48>
        return 0;
  }
}
 9dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9df:	31 c0                	xor    %eax,%eax
}
 9e1:	5b                   	pop    %ebx
 9e2:	5e                   	pop    %esi
 9e3:	5f                   	pop    %edi
 9e4:	5d                   	pop    %ebp
 9e5:	c3                   	ret    
    if(p->s.size >= nunits){
 9e6:	89 d0                	mov    %edx,%eax
 9e8:	89 fa                	mov    %edi,%edx
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9f0:	39 ce                	cmp    %ecx,%esi
 9f2:	74 4c                	je     a40 <malloc+0xf0>
        p->s.size -= nunits;
 9f4:	29 f1                	sub    %esi,%ecx
 9f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9ff:	89 15 04 0f 00 00    	mov    %edx,0xf04
}
 a05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a08:	83 c0 08             	add    $0x8,%eax
}
 a0b:	5b                   	pop    %ebx
 a0c:	5e                   	pop    %esi
 a0d:	5f                   	pop    %edi
 a0e:	5d                   	pop    %ebp
 a0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a10:	c7 05 04 0f 00 00 08 	movl   $0xf08,0xf04
 a17:	0f 00 00 
    base.s.size = 0;
 a1a:	bf 08 0f 00 00       	mov    $0xf08,%edi
    base.s.ptr = freep = prevp = &base;
 a1f:	c7 05 08 0f 00 00 08 	movl   $0xf08,0xf08
 a26:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a2b:	c7 05 0c 0f 00 00 00 	movl   $0x0,0xf0c
 a32:	00 00 00 
    if(p->s.size >= nunits){
 a35:	e9 42 ff ff ff       	jmp    97c <malloc+0x2c>
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a40:	8b 08                	mov    (%eax),%ecx
 a42:	89 0a                	mov    %ecx,(%edx)
 a44:	eb b9                	jmp    9ff <malloc+0xaf>
