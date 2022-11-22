
_test_8:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void worker(void *arg1, void *arg2);

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
  14:	e8 cd 05 00 00       	call   5e6 <getpid>

   void *stack, *p = malloc(PGSIZE * 2);
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	68 00 20 00 00       	push   $0x2000
   ppid = getpid();
  21:	a3 8c 0e 00 00       	mov    %eax,0xe8c
   void *stack, *p = malloc(PGSIZE * 2);
  26:	e8 d5 08 00 00       	call   900 <malloc>
   assert(p != NULL);
  2b:	83 c4 10             	add    $0x10,%esp
  2e:	85 c0                	test   %eax,%eax
  30:	0f 84 c0 00 00 00    	je     f6 <main+0xf6>
  36:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  38:	89 c7                	mov    %eax,%edi
  3a:	25 ff 0f 00 00       	and    $0xfff,%eax
  3f:	74 0a                	je     4b <main+0x4b>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  41:	89 da                	mov    %ebx,%edx
  43:	29 c2                	sub    %eax,%edx
  45:	8d ba 00 10 00 00    	lea    0x1000(%edx),%edi
   else
     stack = p;

   int arg1 = 42, arg2 = 24;
   int clone_pid = clone(worker, &arg1, &arg2, stack);
  4b:	8d 45 e0             	lea    -0x20(%ebp),%eax
  4e:	57                   	push   %edi
  4f:	50                   	push   %eax
  50:	8d 45 dc             	lea    -0x24(%ebp),%eax
  53:	50                   	push   %eax
  54:	68 b0 01 00 00       	push   $0x1b0
   int arg1 = 42, arg2 = 24;
  59:	c7 45 dc 2a 00 00 00 	movl   $0x2a,-0x24(%ebp)
  60:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
  67:	e8 9a 05 00 00       	call   606 <clone>
   assert(clone_pid > 0);
  6c:	83 c4 10             	add    $0x10,%esp
   int clone_pid = clone(worker, &arg1, &arg2, stack);
  6f:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  71:	85 c0                	test   %eax,%eax
  73:	7e 64                	jle    d9 <main+0xd9>

   sleep(250);
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	68 fa 00 00 00       	push   $0xfa
  7d:	e8 74 05 00 00       	call   5f6 <sleep>
   assert(wait() == -1);
  82:	e8 e7 04 00 00       	call   56e <wait>
  87:	83 c4 10             	add    $0x10,%esp
  8a:	83 c0 01             	add    $0x1,%eax
  8d:	0f 84 80 00 00 00    	je     113 <main+0x113>
  93:	6a 28                	push   $0x28
  95:	68 f8 09 00 00       	push   $0x9f8
  9a:	68 01 0a 00 00       	push   $0xa01
  9f:	6a 01                	push   $0x1
  a1:	e8 2a 06 00 00       	call   6d0 <printf>
  a6:	83 c4 0c             	add    $0xc,%esp
  a9:	68 64 0a 00 00       	push   $0xa64
   assert(clone_pid > 0);
  ae:	68 14 0a 00 00       	push   $0xa14
  b3:	6a 01                	push   $0x1
  b5:	e8 16 06 00 00       	call   6d0 <printf>
  ba:	5a                   	pop    %edx
  bb:	59                   	pop    %ecx
  bc:	68 28 0a 00 00       	push   $0xa28
  c1:	6a 01                	push   $0x1
  c3:	e8 08 06 00 00       	call   6d0 <printf>
  c8:	5b                   	pop    %ebx
  c9:	ff 35 8c 0e 00 00    	push   0xe8c
  cf:	e8 c2 04 00 00       	call   596 <kill>
  d4:	e8 8d 04 00 00       	call   566 <exit>
  d9:	6a 25                	push   $0x25
  db:	68 f8 09 00 00       	push   $0x9f8
  e0:	68 01 0a 00 00       	push   $0xa01
  e5:	6a 01                	push   $0x1
  e7:	e8 e4 05 00 00       	call   6d0 <printf>
  ec:	83 c4 0c             	add    $0xc,%esp
  ef:	68 56 0a 00 00       	push   $0xa56
  f4:	eb b8                	jmp    ae <main+0xae>
   assert(p != NULL);
  f6:	6a 1d                	push   $0x1d
  f8:	68 f8 09 00 00       	push   $0x9f8
  fd:	68 01 0a 00 00       	push   $0xa01
 102:	6a 01                	push   $0x1
 104:	e8 c7 05 00 00       	call   6d0 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 4c 0a 00 00       	push   $0xa4c
 111:	eb 9b                	jmp    ae <main+0xae>

   void *join_stack;
   int join_pid = join(&join_stack);
 113:	83 ec 0c             	sub    $0xc,%esp
 116:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 119:	50                   	push   %eax
 11a:	e8 ef 04 00 00       	call   60e <join>
   assert(join_pid == clone_pid);
 11f:	83 c4 10             	add    $0x10,%esp
 122:	39 c6                	cmp    %eax,%esi
 124:	74 20                	je     146 <main+0x146>
 126:	6a 2c                	push   $0x2c
 128:	68 f8 09 00 00       	push   $0x9f8
 12d:	68 01 0a 00 00       	push   $0xa01
 132:	6a 01                	push   $0x1
 134:	e8 97 05 00 00       	call   6d0 <printf>
 139:	83 c4 0c             	add    $0xc,%esp
 13c:	68 71 0a 00 00       	push   $0xa71
 141:	e9 68 ff ff ff       	jmp    ae <main+0xae>
   assert(stack == join_stack);
 146:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 149:	74 20                	je     16b <main+0x16b>
 14b:	6a 2d                	push   $0x2d
 14d:	68 f8 09 00 00       	push   $0x9f8
 152:	68 01 0a 00 00       	push   $0xa01
 157:	6a 01                	push   $0x1
 159:	e8 72 05 00 00       	call   6d0 <printf>
 15e:	83 c4 0c             	add    $0xc,%esp
 161:	68 87 0a 00 00       	push   $0xa87
 166:	e9 43 ff ff ff       	jmp    ae <main+0xae>
   assert(global == 2);
 16b:	83 3d 88 0e 00 00 02 	cmpl   $0x2,0xe88
 172:	74 20                	je     194 <main+0x194>
 174:	6a 2e                	push   $0x2e
 176:	68 f8 09 00 00       	push   $0x9f8
 17b:	68 01 0a 00 00       	push   $0xa01
 180:	6a 01                	push   $0x1
 182:	e8 49 05 00 00       	call   6d0 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 9b 0a 00 00       	push   $0xa9b
 18f:	e9 1a ff ff ff       	jmp    ae <main+0xae>

   printf(1, "TEST PASSED\n");
 194:	50                   	push   %eax
 195:	50                   	push   %eax
 196:	68 a7 0a 00 00       	push   $0xaa7
 19b:	6a 01                	push   $0x1
 19d:	e8 2e 05 00 00       	call   6d0 <printf>
   free(p);
 1a2:	89 1c 24             	mov    %ebx,(%esp)
 1a5:	e8 c6 06 00 00       	call   870 <free>
   exit();
 1aa:	e8 b7 03 00 00       	call   566 <exit>
 1af:	90                   	nop

