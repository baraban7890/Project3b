
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
   8:	68 24 09 00 00       	push   $0x924
   d:	6a 03                	push   $0x3
   f:	e8 2d 05 00 00       	call   541 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 2b 09 00 00       	push   $0x92b
  23:	68 34 09 00 00       	push   $0x934
  28:	6a 01                	push   $0x1
  2a:	e8 47 06 00 00       	call   676 <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 3c 09 00 00       	push   $0x93c
  37:	68 58 09 00 00       	push   $0x958
  3c:	6a 01                	push   $0x1
  3e:	e8 33 06 00 00       	call   676 <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 6c 09 00 00       	push   $0x96c
  4b:	6a 01                	push   $0x1
  4d:	e8 24 06 00 00       	call   676 <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 c8 0d 00 00    	push   0xdc8
  5b:	e8 f1 04 00 00       	call   551 <kill>
  60:	e8 bc 04 00 00       	call   521 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 79 09 00 00       	push   $0x979
  72:	e8 ea 04 00 00       	call   561 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 c4 0d 00 00 	lock xchg %eax,0xdc4
   exit();
  7e:	e8 9e 04 00 00       	call   521 <exit>

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  96:	e8 06 05 00 00       	call   5a1 <getpid>
  9b:	a3 c8 0d 00 00       	mov    %eax,0xdc8
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 ef 07 00 00       	call   89c <malloc>
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
  d2:	68 88 09 00 00       	push   $0x988
  d7:	e8 85 04 00 00       	call   561 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 2b 09 00 00       	push   $0x92b
  ef:	68 34 09 00 00       	push   $0x934
  f4:	6a 01                	push   $0x1
  f6:	e8 7b 05 00 00       	call   676 <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 8c 09 00 00       	push   $0x98c
 103:	68 58 09 00 00       	push   $0x958
 108:	6a 01                	push   $0x1
 10a:	e8 67 05 00 00       	call   676 <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 6c 09 00 00       	push   $0x96c
 117:	6a 01                	push   $0x1
 119:	e8 58 05 00 00       	call   676 <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 c8 0d 00 00    	push   0xdc8
 127:	e8 25 04 00 00       	call   551 <kill>
 12c:	e8 f0 03 00 00       	call   521 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 2b 09 00 00       	push   $0x92b
 138:	68 34 09 00 00       	push   $0x934
 13d:	6a 01                	push   $0x1
 13f:	e8 32 05 00 00       	call   676 <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 7e 09 00 00       	push   $0x97e
 14c:	68 58 09 00 00       	push   $0x958
 151:	6a 01                	push   $0x1
 153:	e8 1e 05 00 00       	call   676 <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 6c 09 00 00       	push   $0x96c
 160:	6a 01                	push   $0x1
 162:	e8 0f 05 00 00       	call   676 <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 c8 0d 00 00    	push   0xdc8
 170:	e8 dc 03 00 00       	call   551 <kill>
 175:	e8 a7 03 00 00       	call   521 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 31 04 00 00       	call   5c1 <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 a2 09 00 00       	push   $0x9a2
 1b1:	50                   	push   %eax
 1b2:	e8 8a 03 00 00       	call   541 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 2b 09 00 00       	push   $0x92b
 1ca:	68 34 09 00 00       	push   $0x934
 1cf:	6a 01                	push   $0x1
 1d1:	e8 a0 04 00 00       	call   676 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 d0 09 00 00       	push   $0x9d0
 1de:	68 58 09 00 00       	push   $0x958
 1e3:	6a 01                	push   $0x1
 1e5:	e8 8c 04 00 00       	call   676 <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 6c 09 00 00       	push   $0x96c
 1f2:	6a 01                	push   $0x1
 1f4:	e8 7d 04 00 00       	call   676 <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 c8 0d 00 00    	push   0xdc8
 202:	e8 4a 03 00 00       	call   551 <kill>
 207:	e8 15 03 00 00       	call   521 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 2b 09 00 00       	push   $0x92b
 213:	68 34 09 00 00       	push   $0x934
 218:	6a 01                	push   $0x1
 21a:	e8 57 04 00 00       	call   676 <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 94 09 00 00       	push   $0x994
 227:	68 58 09 00 00       	push   $0x958
 22c:	6a 01                	push   $0x1
 22e:	e8 43 04 00 00       	call   676 <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 6c 09 00 00       	push   $0x96c
 23b:	6a 01                	push   $0x1
 23d:	e8 34 04 00 00       	call   676 <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 c8 0d 00 00    	push   0xdc8
 24b:	e8 01 03 00 00       	call   551 <kill>
 250:	e8 cc 02 00 00       	call   521 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 ab 09 00 00       	push   $0x9ab
 25d:	6a 01                	push   $0x1
 25f:	e8 12 04 00 00       	call   676 <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 5a 03 00 00       	call   5c9 <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 2b 09 00 00       	push   $0x92b
 27d:	68 34 09 00 00       	push   $0x934
 282:	6a 01                	push   $0x1
 284:	e8 ed 03 00 00       	call   676 <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 b8 09 00 00       	push   $0x9b8
 291:	68 58 09 00 00       	push   $0x958
 296:	6a 01                	push   $0x1
 298:	e8 d9 03 00 00       	call   676 <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 6c 09 00 00       	push   $0x96c
 2a5:	6a 01                	push   $0x1
 2a7:	e8 ca 03 00 00       	call   676 <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 c8 0d 00 00    	push   0xdc8
 2b5:	e8 97 02 00 00       	call   551 <kill>
 2ba:	e8 62 02 00 00       	call   521 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 14 05 00 00       	call   7dc <free>
   exit();
 2c8:	e8 54 02 00 00       	call   521 <exit>

