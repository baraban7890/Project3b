
_test_6:     file format elf32-i386


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
  11:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
  14:	e8 ed 05 00 00       	call   606 <getpid>

   void *stack, *p = malloc(PGSIZE * 2);
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	68 00 20 00 00       	push   $0x2000
   ppid = getpid();
  21:	a3 d4 0e 00 00       	mov    %eax,0xed4
   void *stack, *p = malloc(PGSIZE * 2);
  26:	e8 f5 08 00 00       	call   920 <malloc>
   assert(p != NULL);
  2b:	83 c4 10             	add    $0x10,%esp
  2e:	85 c0                	test   %eax,%eax
  30:	0f 84 d5 00 00 00    	je     10b <main+0x10b>
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
  4b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  4e:	57                   	push   %edi
  4f:	50                   	push   %eax
  50:	8d 45 e0             	lea    -0x20(%ebp),%eax
  53:	50                   	push   %eax
  54:	68 d0 01 00 00       	push   $0x1d0
   int arg1 = 42, arg2 = 24;
  59:	c7 45 e0 2a 00 00 00 	movl   $0x2a,-0x20(%ebp)
  60:	c7 45 e4 18 00 00 00 	movl   $0x18,-0x1c(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
  67:	e8 ba 05 00 00       	call   626 <clone>
   assert(clone_pid > 0);
  6c:	83 c4 10             	add    $0x10,%esp
   int clone_pid = clone(worker, &arg1, &arg2, stack);
  6f:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  71:	85 c0                	test   %eax,%eax
  73:	7e 79                	jle    ee <main+0xee>

   sbrk(PGSIZE);
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	68 00 10 00 00       	push   $0x1000
  7d:	e8 8c 05 00 00       	call   60e <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
  82:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  89:	e8 80 05 00 00       	call   60e <sbrk>
  8e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
  91:	83 e8 02             	sub    $0x2,%eax
  94:	89 04 24             	mov    %eax,(%esp)
  97:	e8 92 05 00 00       	call   62e <join>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	83 c0 01             	add    $0x1,%eax
  a2:	0f 84 80 00 00 00    	je     128 <main+0x128>
  a8:	6a 29                	push   $0x29
  aa:	68 18 0a 00 00       	push   $0xa18
  af:	68 21 0a 00 00       	push   $0xa21
  b4:	6a 01                	push   $0x1
  b6:	e8 35 06 00 00       	call   6f0 <printf>
  bb:	83 c4 0c             	add    $0xc,%esp
  be:	68 d0 0a 00 00       	push   $0xad0
   assert(clone_pid > 0);
  c3:	68 34 0a 00 00       	push   $0xa34
  c8:	6a 01                	push   $0x1
  ca:	e8 21 06 00 00       	call   6f0 <printf>
  cf:	5a                   	pop    %edx
  d0:	59                   	pop    %ecx
  d1:	68 48 0a 00 00       	push   $0xa48
  d6:	6a 01                	push   $0x1
  d8:	e8 13 06 00 00       	call   6f0 <printf>
  dd:	5b                   	pop    %ebx
  de:	ff 35 d4 0e 00 00    	push   0xed4
  e4:	e8 cd 04 00 00       	call   5b6 <kill>
  e9:	e8 98 04 00 00       	call   586 <exit>
  ee:	6a 25                	push   $0x25
  f0:	68 18 0a 00 00       	push   $0xa18
  f5:	68 21 0a 00 00       	push   $0xa21
  fa:	6a 01                	push   $0x1
  fc:	e8 ef 05 00 00       	call   6f0 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 76 0a 00 00       	push   $0xa76
 109:	eb b8                	jmp    c3 <main+0xc3>
   assert(p != NULL);
 10b:	6a 1d                	push   $0x1d
 10d:	68 18 0a 00 00       	push   $0xa18
 112:	68 21 0a 00 00       	push   $0xa21
 117:	6a 01                	push   $0x1
 119:	e8 d2 05 00 00       	call   6f0 <printf>
 11e:	83 c4 0c             	add    $0xc,%esp
 121:	68 6c 0a 00 00       	push   $0xa6c
 126:	eb 9b                	jmp    c3 <main+0xc3>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 128:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   assert(join(join_stack) == clone_pid);
 12b:	83 ec 0c             	sub    $0xc,%esp
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 12e:	83 e8 04             	sub    $0x4,%eax
   assert(join(join_stack) == clone_pid);
 131:	50                   	push   %eax
 132:	e8 f7 04 00 00       	call   62e <join>
 137:	83 c4 10             	add    $0x10,%esp
 13a:	39 f0                	cmp    %esi,%eax
 13c:	74 20                	je     15e <main+0x15e>
 13e:	6a 2a                	push   $0x2a
 140:	68 18 0a 00 00       	push   $0xa18
 145:	68 21 0a 00 00       	push   $0xa21
 14a:	6a 01                	push   $0x1
 14c:	e8 9f 05 00 00       	call   6f0 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 84 0a 00 00       	push   $0xa84
 159:	e9 65 ff ff ff       	jmp    c3 <main+0xc3>
   assert(stack == *join_stack);
 15e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 161:	39 78 fc             	cmp    %edi,-0x4(%eax)
 164:	74 20                	je     186 <main+0x186>
 166:	6a 2b                	push   $0x2b
 168:	68 18 0a 00 00       	push   $0xa18
 16d:	68 21 0a 00 00       	push   $0xa21
 172:	6a 01                	push   $0x1
 174:	e8 77 05 00 00       	call   6f0 <printf>
 179:	83 c4 0c             	add    $0xc,%esp
 17c:	68 a2 0a 00 00       	push   $0xaa2
 181:	e9 3d ff ff ff       	jmp    c3 <main+0xc3>
   assert(global == 2);
 186:	83 3d d0 0e 00 00 02 	cmpl   $0x2,0xed0
 18d:	74 20                	je     1af <main+0x1af>
 18f:	6a 2c                	push   $0x2c
 191:	68 18 0a 00 00       	push   $0xa18
 196:	68 21 0a 00 00       	push   $0xa21
 19b:	6a 01                	push   $0x1
 19d:	e8 4e 05 00 00       	call   6f0 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 b7 0a 00 00       	push   $0xab7
 1aa:	e9 14 ff ff ff       	jmp    c3 <main+0xc3>

   printf(1, "TEST PASSED\n");
 1af:	50                   	push   %eax
 1b0:	50                   	push   %eax
 1b1:	68 c3 0a 00 00       	push   $0xac3
 1b6:	6a 01                	push   $0x1
 1b8:	e8 33 05 00 00       	call   6f0 <printf>
   free(p);
 1bd:	89 1c 24             	mov    %ebx,(%esp)
 1c0:	e8 cb 06 00 00       	call   890 <free>
   exit();
 1c5:	e8 bc 03 00 00       	call   586 <exit>
 1ca:	66 90                	xchg   %ax,%ax
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <worker>:
}

