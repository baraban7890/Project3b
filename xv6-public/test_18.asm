
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1,void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
   6:	68 d8 0d 00 00       	push   $0xdd8
   b:	e8 70 04 00 00       	call   480 <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 dc 0d 00 00 01 	addl   $0x1,0xddc
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 d8 0d 00 00       	push   $0xdd8
  31:	e8 5d 04 00 00       	call   493 <lock_release>
    exit();
  36:	e8 02 05 00 00       	call   53d <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 d8 0d 00 00       	push   $0xdd8
  47:	e8 34 04 00 00       	call   480 <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 dc 0d 00 00 01 	addl   $0x1,0xddc
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 d8 0d 00 00       	push   $0xdd8
  6d:	e8 21 04 00 00       	call   493 <lock_release>

    int nested_thread_pid = thread_create(worker2, 0, 0);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 00 00 00 00       	push   $0x0
  7e:	e8 2c 04 00 00       	call   4af <thread_create>
  83:	89 c3                	mov    %eax,%ebx
    assert(nested_thread_pid > 0);
  85:	83 c4 10             	add    $0x10,%esp
  88:	85 c0                	test   %eax,%eax
  8a:	7e 5e                	jle    ea <worker+0xaf>
    int nested_join_pid = thread_join();
  8c:	e8 56 04 00 00       	call   4e7 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 40 09 00 00       	push   $0x940
  a8:	68 4a 09 00 00       	push   $0x94a
  ad:	6a 01                	push   $0x1
  af:	e8 de 05 00 00       	call   692 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 c4 09 00 00       	push   $0x9c4
  bc:	68 68 09 00 00       	push   $0x968
  c1:	6a 01                	push   $0x1
  c3:	e8 ca 05 00 00       	call   692 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 7c 09 00 00       	push   $0x97c
  d0:	6a 01                	push   $0x1
  d2:	e8 bb 05 00 00       	call   692 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 e0 0d 00 00    	push   0xde0
  e0:	e8 88 04 00 00       	call   56d <kill>
  e5:	e8 53 04 00 00       	call   53d <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 40 09 00 00       	push   $0x940
  f1:	68 4a 09 00 00       	push   $0x94a
  f6:	6a 01                	push   $0x1
  f8:	e8 95 05 00 00       	call   692 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 52 09 00 00       	push   $0x952
 105:	68 68 09 00 00       	push   $0x968
 10a:	6a 01                	push   $0x1
 10c:	e8 81 05 00 00       	call   692 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 7c 09 00 00       	push   $0x97c
 119:	6a 01                	push   $0x1
 11b:	e8 72 05 00 00       	call   692 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 e0 0d 00 00    	push   0xde0
 129:	e8 3f 04 00 00       	call   56d <kill>
 12e:	e8 0a 04 00 00       	call   53d <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 40 09 00 00       	push   $0x940
 13a:	68 4a 09 00 00       	push   $0x94a
 13f:	6a 01                	push   $0x1
 141:	e8 4c 05 00 00       	call   692 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 89 09 00 00       	push   $0x989
 14e:	68 68 09 00 00       	push   $0x968
 153:	6a 01                	push   $0x1
 155:	e8 38 05 00 00       	call   692 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 7c 09 00 00       	push   $0x97c
 162:	6a 01                	push   $0x1
 164:	e8 29 05 00 00       	call   692 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 e0 0d 00 00    	push   0xde0
 172:	e8 f6 03 00 00       	call   56d <kill>
 177:	e8 c1 03 00 00       	call   53d <exit>

   exit();
 17c:	e8 bc 03 00 00       	call   53d <exit>

