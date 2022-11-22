
_test_6:     file format elf32-i386


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
  1c:	a1 c8 0e 00 00       	mov    0xec8,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 10 0a 00 00       	push   $0xa10
  31:	68 19 0a 00 00       	push   $0xa19
  36:	6a 01                	push   $0x1
  38:	e8 26 07 00 00       	call   763 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 58 0a 00 00       	push   $0xa58
  45:	68 2c 0a 00 00       	push   $0xa2c
  4a:	6a 01                	push   $0x1
  4c:	e8 12 07 00 00       	call   763 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 40 0a 00 00       	push   $0xa40
  59:	6a 01                	push   $0x1
  5b:	e8 03 07 00 00       	call   763 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 cc 0e 00 00    	push   0xecc
  69:	e8 d0 05 00 00       	call   63e <kill>
  6e:	e8 9b 05 00 00       	call   60e <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 10 0a 00 00       	push   $0xa10
  7a:	68 19 0a 00 00       	push   $0xa19
  7f:	6a 01                	push   $0x1
  81:	e8 dd 06 00 00       	call   763 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 21 0a 00 00       	push   $0xa21
  8e:	68 2c 0a 00 00       	push   $0xa2c
  93:	6a 01                	push   $0x1
  95:	e8 c9 06 00 00       	call   763 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 40 0a 00 00       	push   $0xa40
  a2:	6a 01                	push   $0x1
  a4:	e8 ba 06 00 00       	call   763 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 cc 0e 00 00    	push   0xecc
  b2:	e8 87 05 00 00       	call   63e <kill>
  b7:	e8 52 05 00 00       	call   60e <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 10 0a 00 00       	push   $0xa10
  c3:	68 19 0a 00 00       	push   $0xa19
  c8:	6a 01                	push   $0x1
  ca:	e8 94 06 00 00       	call   763 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 4d 0a 00 00       	push   $0xa4d
  d7:	68 2c 0a 00 00       	push   $0xa2c
  dc:	6a 01                	push   $0x1
  de:	e8 80 06 00 00       	call   763 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 40 0a 00 00       	push   $0xa40
  eb:	6a 01                	push   $0x1
  ed:	e8 71 06 00 00       	call   763 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 cc 0e 00 00    	push   0xecc
  fb:	e8 3e 05 00 00       	call   63e <kill>
 100:	e8 09 05 00 00       	call   60e <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 c8 0e 00 00       	mov    %eax,0xec8
   exit();
 10d:	e8 fc 04 00 00       	call   60e <exit>

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
 123:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 126:	e8 63 05 00 00       	call   68e <getpid>
 12b:	a3 cc 0e 00 00       	mov    %eax,0xecc
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 4c 08 00 00       	call   989 <malloc>
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
 15a:	68 10 0a 00 00       	push   $0xa10
 15f:	68 19 0a 00 00       	push   $0xa19
 164:	6a 01                	push   $0x1
 166:	e8 f8 05 00 00       	call   763 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 64 0a 00 00       	push   $0xa64
 173:	68 2c 0a 00 00       	push   $0xa2c
 178:	6a 01                	push   $0x1
 17a:	e8 e4 05 00 00       	call   763 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 40 0a 00 00       	push   $0xa40
 187:	6a 01                	push   $0x1
 189:	e8 d5 05 00 00       	call   763 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 cc 0e 00 00    	push   0xecc
 197:	e8 a2 04 00 00       	call   63e <kill>
 19c:	e8 6d 04 00 00       	call   60e <exit>
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
 1bf:	e8 ea 04 00 00       	call   6ae <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 b8 04 00 00       	call   696 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 ac 04 00 00       	call   696 <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 b8 04 00 00       	call   6b6 <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 10 0a 00 00       	push   $0xa10
 211:	68 19 0a 00 00       	push   $0xa19
 216:	6a 01                	push   $0x1
 218:	e8 46 05 00 00       	call   763 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 c8 0a 00 00       	push   $0xac8
 225:	68 2c 0a 00 00       	push   $0xa2c
 22a:	6a 01                	push   $0x1
 22c:	e8 32 05 00 00       	call   763 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 40 0a 00 00       	push   $0xa40
 239:	6a 01                	push   $0x1
 23b:	e8 23 05 00 00       	call   763 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 cc 0e 00 00    	push   0xecc
 249:	e8 f0 03 00 00       	call   63e <kill>
 24e:	e8 bb 03 00 00       	call   60e <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 10 0a 00 00       	push   $0xa10
 25a:	68 19 0a 00 00       	push   $0xa19
 25f:	6a 01                	push   $0x1
 261:	e8 fd 04 00 00       	call   763 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 6e 0a 00 00       	push   $0xa6e
 26e:	68 2c 0a 00 00       	push   $0xa2c
 273:	6a 01                	push   $0x1
 275:	e8 e9 04 00 00       	call   763 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 40 0a 00 00       	push   $0xa40
 282:	6a 01                	push   $0x1
 284:	e8 da 04 00 00       	call   763 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 cc 0e 00 00    	push   0xecc
 292:	e8 a7 03 00 00       	call   63e <kill>
 297:	e8 72 03 00 00       	call   60e <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 0f 04 00 00       	call   6b6 <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 10 0a 00 00       	push   $0xa10
 2c1:	68 19 0a 00 00       	push   $0xa19
 2c6:	6a 01                	push   $0x1
 2c8:	e8 96 04 00 00       	call   763 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 9a 0a 00 00       	push   $0xa9a
 2d5:	68 2c 0a 00 00       	push   $0xa2c
 2da:	6a 01                	push   $0x1
 2dc:	e8 82 04 00 00       	call   763 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 40 0a 00 00       	push   $0xa40
 2e9:	6a 01                	push   $0x1
 2eb:	e8 73 04 00 00       	call   763 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 cc 0e 00 00    	push   0xecc
 2f9:	e8 40 03 00 00       	call   63e <kill>
 2fe:	e8 0b 03 00 00       	call   60e <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 10 0a 00 00       	push   $0xa10
 30a:	68 19 0a 00 00       	push   $0xa19
 30f:	6a 01                	push   $0x1
 311:	e8 4d 04 00 00       	call   763 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 7c 0a 00 00       	push   $0xa7c
 31e:	68 2c 0a 00 00       	push   $0xa2c
 323:	6a 01                	push   $0x1
 325:	e8 39 04 00 00       	call   763 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 40 0a 00 00       	push   $0xa40
 332:	6a 01                	push   $0x1
 334:	e8 2a 04 00 00       	call   763 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 cc 0e 00 00    	push   0xecc
 342:	e8 f7 02 00 00       	call   63e <kill>
 347:	e8 c2 02 00 00       	call   60e <exit>
   assert(global == 2);
 34c:	83 3d c8 0e 00 00 02 	cmpl   $0x2,0xec8
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 10 0a 00 00       	push   $0xa10
 35c:	68 19 0a 00 00       	push   $0xa19
 361:	6a 01                	push   $0x1
 363:	e8 fb 03 00 00       	call   763 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 af 0a 00 00       	push   $0xaaf
 370:	68 2c 0a 00 00       	push   $0xa2c
 375:	6a 01                	push   $0x1
 377:	e8 e7 03 00 00       	call   763 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 40 0a 00 00       	push   $0xa40
 384:	6a 01                	push   $0x1
 386:	e8 d8 03 00 00       	call   763 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 cc 0e 00 00    	push   0xecc
 394:	e8 a5 02 00 00       	call   63e <kill>
 399:	e8 70 02 00 00       	call   60e <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 bb 0a 00 00       	push   $0xabb
 3a6:	6a 01                	push   $0x1
 3a8:	e8 b6 03 00 00       	call   763 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 14 05 00 00       	call   8c9 <free>
   exit();
 3b5:	e8 54 02 00 00       	call   60e <exit>

