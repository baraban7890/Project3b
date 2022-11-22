
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 64 0d 00 00       	mov    0xd64,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 04 09 00 00       	push   $0x904
  2e:	68 0d 09 00 00       	push   $0x90d
  33:	6a 01                	push   $0x1
  35:	e8 1a 06 00 00       	call   654 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 15 09 00 00       	push   $0x915
  42:	68 21 09 00 00       	push   $0x921
  47:	6a 01                	push   $0x1
  49:	e8 06 06 00 00       	call   654 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 35 09 00 00       	push   $0x935
  56:	6a 01                	push   $0x1
  58:	e8 f7 05 00 00       	call   654 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 70 0d 00 00    	push   0xd70
  66:	e8 c4 04 00 00       	call   52f <kill>
  6b:	e8 8f 04 00 00       	call   4ff <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 64 0d 00 00    	mov    %ecx,0xd64
   exit();
  78:	e8 82 04 00 00       	call   4ff <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 ea 04 00 00       	call   57f <getpid>
  95:	a3 70 0d 00 00       	mov    %eax,0xd70
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 d3 07 00 00       	call   87a <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 68 0d 00 00       	push   $0xd68
  cd:	68 6c 0d 00 00       	push   $0xd6c
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 c3 04 00 00       	call   59f <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 64 0d 00 00       	mov    0xd64,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 6c 0d 00 00       	mov    0xd6c,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 68 0d 00 00       	mov    0xd68,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 04 09 00 00       	push   $0x904
 116:	68 0d 09 00 00       	push   $0x90d
 11b:	6a 01                	push   $0x1
 11d:	e8 32 05 00 00       	call   654 <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 65 09 00 00       	push   $0x965
 12a:	68 21 09 00 00       	push   $0x921
 12f:	6a 01                	push   $0x1
 131:	e8 1e 05 00 00       	call   654 <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 35 09 00 00       	push   $0x935
 13e:	6a 01                	push   $0x1
 140:	e8 0f 05 00 00       	call   654 <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 70 0d 00 00    	push   0xd70
 14e:	e8 dc 03 00 00       	call   52f <kill>
 153:	e8 a7 03 00 00       	call   4ff <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 04 09 00 00       	push   $0x904
 15f:	68 0d 09 00 00       	push   $0x90d
 164:	6a 01                	push   $0x1
 166:	e8 e9 04 00 00       	call   654 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 42 09 00 00       	push   $0x942
 173:	68 21 09 00 00       	push   $0x921
 178:	6a 01                	push   $0x1
 17a:	e8 d5 04 00 00       	call   654 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 35 09 00 00       	push   $0x935
 187:	6a 01                	push   $0x1
 189:	e8 c6 04 00 00       	call   654 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 70 0d 00 00    	push   0xd70
 197:	e8 93 03 00 00       	call   52f <kill>
 19c:	e8 5e 03 00 00       	call   4ff <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 04 09 00 00       	push   $0x904
 1a8:	68 0d 09 00 00       	push   $0x90d
 1ad:	6a 01                	push   $0x1
 1af:	e8 a0 04 00 00       	call   654 <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 4c 09 00 00       	push   $0x94c
 1bc:	68 21 09 00 00       	push   $0x921
 1c1:	6a 01                	push   $0x1
 1c3:	e8 8c 04 00 00       	call   654 <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 35 09 00 00       	push   $0x935
 1d0:	6a 01                	push   $0x1
 1d2:	e8 7d 04 00 00       	call   654 <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 70 0d 00 00    	push   0xd70
 1e0:	e8 4a 03 00 00       	call   52f <kill>
 1e5:	e8 15 03 00 00       	call   4ff <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 04 09 00 00       	push   $0x904
 1f1:	68 0d 09 00 00       	push   $0x90d
 1f6:	6a 01                	push   $0x1
 1f8:	e8 57 04 00 00       	call   654 <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 5a 09 00 00       	push   $0x95a
 205:	68 21 09 00 00       	push   $0x921
 20a:	6a 01                	push   $0x1
 20c:	e8 43 04 00 00       	call   654 <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 35 09 00 00       	push   $0x935
 219:	6a 01                	push   $0x1
 21b:	e8 34 04 00 00       	call   654 <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 70 0d 00 00    	push   0xd70
 229:	e8 01 03 00 00       	call   52f <kill>
 22e:	e8 cc 02 00 00       	call   4ff <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 70 09 00 00       	push   $0x970
 23b:	6a 01                	push   $0x1
 23d:	e8 12 04 00 00       	call   654 <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 5a 03 00 00       	call   5a7 <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 04 09 00 00       	push   $0x904
 25b:	68 0d 09 00 00       	push   $0x90d
 260:	6a 01                	push   $0x1
 262:	e8 ed 03 00 00       	call   654 <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 7d 09 00 00       	push   $0x97d
 26f:	68 21 09 00 00       	push   $0x921
 274:	6a 01                	push   $0x1
 276:	e8 d9 03 00 00       	call   654 <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 35 09 00 00       	push   $0x935
 283:	6a 01                	push   $0x1
 285:	e8 ca 03 00 00       	call   654 <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 70 0d 00 00    	push   0xd70
 293:	e8 97 02 00 00       	call   52f <kill>
 298:	e8 62 02 00 00       	call   4ff <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 14 05 00 00       	call   7ba <free>
   exit();
 2a6:	e8 54 02 00 00       	call   4ff <exit>