void
worker(void *arg1, void *arg2) {
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
 1d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	83 38 2a             	cmpl   $0x2a,(%eax)
 1e1:	75 75                	jne    258 <worker+0x88>
   assert(tmp2 == 24);
 1e3:	83 fa 18             	cmp    $0x18,%edx
 1e6:	75 2a                	jne    212 <worker+0x42>
   assert(global == 1);
 1e8:	83 3d d0 0e 00 00 01 	cmpl   $0x1,0xed0
 1ef:	0f 84 80 00 00 00    	je     275 <worker+0xa5>
 1f5:	6a 39                	push   $0x39
 1f7:	68 18 0a 00 00       	push   $0xa18
 1fc:	68 21 0a 00 00       	push   $0xa21
 201:	6a 01                	push   $0x1
 203:	e8 e8 04 00 00       	call   6f0 <printf>
 208:	83 c4 0c             	add    $0xc,%esp
 20b:	68 60 0a 00 00       	push   $0xa60
 210:	eb 1b                	jmp    22d <worker+0x5d>
   assert(tmp2 == 24);
 212:	6a 38                	push   $0x38
 214:	68 18 0a 00 00       	push   $0xa18
 219:	68 21 0a 00 00       	push   $0xa21
 21e:	6a 01                	push   $0x1
 220:	e8 cb 04 00 00       	call   6f0 <printf>
 225:	83 c4 0c             	add    $0xc,%esp
 228:	68 55 0a 00 00       	push   $0xa55
 22d:	68 34 0a 00 00       	push   $0xa34
 232:	6a 01                	push   $0x1
 234:	e8 b7 04 00 00       	call   6f0 <printf>
 239:	58                   	pop    %eax
 23a:	5a                   	pop    %edx
 23b:	68 48 0a 00 00       	push   $0xa48
 240:	6a 01                	push   $0x1
 242:	e8 a9 04 00 00       	call   6f0 <printf>
 247:	59                   	pop    %ecx
 248:	ff 35 d4 0e 00 00    	push   0xed4
 24e:	e8 63 03 00 00       	call   5b6 <kill>
 253:	e8 2e 03 00 00       	call   586 <exit>
   assert(tmp1 == 42);
 258:	6a 37                	push   $0x37
 25a:	68 18 0a 00 00       	push   $0xa18
 25f:	68 21 0a 00 00       	push   $0xa21
 264:	6a 01                	push   $0x1
 266:	e8 85 04 00 00       	call   6f0 <printf>
 26b:	83 c4 0c             	add    $0xc,%esp
 26e:	68 29 0a 00 00       	push   $0xa29
 273:	eb b8                	jmp    22d <worker+0x5d>
   global++;
 275:	c7 05 d0 0e 00 00 02 	movl   $0x2,0xed0
 27c:	00 00 00 
   exit();
 27f:	e8 02 03 00 00       	call   586 <exit>
 284:	66 90                	xchg   %ax,%ax
 286:	66 90                	xchg   %ax,%ax
 288:	66 90                	xchg   %ax,%ax
 28a:	66 90                	xchg   %ax,%ax
 28c:	66 90                	xchg   %ax,%ax
 28e:	66 90                	xchg   %ax,%ax

00000290 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 290:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 291:	31 c0                	xor    %eax,%eax
{
 293:	89 e5                	mov    %esp,%ebp
 295:	53                   	push   %ebx
 296:	8b 4d 08             	mov    0x8(%ebp),%ecx
 299:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 2a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2a7:	83 c0 01             	add    $0x1,%eax
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strcpy+0x10>
    ;
  return os;
}
 2ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b1:	89 c8                	mov    %ecx,%eax
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    
 2b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
 2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 2ca:	0f b6 02             	movzbl (%edx),%eax
 2cd:	84 c0                	test   %al,%al
 2cf:	75 17                	jne    2e8 <strcmp+0x28>
 2d1:	eb 3a                	jmp    30d <strcmp+0x4d>
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 2dc:	83 c2 01             	add    $0x1,%edx
 2df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 2e2:	84 c0                	test   %al,%al
 2e4:	74 1a                	je     300 <strcmp+0x40>
    p++, q++;
 2e6:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 2e8:	0f b6 19             	movzbl (%ecx),%ebx
 2eb:	38 c3                	cmp    %al,%bl
 2ed:	74 e9                	je     2d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 2ef:	29 d8                	sub    %ebx,%eax
}
 2f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f4:	c9                   	leave  
 2f5:	c3                   	ret    
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 300:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 304:	31 c0                	xor    %eax,%eax
 306:	29 d8                	sub    %ebx,%eax
}
 308:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30b:	c9                   	leave  
 30c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 30d:	0f b6 19             	movzbl (%ecx),%ebx
 310:	31 c0                	xor    %eax,%eax
 312:	eb db                	jmp    2ef <strcmp+0x2f>
 314:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <strlen>:

uint strlen(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 326:	80 3a 00             	cmpb   $0x0,(%edx)
 329:	74 15                	je     340 <strlen+0x20>
 32b:	31 c0                	xor    %eax,%eax
 32d:	8d 76 00             	lea    0x0(%esi),%esi
 330:	83 c0 01             	add    $0x1,%eax
 333:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 337:	89 c1                	mov    %eax,%ecx
 339:	75 f5                	jne    330 <strlen+0x10>
    ;
  return n;
}
 33b:	89 c8                	mov    %ecx,%eax
 33d:	5d                   	pop    %ebp
 33e:	c3                   	ret    
 33f:	90                   	nop
  for (n = 0; s[n]; n++)
 340:	31 c9                	xor    %ecx,%ecx
}
 342:	5d                   	pop    %ebp
 343:	89 c8                	mov    %ecx,%eax
 345:	c3                   	ret    
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi

00000350 <memset>:

void *
memset(void *dst, int c, uint n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 357:	8b 4d 10             	mov    0x10(%ebp),%ecx
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	89 d7                	mov    %edx,%edi
 35f:	fc                   	cld    
 360:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 362:	8b 7d fc             	mov    -0x4(%ebp),%edi
 365:	89 d0                	mov    %edx,%eax
 367:	c9                   	leave  
 368:	c3                   	ret    
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <strchr>:

char *
strchr(const char *s, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 37a:	0f b6 10             	movzbl (%eax),%edx
 37d:	84 d2                	test   %dl,%dl
 37f:	75 12                	jne    393 <strchr+0x23>
 381:	eb 1d                	jmp    3a0 <strchr+0x30>
 383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 387:	90                   	nop
 388:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 38c:	83 c0 01             	add    $0x1,%eax
 38f:	84 d2                	test   %dl,%dl
 391:	74 0d                	je     3a0 <strchr+0x30>
    if (*s == c)
 393:	38 d1                	cmp    %dl,%cl
 395:	75 f1                	jne    388 <strchr+0x18>
      return (char *)s;
  return 0;
}
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3a0:	31 c0                	xor    %eax,%eax
}
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <gets>:

char *
gets(char *buf, int max)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 3b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 3b8:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 3b9:	31 db                	xor    %ebx,%ebx
{
 3bb:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 3be:	eb 27                	jmp    3e7 <gets+0x37>
    cc = read(0, &c, 1);
 3c0:	83 ec 04             	sub    $0x4,%esp
 3c3:	6a 01                	push   $0x1
 3c5:	57                   	push   %edi
 3c6:	6a 00                	push   $0x0
 3c8:	e8 d1 01 00 00       	call   59e <read>
    if (cc < 1)
 3cd:	83 c4 10             	add    $0x10,%esp
 3d0:	85 c0                	test   %eax,%eax
 3d2:	7e 1d                	jle    3f1 <gets+0x41>
      break;
    buf[i++] = c;
 3d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3d8:	8b 55 08             	mov    0x8(%ebp),%edx
 3db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 3df:	3c 0a                	cmp    $0xa,%al
 3e1:	74 1d                	je     400 <gets+0x50>
 3e3:	3c 0d                	cmp    $0xd,%al
 3e5:	74 19                	je     400 <gets+0x50>
  for (i = 0; i + 1 < max;)
 3e7:	89 de                	mov    %ebx,%esi
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ef:	7c cf                	jl     3c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fb:	5b                   	pop    %ebx
 3fc:	5e                   	pop    %esi
 3fd:	5f                   	pop    %edi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    
  buf[i] = '\0';
 400:	8b 45 08             	mov    0x8(%ebp),%eax
 403:	89 de                	mov    %ebx,%esi
 405:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 409:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5f                   	pop    %edi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <stat>:

int stat(const char *n, struct stat *st)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 425:	83 ec 08             	sub    $0x8,%esp
 428:	6a 00                	push   $0x0
 42a:	ff 75 08             	push   0x8(%ebp)
 42d:	e8 94 01 00 00       	call   5c6 <open>
  if (fd < 0)
 432:	83 c4 10             	add    $0x10,%esp
 435:	85 c0                	test   %eax,%eax
 437:	78 27                	js     460 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	ff 75 0c             	push   0xc(%ebp)
 43f:	89 c3                	mov    %eax,%ebx
 441:	50                   	push   %eax
 442:	e8 97 01 00 00       	call   5de <fstat>
  close(fd);
 447:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 44a:	89 c6                	mov    %eax,%esi
  close(fd);
 44c:	e8 5d 01 00 00       	call   5ae <close>
  return r;
 451:	83 c4 10             	add    $0x10,%esp
}
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	89 f0                	mov    %esi,%eax
 459:	5b                   	pop    %ebx
 45a:	5e                   	pop    %esi
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 460:	be ff ff ff ff       	mov    $0xffffffff,%esi
 465:	eb ed                	jmp    454 <stat+0x34>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax

00000470 <atoi>:

int atoi(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 477:	0f be 02             	movsbl (%edx),%eax
 47a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 47d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 480:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 485:	77 1e                	ja     4a5 <atoi+0x35>
 487:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 490:	83 c2 01             	add    $0x1,%edx
 493:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 496:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 49a:	0f be 02             	movsbl (%edx),%eax
 49d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a0:	80 fb 09             	cmp    $0x9,%bl
 4a3:	76 eb                	jbe    490 <atoi+0x20>
  return n;
}
 4a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a8:	89 c8                	mov    %ecx,%eax
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	8b 45 10             	mov    0x10(%ebp),%eax
 4b7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ba:	56                   	push   %esi
 4bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 4be:	85 c0                	test   %eax,%eax
 4c0:	7e 13                	jle    4d5 <memmove+0x25>
 4c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4c4:	89 d7                	mov    %edx,%edi
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 4d1:	39 f8                	cmp    %edi,%eax
 4d3:	75 fb                	jne    4d0 <memmove+0x20>
  return vdst;
}
 4d5:	5e                   	pop    %esi
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 4e6:	68 00 20 00 00       	push   $0x2000
 4eb:	e8 30 04 00 00       	call   920 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 4f0:	50                   	push   %eax
 4f1:	ff 75 10             	push   0x10(%ebp)
 4f4:	ff 75 0c             	push   0xc(%ebp)
 4f7:	ff 75 08             	push   0x8(%ebp)
 4fa:	e8 27 01 00 00       	call   626 <clone>

  return pid;
}
 4ff:	c9                   	leave  
 500:	c3                   	ret    
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <thread_join>:

int thread_join()
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 517:	6a 04                	push   $0x4
 519:	e8 02 04 00 00       	call   920 <malloc>
 51e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 521:	8d 45 f4             	lea    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 02 01 00 00       	call   62e <join>
 52c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 52e:	58                   	pop    %eax
 52f:	ff 75 f4             	push   -0xc(%ebp)
 532:	e8 59 03 00 00       	call   890 <free>
  lock_release(&lock);

  return pid;
}
 537:	89 d8                	mov    %ebx,%eax
 539:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 53c:	c9                   	leave  
 53d:	c3                   	ret    
 53e:	66 90                	xchg   %ax,%ax

00000540 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 546:	83 38 01             	cmpl   $0x1,(%eax)
 549:	75 05                	jne    550 <lock_acquire+0x10>
 54b:	eb fe                	jmp    54b <lock_acquire+0xb>
 54d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 550:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    
 558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop

00000560 <lock_release>:
void lock_release(lock_t *lock)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 56c:	5d                   	pop    %ebp
 56d:	c3                   	ret    
 56e:	66 90                	xchg   %ax,%ax

00000570 <lock_init>:
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 57c:	5d                   	pop    %ebp
 57d:	c3                   	ret    

0000057e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57e:	b8 01 00 00 00       	mov    $0x1,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <exit>:
SYSCALL(exit)
 586:	b8 02 00 00 00       	mov    $0x2,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <wait>:
SYSCALL(wait)
 58e:	b8 03 00 00 00       	mov    $0x3,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <pipe>:
SYSCALL(pipe)
 596:	b8 04 00 00 00       	mov    $0x4,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <read>:
SYSCALL(read)
 59e:	b8 05 00 00 00       	mov    $0x5,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <write>:
SYSCALL(write)
 5a6:	b8 10 00 00 00       	mov    $0x10,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <close>:
SYSCALL(close)
 5ae:	b8 15 00 00 00       	mov    $0x15,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <kill>:
SYSCALL(kill)
 5b6:	b8 06 00 00 00       	mov    $0x6,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <exec>:
SYSCALL(exec)
 5be:	b8 07 00 00 00       	mov    $0x7,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <open>:
SYSCALL(open)
 5c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <mknod>:
SYSCALL(mknod)
 5ce:	b8 11 00 00 00       	mov    $0x11,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <unlink>:
SYSCALL(unlink)
 5d6:	b8 12 00 00 00       	mov    $0x12,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <fstat>:
SYSCALL(fstat)
 5de:	b8 08 00 00 00       	mov    $0x8,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <link>:
SYSCALL(link)
 5e6:	b8 13 00 00 00       	mov    $0x13,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <mkdir>:
SYSCALL(mkdir)
 5ee:	b8 14 00 00 00       	mov    $0x14,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <chdir>:
SYSCALL(chdir)
 5f6:	b8 09 00 00 00       	mov    $0x9,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <dup>:
SYSCALL(dup)
 5fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <getpid>:
SYSCALL(getpid)
 606:	b8 0b 00 00 00       	mov    $0xb,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <sbrk>:
SYSCALL(sbrk)
 60e:	b8 0c 00 00 00       	mov    $0xc,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <sleep>:
SYSCALL(sleep)
 616:	b8 0d 00 00 00       	mov    $0xd,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <uptime>:
SYSCALL(uptime)
 61e:	b8 0e 00 00 00       	mov    $0xe,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <clone>:
SYSCALL(clone)
 626:	b8 16 00 00 00       	mov    $0x16,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <join>:
 62e:	b8 17 00 00 00       	mov    $0x17,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    
 636:	66 90                	xchg   %ax,%ax
 638:	66 90                	xchg   %ax,%ax
 63a:	66 90                	xchg   %ax,%ax
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 3c             	sub    $0x3c,%esp
 649:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 64c:	89 d1                	mov    %edx,%ecx
{
 64e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 651:	85 d2                	test   %edx,%edx
 653:	0f 89 7f 00 00 00    	jns    6d8 <printint+0x98>
 659:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 65d:	74 79                	je     6d8 <printint+0x98>
    neg = 1;
 65f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 666:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 668:	31 db                	xor    %ebx,%ebx
 66a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 670:	89 c8                	mov    %ecx,%eax
 672:	31 d2                	xor    %edx,%edx
 674:	89 cf                	mov    %ecx,%edi
 676:	f7 75 c4             	divl   -0x3c(%ebp)
 679:	0f b6 92 5c 0b 00 00 	movzbl 0xb5c(%edx),%edx
 680:	89 45 c0             	mov    %eax,-0x40(%ebp)
 683:	89 d8                	mov    %ebx,%eax
 685:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 688:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 68b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 68e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 691:	76 dd                	jbe    670 <printint+0x30>
  if(neg)
 693:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 696:	85 c9                	test   %ecx,%ecx
 698:	74 0c                	je     6a6 <printint+0x66>
    buf[i++] = '-';
 69a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 69f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6ad:	eb 07                	jmp    6b6 <printint+0x76>
 6af:	90                   	nop
    putc(fd, buf[i]);
 6b0:	0f b6 13             	movzbl (%ebx),%edx
 6b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6b6:	83 ec 04             	sub    $0x4,%esp
 6b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6bc:	6a 01                	push   $0x1
 6be:	56                   	push   %esi
 6bf:	57                   	push   %edi
 6c0:	e8 e1 fe ff ff       	call   5a6 <write>
  while(--i >= 0)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	39 de                	cmp    %ebx,%esi
 6ca:	75 e4                	jne    6b0 <printint+0x70>
}
 6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cf:	5b                   	pop    %ebx
 6d0:	5e                   	pop    %esi
 6d1:	5f                   	pop    %edi
 6d2:	5d                   	pop    %ebp
 6d3:	c3                   	ret    
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6df:	eb 87                	jmp    668 <printint+0x28>
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop

000006f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 6fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 6ff:	0f b6 13             	movzbl (%ebx),%edx
 702:	84 d2                	test   %dl,%dl
 704:	74 6a                	je     770 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 706:	8d 45 10             	lea    0x10(%ebp),%eax
 709:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 70c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 70f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 711:	89 45 d0             	mov    %eax,-0x30(%ebp)
 714:	eb 36                	jmp    74c <printf+0x5c>
 716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
 720:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 723:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	74 15                	je     742 <printf+0x52>
  write(fd, &c, 1);
 72d:	83 ec 04             	sub    $0x4,%esp
 730:	88 55 e7             	mov    %dl,-0x19(%ebp)
 733:	6a 01                	push   $0x1
 735:	57                   	push   %edi
 736:	56                   	push   %esi
 737:	e8 6a fe ff ff       	call   5a6 <write>
 73c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 73f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 742:	0f b6 13             	movzbl (%ebx),%edx
 745:	83 c3 01             	add    $0x1,%ebx
 748:	84 d2                	test   %dl,%dl
 74a:	74 24                	je     770 <printf+0x80>
    c = fmt[i] & 0xff;
 74c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 74f:	85 c9                	test   %ecx,%ecx
 751:	74 cd                	je     720 <printf+0x30>
      }
    } else if(state == '%'){
 753:	83 f9 25             	cmp    $0x25,%ecx
 756:	75 ea                	jne    742 <printf+0x52>
      if(c == 'd'){
 758:	83 f8 25             	cmp    $0x25,%eax
 75b:	0f 84 07 01 00 00    	je     868 <printf+0x178>
 761:	83 e8 63             	sub    $0x63,%eax
 764:	83 f8 15             	cmp    $0x15,%eax
 767:	77 17                	ja     780 <printf+0x90>
 769:	ff 24 85 04 0b 00 00 	jmp    *0xb04(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 770:	8d 65 f4             	lea    -0xc(%ebp),%esp
 773:	5b                   	pop    %ebx
 774:	5e                   	pop    %esi
 775:	5f                   	pop    %edi
 776:	5d                   	pop    %ebp
 777:	c3                   	ret    
 778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
 783:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 786:	6a 01                	push   $0x1
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 78e:	e8 13 fe ff ff       	call   5a6 <write>
        putc(fd, c);
 793:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 797:	83 c4 0c             	add    $0xc,%esp
 79a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 79d:	6a 01                	push   $0x1
 79f:	57                   	push   %edi
 7a0:	56                   	push   %esi
 7a1:	e8 00 fe ff ff       	call   5a6 <write>
        putc(fd, c);
 7a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a9:	31 c9                	xor    %ecx,%ecx
 7ab:	eb 95                	jmp    742 <printf+0x52>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7b8:	6a 00                	push   $0x0
 7ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	89 f0                	mov    %esi,%eax
 7c1:	e8 7a fe ff ff       	call   640 <printint>
        ap++;
 7c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7cd:	31 c9                	xor    %ecx,%ecx
 7cf:	e9 6e ff ff ff       	jmp    742 <printf+0x52>
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7db:	8b 10                	mov    (%eax),%edx
        ap++;
 7dd:	83 c0 04             	add    $0x4,%eax
 7e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7e3:	85 d2                	test   %edx,%edx
 7e5:	0f 84 8d 00 00 00    	je     878 <printf+0x188>
        while(*s != 0){
 7eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 7ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 7f0:	84 c0                	test   %al,%al
 7f2:	0f 84 4a ff ff ff    	je     742 <printf+0x52>
 7f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7fb:	89 d3                	mov    %edx,%ebx
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 800:	83 ec 04             	sub    $0x4,%esp
          s++;
 803:	83 c3 01             	add    $0x1,%ebx
 806:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 809:	6a 01                	push   $0x1
 80b:	57                   	push   %edi
 80c:	56                   	push   %esi
 80d:	e8 94 fd ff ff       	call   5a6 <write>
        while(*s != 0){
 812:	0f b6 03             	movzbl (%ebx),%eax
 815:	83 c4 10             	add    $0x10,%esp
 818:	84 c0                	test   %al,%al
 81a:	75 e4                	jne    800 <printf+0x110>
      state = 0;
 81c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 81f:	31 c9                	xor    %ecx,%ecx
 821:	e9 1c ff ff ff       	jmp    742 <printf+0x52>
 826:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	b9 0a 00 00 00       	mov    $0xa,%ecx
 838:	6a 01                	push   $0x1
 83a:	e9 7b ff ff ff       	jmp    7ba <printf+0xca>
 83f:	90                   	nop
        putc(fd, *ap);
 840:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 843:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 846:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 848:	6a 01                	push   $0x1
 84a:	57                   	push   %edi
 84b:	56                   	push   %esi
        putc(fd, *ap);
 84c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 84f:	e8 52 fd ff ff       	call   5a6 <write>
        ap++;
 854:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 858:	83 c4 10             	add    $0x10,%esp
      state = 0;
 85b:	31 c9                	xor    %ecx,%ecx
 85d:	e9 e0 fe ff ff       	jmp    742 <printf+0x52>
 862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 868:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 86b:	83 ec 04             	sub    $0x4,%esp
 86e:	e9 2a ff ff ff       	jmp    79d <printf+0xad>
 873:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 877:	90                   	nop
          s = "(null)";
 878:	ba fb 0a 00 00       	mov    $0xafb,%edx
        while(*s != 0){
 87d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 880:	b8 28 00 00 00       	mov    $0x28,%eax
 885:	89 d3                	mov    %edx,%ebx
 887:	e9 74 ff ff ff       	jmp    800 <printf+0x110>
 88c:	66 90                	xchg   %ax,%ax
 88e:	66 90                	xchg   %ax,%ax

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 890:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	a1 d8 0e 00 00       	mov    0xed8,%eax
{
 896:	89 e5                	mov    %esp,%ebp
 898:	57                   	push   %edi
 899:	56                   	push   %esi
 89a:	53                   	push   %ebx
 89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 89e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8a8:	89 c2                	mov    %eax,%edx
 8aa:	8b 00                	mov    (%eax),%eax
 8ac:	39 ca                	cmp    %ecx,%edx
 8ae:	73 30                	jae    8e0 <free+0x50>
 8b0:	39 c1                	cmp    %eax,%ecx
 8b2:	72 04                	jb     8b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b4:	39 c2                	cmp    %eax,%edx
 8b6:	72 f0                	jb     8a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8be:	39 f8                	cmp    %edi,%eax
 8c0:	74 30                	je     8f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8c5:	8b 42 04             	mov    0x4(%edx),%eax
 8c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8cb:	39 f1                	cmp    %esi,%ecx
 8cd:	74 3a                	je     909 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8d1:	5b                   	pop    %ebx
  freep = p;
 8d2:	89 15 d8 0e 00 00    	mov    %edx,0xed8
}
 8d8:	5e                   	pop    %esi
 8d9:	5f                   	pop    %edi
 8da:	5d                   	pop    %ebp
 8db:	c3                   	ret    
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e0:	39 c2                	cmp    %eax,%edx
 8e2:	72 c4                	jb     8a8 <free+0x18>
 8e4:	39 c1                	cmp    %eax,%ecx
 8e6:	73 c0                	jae    8a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 8e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ee:	39 f8                	cmp    %edi,%eax
 8f0:	75 d0                	jne    8c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 8f2:	03 70 04             	add    0x4(%eax),%esi
 8f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f8:	8b 02                	mov    (%edx),%eax
 8fa:	8b 00                	mov    (%eax),%eax
 8fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ff:	8b 42 04             	mov    0x4(%edx),%eax
 902:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 905:	39 f1                	cmp    %esi,%ecx
 907:	75 c6                	jne    8cf <free+0x3f>
    p->s.size += bp->s.size;
 909:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 90c:	89 15 d8 0e 00 00    	mov    %edx,0xed8
    p->s.size += bp->s.size;
 912:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 915:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 918:	89 0a                	mov    %ecx,(%edx)
}
 91a:	5b                   	pop    %ebx
 91b:	5e                   	pop    %esi
 91c:	5f                   	pop    %edi
 91d:	5d                   	pop    %ebp
 91e:	c3                   	ret    
 91f:	90                   	nop

00000920 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 929:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 92c:	8b 3d d8 0e 00 00    	mov    0xed8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 932:	8d 70 07             	lea    0x7(%eax),%esi
 935:	c1 ee 03             	shr    $0x3,%esi
 938:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 93b:	85 ff                	test   %edi,%edi
 93d:	0f 84 9d 00 00 00    	je     9e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 943:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 945:	8b 4a 04             	mov    0x4(%edx),%ecx
 948:	39 f1                	cmp    %esi,%ecx
 94a:	73 6a                	jae    9b6 <malloc+0x96>
 94c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 951:	39 de                	cmp    %ebx,%esi
 953:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 956:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 95d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 960:	eb 17                	jmp    979 <malloc+0x59>
 962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 968:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 96a:	8b 48 04             	mov    0x4(%eax),%ecx
 96d:	39 f1                	cmp    %esi,%ecx
 96f:	73 4f                	jae    9c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 971:	8b 3d d8 0e 00 00    	mov    0xed8,%edi
 977:	89 c2                	mov    %eax,%edx
 979:	39 d7                	cmp    %edx,%edi
 97b:	75 eb                	jne    968 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 97d:	83 ec 0c             	sub    $0xc,%esp
 980:	ff 75 e4             	push   -0x1c(%ebp)
 983:	e8 86 fc ff ff       	call   60e <sbrk>
  if(p == (char*)-1)
 988:	83 c4 10             	add    $0x10,%esp
 98b:	83 f8 ff             	cmp    $0xffffffff,%eax
 98e:	74 1c                	je     9ac <malloc+0x8c>
  hp->s.size = nu;
 990:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 993:	83 ec 0c             	sub    $0xc,%esp
 996:	83 c0 08             	add    $0x8,%eax
 999:	50                   	push   %eax
 99a:	e8 f1 fe ff ff       	call   890 <free>
  return freep;
 99f:	8b 15 d8 0e 00 00    	mov    0xed8,%edx
      if((p = morecore(nunits)) == 0)
 9a5:	83 c4 10             	add    $0x10,%esp
 9a8:	85 d2                	test   %edx,%edx
 9aa:	75 bc                	jne    968 <malloc+0x48>
        return 0;
  }
}
 9ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9af:	31 c0                	xor    %eax,%eax
}
 9b1:	5b                   	pop    %ebx
 9b2:	5e                   	pop    %esi
 9b3:	5f                   	pop    %edi
 9b4:	5d                   	pop    %ebp
 9b5:	c3                   	ret    
    if(p->s.size >= nunits){
 9b6:	89 d0                	mov    %edx,%eax
 9b8:	89 fa                	mov    %edi,%edx
 9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9c0:	39 ce                	cmp    %ecx,%esi
 9c2:	74 4c                	je     a10 <malloc+0xf0>
        p->s.size -= nunits;
 9c4:	29 f1                	sub    %esi,%ecx
 9c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9cf:	89 15 d8 0e 00 00    	mov    %edx,0xed8
}
 9d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9d8:	83 c0 08             	add    $0x8,%eax
}
 9db:	5b                   	pop    %ebx
 9dc:	5e                   	pop    %esi
 9dd:	5f                   	pop    %edi
 9de:	5d                   	pop    %ebp
 9df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9e0:	c7 05 d8 0e 00 00 dc 	movl   $0xedc,0xed8
 9e7:	0e 00 00 
    base.s.size = 0;
 9ea:	bf dc 0e 00 00       	mov    $0xedc,%edi
    base.s.ptr = freep = prevp = &base;
 9ef:	c7 05 dc 0e 00 00 dc 	movl   $0xedc,0xedc
 9f6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 9fb:	c7 05 e0 0e 00 00 00 	movl   $0x0,0xee0
 a02:	00 00 00 
    if(p->s.size >= nunits){
 a05:	e9 42 ff ff ff       	jmp    94c <malloc+0x2c>
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a10:	8b 08                	mov    (%eax),%ecx
 a12:	89 0a                	mov    %ecx,(%edx)
 a14:	eb b9                	jmp    9cf <malloc+0xaf>