000003ba <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	56                   	push   %esi
 3be:	53                   	push   %ebx
 3bf:	8b 75 08             	mov    0x8(%ebp),%esi
 3c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	89 d1                	mov    %edx,%ecx
 3c9:	83 c2 01             	add    $0x1,%edx
 3cc:	89 c3                	mov    %eax,%ebx
 3ce:	83 c0 01             	add    $0x1,%eax
 3d1:	0f b6 09             	movzbl (%ecx),%ecx
 3d4:	88 0b                	mov    %cl,(%ebx)
 3d6:	84 c9                	test   %cl,%cl
 3d8:	75 ed                	jne    3c7 <strcpy+0xd>
    ;
  return os;
}
 3da:	89 f0                	mov    %esi,%eax
 3dc:	5b                   	pop    %ebx
 3dd:	5e                   	pop    %esi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 3e9:	eb 06                	jmp    3f1 <strcmp+0x11>
    p++, q++;
 3eb:	83 c1 01             	add    $0x1,%ecx
 3ee:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 3f1:	0f b6 01             	movzbl (%ecx),%eax
 3f4:	84 c0                	test   %al,%al
 3f6:	74 04                	je     3fc <strcmp+0x1c>
 3f8:	3a 02                	cmp    (%edx),%al
 3fa:	74 ef                	je     3eb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3fc:	0f b6 c0             	movzbl %al,%eax
 3ff:	0f b6 12             	movzbl (%edx),%edx
 402:	29 d0                	sub    %edx,%eax
}
 404:	5d                   	pop    %ebp
 405:	c3                   	ret    