000002ab <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	56                   	push   %esi
 2af:	53                   	push   %ebx
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2b6:	89 f0                	mov    %esi,%eax
 2b8:	89 d1                	mov    %edx,%ecx
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	89 c3                	mov    %eax,%ebx
 2bf:	83 c0 01             	add    $0x1,%eax
 2c2:	0f b6 09             	movzbl (%ecx),%ecx
 2c5:	88 0b                	mov    %cl,(%ebx)
 2c7:	84 c9                	test   %cl,%cl
 2c9:	75 ed                	jne    2b8 <strcpy+0xd>
    ;
  return os;
}
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    

000002d1 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 2da:	eb 06                	jmp    2e2 <strcmp+0x11>
    p++, q++;
 2dc:	83 c1 01             	add    $0x1,%ecx
 2df:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 2e2:	0f b6 01             	movzbl (%ecx),%eax
 2e5:	84 c0                	test   %al,%al
 2e7:	74 04                	je     2ed <strcmp+0x1c>
 2e9:	3a 02                	cmp    (%edx),%al
 2eb:	74 ef                	je     2dc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 c0             	movzbl %al,%eax
 2f0:	0f b6 12             	movzbl (%edx),%edx
 2f3:	29 d0                	sub    %edx,%eax
}
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    

000002f7 <strlen>:

uint strlen(const char *s)
{
 2f7:	55                   	push   %ebp
 2f8:	89 e5                	mov    %esp,%ebp
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 2fd:	b8 00 00 00 00       	mov    $0x0,%eax
 302:	eb 03                	jmp    307 <strlen+0x10>
 304:	83 c0 01             	add    $0x1,%eax
 307:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 30b:	75 f7                	jne    304 <strlen+0xd>
    ;
  return n;
}
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <memset>:

void *
memset(void *dst, int c, uint n)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	57                   	push   %edi
 313:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 316:	89 d7                	mov    %edx,%edi
 318:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 31e:	fc                   	cld    
 31f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 321:	89 d0                	mov    %edx,%eax
 323:	8b 7d fc             	mov    -0x4(%ebp),%edi
 326:	c9                   	leave  
 327:	c3                   	ret    

00000328 <strchr>:

char *
strchr(const char *s, char c)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 332:	eb 03                	jmp    337 <strchr+0xf>
 334:	83 c0 01             	add    $0x1,%eax
 337:	0f b6 10             	movzbl (%eax),%edx
 33a:	84 d2                	test   %dl,%dl
 33c:	74 06                	je     344 <strchr+0x1c>
    if (*s == c)
 33e:	38 ca                	cmp    %cl,%dl
 340:	75 f2                	jne    334 <strchr+0xc>
 342:	eb 05                	jmp    349 <strchr+0x21>
      return (char *)s;
  return 0;
 344:	b8 00 00 00 00       	mov    $0x0,%eax
}
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <gets>:

char *
gets(char *buf, int max)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	57                   	push   %edi
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	83 ec 1c             	sub    $0x1c,%esp
 354:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 357:	bb 00 00 00 00       	mov    $0x0,%ebx
 35c:	89 de                	mov    %ebx,%esi
 35e:	83 c3 01             	add    $0x1,%ebx
 361:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 364:	7d 2e                	jge    394 <gets+0x49>
  {
    cc = read(0, &c, 1);
 366:	83 ec 04             	sub    $0x4,%esp
 369:	6a 01                	push   $0x1
 36b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 36e:	50                   	push   %eax
 36f:	6a 00                	push   $0x0
 371:	e8 a1 01 00 00       	call   517 <read>
    if (cc < 1)
 376:	83 c4 10             	add    $0x10,%esp
 379:	85 c0                	test   %eax,%eax
 37b:	7e 17                	jle    394 <gets+0x49>
      break;
    buf[i++] = c;
 37d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 381:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 384:	3c 0a                	cmp    $0xa,%al
 386:	0f 94 c2             	sete   %dl
 389:	3c 0d                	cmp    $0xd,%al
 38b:	0f 94 c0             	sete   %al
 38e:	08 c2                	or     %al,%dl
 390:	74 ca                	je     35c <gets+0x11>
    buf[i++] = c;
 392:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 394:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 398:	89 f8                	mov    %edi,%eax
 39a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39d:	5b                   	pop    %ebx
 39e:	5e                   	pop    %esi
 39f:	5f                   	pop    %edi
 3a0:	5d                   	pop    %ebp
 3a1:	c3                   	ret    

000003a2 <stat>:

int stat(const char *n, struct stat *st)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	56                   	push   %esi
 3a6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a7:	83 ec 08             	sub    $0x8,%esp
 3aa:	6a 00                	push   $0x0
 3ac:	ff 75 08             	push   0x8(%ebp)
 3af:	e8 8b 01 00 00       	call   53f <open>
  if (fd < 0)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	78 24                	js     3df <stat+0x3d>
 3bb:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	ff 75 0c             	push   0xc(%ebp)
 3c3:	50                   	push   %eax
 3c4:	e8 8e 01 00 00       	call   557 <fstat>
 3c9:	89 c6                	mov    %eax,%esi
  close(fd);
 3cb:	89 1c 24             	mov    %ebx,(%esp)
 3ce:	e8 54 01 00 00       	call   527 <close>
  return r;
 3d3:	83 c4 10             	add    $0x10,%esp
}
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
    return -1;
 3df:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e4:	eb f0                	jmp    3d6 <stat+0x34>

000003e6 <atoi>:

int atoi(const char *s)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	53                   	push   %ebx
 3ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 3f2:	eb 10                	jmp    404 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 3f4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3f7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3fa:	83 c1 01             	add    $0x1,%ecx
 3fd:	0f be c0             	movsbl %al,%eax
 400:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 404:	0f b6 01             	movzbl (%ecx),%eax
 407:	8d 58 d0             	lea    -0x30(%eax),%ebx
 40a:	80 fb 09             	cmp    $0x9,%bl
 40d:	76 e5                	jbe    3f4 <atoi+0xe>
  return n;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	8b 75 08             	mov    0x8(%ebp),%esi
 41e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 421:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 424:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 426:	eb 0d                	jmp    435 <memmove+0x1f>
    *dst++ = *src++;
 428:	0f b6 01             	movzbl (%ecx),%eax
 42b:	88 02                	mov    %al,(%edx)
 42d:	8d 49 01             	lea    0x1(%ecx),%ecx
 430:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 58 ff             	lea    -0x1(%eax),%ebx
 438:	85 c0                	test   %eax,%eax
 43a:	7f ec                	jg     428 <memmove+0x12>
  return vdst;
}
 43c:	89 f0                	mov    %esi,%eax
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    