000001b0 <worker>:
}

void
worker(void *arg1, void *arg2) {
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
 1b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	83 38 2a             	cmpl   $0x2a,(%eax)
 1c1:	75 75                	jne    238 <worker+0x88>
   assert(tmp2 == 24);
 1c3:	83 fa 18             	cmp    $0x18,%edx
 1c6:	75 2a                	jne    1f2 <worker+0x42>
   assert(global == 1);
 1c8:	83 3d 88 0e 00 00 01 	cmpl   $0x1,0xe88
 1cf:	0f 84 80 00 00 00    	je     255 <worker+0xa5>
 1d5:	6a 3b                	push   $0x3b
 1d7:	68 f8 09 00 00       	push   $0x9f8
 1dc:	68 01 0a 00 00       	push   $0xa01
 1e1:	6a 01                	push   $0x1
 1e3:	e8 e8 04 00 00       	call   6d0 <printf>
 1e8:	83 c4 0c             	add    $0xc,%esp
 1eb:	68 40 0a 00 00       	push   $0xa40
 1f0:	eb 1b                	jmp    20d <worker+0x5d>
   assert(tmp2 == 24);
 1f2:	6a 3a                	push   $0x3a
 1f4:	68 f8 09 00 00       	push   $0x9f8
 1f9:	68 01 0a 00 00       	push   $0xa01
 1fe:	6a 01                	push   $0x1
 200:	e8 cb 04 00 00       	call   6d0 <printf>
 205:	83 c4 0c             	add    $0xc,%esp
 208:	68 35 0a 00 00       	push   $0xa35
 20d:	68 14 0a 00 00       	push   $0xa14
 212:	6a 01                	push   $0x1
 214:	e8 b7 04 00 00       	call   6d0 <printf>
 219:	58                   	pop    %eax
 21a:	5a                   	pop    %edx
 21b:	68 28 0a 00 00       	push   $0xa28
 220:	6a 01                	push   $0x1
 222:	e8 a9 04 00 00       	call   6d0 <printf>
 227:	59                   	pop    %ecx
 228:	ff 35 8c 0e 00 00    	push   0xe8c
 22e:	e8 63 03 00 00       	call   596 <kill>
 233:	e8 2e 03 00 00       	call   566 <exit>
   assert(tmp1 == 42);
 238:	6a 39                	push   $0x39
 23a:	68 f8 09 00 00       	push   $0x9f8
 23f:	68 01 0a 00 00       	push   $0xa01
 244:	6a 01                	push   $0x1
 246:	e8 85 04 00 00       	call   6d0 <printf>
 24b:	83 c4 0c             	add    $0xc,%esp
 24e:	68 09 0a 00 00       	push   $0xa09
 253:	eb b8                	jmp    20d <worker+0x5d>
   global++;
 255:	c7 05 88 0e 00 00 02 	movl   $0x2,0xe88
 25c:	00 00 00 
   exit();
 25f:	e8 02 03 00 00       	call   566 <exit>
 264:	66 90                	xchg   %ax,%ax
 266:	66 90                	xchg   %ax,%ax
 268:	66 90                	xchg   %ax,%ax
 26a:	66 90                	xchg   %ax,%ax
 26c:	66 90                	xchg   %ax,%ax
 26e:	66 90                	xchg   %ax,%ax

00000270 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 270:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 271:	31 c0                	xor    %eax,%eax
{
 273:	89 e5                	mov    %esp,%ebp
 275:	53                   	push   %ebx
 276:	8b 4d 08             	mov    0x8(%ebp),%ecx
 279:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 280:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 284:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 287:	83 c0 01             	add    $0x1,%eax
 28a:	84 d2                	test   %dl,%dl
 28c:	75 f2                	jne    280 <strcpy+0x10>
    ;
  return os;
}
 28e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 291:	89 c8                	mov    %ecx,%eax
 293:	c9                   	leave  
 294:	c3                   	ret    
 295:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
 2a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 2aa:	0f b6 02             	movzbl (%edx),%eax
 2ad:	84 c0                	test   %al,%al
 2af:	75 17                	jne    2c8 <strcmp+0x28>
 2b1:	eb 3a                	jmp    2ed <strcmp+0x4d>
 2b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b7:	90                   	nop
 2b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 2bc:	83 c2 01             	add    $0x1,%edx
 2bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 2c2:	84 c0                	test   %al,%al
 2c4:	74 1a                	je     2e0 <strcmp+0x40>
    p++, q++;
 2c6:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 2c8:	0f b6 19             	movzbl (%ecx),%ebx
 2cb:	38 c3                	cmp    %al,%bl
 2cd:	74 e9                	je     2b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 2cf:	29 d8                	sub    %ebx,%eax
}
 2d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d4:	c9                   	leave  
 2d5:	c3                   	ret    
 2d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2e4:	31 c0                	xor    %eax,%eax
 2e6:	29 d8                	sub    %ebx,%eax
}
 2e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2eb:	c9                   	leave  
 2ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 19             	movzbl (%ecx),%ebx
 2f0:	31 c0                	xor    %eax,%eax
 2f2:	eb db                	jmp    2cf <strcmp+0x2f>
 2f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <strlen>:

uint strlen(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 306:	80 3a 00             	cmpb   $0x0,(%edx)
 309:	74 15                	je     320 <strlen+0x20>
 30b:	31 c0                	xor    %eax,%eax
 30d:	8d 76 00             	lea    0x0(%esi),%esi
 310:	83 c0 01             	add    $0x1,%eax
 313:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 317:	89 c1                	mov    %eax,%ecx
 319:	75 f5                	jne    310 <strlen+0x10>
    ;
  return n;
}
 31b:	89 c8                	mov    %ecx,%eax
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    
 31f:	90                   	nop
  for (n = 0; s[n]; n++)
 320:	31 c9                	xor    %ecx,%ecx
}
 322:	5d                   	pop    %ebp
 323:	89 c8                	mov    %ecx,%eax
 325:	c3                   	ret    
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <memset>:

void *
memset(void *dst, int c, uint n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 337:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	89 d7                	mov    %edx,%edi
 33f:	fc                   	cld    
 340:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 342:	8b 7d fc             	mov    -0x4(%ebp),%edi
 345:	89 d0                	mov    %edx,%eax
 347:	c9                   	leave  
 348:	c3                   	ret    
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <strchr>:

char *
strchr(const char *s, char c)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 35a:	0f b6 10             	movzbl (%eax),%edx
 35d:	84 d2                	test   %dl,%dl
 35f:	75 12                	jne    373 <strchr+0x23>
 361:	eb 1d                	jmp    380 <strchr+0x30>
 363:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 367:	90                   	nop
 368:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 36c:	83 c0 01             	add    $0x1,%eax
 36f:	84 d2                	test   %dl,%dl
 371:	74 0d                	je     380 <strchr+0x30>
    if (*s == c)
 373:	38 d1                	cmp    %dl,%cl
 375:	75 f1                	jne    368 <strchr+0x18>
      return (char *)s;
  return 0;
}
 377:	5d                   	pop    %ebp
 378:	c3                   	ret    
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 380:	31 c0                	xor    %eax,%eax
}
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    
 384:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <gets>:

char *
gets(char *buf, int max)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 395:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 398:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 399:	31 db                	xor    %ebx,%ebx
{
 39b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 39e:	eb 27                	jmp    3c7 <gets+0x37>
    cc = read(0, &c, 1);
 3a0:	83 ec 04             	sub    $0x4,%esp
 3a3:	6a 01                	push   $0x1
 3a5:	57                   	push   %edi
 3a6:	6a 00                	push   $0x0
 3a8:	e8 d1 01 00 00       	call   57e <read>
    if (cc < 1)
 3ad:	83 c4 10             	add    $0x10,%esp
 3b0:	85 c0                	test   %eax,%eax
 3b2:	7e 1d                	jle    3d1 <gets+0x41>
      break;
    buf[i++] = c;
 3b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3b8:	8b 55 08             	mov    0x8(%ebp),%edx
 3bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 3bf:	3c 0a                	cmp    $0xa,%al
 3c1:	74 1d                	je     3e0 <gets+0x50>
 3c3:	3c 0d                	cmp    $0xd,%al
 3c5:	74 19                	je     3e0 <gets+0x50>
  for (i = 0; i + 1 < max;)
 3c7:	89 de                	mov    %ebx,%esi
 3c9:	83 c3 01             	add    $0x1,%ebx
 3cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3cf:	7c cf                	jl     3a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    
  buf[i] = '\0';
 3e0:	8b 45 08             	mov    0x8(%ebp),%eax
 3e3:	89 de                	mov    %ebx,%esi
 3e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ec:	5b                   	pop    %ebx
 3ed:	5e                   	pop    %esi
 3ee:	5f                   	pop    %edi
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <stat>:

int stat(const char *n, struct stat *st)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 405:	83 ec 08             	sub    $0x8,%esp
 408:	6a 00                	push   $0x0
 40a:	ff 75 08             	push   0x8(%ebp)
 40d:	e8 94 01 00 00       	call   5a6 <open>
  if (fd < 0)
 412:	83 c4 10             	add    $0x10,%esp
 415:	85 c0                	test   %eax,%eax
 417:	78 27                	js     440 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 419:	83 ec 08             	sub    $0x8,%esp
 41c:	ff 75 0c             	push   0xc(%ebp)
 41f:	89 c3                	mov    %eax,%ebx
 421:	50                   	push   %eax
 422:	e8 97 01 00 00       	call   5be <fstat>
  close(fd);
 427:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 42a:	89 c6                	mov    %eax,%esi
  close(fd);
 42c:	e8 5d 01 00 00       	call   58e <close>
  return r;
 431:	83 c4 10             	add    $0x10,%esp
}
 434:	8d 65 f8             	lea    -0x8(%ebp),%esp
 437:	89 f0                	mov    %esi,%eax
 439:	5b                   	pop    %ebx
 43a:	5e                   	pop    %esi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 440:	be ff ff ff ff       	mov    $0xffffffff,%esi
 445:	eb ed                	jmp    434 <stat+0x34>
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax

00000450 <atoi>:

int atoi(const char *s)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	53                   	push   %ebx
 454:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 457:	0f be 02             	movsbl (%edx),%eax
 45a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 45d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 460:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 465:	77 1e                	ja     485 <atoi+0x35>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 470:	83 c2 01             	add    $0x1,%edx
 473:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 476:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 47a:	0f be 02             	movsbl (%edx),%eax
 47d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 480:	80 fb 09             	cmp    $0x9,%bl
 483:	76 eb                	jbe    470 <atoi+0x20>
  return n;
}
 485:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 488:	89 c8                	mov    %ecx,%eax
 48a:	c9                   	leave  
 48b:	c3                   	ret    
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000490 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 45 10             	mov    0x10(%ebp),%eax
 497:	8b 55 08             	mov    0x8(%ebp),%edx
 49a:	56                   	push   %esi
 49b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 49e:	85 c0                	test   %eax,%eax
 4a0:	7e 13                	jle    4b5 <memmove+0x25>
 4a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4a4:	89 d7                	mov    %edx,%edi
 4a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 4b1:	39 f8                	cmp    %edi,%eax
 4b3:	75 fb                	jne    4b0 <memmove+0x20>
  return vdst;
}
 4b5:	5e                   	pop    %esi
 4b6:	89 d0                	mov    %edx,%eax
 4b8:	5f                   	pop    %edi
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    
 4bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop

000004c0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 4c6:	68 00 20 00 00       	push   $0x2000
 4cb:	e8 30 04 00 00       	call   900 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 4d0:	50                   	push   %eax
 4d1:	ff 75 10             	push   0x10(%ebp)
 4d4:	ff 75 0c             	push   0xc(%ebp)
 4d7:	ff 75 08             	push   0x8(%ebp)
 4da:	e8 27 01 00 00       	call   606 <clone>

  return pid;
}
 4df:	c9                   	leave  
 4e0:	c3                   	ret    
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop

000004f0 <thread_join>:

int thread_join()
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 4f7:	6a 04                	push   $0x4
 4f9:	e8 02 04 00 00       	call   900 <malloc>
 4fe:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 501:	8d 45 f4             	lea    -0xc(%ebp),%eax
 504:	89 04 24             	mov    %eax,(%esp)
 507:	e8 02 01 00 00       	call   60e <join>
 50c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 50e:	58                   	pop    %eax
 50f:	ff 75 f4             	push   -0xc(%ebp)
 512:	e8 59 03 00 00       	call   870 <free>
  lock_release(&lock);

  return pid;
}
 517:	89 d8                	mov    %ebx,%eax
 519:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51c:	c9                   	leave  
 51d:	c3                   	ret    
 51e:	66 90                	xchg   %ax,%ax

00000520 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 526:	83 38 01             	cmpl   $0x1,(%eax)
 529:	75 05                	jne    530 <lock_acquire+0x10>
 52b:	eb fe                	jmp    52b <lock_acquire+0xb>
 52d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 530:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop

00000540 <lock_release>:
void lock_release(lock_t *lock)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 54c:	5d                   	pop    %ebp
 54d:	c3                   	ret    
 54e:	66 90                	xchg   %ax,%ax

00000550 <lock_init>:
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 55c:	5d                   	pop    %ebp
 55d:	c3                   	ret    

0000055e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55e:	b8 01 00 00 00       	mov    $0x1,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <exit>:
SYSCALL(exit)
 566:	b8 02 00 00 00       	mov    $0x2,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <wait>:
SYSCALL(wait)
 56e:	b8 03 00 00 00       	mov    $0x3,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <pipe>:
SYSCALL(pipe)
 576:	b8 04 00 00 00       	mov    $0x4,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <read>:
SYSCALL(read)
 57e:	b8 05 00 00 00       	mov    $0x5,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <write>:
SYSCALL(write)
 586:	b8 10 00 00 00       	mov    $0x10,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <close>:
SYSCALL(close)
 58e:	b8 15 00 00 00       	mov    $0x15,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <kill>:
SYSCALL(kill)
 596:	b8 06 00 00 00       	mov    $0x6,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <exec>:
SYSCALL(exec)
 59e:	b8 07 00 00 00       	mov    $0x7,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <open>:
SYSCALL(open)
 5a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <mknod>:
SYSCALL(mknod)
 5ae:	b8 11 00 00 00       	mov    $0x11,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <unlink>:
SYSCALL(unlink)
 5b6:	b8 12 00 00 00       	mov    $0x12,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <fstat>:
SYSCALL(fstat)
 5be:	b8 08 00 00 00       	mov    $0x8,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <link>:
SYSCALL(link)
 5c6:	b8 13 00 00 00       	mov    $0x13,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <mkdir>:
SYSCALL(mkdir)
 5ce:	b8 14 00 00 00       	mov    $0x14,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <chdir>:
SYSCALL(chdir)
 5d6:	b8 09 00 00 00       	mov    $0x9,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <dup>:
SYSCALL(dup)
 5de:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <getpid>:
SYSCALL(getpid)
 5e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <sbrk>:
SYSCALL(sbrk)
 5ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <sleep>:
SYSCALL(sleep)
 5f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <uptime>:
SYSCALL(uptime)
 5fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <clone>:
SYSCALL(clone)
 606:	b8 16 00 00 00       	mov    $0x16,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <join>:
 60e:	b8 17 00 00 00       	mov    $0x17,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    
 616:	66 90                	xchg   %ax,%ax
 618:	66 90                	xchg   %ax,%ax
 61a:	66 90                	xchg   %ax,%ax
 61c:	66 90                	xchg   %ax,%ax
 61e:	66 90                	xchg   %ax,%ax