00000406 <strlen>:

uint strlen(const char *s)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 40c:	b8 00 00 00 00       	mov    $0x0,%eax
 411:	eb 03                	jmp    416 <strlen+0x10>
 413:	83 c0 01             	add    $0x1,%eax
 416:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41a:	75 f7                	jne    413 <strlen+0xd>
    ;
  return n;
}
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    

0000041e <memset>:

void *
memset(void *dst, int c, uint n)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	57                   	push   %edi
 422:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 425:	89 d7                	mov    %edx,%edi
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	fc                   	cld    
 42e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 430:	89 d0                	mov    %edx,%eax
 432:	8b 7d fc             	mov    -0x4(%ebp),%edi
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <strchr>:

char *
strchr(const char *s, char c)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 441:	eb 03                	jmp    446 <strchr+0xf>
 443:	83 c0 01             	add    $0x1,%eax
 446:	0f b6 10             	movzbl (%eax),%edx
 449:	84 d2                	test   %dl,%dl
 44b:	74 06                	je     453 <strchr+0x1c>
    if (*s == c)
 44d:	38 ca                	cmp    %cl,%dl
 44f:	75 f2                	jne    443 <strchr+0xc>
 451:	eb 05                	jmp    458 <strchr+0x21>
      return (char *)s;
  return 0;
 453:	b8 00 00 00 00       	mov    $0x0,%eax
}
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <gets>:

char *
gets(char *buf, int max)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	57                   	push   %edi
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
 460:	83 ec 1c             	sub    $0x1c,%esp
 463:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 466:	bb 00 00 00 00       	mov    $0x0,%ebx
 46b:	89 de                	mov    %ebx,%esi
 46d:	83 c3 01             	add    $0x1,%ebx
 470:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 473:	7d 2e                	jge    4a3 <gets+0x49>
  {
    cc = read(0, &c, 1);
 475:	83 ec 04             	sub    $0x4,%esp
 478:	6a 01                	push   $0x1
 47a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47d:	50                   	push   %eax
 47e:	6a 00                	push   $0x0
 480:	e8 a1 01 00 00       	call   626 <read>
    if (cc < 1)
 485:	83 c4 10             	add    $0x10,%esp
 488:	85 c0                	test   %eax,%eax
 48a:	7e 17                	jle    4a3 <gets+0x49>
      break;
    buf[i++] = c;
 48c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 490:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 493:	3c 0a                	cmp    $0xa,%al
 495:	0f 94 c2             	sete   %dl
 498:	3c 0d                	cmp    $0xd,%al
 49a:	0f 94 c0             	sete   %al
 49d:	08 c2                	or     %al,%dl
 49f:	74 ca                	je     46b <gets+0x11>
    buf[i++] = c;
 4a1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a7:	89 f8                	mov    %edi,%eax
 4a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ac:	5b                   	pop    %ebx
 4ad:	5e                   	pop    %esi
 4ae:	5f                   	pop    %edi
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <stat>:

int stat(const char *n, struct stat *st)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	6a 00                	push   $0x0
 4bb:	ff 75 08             	push   0x8(%ebp)
 4be:	e8 8b 01 00 00       	call   64e <open>
  if (fd < 0)
 4c3:	83 c4 10             	add    $0x10,%esp
 4c6:	85 c0                	test   %eax,%eax
 4c8:	78 24                	js     4ee <stat+0x3d>
 4ca:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	ff 75 0c             	push   0xc(%ebp)
 4d2:	50                   	push   %eax
 4d3:	e8 8e 01 00 00       	call   666 <fstat>
 4d8:	89 c6                	mov    %eax,%esi
  close(fd);
 4da:	89 1c 24             	mov    %ebx,(%esp)
 4dd:	e8 54 01 00 00       	call   636 <close>
  return r;
 4e2:	83 c4 10             	add    $0x10,%esp
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    
    return -1;
 4ee:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f3:	eb f0                	jmp    4e5 <stat+0x34>

000004f5 <atoi>:

int atoi(const char *s)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	53                   	push   %ebx
 4f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4fc:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 501:	eb 10                	jmp    513 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 503:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 506:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 509:	83 c1 01             	add    $0x1,%ecx
 50c:	0f be c0             	movsbl %al,%eax
 50f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 513:	0f b6 01             	movzbl (%ecx),%eax
 516:	8d 58 d0             	lea    -0x30(%eax),%ebx
 519:	80 fb 09             	cmp    $0x9,%bl
 51c:	76 e5                	jbe    503 <atoi+0xe>
  return n;
}
 51e:	89 d0                	mov    %edx,%eax
 520:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 523:	c9                   	leave  
 524:	c3                   	ret    