00000442 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 448:	83 38 01             	cmpl   $0x1,(%eax)
 44b:	74 fb                	je     448 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 44d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    

00000455 <lock_release>:
void lock_release(lock_t *lock)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    

00000463 <lock_init>:
void lock_init(lock_t *lock)
{
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 466:	8b 45 08             	mov    0x8(%ebp),%eax
 469:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    

00000471 <thread_create>:
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	53                   	push   %ebx
 475:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 478:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 47b:	53                   	push   %ebx
 47c:	e8 e2 ff ff ff       	call   463 <lock_init>
  lock_acquire(&lock);
 481:	89 1c 24             	mov    %ebx,(%esp)
 484:	e8 b9 ff ff ff       	call   442 <lock_acquire>
  void *stack = malloc(4096 * 2);
 489:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 490:	e8 e5 03 00 00       	call   87a <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 495:	50                   	push   %eax
 496:	ff 75 10             	push   0x10(%ebp)
 499:	ff 75 0c             	push   0xc(%ebp)
 49c:	ff 75 08             	push   0x8(%ebp)
 49f:	e8 fb 00 00 00       	call   59f <clone>
}
 4a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a7:	c9                   	leave  
 4a8:	c3                   	ret    

000004a9 <thread_join>:
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	56                   	push   %esi
 4ad:	53                   	push   %ebx
 4ae:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 4b1:	6a 04                	push   $0x4
 4b3:	e8 c2 03 00 00       	call   87a <malloc>
 4b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 4bb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4be:	89 04 24             	mov    %eax,(%esp)
 4c1:	e8 e1 00 00 00       	call   5a7 <join>
 4c6:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 4c8:	8d 75 f0             	lea    -0x10(%ebp),%esi
 4cb:	89 34 24             	mov    %esi,(%esp)
 4ce:	e8 90 ff ff ff       	call   463 <lock_init>
  lock_acquire(&lock);
 4d3:	89 34 24             	mov    %esi,(%esp)
 4d6:	e8 67 ff ff ff       	call   442 <lock_acquire>
  free(stack);
 4db:	83 c4 04             	add    $0x4,%esp
 4de:	ff 75 f4             	push   -0xc(%ebp)
 4e1:	e8 d4 02 00 00       	call   7ba <free>
  lock_release(&lock);
 4e6:	89 34 24             	mov    %esi,(%esp)
 4e9:	e8 67 ff ff ff       	call   455 <lock_release>
}
 4ee:	89 d8                	mov    %ebx,%eax
 4f0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5d                   	pop    %ebp
 4f6:	c3                   	ret    

000004f7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f7:	b8 01 00 00 00       	mov    $0x1,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <exit>:
SYSCALL(exit)
 4ff:	b8 02 00 00 00       	mov    $0x2,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <wait>:
SYSCALL(wait)
 507:	b8 03 00 00 00       	mov    $0x3,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <pipe>:
SYSCALL(pipe)
 50f:	b8 04 00 00 00       	mov    $0x4,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <read>:
SYSCALL(read)
 517:	b8 05 00 00 00       	mov    $0x5,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <write>:
SYSCALL(write)
 51f:	b8 10 00 00 00       	mov    $0x10,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <close>:
SYSCALL(close)
 527:	b8 15 00 00 00       	mov    $0x15,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <kill>:
SYSCALL(kill)
 52f:	b8 06 00 00 00       	mov    $0x6,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <exec>:
SYSCALL(exec)
 537:	b8 07 00 00 00       	mov    $0x7,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <open>:
SYSCALL(open)
 53f:	b8 0f 00 00 00       	mov    $0xf,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <mknod>:
SYSCALL(mknod)
 547:	b8 11 00 00 00       	mov    $0x11,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <unlink>:
SYSCALL(unlink)
 54f:	b8 12 00 00 00       	mov    $0x12,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <fstat>:
SYSCALL(fstat)
 557:	b8 08 00 00 00       	mov    $0x8,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <link>:
SYSCALL(link)
 55f:	b8 13 00 00 00       	mov    $0x13,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <mkdir>:
SYSCALL(mkdir)
 567:	b8 14 00 00 00       	mov    $0x14,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <chdir>:
SYSCALL(chdir)
 56f:	b8 09 00 00 00       	mov    $0x9,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <dup>:
SYSCALL(dup)
 577:	b8 0a 00 00 00       	mov    $0xa,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <getpid>:
SYSCALL(getpid)
 57f:	b8 0b 00 00 00       	mov    $0xb,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <sbrk>:
SYSCALL(sbrk)
 587:	b8 0c 00 00 00       	mov    $0xc,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <sleep>:
SYSCALL(sleep)
 58f:	b8 0d 00 00 00       	mov    $0xd,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <uptime>:
SYSCALL(uptime)
 597:	b8 0e 00 00 00       	mov    $0xe,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <clone>:
SYSCALL(clone)
 59f:	b8 16 00 00 00       	mov    $0x16,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <join>:
 5a7:	b8 17 00 00 00       	mov    $0x17,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5af:	55                   	push   %ebp
 5b0:	89 e5                	mov    %esp,%ebp
 5b2:	83 ec 1c             	sub    $0x1c,%esp
 5b5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b8:	6a 01                	push   $0x1
 5ba:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5bd:	52                   	push   %edx
 5be:	50                   	push   %eax
 5bf:	e8 5b ff ff ff       	call   51f <write>
}
 5c4:	83 c4 10             	add    $0x10,%esp
 5c7:	c9                   	leave  
 5c8:	c3                   	ret    

000005c9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c9:	55                   	push   %ebp
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	57                   	push   %edi
 5cd:	56                   	push   %esi
 5ce:	53                   	push   %ebx
 5cf:	83 ec 2c             	sub    $0x2c,%esp
 5d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d5:	89 d0                	mov    %edx,%eax
 5d7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5dd:	0f 95 c1             	setne  %cl
 5e0:	c1 ea 1f             	shr    $0x1f,%edx
 5e3:	84 d1                	test   %dl,%cl
 5e5:	74 44                	je     62b <printint+0x62>
    neg = 1;
    x = -xx;
 5e7:	f7 d8                	neg    %eax
 5e9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5eb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5f7:	89 c8                	mov    %ecx,%eax
 5f9:	ba 00 00 00 00       	mov    $0x0,%edx
 5fe:	f7 f6                	div    %esi
 600:	89 df                	mov    %ebx,%edi
 602:	83 c3 01             	add    $0x1,%ebx
 605:	0f b6 92 f4 09 00 00 	movzbl 0x9f4(%edx),%edx
 60c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 610:	89 ca                	mov    %ecx,%edx
 612:	89 c1                	mov    %eax,%ecx
 614:	39 d6                	cmp    %edx,%esi
 616:	76 df                	jbe    5f7 <printint+0x2e>
  if(neg)
 618:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 61c:	74 31                	je     64f <printint+0x86>
    buf[i++] = '-';
 61e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 623:	8d 5f 02             	lea    0x2(%edi),%ebx
 626:	8b 75 d0             	mov    -0x30(%ebp),%esi
 629:	eb 17                	jmp    642 <printint+0x79>
    x = xx;
 62b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 62d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 634:	eb bc                	jmp    5f2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 636:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 63b:	89 f0                	mov    %esi,%eax
 63d:	e8 6d ff ff ff       	call   5af <putc>
  while(--i >= 0)
 642:	83 eb 01             	sub    $0x1,%ebx
 645:	79 ef                	jns    636 <printint+0x6d>
}
 647:	83 c4 2c             	add    $0x2c,%esp
 64a:	5b                   	pop    %ebx
 64b:	5e                   	pop    %esi
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    
 64f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 652:	eb ee                	jmp    642 <printint+0x79>