000002cd <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2d8:	89 f0                	mov    %esi,%eax
 2da:	89 d1                	mov    %edx,%ecx
 2dc:	83 c2 01             	add    $0x1,%edx
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	83 c0 01             	add    $0x1,%eax
 2e4:	0f b6 09             	movzbl (%ecx),%ecx
 2e7:	88 0b                	mov    %cl,(%ebx)
 2e9:	84 c9                	test   %cl,%cl
 2eb:	75 ed                	jne    2da <strcpy+0xd>
    ;
  return os;
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 2fc:	eb 06                	jmp    304 <strcmp+0x11>
    p++, q++;
 2fe:	83 c1 01             	add    $0x1,%ecx
 301:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 304:	0f b6 01             	movzbl (%ecx),%eax
 307:	84 c0                	test   %al,%al
 309:	74 04                	je     30f <strcmp+0x1c>
 30b:	3a 02                	cmp    (%edx),%al
 30d:	74 ef                	je     2fe <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 30f:	0f b6 c0             	movzbl %al,%eax
 312:	0f b6 12             	movzbl (%edx),%edx
 315:	29 d0                	sub    %edx,%eax
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <strlen>:

uint strlen(const char *s)
{
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 31f:	b8 00 00 00 00       	mov    $0x0,%eax
 324:	eb 03                	jmp    329 <strlen+0x10>
 326:	83 c0 01             	add    $0x1,%eax
 329:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 32d:	75 f7                	jne    326 <strlen+0xd>
    ;
  return n;
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    

00000331 <memset>:

void *
memset(void *dst, int c, uint n)
{
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	57                   	push   %edi
 335:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 338:	89 d7                	mov    %edx,%edi
 33a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33d:	8b 45 0c             	mov    0xc(%ebp),%eax
 340:	fc                   	cld    
 341:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 343:	89 d0                	mov    %edx,%eax
 345:	8b 7d fc             	mov    -0x4(%ebp),%edi
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <strchr>:

char *
strchr(const char *s, char c)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 354:	eb 03                	jmp    359 <strchr+0xf>
 356:	83 c0 01             	add    $0x1,%eax
 359:	0f b6 10             	movzbl (%eax),%edx
 35c:	84 d2                	test   %dl,%dl
 35e:	74 06                	je     366 <strchr+0x1c>
    if (*s == c)
 360:	38 ca                	cmp    %cl,%dl
 362:	75 f2                	jne    356 <strchr+0xc>
 364:	eb 05                	jmp    36b <strchr+0x21>
      return (char *)s;
  return 0;
 366:	b8 00 00 00 00       	mov    $0x0,%eax
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <gets>:

char *
gets(char *buf, int max)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	57                   	push   %edi
 371:	56                   	push   %esi
 372:	53                   	push   %ebx
 373:	83 ec 1c             	sub    $0x1c,%esp
 376:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 379:	bb 00 00 00 00       	mov    $0x0,%ebx
 37e:	89 de                	mov    %ebx,%esi
 380:	83 c3 01             	add    $0x1,%ebx
 383:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 386:	7d 2e                	jge    3b6 <gets+0x49>
  {
    cc = read(0, &c, 1);
 388:	83 ec 04             	sub    $0x4,%esp
 38b:	6a 01                	push   $0x1
 38d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 390:	50                   	push   %eax
 391:	6a 00                	push   $0x0
 393:	e8 a1 01 00 00       	call   539 <read>
    if (cc < 1)
 398:	83 c4 10             	add    $0x10,%esp
 39b:	85 c0                	test   %eax,%eax
 39d:	7e 17                	jle    3b6 <gets+0x49>
      break;
    buf[i++] = c;
 39f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 3a6:	3c 0a                	cmp    $0xa,%al
 3a8:	0f 94 c2             	sete   %dl
 3ab:	3c 0d                	cmp    $0xd,%al
 3ad:	0f 94 c0             	sete   %al
 3b0:	08 c2                	or     %al,%dl
 3b2:	74 ca                	je     37e <gets+0x11>
    buf[i++] = c;
 3b4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3ba:	89 f8                	mov    %edi,%eax
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    

000003c4 <stat>:

int stat(const char *n, struct stat *st)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c9:	83 ec 08             	sub    $0x8,%esp
 3cc:	6a 00                	push   $0x0
 3ce:	ff 75 08             	push   0x8(%ebp)
 3d1:	e8 8b 01 00 00       	call   561 <open>
  if (fd < 0)
 3d6:	83 c4 10             	add    $0x10,%esp
 3d9:	85 c0                	test   %eax,%eax
 3db:	78 24                	js     401 <stat+0x3d>
 3dd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3df:	83 ec 08             	sub    $0x8,%esp
 3e2:	ff 75 0c             	push   0xc(%ebp)
 3e5:	50                   	push   %eax
 3e6:	e8 8e 01 00 00       	call   579 <fstat>
 3eb:	89 c6                	mov    %eax,%esi
  close(fd);
 3ed:	89 1c 24             	mov    %ebx,(%esp)
 3f0:	e8 54 01 00 00       	call   549 <close>
  return r;
 3f5:	83 c4 10             	add    $0x10,%esp
}
 3f8:	89 f0                	mov    %esi,%eax
 3fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
    return -1;
 401:	be ff ff ff ff       	mov    $0xffffffff,%esi
 406:	eb f0                	jmp    3f8 <stat+0x34>

00000408 <atoi>:

int atoi(const char *s)
{
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 414:	eb 10                	jmp    426 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 416:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 419:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 41c:	83 c1 01             	add    $0x1,%ecx
 41f:	0f be c0             	movsbl %al,%eax
 422:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 426:	0f b6 01             	movzbl (%ecx),%eax
 429:	8d 58 d0             	lea    -0x30(%eax),%ebx
 42c:	80 fb 09             	cmp    $0x9,%bl
 42f:	76 e5                	jbe    416 <atoi+0xe>
  return n;
}
 431:	89 d0                	mov    %edx,%eax
 433:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	56                   	push   %esi
 43c:	53                   	push   %ebx
 43d:	8b 75 08             	mov    0x8(%ebp),%esi
 440:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 443:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 446:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 448:	eb 0d                	jmp    457 <memmove+0x1f>
    *dst++ = *src++;
 44a:	0f b6 01             	movzbl (%ecx),%eax
 44d:	88 02                	mov    %al,(%edx)
 44f:	8d 49 01             	lea    0x1(%ecx),%ecx
 452:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 455:	89 d8                	mov    %ebx,%eax
 457:	8d 58 ff             	lea    -0x1(%eax),%ebx
 45a:	85 c0                	test   %eax,%eax
 45c:	7f ec                	jg     44a <memmove+0x12>
  return vdst;
}
 45e:	89 f0                	mov    %esi,%eax
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    

00000464 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 46a:	83 38 01             	cmpl   $0x1,(%eax)
 46d:	74 fb                	je     46a <lock_acquire+0x6>
    ;
  lock->flag = 1;
 46f:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    

00000477 <lock_release>:
void lock_release(lock_t *lock)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 47a:	8b 45 08             	mov    0x8(%ebp),%eax
 47d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    

00000485 <lock_init>:
void lock_init(lock_t *lock)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    

00000493 <thread_create>:
{
 493:	55                   	push   %ebp
 494:	89 e5                	mov    %esp,%ebp
 496:	53                   	push   %ebx
 497:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 49a:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 49d:	53                   	push   %ebx
 49e:	e8 e2 ff ff ff       	call   485 <lock_init>
  lock_acquire(&lock);
 4a3:	89 1c 24             	mov    %ebx,(%esp)
 4a6:	e8 b9 ff ff ff       	call   464 <lock_acquire>
  void *stack = malloc(4096 * 2);
 4ab:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 4b2:	e8 e5 03 00 00       	call   89c <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 4b7:	50                   	push   %eax
 4b8:	ff 75 10             	push   0x10(%ebp)
 4bb:	ff 75 0c             	push   0xc(%ebp)
 4be:	ff 75 08             	push   0x8(%ebp)
 4c1:	e8 fb 00 00 00       	call   5c1 <clone>
}
 4c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c9:	c9                   	leave  
 4ca:	c3                   	ret    

000004cb <thread_join>:
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	56                   	push   %esi
 4cf:	53                   	push   %ebx
 4d0:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 4d3:	6a 04                	push   $0x4
 4d5:	e8 c2 03 00 00       	call   89c <malloc>
 4da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 4dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4e0:	89 04 24             	mov    %eax,(%esp)
 4e3:	e8 e1 00 00 00       	call   5c9 <join>
 4e8:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 4ea:	8d 75 f0             	lea    -0x10(%ebp),%esi
 4ed:	89 34 24             	mov    %esi,(%esp)
 4f0:	e8 90 ff ff ff       	call   485 <lock_init>
  lock_acquire(&lock);
 4f5:	89 34 24             	mov    %esi,(%esp)
 4f8:	e8 67 ff ff ff       	call   464 <lock_acquire>
  free(stack);
 4fd:	83 c4 04             	add    $0x4,%esp
 500:	ff 75 f4             	push   -0xc(%ebp)
 503:	e8 d4 02 00 00       	call   7dc <free>
  lock_release(&lock);
 508:	89 34 24             	mov    %esi,(%esp)
 50b:	e8 67 ff ff ff       	call   477 <lock_release>
}
 510:	89 d8                	mov    %ebx,%eax
 512:	8d 65 f8             	lea    -0x8(%ebp),%esp
 515:	5b                   	pop    %ebx
 516:	5e                   	pop    %esi
 517:	5d                   	pop    %ebp
 518:	c3                   	ret    