00000525 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	8b 75 08             	mov    0x8(%ebp),%esi
 52d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 530:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 533:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 535:	eb 0d                	jmp    544 <memmove+0x1f>
    *dst++ = *src++;
 537:	0f b6 01             	movzbl (%ecx),%eax
 53a:	88 02                	mov    %al,(%edx)
 53c:	8d 49 01             	lea    0x1(%ecx),%ecx
 53f:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 542:	89 d8                	mov    %ebx,%eax
 544:	8d 58 ff             	lea    -0x1(%eax),%ebx
 547:	85 c0                	test   %eax,%eax
 549:	7f ec                	jg     537 <memmove+0x12>
  return vdst;
}
 54b:	89 f0                	mov    %esi,%eax
 54d:	5b                   	pop    %ebx
 54e:	5e                   	pop    %esi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    

00000551 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 557:	83 38 01             	cmpl   $0x1,(%eax)
 55a:	74 fb                	je     557 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 55c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    

00000564 <lock_release>:
void lock_release(lock_t *lock)
{
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 570:	5d                   	pop    %ebp
 571:	c3                   	ret    

00000572 <lock_init>:
void lock_init(lock_t *lock)
{
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <thread_create>:
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 587:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 58a:	53                   	push   %ebx
 58b:	e8 e2 ff ff ff       	call   572 <lock_init>
  lock_acquire(&lock);
 590:	89 1c 24             	mov    %ebx,(%esp)
 593:	e8 b9 ff ff ff       	call   551 <lock_acquire>
  void *stack = malloc(4096 * 2);
 598:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 59f:	e8 e5 03 00 00       	call   989 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 5a4:	50                   	push   %eax
 5a5:	ff 75 10             	push   0x10(%ebp)
 5a8:	ff 75 0c             	push   0xc(%ebp)
 5ab:	ff 75 08             	push   0x8(%ebp)
 5ae:	e8 fb 00 00 00       	call   6ae <clone>
}
 5b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b6:	c9                   	leave  
 5b7:	c3                   	ret    

000005b8 <thread_join>:
{
 5b8:	55                   	push   %ebp
 5b9:	89 e5                	mov    %esp,%ebp
 5bb:	56                   	push   %esi
 5bc:	53                   	push   %ebx
 5bd:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 5c0:	6a 04                	push   $0x4
 5c2:	e8 c2 03 00 00       	call   989 <malloc>
 5c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 5ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 e1 00 00 00       	call   6b6 <join>
 5d5:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 5d7:	8d 75 f0             	lea    -0x10(%ebp),%esi
 5da:	89 34 24             	mov    %esi,(%esp)
 5dd:	e8 90 ff ff ff       	call   572 <lock_init>
  lock_acquire(&lock);
 5e2:	89 34 24             	mov    %esi,(%esp)
 5e5:	e8 67 ff ff ff       	call   551 <lock_acquire>
  free(stack);
 5ea:	83 c4 04             	add    $0x4,%esp
 5ed:	ff 75 f4             	push   -0xc(%ebp)
 5f0:	e8 d4 02 00 00       	call   8c9 <free>
  lock_release(&lock);
 5f5:	89 34 24             	mov    %esi,(%esp)
 5f8:	e8 67 ff ff ff       	call   564 <lock_release>
}
 5fd:	89 d8                	mov    %ebx,%eax
 5ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
 602:	5b                   	pop    %ebx
 603:	5e                   	pop    %esi
 604:	5d                   	pop    %ebp
 605:	c3                   	ret    

00000606 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 606:	b8 01 00 00 00       	mov    $0x1,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <exit>:
SYSCALL(exit)
 60e:	b8 02 00 00 00       	mov    $0x2,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <wait>:
SYSCALL(wait)
 616:	b8 03 00 00 00       	mov    $0x3,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <pipe>:
SYSCALL(pipe)
 61e:	b8 04 00 00 00       	mov    $0x4,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <read>:
SYSCALL(read)
 626:	b8 05 00 00 00       	mov    $0x5,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <write>:
SYSCALL(write)
 62e:	b8 10 00 00 00       	mov    $0x10,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <close>:
SYSCALL(close)
 636:	b8 15 00 00 00       	mov    $0x15,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <kill>:
SYSCALL(kill)
 63e:	b8 06 00 00 00       	mov    $0x6,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <exec>:
SYSCALL(exec)
 646:	b8 07 00 00 00       	mov    $0x7,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <open>:
SYSCALL(open)
 64e:	b8 0f 00 00 00       	mov    $0xf,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <mknod>:
SYSCALL(mknod)
 656:	b8 11 00 00 00       	mov    $0x11,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <unlink>:
SYSCALL(unlink)
 65e:	b8 12 00 00 00       	mov    $0x12,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <fstat>:
SYSCALL(fstat)
 666:	b8 08 00 00 00       	mov    $0x8,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <link>:
SYSCALL(link)
 66e:	b8 13 00 00 00       	mov    $0x13,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <mkdir>:
SYSCALL(mkdir)
 676:	b8 14 00 00 00       	mov    $0x14,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <chdir>:
SYSCALL(chdir)
 67e:	b8 09 00 00 00       	mov    $0x9,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <dup>:
SYSCALL(dup)
 686:	b8 0a 00 00 00       	mov    $0xa,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <getpid>:
SYSCALL(getpid)
 68e:	b8 0b 00 00 00       	mov    $0xb,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <sbrk>:
SYSCALL(sbrk)
 696:	b8 0c 00 00 00       	mov    $0xc,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <sleep>:
SYSCALL(sleep)
 69e:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <uptime>:
SYSCALL(uptime)
 6a6:	b8 0e 00 00 00       	mov    $0xe,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <clone>:
SYSCALL(clone)
 6ae:	b8 16 00 00 00       	mov    $0x16,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <join>:
 6b6:	b8 17 00 00 00       	mov    $0x17,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6be:	55                   	push   %ebp
 6bf:	89 e5                	mov    %esp,%ebp
 6c1:	83 ec 1c             	sub    $0x1c,%esp
 6c4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6c7:	6a 01                	push   $0x1
 6c9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6cc:	52                   	push   %edx
 6cd:	50                   	push   %eax
 6ce:	e8 5b ff ff ff       	call   62e <write>
}
 6d3:	83 c4 10             	add    $0x10,%esp
 6d6:	c9                   	leave  
 6d7:	c3                   	ret    