00000654 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	57                   	push   %edi
 658:	56                   	push   %esi
 659:	53                   	push   %ebx
 65a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 65d:	8d 45 10             	lea    0x10(%ebp),%eax
 660:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 663:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 668:	bb 00 00 00 00       	mov    $0x0,%ebx
 66d:	eb 14                	jmp    683 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 66f:	89 fa                	mov    %edi,%edx
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	e8 36 ff ff ff       	call   5af <putc>
 679:	eb 05                	jmp    680 <printf+0x2c>
      }
    } else if(state == '%'){
 67b:	83 fe 25             	cmp    $0x25,%esi
 67e:	74 25                	je     6a5 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 680:	83 c3 01             	add    $0x1,%ebx
 683:	8b 45 0c             	mov    0xc(%ebp),%eax
 686:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 68a:	84 c0                	test   %al,%al
 68c:	0f 84 20 01 00 00    	je     7b2 <printf+0x15e>
    c = fmt[i] & 0xff;
 692:	0f be f8             	movsbl %al,%edi
 695:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 698:	85 f6                	test   %esi,%esi
 69a:	75 df                	jne    67b <printf+0x27>
      if(c == '%'){
 69c:	83 f8 25             	cmp    $0x25,%eax
 69f:	75 ce                	jne    66f <printf+0x1b>
        state = '%';
 6a1:	89 c6                	mov    %eax,%esi
 6a3:	eb db                	jmp    680 <printf+0x2c>
      if(c == 'd'){
 6a5:	83 f8 25             	cmp    $0x25,%eax
 6a8:	0f 84 cf 00 00 00    	je     77d <printf+0x129>
 6ae:	0f 8c dd 00 00 00    	jl     791 <printf+0x13d>
 6b4:	83 f8 78             	cmp    $0x78,%eax
 6b7:	0f 8f d4 00 00 00    	jg     791 <printf+0x13d>
 6bd:	83 f8 63             	cmp    $0x63,%eax
 6c0:	0f 8c cb 00 00 00    	jl     791 <printf+0x13d>
 6c6:	83 e8 63             	sub    $0x63,%eax
 6c9:	83 f8 15             	cmp    $0x15,%eax
 6cc:	0f 87 bf 00 00 00    	ja     791 <printf+0x13d>
 6d2:	ff 24 85 9c 09 00 00 	jmp    *0x99c(,%eax,4)
        printint(fd, *ap, 10, 1);
 6d9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6dc:	8b 17                	mov    (%edi),%edx
 6de:	83 ec 0c             	sub    $0xc,%esp
 6e1:	6a 01                	push   $0x1
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	e8 d9 fe ff ff       	call   5c9 <printint>
        ap++;
 6f0:	83 c7 04             	add    $0x4,%edi
 6f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f9:	be 00 00 00 00       	mov    $0x0,%esi
 6fe:	eb 80                	jmp    680 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 700:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 703:	8b 17                	mov    (%edi),%edx
 705:	83 ec 0c             	sub    $0xc,%esp
 708:	6a 00                	push   $0x0
 70a:	b9 10 00 00 00       	mov    $0x10,%ecx
 70f:	8b 45 08             	mov    0x8(%ebp),%eax
 712:	e8 b2 fe ff ff       	call   5c9 <printint>
        ap++;
 717:	83 c7 04             	add    $0x4,%edi
 71a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 71d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 720:	be 00 00 00 00       	mov    $0x0,%esi
 725:	e9 56 ff ff ff       	jmp    680 <printf+0x2c>
        s = (char*)*ap;
 72a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72d:	8b 30                	mov    (%eax),%esi
        ap++;
 72f:	83 c0 04             	add    $0x4,%eax
 732:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 735:	85 f6                	test   %esi,%esi
 737:	75 15                	jne    74e <printf+0xfa>
          s = "(null)";
 739:	be 93 09 00 00       	mov    $0x993,%esi
 73e:	eb 0e                	jmp    74e <printf+0xfa>
          putc(fd, *s);
 740:	0f be d2             	movsbl %dl,%edx
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	e8 64 fe ff ff       	call   5af <putc>
          s++;
 74b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 74e:	0f b6 16             	movzbl (%esi),%edx
 751:	84 d2                	test   %dl,%dl
 753:	75 eb                	jne    740 <printf+0xec>
      state = 0;
 755:	be 00 00 00 00       	mov    $0x0,%esi
 75a:	e9 21 ff ff ff       	jmp    680 <printf+0x2c>
        putc(fd, *ap);
 75f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 762:	0f be 17             	movsbl (%edi),%edx
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	e8 42 fe ff ff       	call   5af <putc>
        ap++;
 76d:	83 c7 04             	add    $0x4,%edi
 770:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 773:	be 00 00 00 00       	mov    $0x0,%esi
 778:	e9 03 ff ff ff       	jmp    680 <printf+0x2c>
        putc(fd, c);
 77d:	89 fa                	mov    %edi,%edx
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	e8 28 fe ff ff       	call   5af <putc>
      state = 0;
 787:	be 00 00 00 00       	mov    $0x0,%esi
 78c:	e9 ef fe ff ff       	jmp    680 <printf+0x2c>
        putc(fd, '%');
 791:	ba 25 00 00 00       	mov    $0x25,%edx
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	e8 11 fe ff ff       	call   5af <putc>
        putc(fd, c);
 79e:	89 fa                	mov    %edi,%edx
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	e8 07 fe ff ff       	call   5af <putc>
      state = 0;
 7a8:	be 00 00 00 00       	mov    $0x0,%esi
 7ad:	e9 ce fe ff ff       	jmp    680 <printf+0x2c>
    }
  }
}
 7b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b5:	5b                   	pop    %ebx
 7b6:	5e                   	pop    %esi
 7b7:	5f                   	pop    %edi
 7b8:	5d                   	pop    %ebp
 7b9:	c3                   	ret    