00000181 <main>:
{
 181:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 185:	83 e4 f0             	and    $0xfffffff0,%esp
 188:	ff 71 fc             	push   -0x4(%ecx)
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	53                   	push   %ebx
 18f:	51                   	push   %ecx
   ppid = getpid();
 190:	e8 28 04 00 00       	call   5bd <getpid>
 195:	a3 e0 0d 00 00       	mov    %eax,0xde0
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 d8 0d 00 00       	push   $0xdd8
 1a2:	e8 fa 02 00 00       	call   4a1 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d d4 0d 00 00    	cmp    %ebx,0xdd4
 1ba:	7e 61                	jle    21d <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
 1bc:	83 ec 04             	sub    $0x4,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	6a 00                	push   $0x0
 1c3:	68 3b 00 00 00       	push   $0x3b
 1c8:	e8 e2 02 00 00       	call   4af <thread_create>
      assert(thread_pid > 0);
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7f dd                	jg     1b1 <main+0x30>
 1d4:	6a 26                	push   $0x26
 1d6:	68 40 09 00 00       	push   $0x940
 1db:	68 4a 09 00 00       	push   $0x94a
 1e0:	6a 01                	push   $0x1
 1e2:	e8 ab 04 00 00       	call   692 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 59 09 00 00       	push   $0x959
 1ef:	68 68 09 00 00       	push   $0x968
 1f4:	6a 01                	push   $0x1
 1f6:	e8 97 04 00 00       	call   692 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 7c 09 00 00       	push   $0x97c
 203:	6a 01                	push   $0x1
 205:	e8 88 04 00 00       	call   692 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 e0 0d 00 00    	push   0xde0
 213:	e8 55 03 00 00       	call   56d <kill>
 218:	e8 20 03 00 00       	call   53d <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 d4 0d 00 00       	mov    0xdd4,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 b7 02 00 00       	call   4e7 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 40 09 00 00       	push   $0x940
 240:	68 4a 09 00 00       	push   $0x94a
 245:	6a 01                	push   $0x1
 247:	e8 46 04 00 00       	call   692 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 90 09 00 00       	push   $0x990
 254:	68 68 09 00 00       	push   $0x968
 259:	6a 01                	push   $0x1
 25b:	e8 32 04 00 00       	call   692 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 7c 09 00 00       	push   $0x97c
 268:	6a 01                	push   $0x1
 26a:	e8 23 04 00 00       	call   692 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 e0 0d 00 00    	push   0xde0
 278:	e8 f0 02 00 00       	call   56d <kill>
 27d:	e8 bb 02 00 00       	call   53d <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 dc 0d 00 00    	cmp    0xddc,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 40 09 00 00       	push   $0x940
 293:	68 4a 09 00 00       	push   $0x94a
 298:	6a 01                	push   $0x1
 29a:	e8 f3 03 00 00       	call   692 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 9d 09 00 00       	push   $0x99d
 2a7:	68 68 09 00 00       	push   $0x968
 2ac:	6a 01                	push   $0x1
 2ae:	e8 df 03 00 00       	call   692 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 7c 09 00 00       	push   $0x97c
 2bb:	6a 01                	push   $0x1
 2bd:	e8 d0 03 00 00       	call   692 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 e0 0d 00 00    	push   0xde0
 2cb:	e8 9d 02 00 00       	call   56d <kill>
 2d0:	e8 68 02 00 00       	call   53d <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 b7 09 00 00       	push   $0x9b7
 2dd:	6a 01                	push   $0x1
 2df:	e8 ae 03 00 00       	call   692 <printf>
   exit();
 2e4:	e8 54 02 00 00       	call   53d <exit>

000002e9 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	56                   	push   %esi
 2ed:	53                   	push   %ebx
 2ee:	8b 75 08             	mov    0x8(%ebp),%esi
 2f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2f4:	89 f0                	mov    %esi,%eax
 2f6:	89 d1                	mov    %edx,%ecx
 2f8:	83 c2 01             	add    $0x1,%edx
 2fb:	89 c3                	mov    %eax,%ebx
 2fd:	83 c0 01             	add    $0x1,%eax
 300:	0f b6 09             	movzbl (%ecx),%ecx
 303:	88 0b                	mov    %cl,(%ebx)
 305:	84 c9                	test   %cl,%cl
 307:	75 ed                	jne    2f6 <strcpy+0xd>
    ;
  return os;
}
 309:	89 f0                	mov    %esi,%eax
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <strcmp>:

int strcmp(const char *p, const char *q)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	8b 4d 08             	mov    0x8(%ebp),%ecx
 315:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 318:	eb 06                	jmp    320 <strcmp+0x11>
    p++, q++;
 31a:	83 c1 01             	add    $0x1,%ecx
 31d:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 320:	0f b6 01             	movzbl (%ecx),%eax
 323:	84 c0                	test   %al,%al
 325:	74 04                	je     32b <strcmp+0x1c>
 327:	3a 02                	cmp    (%edx),%al
 329:	74 ef                	je     31a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 32b:	0f b6 c0             	movzbl %al,%eax
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	29 d0                	sub    %edx,%eax
}
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    