000006d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6d8:	55                   	push   %ebp
 6d9:	89 e5                	mov    %esp,%ebp
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	53                   	push   %ebx
 6de:	83 ec 2c             	sub    $0x2c,%esp
 6e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e4:	89 d0                	mov    %edx,%eax
 6e6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6e8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ec:	0f 95 c1             	setne  %cl
 6ef:	c1 ea 1f             	shr    $0x1f,%edx
 6f2:	84 d1                	test   %dl,%cl
 6f4:	74 44                	je     73a <printint+0x62>
    neg = 1;
    x = -xx;
 6f6:	f7 d8                	neg    %eax
 6f8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6fa:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 701:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 706:	89 c8                	mov    %ecx,%eax
 708:	ba 00 00 00 00       	mov    $0x0,%edx
 70d:	f7 f6                	div    %esi
 70f:	89 df                	mov    %ebx,%edi
 711:	83 c3 01             	add    $0x1,%ebx
 714:	0f b6 92 54 0b 00 00 	movzbl 0xb54(%edx),%edx
 71b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 71f:	89 ca                	mov    %ecx,%edx
 721:	89 c1                	mov    %eax,%ecx
 723:	39 d6                	cmp    %edx,%esi
 725:	76 df                	jbe    706 <printint+0x2e>
  if(neg)
 727:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 72b:	74 31                	je     75e <printint+0x86>
    buf[i++] = '-';
 72d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 732:	8d 5f 02             	lea    0x2(%edi),%ebx
 735:	8b 75 d0             	mov    -0x30(%ebp),%esi
 738:	eb 17                	jmp    751 <printint+0x79>
    x = xx;
 73a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 73c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 743:	eb bc                	jmp    701 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 745:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 74a:	89 f0                	mov    %esi,%eax
 74c:	e8 6d ff ff ff       	call   6be <putc>
  while(--i >= 0)
 751:	83 eb 01             	sub    $0x1,%ebx
 754:	79 ef                	jns    745 <printint+0x6d>
}
 756:	83 c4 2c             	add    $0x2c,%esp
 759:	5b                   	pop    %ebx
 75a:	5e                   	pop    %esi
 75b:	5f                   	pop    %edi
 75c:	5d                   	pop    %ebp
 75d:	c3                   	ret    
 75e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 761:	eb ee                	jmp    751 <printint+0x79>