00000519 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 519:	b8 01 00 00 00       	mov    $0x1,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <exit>:
SYSCALL(exit)
 521:	b8 02 00 00 00       	mov    $0x2,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <wait>:
SYSCALL(wait)
 529:	b8 03 00 00 00       	mov    $0x3,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <pipe>:
SYSCALL(pipe)
 531:	b8 04 00 00 00       	mov    $0x4,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <read>:
SYSCALL(read)
 539:	b8 05 00 00 00       	mov    $0x5,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <write>:
SYSCALL(write)
 541:	b8 10 00 00 00       	mov    $0x10,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <close>:
SYSCALL(close)
 549:	b8 15 00 00 00       	mov    $0x15,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <kill>:
SYSCALL(kill)
 551:	b8 06 00 00 00       	mov    $0x6,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <exec>:
SYSCALL(exec)
 559:	b8 07 00 00 00       	mov    $0x7,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <open>:
SYSCALL(open)
 561:	b8 0f 00 00 00       	mov    $0xf,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <mknod>:
SYSCALL(mknod)
 569:	b8 11 00 00 00       	mov    $0x11,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <unlink>:
SYSCALL(unlink)
 571:	b8 12 00 00 00       	mov    $0x12,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <fstat>:
SYSCALL(fstat)
 579:	b8 08 00 00 00       	mov    $0x8,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <link>:
SYSCALL(link)
 581:	b8 13 00 00 00       	mov    $0x13,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <mkdir>:
SYSCALL(mkdir)
 589:	b8 14 00 00 00       	mov    $0x14,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <chdir>:
SYSCALL(chdir)
 591:	b8 09 00 00 00       	mov    $0x9,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <dup>:
SYSCALL(dup)
 599:	b8 0a 00 00 00       	mov    $0xa,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <getpid>:
SYSCALL(getpid)
 5a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <sbrk>:
SYSCALL(sbrk)
 5a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <sleep>:
SYSCALL(sleep)
 5b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <uptime>:
SYSCALL(uptime)
 5b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <clone>:
SYSCALL(clone)
 5c1:	b8 16 00 00 00       	mov    $0x16,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <join>:
 5c9:	b8 17 00 00 00       	mov    $0x17,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5d1:	55                   	push   %ebp
 5d2:	89 e5                	mov    %esp,%ebp
 5d4:	83 ec 1c             	sub    $0x1c,%esp
 5d7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5da:	6a 01                	push   $0x1
 5dc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5df:	52                   	push   %edx
 5e0:	50                   	push   %eax
 5e1:	e8 5b ff ff ff       	call   541 <write>
}
 5e6:	83 c4 10             	add    $0x10,%esp
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    