00000335 <strlen>:

uint strlen(const char *s)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 33b:	b8 00 00 00 00       	mov    $0x0,%eax
 340:	eb 03                	jmp    345 <strlen+0x10>
 342:	83 c0 01             	add    $0x1,%eax
 345:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 349:	75 f7                	jne    342 <strlen+0xd>
    ;
  return n;
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <memset>:

void *
memset(void *dst, int c, uint n)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 354:	89 d7                	mov    %edx,%edi
 356:	8b 4d 10             	mov    0x10(%ebp),%ecx
 359:	8b 45 0c             	mov    0xc(%ebp),%eax
 35c:	fc                   	cld    
 35d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35f:	89 d0                	mov    %edx,%eax
 361:	8b 7d fc             	mov    -0x4(%ebp),%edi
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <strchr>:

char *
strchr(const char *s, char c)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 370:	eb 03                	jmp    375 <strchr+0xf>
 372:	83 c0 01             	add    $0x1,%eax
 375:	0f b6 10             	movzbl (%eax),%edx
 378:	84 d2                	test   %dl,%dl
 37a:	74 06                	je     382 <strchr+0x1c>
    if (*s == c)
 37c:	38 ca                	cmp    %cl,%dl
 37e:	75 f2                	jne    372 <strchr+0xc>
 380:	eb 05                	jmp    387 <strchr+0x21>
      return (char *)s;
  return 0;
 382:	b8 00 00 00 00       	mov    $0x0,%eax
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <gets>:

char *
gets(char *buf, int max)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	83 ec 1c             	sub    $0x1c,%esp
 392:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 395:	bb 00 00 00 00       	mov    $0x0,%ebx
 39a:	89 de                	mov    %ebx,%esi
 39c:	83 c3 01             	add    $0x1,%ebx
 39f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a2:	7d 2e                	jge    3d2 <gets+0x49>
  {
    cc = read(0, &c, 1);
 3a4:	83 ec 04             	sub    $0x4,%esp
 3a7:	6a 01                	push   $0x1
 3a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ac:	50                   	push   %eax
 3ad:	6a 00                	push   $0x0
 3af:	e8 a1 01 00 00       	call   555 <read>
    if (cc < 1)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	7e 17                	jle    3d2 <gets+0x49>
      break;
    buf[i++] = c;
 3bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 3c2:	3c 0a                	cmp    $0xa,%al
 3c4:	0f 94 c2             	sete   %dl
 3c7:	3c 0d                	cmp    $0xd,%al
 3c9:	0f 94 c0             	sete   %al
 3cc:	08 c2                	or     %al,%dl
 3ce:	74 ca                	je     39a <gets+0x11>
    buf[i++] = c;
 3d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d6:	89 f8                	mov    %edi,%eax
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <stat>:

int stat(const char *n, struct stat *st)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e5:	83 ec 08             	sub    $0x8,%esp
 3e8:	6a 00                	push   $0x0
 3ea:	ff 75 08             	push   0x8(%ebp)
 3ed:	e8 8b 01 00 00       	call   57d <open>
  if (fd < 0)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	78 24                	js     41d <stat+0x3d>
 3f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3fb:	83 ec 08             	sub    $0x8,%esp
 3fe:	ff 75 0c             	push   0xc(%ebp)
 401:	50                   	push   %eax
 402:	e8 8e 01 00 00       	call   595 <fstat>
 407:	89 c6                	mov    %eax,%esi
  close(fd);
 409:	89 1c 24             	mov    %ebx,(%esp)
 40c:	e8 54 01 00 00       	call   565 <close>
  return r;
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	89 f0                	mov    %esi,%eax
 416:	8d 65 f8             	lea    -0x8(%ebp),%esp
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
    return -1;
 41d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 422:	eb f0                	jmp    414 <stat+0x34>

00000424 <atoi>:

int atoi(const char *s)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 42b:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 430:	eb 10                	jmp    442 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 432:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 435:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 438:	83 c1 01             	add    $0x1,%ecx
 43b:	0f be c0             	movsbl %al,%eax
 43e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 442:	0f b6 01             	movzbl (%ecx),%eax
 445:	8d 58 d0             	lea    -0x30(%eax),%ebx
 448:	80 fb 09             	cmp    $0x9,%bl
 44b:	76 e5                	jbe    432 <atoi+0xe>
  return n;
}
 44d:	89 d0                	mov    %edx,%eax
 44f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 452:	c9                   	leave  
 453:	c3                   	ret    