00000763 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 763:	55                   	push   %ebp
 764:	89 e5                	mov    %esp,%ebp
 766:	57                   	push   %edi
 767:	56                   	push   %esi
 768:	53                   	push   %ebx
 769:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 76c:	8d 45 10             	lea    0x10(%ebp),%eax
 76f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 772:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 777:	bb 00 00 00 00       	mov    $0x0,%ebx
 77c:	eb 14                	jmp    792 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 77e:	89 fa                	mov    %edi,%edx
 780:	8b 45 08             	mov    0x8(%ebp),%eax
 783:	e8 36 ff ff ff       	call   6be <putc>
 788:	eb 05                	jmp    78f <printf+0x2c>
      }
    } else if(state == '%'){
 78a:	83 fe 25             	cmp    $0x25,%esi
 78d:	74 25                	je     7b4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 78f:	83 c3 01             	add    $0x1,%ebx
 792:	8b 45 0c             	mov    0xc(%ebp),%eax
 795:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 799:	84 c0                	test   %al,%al
 79b:	0f 84 20 01 00 00    	je     8c1 <printf+0x15e>
    c = fmt[i] & 0xff;
 7a1:	0f be f8             	movsbl %al,%edi
 7a4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7a7:	85 f6                	test   %esi,%esi
 7a9:	75 df                	jne    78a <printf+0x27>
      if(c == '%'){
 7ab:	83 f8 25             	cmp    $0x25,%eax
 7ae:	75 ce                	jne    77e <printf+0x1b>
        state = '%';
 7b0:	89 c6                	mov    %eax,%esi
 7b2:	eb db                	jmp    78f <printf+0x2c>
      if(c == 'd'){
 7b4:	83 f8 25             	cmp    $0x25,%eax
 7b7:	0f 84 cf 00 00 00    	je     88c <printf+0x129>
 7bd:	0f 8c dd 00 00 00    	jl     8a0 <printf+0x13d>
 7c3:	83 f8 78             	cmp    $0x78,%eax
 7c6:	0f 8f d4 00 00 00    	jg     8a0 <printf+0x13d>
 7cc:	83 f8 63             	cmp    $0x63,%eax
 7cf:	0f 8c cb 00 00 00    	jl     8a0 <printf+0x13d>
 7d5:	83 e8 63             	sub    $0x63,%eax
 7d8:	83 f8 15             	cmp    $0x15,%eax
 7db:	0f 87 bf 00 00 00    	ja     8a0 <printf+0x13d>
 7e1:	ff 24 85 fc 0a 00 00 	jmp    *0xafc(,%eax,4)
        printint(fd, *ap, 10, 1);
 7e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7eb:	8b 17                	mov    (%edi),%edx
 7ed:	83 ec 0c             	sub    $0xc,%esp
 7f0:	6a 01                	push   $0x1
 7f2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f7:	8b 45 08             	mov    0x8(%ebp),%eax
 7fa:	e8 d9 fe ff ff       	call   6d8 <printint>
        ap++;
 7ff:	83 c7 04             	add    $0x4,%edi
 802:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 805:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 808:	be 00 00 00 00       	mov    $0x0,%esi
 80d:	eb 80                	jmp    78f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 80f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 812:	8b 17                	mov    (%edi),%edx
 814:	83 ec 0c             	sub    $0xc,%esp
 817:	6a 00                	push   $0x0
 819:	b9 10 00 00 00       	mov    $0x10,%ecx
 81e:	8b 45 08             	mov    0x8(%ebp),%eax
 821:	e8 b2 fe ff ff       	call   6d8 <printint>
        ap++;
 826:	83 c7 04             	add    $0x4,%edi
 829:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82f:	be 00 00 00 00       	mov    $0x0,%esi
 834:	e9 56 ff ff ff       	jmp    78f <printf+0x2c>
        s = (char*)*ap;
 839:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83c:	8b 30                	mov    (%eax),%esi
        ap++;
 83e:	83 c0 04             	add    $0x4,%eax
 841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 844:	85 f6                	test   %esi,%esi
 846:	75 15                	jne    85d <printf+0xfa>
          s = "(null)";
 848:	be f3 0a 00 00       	mov    $0xaf3,%esi
 84d:	eb 0e                	jmp    85d <printf+0xfa>
          putc(fd, *s);
 84f:	0f be d2             	movsbl %dl,%edx
 852:	8b 45 08             	mov    0x8(%ebp),%eax
 855:	e8 64 fe ff ff       	call   6be <putc>
          s++;
 85a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 85d:	0f b6 16             	movzbl (%esi),%edx
 860:	84 d2                	test   %dl,%dl
 862:	75 eb                	jne    84f <printf+0xec>
      state = 0;
 864:	be 00 00 00 00       	mov    $0x0,%esi
 869:	e9 21 ff ff ff       	jmp    78f <printf+0x2c>
        putc(fd, *ap);
 86e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 871:	0f be 17             	movsbl (%edi),%edx
 874:	8b 45 08             	mov    0x8(%ebp),%eax
 877:	e8 42 fe ff ff       	call   6be <putc>
        ap++;
 87c:	83 c7 04             	add    $0x4,%edi
 87f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 882:	be 00 00 00 00       	mov    $0x0,%esi
 887:	e9 03 ff ff ff       	jmp    78f <printf+0x2c>
        putc(fd, c);
 88c:	89 fa                	mov    %edi,%edx
 88e:	8b 45 08             	mov    0x8(%ebp),%eax
 891:	e8 28 fe ff ff       	call   6be <putc>
      state = 0;
 896:	be 00 00 00 00       	mov    $0x0,%esi
 89b:	e9 ef fe ff ff       	jmp    78f <printf+0x2c>
        putc(fd, '%');
 8a0:	ba 25 00 00 00       	mov    $0x25,%edx
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	e8 11 fe ff ff       	call   6be <putc>
        putc(fd, c);
 8ad:	89 fa                	mov    %edi,%edx
 8af:	8b 45 08             	mov    0x8(%ebp),%eax
 8b2:	e8 07 fe ff ff       	call   6be <putc>
      state = 0;
 8b7:	be 00 00 00 00       	mov    $0x0,%esi
 8bc:	e9 ce fe ff ff       	jmp    78f <printf+0x2c>
    }
  }
}
 8c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c4:	5b                   	pop    %ebx
 8c5:	5e                   	pop    %esi
 8c6:	5f                   	pop    %edi
 8c7:	5d                   	pop    %ebp
 8c8:	c3                   	ret    