000005eb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	57                   	push   %edi
 5ef:	56                   	push   %esi
 5f0:	53                   	push   %ebx
 5f1:	83 ec 2c             	sub    $0x2c,%esp
 5f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f7:	89 d0                	mov    %edx,%eax
 5f9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5fb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ff:	0f 95 c1             	setne  %cl
 602:	c1 ea 1f             	shr    $0x1f,%edx
 605:	84 d1                	test   %dl,%cl
 607:	74 44                	je     64d <printint+0x62>
    neg = 1;
    x = -xx;
 609:	f7 d8                	neg    %eax
 60b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 60d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 614:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 619:	89 c8                	mov    %ecx,%eax
 61b:	ba 00 00 00 00       	mov    $0x0,%edx
 620:	f7 f6                	div    %esi
 622:	89 df                	mov    %ebx,%edi
 624:	83 c3 01             	add    $0x1,%ebx
 627:	0f b6 92 54 0a 00 00 	movzbl 0xa54(%edx),%edx
 62e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 632:	89 ca                	mov    %ecx,%edx
 634:	89 c1                	mov    %eax,%ecx
 636:	39 d6                	cmp    %edx,%esi
 638:	76 df                	jbe    619 <printint+0x2e>
  if(neg)
 63a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 63e:	74 31                	je     671 <printint+0x86>
    buf[i++] = '-';
 640:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 645:	8d 5f 02             	lea    0x2(%edi),%ebx
 648:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64b:	eb 17                	jmp    664 <printint+0x79>
    x = xx;
 64d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 64f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 656:	eb bc                	jmp    614 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 658:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 65d:	89 f0                	mov    %esi,%eax
 65f:	e8 6d ff ff ff       	call   5d1 <putc>
  while(--i >= 0)
 664:	83 eb 01             	sub    $0x1,%ebx
 667:	79 ef                	jns    658 <printint+0x6d>
}
 669:	83 c4 2c             	add    $0x2c,%esp
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    
 671:	8b 75 d0             	mov    -0x30(%ebp),%esi
 674:	eb ee                	jmp    664 <printint+0x79>