00000454 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	56                   	push   %esi
 458:	53                   	push   %ebx
 459:	8b 75 08             	mov    0x8(%ebp),%esi
 45c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 462:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 464:	eb 0d                	jmp    473 <memmove+0x1f>
    *dst++ = *src++;
 466:	0f b6 01             	movzbl (%ecx),%eax
 469:	88 02                	mov    %al,(%edx)
 46b:	8d 49 01             	lea    0x1(%ecx),%ecx
 46e:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 471:	89 d8                	mov    %ebx,%eax
 473:	8d 58 ff             	lea    -0x1(%eax),%ebx
 476:	85 c0                	test   %eax,%eax
 478:	7f ec                	jg     466 <memmove+0x12>
  return vdst;
}
 47a:	89 f0                	mov    %esi,%eax
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 486:	83 38 01             	cmpl   $0x1,(%eax)
 489:	74 fb                	je     486 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 48b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    

00000493 <lock_release>:
void lock_release(lock_t *lock)
{
 493:	55                   	push   %ebp
 494:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret    

000004a1 <lock_init>:
void lock_init(lock_t *lock)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    

000004af <thread_create>:
{
 4af:	55                   	push   %ebp
 4b0:	89 e5                	mov    %esp,%ebp
 4b2:	53                   	push   %ebx
 4b3:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 4b6:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 4b9:	53                   	push   %ebx
 4ba:	e8 e2 ff ff ff       	call   4a1 <lock_init>
  lock_acquire(&lock);
 4bf:	89 1c 24             	mov    %ebx,(%esp)
 4c2:	e8 b9 ff ff ff       	call   480 <lock_acquire>
  void *stack = malloc(4096 * 2);
 4c7:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 4ce:	e8 e5 03 00 00       	call   8b8 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 4d3:	50                   	push   %eax
 4d4:	ff 75 10             	push   0x10(%ebp)
 4d7:	ff 75 0c             	push   0xc(%ebp)
 4da:	ff 75 08             	push   0x8(%ebp)
 4dd:	e8 fb 00 00 00       	call   5dd <clone>
}
 4e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e5:	c9                   	leave  
 4e6:	c3                   	ret    

000004e7 <thread_join>:
{
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	56                   	push   %esi
 4eb:	53                   	push   %ebx
 4ec:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 4ef:	6a 04                	push   $0x4
 4f1:	e8 c2 03 00 00       	call   8b8 <malloc>
 4f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 4f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4fc:	89 04 24             	mov    %eax,(%esp)
 4ff:	e8 e1 00 00 00       	call   5e5 <join>
 504:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 506:	8d 75 f0             	lea    -0x10(%ebp),%esi
 509:	89 34 24             	mov    %esi,(%esp)
 50c:	e8 90 ff ff ff       	call   4a1 <lock_init>
  lock_acquire(&lock);
 511:	89 34 24             	mov    %esi,(%esp)
 514:	e8 67 ff ff ff       	call   480 <lock_acquire>
  free(stack);
 519:	83 c4 04             	add    $0x4,%esp
 51c:	ff 75 f4             	push   -0xc(%ebp)
 51f:	e8 d4 02 00 00       	call   7f8 <free>
  lock_release(&lock);
 524:	89 34 24             	mov    %esi,(%esp)
 527:	e8 67 ff ff ff       	call   493 <lock_release>
}
 52c:	89 d8                	mov    %ebx,%eax
 52e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 531:	5b                   	pop    %ebx
 532:	5e                   	pop    %esi
 533:	5d                   	pop    %ebp
 534:	c3                   	ret    

00000535 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 535:	b8 01 00 00 00       	mov    $0x1,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <exit>:
SYSCALL(exit)
 53d:	b8 02 00 00 00       	mov    $0x2,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <wait>:
SYSCALL(wait)
 545:	b8 03 00 00 00       	mov    $0x3,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <pipe>:
SYSCALL(pipe)
 54d:	b8 04 00 00 00       	mov    $0x4,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <read>:
SYSCALL(read)
 555:	b8 05 00 00 00       	mov    $0x5,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <write>:
SYSCALL(write)
 55d:	b8 10 00 00 00       	mov    $0x10,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <close>:
SYSCALL(close)
 565:	b8 15 00 00 00       	mov    $0x15,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <kill>:
SYSCALL(kill)
 56d:	b8 06 00 00 00       	mov    $0x6,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <exec>:
SYSCALL(exec)
 575:	b8 07 00 00 00       	mov    $0x7,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <open>:
SYSCALL(open)
 57d:	b8 0f 00 00 00       	mov    $0xf,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <mknod>:
SYSCALL(mknod)
 585:	b8 11 00 00 00       	mov    $0x11,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <unlink>:
SYSCALL(unlink)
 58d:	b8 12 00 00 00       	mov    $0x12,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <fstat>:
SYSCALL(fstat)
 595:	b8 08 00 00 00       	mov    $0x8,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <link>:
SYSCALL(link)
 59d:	b8 13 00 00 00       	mov    $0x13,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mkdir>:
SYSCALL(mkdir)
 5a5:	b8 14 00 00 00       	mov    $0x14,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <chdir>:
SYSCALL(chdir)
 5ad:	b8 09 00 00 00       	mov    $0x9,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <dup>:
SYSCALL(dup)
 5b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <getpid>:
SYSCALL(getpid)
 5bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <sbrk>:
SYSCALL(sbrk)
 5c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <sleep>:
SYSCALL(sleep)
 5cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <uptime>:
SYSCALL(uptime)
 5d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <clone>:
SYSCALL(clone)
 5dd:	b8 16 00 00 00       	mov    $0x16,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <join>:
 5e5:	b8 17 00 00 00       	mov    $0x17,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	83 ec 1c             	sub    $0x1c,%esp
 5f3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5f6:	6a 01                	push   $0x1
 5f8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5fb:	52                   	push   %edx
 5fc:	50                   	push   %eax
 5fd:	e8 5b ff ff ff       	call   55d <write>
}
 602:	83 c4 10             	add    $0x10,%esp
 605:	c9                   	leave  
 606:	c3                   	ret    