000007ba <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ba:	55                   	push   %ebp
 7bb:	89 e5                	mov    %esp,%ebp
 7bd:	57                   	push   %edi
 7be:	56                   	push   %esi
 7bf:	53                   	push   %ebx
 7c0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c6:	a1 74 0d 00 00       	mov    0xd74,%eax
 7cb:	eb 02                	jmp    7cf <free+0x15>
 7cd:	89 d0                	mov    %edx,%eax
 7cf:	39 c8                	cmp    %ecx,%eax
 7d1:	73 04                	jae    7d7 <free+0x1d>
 7d3:	39 08                	cmp    %ecx,(%eax)
 7d5:	77 12                	ja     7e9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d7:	8b 10                	mov    (%eax),%edx
 7d9:	39 c2                	cmp    %eax,%edx
 7db:	77 f0                	ja     7cd <free+0x13>
 7dd:	39 c8                	cmp    %ecx,%eax
 7df:	72 08                	jb     7e9 <free+0x2f>
 7e1:	39 ca                	cmp    %ecx,%edx
 7e3:	77 04                	ja     7e9 <free+0x2f>
 7e5:	89 d0                	mov    %edx,%eax
 7e7:	eb e6                	jmp    7cf <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ec:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ef:	8b 10                	mov    (%eax),%edx
 7f1:	39 d7                	cmp    %edx,%edi
 7f3:	74 19                	je     80e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f8:	8b 50 04             	mov    0x4(%eax),%edx
 7fb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7fe:	39 ce                	cmp    %ecx,%esi
 800:	74 1b                	je     81d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 802:	89 08                	mov    %ecx,(%eax)
  freep = p;
 804:	a3 74 0d 00 00       	mov    %eax,0xd74
}
 809:	5b                   	pop    %ebx
 80a:	5e                   	pop    %esi
 80b:	5f                   	pop    %edi
 80c:	5d                   	pop    %ebp
 80d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 80e:	03 72 04             	add    0x4(%edx),%esi
 811:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 814:	8b 10                	mov    (%eax),%edx
 816:	8b 12                	mov    (%edx),%edx
 818:	89 53 f8             	mov    %edx,-0x8(%ebx)
 81b:	eb db                	jmp    7f8 <free+0x3e>
    p->s.size += bp->s.size;
 81d:	03 53 fc             	add    -0x4(%ebx),%edx
 820:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 823:	8b 53 f8             	mov    -0x8(%ebx),%edx
 826:	89 10                	mov    %edx,(%eax)
 828:	eb da                	jmp    804 <free+0x4a>