00000676 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 676:	55                   	push   %ebp
 677:	89 e5                	mov    %esp,%ebp
 679:	57                   	push   %edi
 67a:	56                   	push   %esi
 67b:	53                   	push   %ebx
 67c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 67f:	8d 45 10             	lea    0x10(%ebp),%eax
 682:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 685:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 68a:	bb 00 00 00 00       	mov    $0x0,%ebx
 68f:	eb 14                	jmp    6a5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 691:	89 fa                	mov    %edi,%edx
 693:	8b 45 08             	mov    0x8(%ebp),%eax
 696:	e8 36 ff ff ff       	call   5d1 <putc>
 69b:	eb 05                	jmp    6a2 <printf+0x2c>
      }
    } else if(state == '%'){
 69d:	83 fe 25             	cmp    $0x25,%esi
 6a0:	74 25                	je     6c7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6a2:	83 c3 01             	add    $0x1,%ebx
 6a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6ac:	84 c0                	test   %al,%al
 6ae:	0f 84 20 01 00 00    	je     7d4 <printf+0x15e>
    c = fmt[i] & 0xff;
 6b4:	0f be f8             	movsbl %al,%edi
 6b7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ba:	85 f6                	test   %esi,%esi
 6bc:	75 df                	jne    69d <printf+0x27>
      if(c == '%'){
 6be:	83 f8 25             	cmp    $0x25,%eax
 6c1:	75 ce                	jne    691 <printf+0x1b>
        state = '%';
 6c3:	89 c6                	mov    %eax,%esi
 6c5:	eb db                	jmp    6a2 <printf+0x2c>
      if(c == 'd'){
 6c7:	83 f8 25             	cmp    $0x25,%eax
 6ca:	0f 84 cf 00 00 00    	je     79f <printf+0x129>
 6d0:	0f 8c dd 00 00 00    	jl     7b3 <printf+0x13d>
 6d6:	83 f8 78             	cmp    $0x78,%eax
 6d9:	0f 8f d4 00 00 00    	jg     7b3 <printf+0x13d>
 6df:	83 f8 63             	cmp    $0x63,%eax
 6e2:	0f 8c cb 00 00 00    	jl     7b3 <printf+0x13d>
 6e8:	83 e8 63             	sub    $0x63,%eax
 6eb:	83 f8 15             	cmp    $0x15,%eax
 6ee:	0f 87 bf 00 00 00    	ja     7b3 <printf+0x13d>
 6f4:	ff 24 85 fc 09 00 00 	jmp    *0x9fc(,%eax,4)
        printint(fd, *ap, 10, 1);
 6fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6fe:	8b 17                	mov    (%edi),%edx
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	6a 01                	push   $0x1
 705:	b9 0a 00 00 00       	mov    $0xa,%ecx
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	e8 d9 fe ff ff       	call   5eb <printint>
        ap++;
 712:	83 c7 04             	add    $0x4,%edi
 715:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 718:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 71b:	be 00 00 00 00       	mov    $0x0,%esi
 720:	eb 80                	jmp    6a2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 722:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 725:	8b 17                	mov    (%edi),%edx
 727:	83 ec 0c             	sub    $0xc,%esp
 72a:	6a 00                	push   $0x0
 72c:	b9 10 00 00 00       	mov    $0x10,%ecx
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	e8 b2 fe ff ff       	call   5eb <printint>
        ap++;
 739:	83 c7 04             	add    $0x4,%edi
 73c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 73f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 742:	be 00 00 00 00       	mov    $0x0,%esi
 747:	e9 56 ff ff ff       	jmp    6a2 <printf+0x2c>
        s = (char*)*ap;
 74c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74f:	8b 30                	mov    (%eax),%esi
        ap++;
 751:	83 c0 04             	add    $0x4,%eax
 754:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 757:	85 f6                	test   %esi,%esi
 759:	75 15                	jne    770 <printf+0xfa>
          s = "(null)";
 75b:	be f3 09 00 00       	mov    $0x9f3,%esi
 760:	eb 0e                	jmp    770 <printf+0xfa>
          putc(fd, *s);
 762:	0f be d2             	movsbl %dl,%edx
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	e8 64 fe ff ff       	call   5d1 <putc>
          s++;
 76d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 770:	0f b6 16             	movzbl (%esi),%edx
 773:	84 d2                	test   %dl,%dl
 775:	75 eb                	jne    762 <printf+0xec>
      state = 0;
 777:	be 00 00 00 00       	mov    $0x0,%esi
 77c:	e9 21 ff ff ff       	jmp    6a2 <printf+0x2c>
        putc(fd, *ap);
 781:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 784:	0f be 17             	movsbl (%edi),%edx
 787:	8b 45 08             	mov    0x8(%ebp),%eax
 78a:	e8 42 fe ff ff       	call   5d1 <putc>
        ap++;
 78f:	83 c7 04             	add    $0x4,%edi
 792:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 795:	be 00 00 00 00       	mov    $0x0,%esi
 79a:	e9 03 ff ff ff       	jmp    6a2 <printf+0x2c>
        putc(fd, c);
 79f:	89 fa                	mov    %edi,%edx
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	e8 28 fe ff ff       	call   5d1 <putc>
      state = 0;
 7a9:	be 00 00 00 00       	mov    $0x0,%esi
 7ae:	e9 ef fe ff ff       	jmp    6a2 <printf+0x2c>
        putc(fd, '%');
 7b3:	ba 25 00 00 00       	mov    $0x25,%edx
 7b8:	8b 45 08             	mov    0x8(%ebp),%eax
 7bb:	e8 11 fe ff ff       	call   5d1 <putc>
        putc(fd, c);
 7c0:	89 fa                	mov    %edi,%edx
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	e8 07 fe ff ff       	call   5d1 <putc>
      state = 0;
 7ca:	be 00 00 00 00       	mov    $0x0,%esi
 7cf:	e9 ce fe ff ff       	jmp    6a2 <printf+0x2c>
    }
  }
}
 7d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    