00000607 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 607:	55                   	push   %ebp
 608:	89 e5                	mov    %esp,%ebp
 60a:	57                   	push   %edi
 60b:	56                   	push   %esi
 60c:	53                   	push   %ebx
 60d:	83 ec 2c             	sub    $0x2c,%esp
 610:	89 45 d0             	mov    %eax,-0x30(%ebp)
 613:	89 d0                	mov    %edx,%eax
 615:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 617:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 61b:	0f 95 c1             	setne  %cl
 61e:	c1 ea 1f             	shr    $0x1f,%edx
 621:	84 d1                	test   %dl,%cl
 623:	74 44                	je     669 <printint+0x62>
    neg = 1;
    x = -xx;
 625:	f7 d8                	neg    %eax
 627:	89 c1                	mov    %eax,%ecx
    neg = 1;
 629:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 630:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 635:	89 c8                	mov    %ecx,%eax
 637:	ba 00 00 00 00       	mov    $0x0,%edx
 63c:	f7 f6                	div    %esi
 63e:	89 df                	mov    %ebx,%edi
 640:	83 c3 01             	add    $0x1,%ebx
 643:	0f b6 92 48 0a 00 00 	movzbl 0xa48(%edx),%edx
 64a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 64e:	89 ca                	mov    %ecx,%edx
 650:	89 c1                	mov    %eax,%ecx
 652:	39 d6                	cmp    %edx,%esi
 654:	76 df                	jbe    635 <printint+0x2e>
  if(neg)
 656:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 65a:	74 31                	je     68d <printint+0x86>
    buf[i++] = '-';
 65c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 661:	8d 5f 02             	lea    0x2(%edi),%ebx
 664:	8b 75 d0             	mov    -0x30(%ebp),%esi
 667:	eb 17                	jmp    680 <printint+0x79>
    x = xx;
 669:	89 c1                	mov    %eax,%ecx
  neg = 0;
 66b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 672:	eb bc                	jmp    630 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 674:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 679:	89 f0                	mov    %esi,%eax
 67b:	e8 6d ff ff ff       	call   5ed <putc>
  while(--i >= 0)
 680:	83 eb 01             	sub    $0x1,%ebx
 683:	79 ef                	jns    674 <printint+0x6d>
}
 685:	83 c4 2c             	add    $0x2c,%esp
 688:	5b                   	pop    %ebx
 689:	5e                   	pop    %esi
 68a:	5f                   	pop    %edi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 690:	eb ee                	jmp    680 <printint+0x79>