000008c9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c9:	55                   	push   %ebp
 8ca:	89 e5                	mov    %esp,%ebp
 8cc:	57                   	push   %edi
 8cd:	56                   	push   %esi
 8ce:	53                   	push   %ebx
 8cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d5:	a1 d0 0e 00 00       	mov    0xed0,%eax
 8da:	eb 02                	jmp    8de <free+0x15>
 8dc:	89 d0                	mov    %edx,%eax
 8de:	39 c8                	cmp    %ecx,%eax
 8e0:	73 04                	jae    8e6 <free+0x1d>
 8e2:	39 08                	cmp    %ecx,(%eax)
 8e4:	77 12                	ja     8f8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e6:	8b 10                	mov    (%eax),%edx
 8e8:	39 c2                	cmp    %eax,%edx
 8ea:	77 f0                	ja     8dc <free+0x13>
 8ec:	39 c8                	cmp    %ecx,%eax
 8ee:	72 08                	jb     8f8 <free+0x2f>
 8f0:	39 ca                	cmp    %ecx,%edx
 8f2:	77 04                	ja     8f8 <free+0x2f>
 8f4:	89 d0                	mov    %edx,%eax
 8f6:	eb e6                	jmp    8de <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fe:	8b 10                	mov    (%eax),%edx
 900:	39 d7                	cmp    %edx,%edi
 902:	74 19                	je     91d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 904:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 907:	8b 50 04             	mov    0x4(%eax),%edx
 90a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 90d:	39 ce                	cmp    %ecx,%esi
 90f:	74 1b                	je     92c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 911:	89 08                	mov    %ecx,(%eax)
  freep = p;
 913:	a3 d0 0e 00 00       	mov    %eax,0xed0
}
 918:	5b                   	pop    %ebx
 919:	5e                   	pop    %esi
 91a:	5f                   	pop    %edi
 91b:	5d                   	pop    %ebp
 91c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 91d:	03 72 04             	add    0x4(%edx),%esi
 920:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 923:	8b 10                	mov    (%eax),%edx
 925:	8b 12                	mov    (%edx),%edx
 927:	89 53 f8             	mov    %edx,-0x8(%ebx)
 92a:	eb db                	jmp    907 <free+0x3e>
    p->s.size += bp->s.size;
 92c:	03 53 fc             	add    -0x4(%ebx),%edx
 92f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 932:	8b 53 f8             	mov    -0x8(%ebx),%edx
 935:	89 10                	mov    %edx,(%eax)
 937:	eb da                	jmp    913 <free+0x4a>