000007dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7dc:	55                   	push   %ebp
 7dd:	89 e5                	mov    %esp,%ebp
 7df:	57                   	push   %edi
 7e0:	56                   	push   %esi
 7e1:	53                   	push   %ebx
 7e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7e5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e8:	a1 cc 0d 00 00       	mov    0xdcc,%eax
 7ed:	eb 02                	jmp    7f1 <free+0x15>
 7ef:	89 d0                	mov    %edx,%eax
 7f1:	39 c8                	cmp    %ecx,%eax
 7f3:	73 04                	jae    7f9 <free+0x1d>
 7f5:	39 08                	cmp    %ecx,(%eax)
 7f7:	77 12                	ja     80b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	39 c2                	cmp    %eax,%edx
 7fd:	77 f0                	ja     7ef <free+0x13>
 7ff:	39 c8                	cmp    %ecx,%eax
 801:	72 08                	jb     80b <free+0x2f>
 803:	39 ca                	cmp    %ecx,%edx
 805:	77 04                	ja     80b <free+0x2f>
 807:	89 d0                	mov    %edx,%eax
 809:	eb e6                	jmp    7f1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 80b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 811:	8b 10                	mov    (%eax),%edx
 813:	39 d7                	cmp    %edx,%edi
 815:	74 19                	je     830 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 817:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 81a:	8b 50 04             	mov    0x4(%eax),%edx
 81d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 820:	39 ce                	cmp    %ecx,%esi
 822:	74 1b                	je     83f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 824:	89 08                	mov    %ecx,(%eax)
  freep = p;
 826:	a3 cc 0d 00 00       	mov    %eax,0xdcc
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 830:	03 72 04             	add    0x4(%edx),%esi
 833:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	8b 12                	mov    (%edx),%edx
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 83d:	eb db                	jmp    81a <free+0x3e>
    p->s.size += bp->s.size;
 83f:	03 53 fc             	add    -0x4(%ebx),%edx
 842:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 845:	8b 53 f8             	mov    -0x8(%ebx),%edx
 848:	89 10                	mov    %edx,(%eax)
 84a:	eb da                	jmp    826 <free+0x4a>