00000692 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 692:	55                   	push   %ebp
 693:	89 e5                	mov    %esp,%ebp
 695:	57                   	push   %edi
 696:	56                   	push   %esi
 697:	53                   	push   %ebx
 698:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 69b:	8d 45 10             	lea    0x10(%ebp),%eax
 69e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6a1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6a6:	bb 00 00 00 00       	mov    $0x0,%ebx
 6ab:	eb 14                	jmp    6c1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6ad:	89 fa                	mov    %edi,%edx
 6af:	8b 45 08             	mov    0x8(%ebp),%eax
 6b2:	e8 36 ff ff ff       	call   5ed <putc>
 6b7:	eb 05                	jmp    6be <printf+0x2c>
      }
    } else if(state == '%'){
 6b9:	83 fe 25             	cmp    $0x25,%esi
 6bc:	74 25                	je     6e3 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6be:	83 c3 01             	add    $0x1,%ebx
 6c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6c8:	84 c0                	test   %al,%al
 6ca:	0f 84 20 01 00 00    	je     7f0 <printf+0x15e>
    c = fmt[i] & 0xff;
 6d0:	0f be f8             	movsbl %al,%edi
 6d3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6d6:	85 f6                	test   %esi,%esi
 6d8:	75 df                	jne    6b9 <printf+0x27>
      if(c == '%'){
 6da:	83 f8 25             	cmp    $0x25,%eax
 6dd:	75 ce                	jne    6ad <printf+0x1b>
        state = '%';
 6df:	89 c6                	mov    %eax,%esi
 6e1:	eb db                	jmp    6be <printf+0x2c>
      if(c == 'd'){
 6e3:	83 f8 25             	cmp    $0x25,%eax
 6e6:	0f 84 cf 00 00 00    	je     7bb <printf+0x129>
 6ec:	0f 8c dd 00 00 00    	jl     7cf <printf+0x13d>
 6f2:	83 f8 78             	cmp    $0x78,%eax
 6f5:	0f 8f d4 00 00 00    	jg     7cf <printf+0x13d>
 6fb:	83 f8 63             	cmp    $0x63,%eax
 6fe:	0f 8c cb 00 00 00    	jl     7cf <printf+0x13d>
 704:	83 e8 63             	sub    $0x63,%eax
 707:	83 f8 15             	cmp    $0x15,%eax
 70a:	0f 87 bf 00 00 00    	ja     7cf <printf+0x13d>
 710:	ff 24 85 f0 09 00 00 	jmp    *0x9f0(,%eax,4)
        printint(fd, *ap, 10, 1);
 717:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71a:	8b 17                	mov    (%edi),%edx
 71c:	83 ec 0c             	sub    $0xc,%esp
 71f:	6a 01                	push   $0x1
 721:	b9 0a 00 00 00       	mov    $0xa,%ecx
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	e8 d9 fe ff ff       	call   607 <printint>
        ap++;
 72e:	83 c7 04             	add    $0x4,%edi
 731:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 734:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 737:	be 00 00 00 00       	mov    $0x0,%esi
 73c:	eb 80                	jmp    6be <printf+0x2c>
        printint(fd, *ap, 16, 0);
 73e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 741:	8b 17                	mov    (%edi),%edx
 743:	83 ec 0c             	sub    $0xc,%esp
 746:	6a 00                	push   $0x0
 748:	b9 10 00 00 00       	mov    $0x10,%ecx
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	e8 b2 fe ff ff       	call   607 <printint>
        ap++;
 755:	83 c7 04             	add    $0x4,%edi
 758:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 75b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75e:	be 00 00 00 00       	mov    $0x0,%esi
 763:	e9 56 ff ff ff       	jmp    6be <printf+0x2c>
        s = (char*)*ap;
 768:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 76b:	8b 30                	mov    (%eax),%esi
        ap++;
 76d:	83 c0 04             	add    $0x4,%eax
 770:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 773:	85 f6                	test   %esi,%esi
 775:	75 15                	jne    78c <printf+0xfa>
          s = "(null)";
 777:	be e7 09 00 00       	mov    $0x9e7,%esi
 77c:	eb 0e                	jmp    78c <printf+0xfa>
          putc(fd, *s);
 77e:	0f be d2             	movsbl %dl,%edx
 781:	8b 45 08             	mov    0x8(%ebp),%eax
 784:	e8 64 fe ff ff       	call   5ed <putc>
          s++;
 789:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 78c:	0f b6 16             	movzbl (%esi),%edx
 78f:	84 d2                	test   %dl,%dl
 791:	75 eb                	jne    77e <printf+0xec>
      state = 0;
 793:	be 00 00 00 00       	mov    $0x0,%esi
 798:	e9 21 ff ff ff       	jmp    6be <printf+0x2c>
        putc(fd, *ap);
 79d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7a0:	0f be 17             	movsbl (%edi),%edx
 7a3:	8b 45 08             	mov    0x8(%ebp),%eax
 7a6:	e8 42 fe ff ff       	call   5ed <putc>
        ap++;
 7ab:	83 c7 04             	add    $0x4,%edi
 7ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7b1:	be 00 00 00 00       	mov    $0x0,%esi
 7b6:	e9 03 ff ff ff       	jmp    6be <printf+0x2c>
        putc(fd, c);
 7bb:	89 fa                	mov    %edi,%edx
 7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 7c0:	e8 28 fe ff ff       	call   5ed <putc>
      state = 0;
 7c5:	be 00 00 00 00       	mov    $0x0,%esi
 7ca:	e9 ef fe ff ff       	jmp    6be <printf+0x2c>
        putc(fd, '%');
 7cf:	ba 25 00 00 00       	mov    $0x25,%edx
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	e8 11 fe ff ff       	call   5ed <putc>
        putc(fd, c);
 7dc:	89 fa                	mov    %edi,%edx
 7de:	8b 45 08             	mov    0x8(%ebp),%eax
 7e1:	e8 07 fe ff ff       	call   5ed <putc>
      state = 0;
 7e6:	be 00 00 00 00       	mov    $0x0,%esi
 7eb:	e9 ce fe ff ff       	jmp    6be <printf+0x2c>
    }
  }
}
 7f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7f3:	5b                   	pop    %ebx
 7f4:	5e                   	pop    %esi
 7f5:	5f                   	pop    %edi
 7f6:	5d                   	pop    %ebp
 7f7:	c3                   	ret    