00000620 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 3c             	sub    $0x3c,%esp
 629:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 62c:	89 d1                	mov    %edx,%ecx
{
 62e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 631:	85 d2                	test   %edx,%edx
 633:	0f 89 7f 00 00 00    	jns    6b8 <printint+0x98>
 639:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 63d:	74 79                	je     6b8 <printint+0x98>
    neg = 1;
 63f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 646:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 648:	31 db                	xor    %ebx,%ebx
 64a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 650:	89 c8                	mov    %ecx,%eax
 652:	31 d2                	xor    %edx,%edx
 654:	89 cf                	mov    %ecx,%edi
 656:	f7 75 c4             	divl   -0x3c(%ebp)
 659:	0f b6 92 14 0b 00 00 	movzbl 0xb14(%edx),%edx
 660:	89 45 c0             	mov    %eax,-0x40(%ebp)
 663:	89 d8                	mov    %ebx,%eax
 665:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 668:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 66b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 66e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 671:	76 dd                	jbe    650 <printint+0x30>
  if(neg)
 673:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 676:	85 c9                	test   %ecx,%ecx
 678:	74 0c                	je     686 <printint+0x66>
    buf[i++] = '-';
 67a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 67f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 681:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 686:	8b 7d b8             	mov    -0x48(%ebp),%edi
 689:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 68d:	eb 07                	jmp    696 <printint+0x76>
 68f:	90                   	nop
    putc(fd, buf[i]);
 690:	0f b6 13             	movzbl (%ebx),%edx
 693:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 696:	83 ec 04             	sub    $0x4,%esp
 699:	88 55 d7             	mov    %dl,-0x29(%ebp)
 69c:	6a 01                	push   $0x1
 69e:	56                   	push   %esi
 69f:	57                   	push   %edi
 6a0:	e8 e1 fe ff ff       	call   586 <write>
  while(--i >= 0)
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	39 de                	cmp    %ebx,%esi
 6aa:	75 e4                	jne    690 <printint+0x70>
}
 6ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6af:	5b                   	pop    %ebx
 6b0:	5e                   	pop    %esi
 6b1:	5f                   	pop    %edi
 6b2:	5d                   	pop    %ebp
 6b3:	c3                   	ret    
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6bf:	eb 87                	jmp    648 <printint+0x28>
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop

000006d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 6dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 6df:	0f b6 13             	movzbl (%ebx),%edx
 6e2:	84 d2                	test   %dl,%dl
 6e4:	74 6a                	je     750 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 6e6:	8d 45 10             	lea    0x10(%ebp),%eax
 6e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f4:	eb 36                	jmp    72c <printf+0x5c>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
 700:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 703:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 708:	83 f8 25             	cmp    $0x25,%eax
 70b:	74 15                	je     722 <printf+0x52>
  write(fd, &c, 1);
 70d:	83 ec 04             	sub    $0x4,%esp
 710:	88 55 e7             	mov    %dl,-0x19(%ebp)
 713:	6a 01                	push   $0x1
 715:	57                   	push   %edi
 716:	56                   	push   %esi
 717:	e8 6a fe ff ff       	call   586 <write>
 71c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 71f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 722:	0f b6 13             	movzbl (%ebx),%edx
 725:	83 c3 01             	add    $0x1,%ebx
 728:	84 d2                	test   %dl,%dl
 72a:	74 24                	je     750 <printf+0x80>
    c = fmt[i] & 0xff;
 72c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 72f:	85 c9                	test   %ecx,%ecx
 731:	74 cd                	je     700 <printf+0x30>
      }
    } else if(state == '%'){
 733:	83 f9 25             	cmp    $0x25,%ecx
 736:	75 ea                	jne    722 <printf+0x52>
      if(c == 'd'){
 738:	83 f8 25             	cmp    $0x25,%eax
 73b:	0f 84 07 01 00 00    	je     848 <printf+0x178>
 741:	83 e8 63             	sub    $0x63,%eax
 744:	83 f8 15             	cmp    $0x15,%eax
 747:	77 17                	ja     760 <printf+0x90>
 749:	ff 24 85 bc 0a 00 00 	jmp    *0xabc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 750:	8d 65 f4             	lea    -0xc(%ebp),%esp
 753:	5b                   	pop    %ebx
 754:	5e                   	pop    %esi
 755:	5f                   	pop    %edi
 756:	5d                   	pop    %ebp
 757:	c3                   	ret    
 758:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop
  write(fd, &c, 1);
 760:	83 ec 04             	sub    $0x4,%esp
 763:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 766:	6a 01                	push   $0x1
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 76e:	e8 13 fe ff ff       	call   586 <write>
        putc(fd, c);
 773:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 777:	83 c4 0c             	add    $0xc,%esp
 77a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 77d:	6a 01                	push   $0x1
 77f:	57                   	push   %edi
 780:	56                   	push   %esi
 781:	e8 00 fe ff ff       	call   586 <write>
        putc(fd, c);
 786:	83 c4 10             	add    $0x10,%esp
      state = 0;
 789:	31 c9                	xor    %ecx,%ecx
 78b:	eb 95                	jmp    722 <printf+0x52>
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 10 00 00 00       	mov    $0x10,%ecx
 798:	6a 00                	push   $0x0
 79a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 79d:	8b 10                	mov    (%eax),%edx
 79f:	89 f0                	mov    %esi,%eax
 7a1:	e8 7a fe ff ff       	call   620 <printint>
        ap++;
 7a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ad:	31 c9                	xor    %ecx,%ecx
 7af:	e9 6e ff ff ff       	jmp    722 <printf+0x52>
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7bb:	8b 10                	mov    (%eax),%edx
        ap++;
 7bd:	83 c0 04             	add    $0x4,%eax
 7c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7c3:	85 d2                	test   %edx,%edx
 7c5:	0f 84 8d 00 00 00    	je     858 <printf+0x188>
        while(*s != 0){
 7cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 7ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 7d0:	84 c0                	test   %al,%al
 7d2:	0f 84 4a ff ff ff    	je     722 <printf+0x52>
 7d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7db:	89 d3                	mov    %edx,%ebx
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7e3:	83 c3 01             	add    $0x1,%ebx
 7e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e9:	6a 01                	push   $0x1
 7eb:	57                   	push   %edi
 7ec:	56                   	push   %esi
 7ed:	e8 94 fd ff ff       	call   586 <write>
        while(*s != 0){
 7f2:	0f b6 03             	movzbl (%ebx),%eax
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	84 c0                	test   %al,%al
 7fa:	75 e4                	jne    7e0 <printf+0x110>
      state = 0;
 7fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7ff:	31 c9                	xor    %ecx,%ecx
 801:	e9 1c ff ff ff       	jmp    722 <printf+0x52>
 806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 810:	83 ec 0c             	sub    $0xc,%esp
 813:	b9 0a 00 00 00       	mov    $0xa,%ecx
 818:	6a 01                	push   $0x1
 81a:	e9 7b ff ff ff       	jmp    79a <printf+0xca>
 81f:	90                   	nop
        putc(fd, *ap);
 820:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 823:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 826:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 828:	6a 01                	push   $0x1
 82a:	57                   	push   %edi
 82b:	56                   	push   %esi
        putc(fd, *ap);
 82c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 82f:	e8 52 fd ff ff       	call   586 <write>
        ap++;
 834:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 838:	83 c4 10             	add    $0x10,%esp
      state = 0;
 83b:	31 c9                	xor    %ecx,%ecx
 83d:	e9 e0 fe ff ff       	jmp    722 <printf+0x52>
 842:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 848:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 84b:	83 ec 04             	sub    $0x4,%esp
 84e:	e9 2a ff ff ff       	jmp    77d <printf+0xad>
 853:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 857:	90                   	nop
          s = "(null)";
 858:	ba b4 0a 00 00       	mov    $0xab4,%edx
        while(*s != 0){
 85d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 860:	b8 28 00 00 00       	mov    $0x28,%eax
 865:	89 d3                	mov    %edx,%ebx
 867:	e9 74 ff ff ff       	jmp    7e0 <printf+0x110>
 86c:	66 90                	xchg   %ax,%ax
 86e:	66 90                	xchg   %ax,%ax

00000870 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 870:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 871:	a1 90 0e 00 00       	mov    0xe90,%eax
{
 876:	89 e5                	mov    %esp,%ebp
 878:	57                   	push   %edi
 879:	56                   	push   %esi
 87a:	53                   	push   %ebx
 87b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 87e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 888:	89 c2                	mov    %eax,%edx
 88a:	8b 00                	mov    (%eax),%eax
 88c:	39 ca                	cmp    %ecx,%edx
 88e:	73 30                	jae    8c0 <free+0x50>
 890:	39 c1                	cmp    %eax,%ecx
 892:	72 04                	jb     898 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 894:	39 c2                	cmp    %eax,%edx
 896:	72 f0                	jb     888 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 898:	8b 73 fc             	mov    -0x4(%ebx),%esi
 89b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 89e:	39 f8                	cmp    %edi,%eax
 8a0:	74 30                	je     8d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8a5:	8b 42 04             	mov    0x4(%edx),%eax
 8a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8ab:	39 f1                	cmp    %esi,%ecx
 8ad:	74 3a                	je     8e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8b1:	5b                   	pop    %ebx
  freep = p;
 8b2:	89 15 90 0e 00 00    	mov    %edx,0xe90
}
 8b8:	5e                   	pop    %esi
 8b9:	5f                   	pop    %edi
 8ba:	5d                   	pop    %ebp
 8bb:	c3                   	ret    
 8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c0:	39 c2                	cmp    %eax,%edx
 8c2:	72 c4                	jb     888 <free+0x18>
 8c4:	39 c1                	cmp    %eax,%ecx
 8c6:	73 c0                	jae    888 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 8c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ce:	39 f8                	cmp    %edi,%eax
 8d0:	75 d0                	jne    8a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 8d2:	03 70 04             	add    0x4(%eax),%esi
 8d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d8:	8b 02                	mov    (%edx),%eax
 8da:	8b 00                	mov    (%eax),%eax
 8dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 8df:	8b 42 04             	mov    0x4(%edx),%eax
 8e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8e5:	39 f1                	cmp    %esi,%ecx
 8e7:	75 c6                	jne    8af <free+0x3f>
    p->s.size += bp->s.size;
 8e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 8ec:	89 15 90 0e 00 00    	mov    %edx,0xe90
    p->s.size += bp->s.size;
 8f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8f8:	89 0a                	mov    %ecx,(%edx)
}
 8fa:	5b                   	pop    %ebx
 8fb:	5e                   	pop    %esi
 8fc:	5f                   	pop    %edi
 8fd:	5d                   	pop    %ebp
 8fe:	c3                   	ret    
 8ff:	90                   	nop

00000900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
 904:	56                   	push   %esi
 905:	53                   	push   %ebx
 906:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 909:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 90c:	8b 3d 90 0e 00 00    	mov    0xe90,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	8d 70 07             	lea    0x7(%eax),%esi
 915:	c1 ee 03             	shr    $0x3,%esi
 918:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 91b:	85 ff                	test   %edi,%edi
 91d:	0f 84 9d 00 00 00    	je     9c0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 923:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 925:	8b 4a 04             	mov    0x4(%edx),%ecx
 928:	39 f1                	cmp    %esi,%ecx
 92a:	73 6a                	jae    996 <malloc+0x96>
 92c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 931:	39 de                	cmp    %ebx,%esi
 933:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 936:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 93d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 940:	eb 17                	jmp    959 <malloc+0x59>
 942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 948:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 94a:	8b 48 04             	mov    0x4(%eax),%ecx
 94d:	39 f1                	cmp    %esi,%ecx
 94f:	73 4f                	jae    9a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 951:	8b 3d 90 0e 00 00    	mov    0xe90,%edi
 957:	89 c2                	mov    %eax,%edx
 959:	39 d7                	cmp    %edx,%edi
 95b:	75 eb                	jne    948 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 95d:	83 ec 0c             	sub    $0xc,%esp
 960:	ff 75 e4             	push   -0x1c(%ebp)
 963:	e8 86 fc ff ff       	call   5ee <sbrk>
  if(p == (char*)-1)
 968:	83 c4 10             	add    $0x10,%esp
 96b:	83 f8 ff             	cmp    $0xffffffff,%eax
 96e:	74 1c                	je     98c <malloc+0x8c>
  hp->s.size = nu;
 970:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 973:	83 ec 0c             	sub    $0xc,%esp
 976:	83 c0 08             	add    $0x8,%eax
 979:	50                   	push   %eax
 97a:	e8 f1 fe ff ff       	call   870 <free>
  return freep;
 97f:	8b 15 90 0e 00 00    	mov    0xe90,%edx
      if((p = morecore(nunits)) == 0)
 985:	83 c4 10             	add    $0x10,%esp
 988:	85 d2                	test   %edx,%edx
 98a:	75 bc                	jne    948 <malloc+0x48>
        return 0;
  }
}
 98c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 98f:	31 c0                	xor    %eax,%eax
}
 991:	5b                   	pop    %ebx
 992:	5e                   	pop    %esi
 993:	5f                   	pop    %edi
 994:	5d                   	pop    %ebp
 995:	c3                   	ret    
    if(p->s.size >= nunits){
 996:	89 d0                	mov    %edx,%eax
 998:	89 fa                	mov    %edi,%edx
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9a0:	39 ce                	cmp    %ecx,%esi
 9a2:	74 4c                	je     9f0 <malloc+0xf0>
        p->s.size -= nunits;
 9a4:	29 f1                	sub    %esi,%ecx
 9a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9ac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9af:	89 15 90 0e 00 00    	mov    %edx,0xe90
}
 9b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9b8:	83 c0 08             	add    $0x8,%eax
}
 9bb:	5b                   	pop    %ebx
 9bc:	5e                   	pop    %esi
 9bd:	5f                   	pop    %edi
 9be:	5d                   	pop    %ebp
 9bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9c0:	c7 05 90 0e 00 00 94 	movl   $0xe94,0xe90
 9c7:	0e 00 00 
    base.s.size = 0;
 9ca:	bf 94 0e 00 00       	mov    $0xe94,%edi
    base.s.ptr = freep = prevp = &base;
 9cf:	c7 05 94 0e 00 00 94 	movl   $0xe94,0xe94
 9d6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 9db:	c7 05 98 0e 00 00 00 	movl   $0x0,0xe98
 9e2:	00 00 00 
    if(p->s.size >= nunits){
 9e5:	e9 42 ff ff ff       	jmp    92c <malloc+0x2c>
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 08                	mov    (%eax),%ecx
 9f2:	89 0a                	mov    %ecx,(%edx)
 9f4:	eb b9                	jmp    9af <malloc+0xaf>