0000084c <morecore>:

static Header*
morecore(uint nu)
{
 84c:	55                   	push   %ebp
 84d:	89 e5                	mov    %esp,%ebp
 84f:	53                   	push   %ebx
 850:	83 ec 04             	sub    $0x4,%esp
 853:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 855:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 85a:	77 05                	ja     861 <morecore+0x15>
    nu = 4096;
 85c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 861:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 868:	83 ec 0c             	sub    $0xc,%esp
 86b:	50                   	push   %eax
 86c:	e8 38 fd ff ff       	call   5a9 <sbrk>
  if(p == (char*)-1)
 871:	83 c4 10             	add    $0x10,%esp
 874:	83 f8 ff             	cmp    $0xffffffff,%eax
 877:	74 1c                	je     895 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 879:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 87c:	83 c0 08             	add    $0x8,%eax
 87f:	83 ec 0c             	sub    $0xc,%esp
 882:	50                   	push   %eax
 883:	e8 54 ff ff ff       	call   7dc <free>
  return freep;
 888:	a1 cc 0d 00 00       	mov    0xdcc,%eax
 88d:	83 c4 10             	add    $0x10,%esp
}
 890:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 893:	c9                   	leave  
 894:	c3                   	ret    
    return 0;
 895:	b8 00 00 00 00       	mov    $0x0,%eax
 89a:	eb f4                	jmp    890 <morecore+0x44>

0000089c <malloc>:

void*
malloc(uint nbytes)
{
 89c:	55                   	push   %ebp
 89d:	89 e5                	mov    %esp,%ebp
 89f:	53                   	push   %ebx
 8a0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	8d 58 07             	lea    0x7(%eax),%ebx
 8a9:	c1 eb 03             	shr    $0x3,%ebx
 8ac:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8af:	8b 0d cc 0d 00 00    	mov    0xdcc,%ecx
 8b5:	85 c9                	test   %ecx,%ecx
 8b7:	74 04                	je     8bd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b9:	8b 01                	mov    (%ecx),%eax
 8bb:	eb 4a                	jmp    907 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8bd:	c7 05 cc 0d 00 00 d0 	movl   $0xdd0,0xdcc
 8c4:	0d 00 00 
 8c7:	c7 05 d0 0d 00 00 d0 	movl   $0xdd0,0xdd0
 8ce:	0d 00 00 
    base.s.size = 0;
 8d1:	c7 05 d4 0d 00 00 00 	movl   $0x0,0xdd4
 8d8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8db:	b9 d0 0d 00 00       	mov    $0xdd0,%ecx
 8e0:	eb d7                	jmp    8b9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8e2:	74 19                	je     8fd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8e4:	29 da                	sub    %ebx,%edx
 8e6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ec:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8ef:	89 0d cc 0d 00 00    	mov    %ecx,0xdcc
      return (void*)(p + 1);
 8f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8fb:	c9                   	leave  
 8fc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8fd:	8b 10                	mov    (%eax),%edx
 8ff:	89 11                	mov    %edx,(%ecx)
 901:	eb ec                	jmp    8ef <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 903:	89 c1                	mov    %eax,%ecx
 905:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 907:	8b 50 04             	mov    0x4(%eax),%edx
 90a:	39 da                	cmp    %ebx,%edx
 90c:	73 d4                	jae    8e2 <malloc+0x46>
    if(p == freep)
 90e:	39 05 cc 0d 00 00    	cmp    %eax,0xdcc
 914:	75 ed                	jne    903 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 916:	89 d8                	mov    %ebx,%eax
 918:	e8 2f ff ff ff       	call   84c <morecore>
 91d:	85 c0                	test   %eax,%eax
 91f:	75 e2                	jne    903 <malloc+0x67>
 921:	eb d5                	jmp    8f8 <malloc+0x5c>