000007f8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f8:	55                   	push   %ebp
 7f9:	89 e5                	mov    %esp,%ebp
 7fb:	57                   	push   %edi
 7fc:	56                   	push   %esi
 7fd:	53                   	push   %ebx
 7fe:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 801:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 804:	a1 e4 0d 00 00       	mov    0xde4,%eax
 809:	eb 02                	jmp    80d <free+0x15>
 80b:	89 d0                	mov    %edx,%eax
 80d:	39 c8                	cmp    %ecx,%eax
 80f:	73 04                	jae    815 <free+0x1d>
 811:	39 08                	cmp    %ecx,(%eax)
 813:	77 12                	ja     827 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 815:	8b 10                	mov    (%eax),%edx
 817:	39 c2                	cmp    %eax,%edx
 819:	77 f0                	ja     80b <free+0x13>
 81b:	39 c8                	cmp    %ecx,%eax
 81d:	72 08                	jb     827 <free+0x2f>
 81f:	39 ca                	cmp    %ecx,%edx
 821:	77 04                	ja     827 <free+0x2f>
 823:	89 d0                	mov    %edx,%eax
 825:	eb e6                	jmp    80d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 827:	8b 73 fc             	mov    -0x4(%ebx),%esi
 82a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 82d:	8b 10                	mov    (%eax),%edx
 82f:	39 d7                	cmp    %edx,%edi
 831:	74 19                	je     84c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 833:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 836:	8b 50 04             	mov    0x4(%eax),%edx
 839:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 83c:	39 ce                	cmp    %ecx,%esi
 83e:	74 1b                	je     85b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 840:	89 08                	mov    %ecx,(%eax)
  freep = p;
 842:	a3 e4 0d 00 00       	mov    %eax,0xde4
}
 847:	5b                   	pop    %ebx
 848:	5e                   	pop    %esi
 849:	5f                   	pop    %edi
 84a:	5d                   	pop    %ebp
 84b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 84c:	03 72 04             	add    0x4(%edx),%esi
 84f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 852:	8b 10                	mov    (%eax),%edx
 854:	8b 12                	mov    (%edx),%edx
 856:	89 53 f8             	mov    %edx,-0x8(%ebx)
 859:	eb db                	jmp    836 <free+0x3e>
    p->s.size += bp->s.size;
 85b:	03 53 fc             	add    -0x4(%ebx),%edx
 85e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 861:	8b 53 f8             	mov    -0x8(%ebx),%edx
 864:	89 10                	mov    %edx,(%eax)
 866:	eb da                	jmp    842 <free+0x4a>