00000939 <morecore>:

static Header*
morecore(uint nu)
{
 939:	55                   	push   %ebp
 93a:	89 e5                	mov    %esp,%ebp
 93c:	53                   	push   %ebx
 93d:	83 ec 04             	sub    $0x4,%esp
 940:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 942:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 947:	77 05                	ja     94e <morecore+0x15>
    nu = 4096;
 949:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 94e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	50                   	push   %eax
 959:	e8 38 fd ff ff       	call   696 <sbrk>
  if(p == (char*)-1)
 95e:	83 c4 10             	add    $0x10,%esp
 961:	83 f8 ff             	cmp    $0xffffffff,%eax
 964:	74 1c                	je     982 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 966:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 969:	83 c0 08             	add    $0x8,%eax
 96c:	83 ec 0c             	sub    $0xc,%esp
 96f:	50                   	push   %eax
 970:	e8 54 ff ff ff       	call   8c9 <free>
  return freep;
 975:	a1 d0 0e 00 00       	mov    0xed0,%eax
 97a:	83 c4 10             	add    $0x10,%esp
}
 97d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 980:	c9                   	leave  
 981:	c3                   	ret    
    return 0;
 982:	b8 00 00 00 00       	mov    $0x0,%eax
 987:	eb f4                	jmp    97d <morecore+0x44>

00000989 <malloc>:

void*
malloc(uint nbytes)
{
 989:	55                   	push   %ebp
 98a:	89 e5                	mov    %esp,%ebp
 98c:	53                   	push   %ebx
 98d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 990:	8b 45 08             	mov    0x8(%ebp),%eax
 993:	8d 58 07             	lea    0x7(%eax),%ebx
 996:	c1 eb 03             	shr    $0x3,%ebx
 999:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 99c:	8b 0d d0 0e 00 00    	mov    0xed0,%ecx
 9a2:	85 c9                	test   %ecx,%ecx
 9a4:	74 04                	je     9aa <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a6:	8b 01                	mov    (%ecx),%eax
 9a8:	eb 4a                	jmp    9f4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9aa:	c7 05 d0 0e 00 00 d4 	movl   $0xed4,0xed0
 9b1:	0e 00 00 
 9b4:	c7 05 d4 0e 00 00 d4 	movl   $0xed4,0xed4
 9bb:	0e 00 00 
    base.s.size = 0;
 9be:	c7 05 d8 0e 00 00 00 	movl   $0x0,0xed8
 9c5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9c8:	b9 d4 0e 00 00       	mov    $0xed4,%ecx
 9cd:	eb d7                	jmp    9a6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9cf:	74 19                	je     9ea <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9d1:	29 da                	sub    %ebx,%edx
 9d3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9d9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9dc:	89 0d d0 0e 00 00    	mov    %ecx,0xed0
      return (void*)(p + 1);
 9e2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9e8:	c9                   	leave  
 9e9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9ea:	8b 10                	mov    (%eax),%edx
 9ec:	89 11                	mov    %edx,(%ecx)
 9ee:	eb ec                	jmp    9dc <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f0:	89 c1                	mov    %eax,%ecx
 9f2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f4:	8b 50 04             	mov    0x4(%eax),%edx
 9f7:	39 da                	cmp    %ebx,%edx
 9f9:	73 d4                	jae    9cf <malloc+0x46>
    if(p == freep)
 9fb:	39 05 d0 0e 00 00    	cmp    %eax,0xed0
 a01:	75 ed                	jne    9f0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a03:	89 d8                	mov    %ebx,%eax
 a05:	e8 2f ff ff ff       	call   939 <morecore>
 a0a:	85 c0                	test   %eax,%eax
 a0c:	75 e2                	jne    9f0 <malloc+0x67>
 a0e:	eb d5                	jmp    9e5 <malloc+0x5c>