0000082a <morecore>:

static Header*
morecore(uint nu)
{
 82a:	55                   	push   %ebp
 82b:	89 e5                	mov    %esp,%ebp
 82d:	53                   	push   %ebx
 82e:	83 ec 04             	sub    $0x4,%esp
 831:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 833:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 838:	77 05                	ja     83f <morecore+0x15>
    nu = 4096;
 83a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 83f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 846:	83 ec 0c             	sub    $0xc,%esp
 849:	50                   	push   %eax
 84a:	e8 38 fd ff ff       	call   587 <sbrk>
  if(p == (char*)-1)
 84f:	83 c4 10             	add    $0x10,%esp
 852:	83 f8 ff             	cmp    $0xffffffff,%eax
 855:	74 1c                	je     873 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 857:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85a:	83 c0 08             	add    $0x8,%eax
 85d:	83 ec 0c             	sub    $0xc,%esp
 860:	50                   	push   %eax
 861:	e8 54 ff ff ff       	call   7ba <free>
  return freep;
 866:	a1 74 0d 00 00       	mov    0xd74,%eax
 86b:	83 c4 10             	add    $0x10,%esp
}
 86e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 871:	c9                   	leave  
 872:	c3                   	ret    
    return 0;
 873:	b8 00 00 00 00       	mov    $0x0,%eax
 878:	eb f4                	jmp    86e <morecore+0x44>

0000087a <malloc>:

void*
malloc(uint nbytes)
{
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	53                   	push   %ebx
 87e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	8d 58 07             	lea    0x7(%eax),%ebx
 887:	c1 eb 03             	shr    $0x3,%ebx
 88a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 88d:	8b 0d 74 0d 00 00    	mov    0xd74,%ecx
 893:	85 c9                	test   %ecx,%ecx
 895:	74 04                	je     89b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 897:	8b 01                	mov    (%ecx),%eax
 899:	eb 4a                	jmp    8e5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 89b:	c7 05 74 0d 00 00 78 	movl   $0xd78,0xd74
 8a2:	0d 00 00 
 8a5:	c7 05 78 0d 00 00 78 	movl   $0xd78,0xd78
 8ac:	0d 00 00 
    base.s.size = 0;
 8af:	c7 05 7c 0d 00 00 00 	movl   $0x0,0xd7c
 8b6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8b9:	b9 78 0d 00 00       	mov    $0xd78,%ecx
 8be:	eb d7                	jmp    897 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8c0:	74 19                	je     8db <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8c2:	29 da                	sub    %ebx,%edx
 8c4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ca:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8cd:	89 0d 74 0d 00 00    	mov    %ecx,0xd74
      return (void*)(p + 1);
 8d3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d9:	c9                   	leave  
 8da:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8db:	8b 10                	mov    (%eax),%edx
 8dd:	89 11                	mov    %edx,(%ecx)
 8df:	eb ec                	jmp    8cd <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e1:	89 c1                	mov    %eax,%ecx
 8e3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e5:	8b 50 04             	mov    0x4(%eax),%edx
 8e8:	39 da                	cmp    %ebx,%edx
 8ea:	73 d4                	jae    8c0 <malloc+0x46>
    if(p == freep)
 8ec:	39 05 74 0d 00 00    	cmp    %eax,0xd74
 8f2:	75 ed                	jne    8e1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f4:	89 d8                	mov    %ebx,%eax
 8f6:	e8 2f ff ff ff       	call   82a <morecore>
 8fb:	85 c0                	test   %eax,%eax
 8fd:	75 e2                	jne    8e1 <malloc+0x67>
 8ff:	eb d5                	jmp    8d6 <malloc+0x5c>