00000868 <morecore>:

static Header*
morecore(uint nu)
{
 868:	55                   	push   %ebp
 869:	89 e5                	mov    %esp,%ebp
 86b:	53                   	push   %ebx
 86c:	83 ec 04             	sub    $0x4,%esp
 86f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 871:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 876:	77 05                	ja     87d <morecore+0x15>
    nu = 4096;
 878:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 87d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 884:	83 ec 0c             	sub    $0xc,%esp
 887:	50                   	push   %eax
 888:	e8 38 fd ff ff       	call   5c5 <sbrk>
  if(p == (char*)-1)
 88d:	83 c4 10             	add    $0x10,%esp
 890:	83 f8 ff             	cmp    $0xffffffff,%eax
 893:	74 1c                	je     8b1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 895:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 898:	83 c0 08             	add    $0x8,%eax
 89b:	83 ec 0c             	sub    $0xc,%esp
 89e:	50                   	push   %eax
 89f:	e8 54 ff ff ff       	call   7f8 <free>
  return freep;
 8a4:	a1 e4 0d 00 00       	mov    0xde4,%eax
 8a9:	83 c4 10             	add    $0x10,%esp
}
 8ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8af:	c9                   	leave  
 8b0:	c3                   	ret    
    return 0;
 8b1:	b8 00 00 00 00       	mov    $0x0,%eax
 8b6:	eb f4                	jmp    8ac <morecore+0x44>

000008b8 <malloc>:

void*
malloc(uint nbytes)
{
 8b8:	55                   	push   %ebp
 8b9:	89 e5                	mov    %esp,%ebp
 8bb:	53                   	push   %ebx
 8bc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8bf:	8b 45 08             	mov    0x8(%ebp),%eax
 8c2:	8d 58 07             	lea    0x7(%eax),%ebx
 8c5:	c1 eb 03             	shr    $0x3,%ebx
 8c8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8cb:	8b 0d e4 0d 00 00    	mov    0xde4,%ecx
 8d1:	85 c9                	test   %ecx,%ecx
 8d3:	74 04                	je     8d9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d5:	8b 01                	mov    (%ecx),%eax
 8d7:	eb 4a                	jmp    923 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8d9:	c7 05 e4 0d 00 00 e8 	movl   $0xde8,0xde4
 8e0:	0d 00 00 
 8e3:	c7 05 e8 0d 00 00 e8 	movl   $0xde8,0xde8
 8ea:	0d 00 00 
    base.s.size = 0;
 8ed:	c7 05 ec 0d 00 00 00 	movl   $0x0,0xdec
 8f4:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8f7:	b9 e8 0d 00 00       	mov    $0xde8,%ecx
 8fc:	eb d7                	jmp    8d5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8fe:	74 19                	je     919 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 900:	29 da                	sub    %ebx,%edx
 902:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 905:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 908:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 90b:	89 0d e4 0d 00 00    	mov    %ecx,0xde4
      return (void*)(p + 1);
 911:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 914:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 917:	c9                   	leave  
 918:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 919:	8b 10                	mov    (%eax),%edx
 91b:	89 11                	mov    %edx,(%ecx)
 91d:	eb ec                	jmp    90b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91f:	89 c1                	mov    %eax,%ecx
 921:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 923:	8b 50 04             	mov    0x4(%eax),%edx
 926:	39 da                	cmp    %ebx,%edx
 928:	73 d4                	jae    8fe <malloc+0x46>
    if(p == freep)
 92a:	39 05 e4 0d 00 00    	cmp    %eax,0xde4
 930:	75 ed                	jne    91f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 932:	89 d8                	mov    %ebx,%eax
 934:	e8 2f ff ff ff       	call   868 <morecore>
 939:	85 c0                	test   %eax,%eax
 93b:	75 e2                	jne    91f <malloc+0x67>
 93d:	eb d5                	jmp    914 <malloc+0x5c>
