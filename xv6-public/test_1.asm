
_test_1:     file format elf32-i386


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
   assert(global == 1);
   6:	a1 e0 0c 00 00       	mov    0xce0,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 35                	push   $0x35
  12:	68 68 08 00 00       	push   $0x868
  17:	68 71 08 00 00       	push   $0x871
  1c:	6a 01                	push   $0x1
  1e:	e8 96 05 00 00       	call   5b9 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 79 08 00 00       	push   $0x879
  2b:	68 85 08 00 00       	push   $0x885
  30:	6a 01                	push   $0x1
  32:	e8 82 05 00 00       	call   5b9 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 99 08 00 00       	push   $0x899
  3f:	6a 01                	push   $0x1
  41:	e8 73 05 00 00       	call   5b9 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 e4 0c 00 00    	push   0xce4
  4f:	e8 40 04 00 00       	call   494 <kill>
  54:	e8 0b 04 00 00       	call   464 <exit>
   global = 5;
  59:	c7 05 e0 0c 00 00 05 	movl   $0x5,0xce0
  60:	00 00 00 
   exit();
  63:	e8 fc 03 00 00       	call   464 <exit>

00000068 <main>:
{
  68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	ff 71 fc             	push   -0x4(%ecx)
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	56                   	push   %esi
  76:	53                   	push   %ebx
  77:	51                   	push   %ecx
  78:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  7b:	e8 64 04 00 00       	call   4e4 <getpid>
  80:	a3 e4 0c 00 00       	mov    %eax,0xce4
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 4d 07 00 00       	call   7df <malloc>
   assert(p != NULL);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	74 14                	je     ad <main+0x45>
  99:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  9b:	25 ff 0f 00 00       	and    $0xfff,%eax
  a0:	74 54                	je     f6 <main+0x8e>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a2:	be 00 10 00 00       	mov    $0x1000,%esi
  a7:	29 c6                	sub    %eax,%esi
  a9:	01 de                	add    %ebx,%esi
  ab:	eb 4b                	jmp    f8 <main+0x90>
   assert(p != NULL);
  ad:	6a 1c                	push   $0x1c
  af:	68 68 08 00 00       	push   $0x868
  b4:	68 71 08 00 00       	push   $0x871
  b9:	6a 01                	push   $0x1
  bb:	e8 f9 04 00 00       	call   5b9 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 a6 08 00 00       	push   $0x8a6
  c8:	68 85 08 00 00       	push   $0x885
  cd:	6a 01                	push   $0x1
  cf:	e8 e5 04 00 00       	call   5b9 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 99 08 00 00       	push   $0x899
  dc:	6a 01                	push   $0x1
  de:	e8 d6 04 00 00       	call   5b9 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 e4 0c 00 00    	push   0xce4
  ec:	e8 a3 03 00 00       	call   494 <kill>
  f1:	e8 6e 03 00 00       	call   464 <exit>
     stack = p;
  f6:	89 de                	mov    %ebx,%esi
   printf(1, "about to do clone\n");
  f8:	83 ec 08             	sub    $0x8,%esp
  fb:	68 b0 08 00 00       	push   $0x8b0
 100:	6a 01                	push   $0x1
 102:	e8 b2 04 00 00       	call   5b9 <printf>
   int clone_pid = clone(worker, 0, 0, stack);
 107:	56                   	push   %esi
 108:	6a 00                	push   $0x0
 10a:	6a 00                	push   $0x0
 10c:	68 00 00 00 00       	push   $0x0
 111:	e8 ee 03 00 00       	call   504 <clone>
 116:	89 c6                	mov    %eax,%esi
   printf(1, "just cloned\n");
 118:	83 c4 18             	add    $0x18,%esp
 11b:	68 c3 08 00 00       	push   $0x8c3
 120:	6a 01                	push   $0x1
 122:	e8 92 04 00 00       	call   5b9 <printf>
   assert(clone_pid > 0);
 127:	83 c4 10             	add    $0x10,%esp
 12a:	85 f6                	test   %esi,%esi
 12c:	0f 8e 87 00 00 00    	jle    1b9 <main+0x151>
   while(global != 5);
 132:	a1 e0 0c 00 00       	mov    0xce0,%eax
 137:	83 f8 05             	cmp    $0x5,%eax
 13a:	75 f6                	jne    132 <main+0xca>
   printf(1, "TEST PASSED\n");
 13c:	83 ec 08             	sub    $0x8,%esp
 13f:	68 de 08 00 00       	push   $0x8de
 144:	6a 01                	push   $0x1
 146:	e8 6e 04 00 00       	call   5b9 <printf>
   printf(1, "about to join\n");
 14b:	83 c4 08             	add    $0x8,%esp
 14e:	68 eb 08 00 00       	push   $0x8eb
 153:	6a 01                	push   $0x1
 155:	e8 5f 04 00 00       	call   5b9 <printf>
   int join_pid = join(&join_stack);
 15a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 15d:	89 04 24             	mov    %eax,(%esp)
 160:	e8 a7 03 00 00       	call   50c <join>
   assert(join_pid == clone_pid);
 165:	83 c4 10             	add    $0x10,%esp
 168:	39 c6                	cmp    %eax,%esi
 16a:	0f 84 92 00 00 00    	je     202 <main+0x19a>
 170:	6a 2e                	push   $0x2e
 172:	68 68 08 00 00       	push   $0x868
 177:	68 71 08 00 00       	push   $0x871
 17c:	6a 01                	push   $0x1
 17e:	e8 36 04 00 00       	call   5b9 <printf>
 183:	83 c4 0c             	add    $0xc,%esp
 186:	68 fa 08 00 00       	push   $0x8fa
 18b:	68 85 08 00 00       	push   $0x885
 190:	6a 01                	push   $0x1
 192:	e8 22 04 00 00       	call   5b9 <printf>
 197:	83 c4 08             	add    $0x8,%esp
 19a:	68 99 08 00 00       	push   $0x899
 19f:	6a 01                	push   $0x1
 1a1:	e8 13 04 00 00       	call   5b9 <printf>
 1a6:	83 c4 04             	add    $0x4,%esp
 1a9:	ff 35 e4 0c 00 00    	push   0xce4
 1af:	e8 e0 02 00 00       	call   494 <kill>
 1b4:	e8 ab 02 00 00       	call   464 <exit>
   assert(clone_pid > 0);
 1b9:	6a 27                	push   $0x27
 1bb:	68 68 08 00 00       	push   $0x868
 1c0:	68 71 08 00 00       	push   $0x871
 1c5:	6a 01                	push   $0x1
 1c7:	e8 ed 03 00 00       	call   5b9 <printf>
 1cc:	83 c4 0c             	add    $0xc,%esp
 1cf:	68 d0 08 00 00       	push   $0x8d0
 1d4:	68 85 08 00 00       	push   $0x885
 1d9:	6a 01                	push   $0x1
 1db:	e8 d9 03 00 00       	call   5b9 <printf>
 1e0:	83 c4 08             	add    $0x8,%esp
 1e3:	68 99 08 00 00       	push   $0x899
 1e8:	6a 01                	push   $0x1
 1ea:	e8 ca 03 00 00       	call   5b9 <printf>
 1ef:	83 c4 04             	add    $0x4,%esp
 1f2:	ff 35 e4 0c 00 00    	push   0xce4
 1f8:	e8 97 02 00 00       	call   494 <kill>
 1fd:	e8 62 02 00 00       	call   464 <exit>
   free(p);
 202:	83 ec 0c             	sub    $0xc,%esp
 205:	53                   	push   %ebx
 206:	e8 14 05 00 00       	call   71f <free>
   exit();
 20b:	e8 54 02 00 00       	call   464 <exit>

00000210 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	8b 75 08             	mov    0x8(%ebp),%esi
 218:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 21b:	89 f0                	mov    %esi,%eax
 21d:	89 d1                	mov    %edx,%ecx
 21f:	83 c2 01             	add    $0x1,%edx
 222:	89 c3                	mov    %eax,%ebx
 224:	83 c0 01             	add    $0x1,%eax
 227:	0f b6 09             	movzbl (%ecx),%ecx
 22a:	88 0b                	mov    %cl,(%ebx)
 22c:	84 c9                	test   %cl,%cl
 22e:	75 ed                	jne    21d <strcpy+0xd>
    ;
  return os;
}
 230:	89 f0                	mov    %esi,%eax
 232:	5b                   	pop    %ebx
 233:	5e                   	pop    %esi
 234:	5d                   	pop    %ebp
 235:	c3                   	ret    

00000236 <strcmp>:

int strcmp(const char *p, const char *q)
{
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	8b 4d 08             	mov    0x8(%ebp),%ecx
 23c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 23f:	eb 06                	jmp    247 <strcmp+0x11>
    p++, q++;
 241:	83 c1 01             	add    $0x1,%ecx
 244:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 247:	0f b6 01             	movzbl (%ecx),%eax
 24a:	84 c0                	test   %al,%al
 24c:	74 04                	je     252 <strcmp+0x1c>
 24e:	3a 02                	cmp    (%edx),%al
 250:	74 ef                	je     241 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 252:	0f b6 c0             	movzbl %al,%eax
 255:	0f b6 12             	movzbl (%edx),%edx
 258:	29 d0                	sub    %edx,%eax
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    

0000025c <strlen>:

uint strlen(const char *s)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 262:	b8 00 00 00 00       	mov    $0x0,%eax
 267:	eb 03                	jmp    26c <strlen+0x10>
 269:	83 c0 01             	add    $0x1,%eax
 26c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 270:	75 f7                	jne    269 <strlen+0xd>
    ;
  return n;
}
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <memset>:

void *
memset(void *dst, int c, uint n)
{
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	57                   	push   %edi
 278:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 27b:	89 d7                	mov    %edx,%edi
 27d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 280:	8b 45 0c             	mov    0xc(%ebp),%eax
 283:	fc                   	cld    
 284:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 286:	89 d0                	mov    %edx,%eax
 288:	8b 7d fc             	mov    -0x4(%ebp),%edi
 28b:	c9                   	leave  
 28c:	c3                   	ret    

0000028d <strchr>:

char *
strchr(const char *s, char c)
{
 28d:	55                   	push   %ebp
 28e:	89 e5                	mov    %esp,%ebp
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 297:	eb 03                	jmp    29c <strchr+0xf>
 299:	83 c0 01             	add    $0x1,%eax
 29c:	0f b6 10             	movzbl (%eax),%edx
 29f:	84 d2                	test   %dl,%dl
 2a1:	74 06                	je     2a9 <strchr+0x1c>
    if (*s == c)
 2a3:	38 ca                	cmp    %cl,%dl
 2a5:	75 f2                	jne    299 <strchr+0xc>
 2a7:	eb 05                	jmp    2ae <strchr+0x21>
      return (char *)s;
  return 0;
 2a9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    

000002b0 <gets>:

char *
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
 2b6:	83 ec 1c             	sub    $0x1c,%esp
 2b9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 2bc:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c1:	89 de                	mov    %ebx,%esi
 2c3:	83 c3 01             	add    $0x1,%ebx
 2c6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c9:	7d 2e                	jge    2f9 <gets+0x49>
  {
    cc = read(0, &c, 1);
 2cb:	83 ec 04             	sub    $0x4,%esp
 2ce:	6a 01                	push   $0x1
 2d0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d3:	50                   	push   %eax
 2d4:	6a 00                	push   $0x0
 2d6:	e8 a1 01 00 00       	call   47c <read>
    if (cc < 1)
 2db:	83 c4 10             	add    $0x10,%esp
 2de:	85 c0                	test   %eax,%eax
 2e0:	7e 17                	jle    2f9 <gets+0x49>
      break;
    buf[i++] = c;
 2e2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e6:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 2e9:	3c 0a                	cmp    $0xa,%al
 2eb:	0f 94 c2             	sete   %dl
 2ee:	3c 0d                	cmp    $0xd,%al
 2f0:	0f 94 c0             	sete   %al
 2f3:	08 c2                	or     %al,%dl
 2f5:	74 ca                	je     2c1 <gets+0x11>
    buf[i++] = c;
 2f7:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2f9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2fd:	89 f8                	mov    %edi,%eax
 2ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 302:	5b                   	pop    %ebx
 303:	5e                   	pop    %esi
 304:	5f                   	pop    %edi
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    

00000307 <stat>:

int stat(const char *n, struct stat *st)
{
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	56                   	push   %esi
 30b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 30c:	83 ec 08             	sub    $0x8,%esp
 30f:	6a 00                	push   $0x0
 311:	ff 75 08             	push   0x8(%ebp)
 314:	e8 8b 01 00 00       	call   4a4 <open>
  if (fd < 0)
 319:	83 c4 10             	add    $0x10,%esp
 31c:	85 c0                	test   %eax,%eax
 31e:	78 24                	js     344 <stat+0x3d>
 320:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 322:	83 ec 08             	sub    $0x8,%esp
 325:	ff 75 0c             	push   0xc(%ebp)
 328:	50                   	push   %eax
 329:	e8 8e 01 00 00       	call   4bc <fstat>
 32e:	89 c6                	mov    %eax,%esi
  close(fd);
 330:	89 1c 24             	mov    %ebx,(%esp)
 333:	e8 54 01 00 00       	call   48c <close>
  return r;
 338:	83 c4 10             	add    $0x10,%esp
}
 33b:	89 f0                	mov    %esi,%eax
 33d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 340:	5b                   	pop    %ebx
 341:	5e                   	pop    %esi
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    
    return -1;
 344:	be ff ff ff ff       	mov    $0xffffffff,%esi
 349:	eb f0                	jmp    33b <stat+0x34>

0000034b <atoi>:

int atoi(const char *s)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 352:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 357:	eb 10                	jmp    369 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 359:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 35c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 35f:	83 c1 01             	add    $0x1,%ecx
 362:	0f be c0             	movsbl %al,%eax
 365:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 369:	0f b6 01             	movzbl (%ecx),%eax
 36c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 36f:	80 fb 09             	cmp    $0x9,%bl
 372:	76 e5                	jbe    359 <atoi+0xe>
  return n;
}
 374:	89 d0                	mov    %edx,%eax
 376:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 379:	c9                   	leave  
 37a:	c3                   	ret    

0000037b <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
 37e:	56                   	push   %esi
 37f:	53                   	push   %ebx
 380:	8b 75 08             	mov    0x8(%ebp),%esi
 383:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 386:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 389:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 38b:	eb 0d                	jmp    39a <memmove+0x1f>
    *dst++ = *src++;
 38d:	0f b6 01             	movzbl (%ecx),%eax
 390:	88 02                	mov    %al,(%edx)
 392:	8d 49 01             	lea    0x1(%ecx),%ecx
 395:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 398:	89 d8                	mov    %ebx,%eax
 39a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 39d:	85 c0                	test   %eax,%eax
 39f:	7f ec                	jg     38d <memmove+0x12>
  return vdst;
}
 3a1:	89 f0                	mov    %esi,%eax
 3a3:	5b                   	pop    %ebx
 3a4:	5e                   	pop    %esi
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    

000003a7 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 3a7:	55                   	push   %ebp
 3a8:	89 e5                	mov    %esp,%ebp
 3aa:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 3ad:	83 38 01             	cmpl   $0x1,(%eax)
 3b0:	74 fb                	je     3ad <lock_acquire+0x6>
    ;
  lock->flag = 1;
 3b2:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    

000003ba <lock_release>:
void lock_release(lock_t *lock)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    

000003c8 <lock_init>:
void lock_init(lock_t *lock)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 3cb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ce:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <thread_create>:
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	53                   	push   %ebx
 3da:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 3dd:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 3e0:	53                   	push   %ebx
 3e1:	e8 e2 ff ff ff       	call   3c8 <lock_init>
  lock_acquire(&lock);
 3e6:	89 1c 24             	mov    %ebx,(%esp)
 3e9:	e8 b9 ff ff ff       	call   3a7 <lock_acquire>
  void *stack = malloc(4096 * 2);
 3ee:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 3f5:	e8 e5 03 00 00       	call   7df <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 3fa:	50                   	push   %eax
 3fb:	ff 75 10             	push   0x10(%ebp)
 3fe:	ff 75 0c             	push   0xc(%ebp)
 401:	ff 75 08             	push   0x8(%ebp)
 404:	e8 fb 00 00 00       	call   504 <clone>
}
 409:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <thread_join>:
{
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	56                   	push   %esi
 412:	53                   	push   %ebx
 413:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 416:	6a 04                	push   $0x4
 418:	e8 c2 03 00 00       	call   7df <malloc>
 41d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 420:	8d 45 f4             	lea    -0xc(%ebp),%eax
 423:	89 04 24             	mov    %eax,(%esp)
 426:	e8 e1 00 00 00       	call   50c <join>
 42b:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 42d:	8d 75 f0             	lea    -0x10(%ebp),%esi
 430:	89 34 24             	mov    %esi,(%esp)
 433:	e8 90 ff ff ff       	call   3c8 <lock_init>
  lock_acquire(&lock);
 438:	89 34 24             	mov    %esi,(%esp)
 43b:	e8 67 ff ff ff       	call   3a7 <lock_acquire>
  free(stack);
 440:	83 c4 04             	add    $0x4,%esp
 443:	ff 75 f4             	push   -0xc(%ebp)
 446:	e8 d4 02 00 00       	call   71f <free>
  lock_release(&lock);
 44b:	89 34 24             	mov    %esi,(%esp)
 44e:	e8 67 ff ff ff       	call   3ba <lock_release>
}
 453:	89 d8                	mov    %ebx,%eax
 455:	8d 65 f8             	lea    -0x8(%ebp),%esp
 458:	5b                   	pop    %ebx
 459:	5e                   	pop    %esi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    

0000045c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45c:	b8 01 00 00 00       	mov    $0x1,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <exit>:
SYSCALL(exit)
 464:	b8 02 00 00 00       	mov    $0x2,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <wait>:
SYSCALL(wait)
 46c:	b8 03 00 00 00       	mov    $0x3,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <pipe>:
SYSCALL(pipe)
 474:	b8 04 00 00 00       	mov    $0x4,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <read>:
SYSCALL(read)
 47c:	b8 05 00 00 00       	mov    $0x5,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <write>:
SYSCALL(write)
 484:	b8 10 00 00 00       	mov    $0x10,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <close>:
SYSCALL(close)
 48c:	b8 15 00 00 00       	mov    $0x15,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <kill>:
SYSCALL(kill)
 494:	b8 06 00 00 00       	mov    $0x6,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <exec>:
SYSCALL(exec)
 49c:	b8 07 00 00 00       	mov    $0x7,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <open>:
SYSCALL(open)
 4a4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <mknod>:
SYSCALL(mknod)
 4ac:	b8 11 00 00 00       	mov    $0x11,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <unlink>:
SYSCALL(unlink)
 4b4:	b8 12 00 00 00       	mov    $0x12,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <fstat>:
SYSCALL(fstat)
 4bc:	b8 08 00 00 00       	mov    $0x8,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <link>:
SYSCALL(link)
 4c4:	b8 13 00 00 00       	mov    $0x13,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <mkdir>:
SYSCALL(mkdir)
 4cc:	b8 14 00 00 00       	mov    $0x14,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <chdir>:
SYSCALL(chdir)
 4d4:	b8 09 00 00 00       	mov    $0x9,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <dup>:
SYSCALL(dup)
 4dc:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <getpid>:
SYSCALL(getpid)
 4e4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <sbrk>:
SYSCALL(sbrk)
 4ec:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <sleep>:
SYSCALL(sleep)
 4f4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <uptime>:
SYSCALL(uptime)
 4fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <clone>:
SYSCALL(clone)
 504:	b8 16 00 00 00       	mov    $0x16,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <join>:
 50c:	b8 17 00 00 00       	mov    $0x17,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 1c             	sub    $0x1c,%esp
 51a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 51d:	6a 01                	push   $0x1
 51f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 522:	52                   	push   %edx
 523:	50                   	push   %eax
 524:	e8 5b ff ff ff       	call   484 <write>
}
 529:	83 c4 10             	add    $0x10,%esp
 52c:	c9                   	leave  
 52d:	c3                   	ret    

0000052e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 52e:	55                   	push   %ebp
 52f:	89 e5                	mov    %esp,%ebp
 531:	57                   	push   %edi
 532:	56                   	push   %esi
 533:	53                   	push   %ebx
 534:	83 ec 2c             	sub    $0x2c,%esp
 537:	89 45 d0             	mov    %eax,-0x30(%ebp)
 53a:	89 d0                	mov    %edx,%eax
 53c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 53e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 542:	0f 95 c1             	setne  %cl
 545:	c1 ea 1f             	shr    $0x1f,%edx
 548:	84 d1                	test   %dl,%cl
 54a:	74 44                	je     590 <printint+0x62>
    neg = 1;
    x = -xx;
 54c:	f7 d8                	neg    %eax
 54e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 550:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 557:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 55c:	89 c8                	mov    %ecx,%eax
 55e:	ba 00 00 00 00       	mov    $0x0,%edx
 563:	f7 f6                	div    %esi
 565:	89 df                	mov    %ebx,%edi
 567:	83 c3 01             	add    $0x1,%ebx
 56a:	0f b6 92 70 09 00 00 	movzbl 0x970(%edx),%edx
 571:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 575:	89 ca                	mov    %ecx,%edx
 577:	89 c1                	mov    %eax,%ecx
 579:	39 d6                	cmp    %edx,%esi
 57b:	76 df                	jbe    55c <printint+0x2e>
  if(neg)
 57d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 581:	74 31                	je     5b4 <printint+0x86>
    buf[i++] = '-';
 583:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 588:	8d 5f 02             	lea    0x2(%edi),%ebx
 58b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 58e:	eb 17                	jmp    5a7 <printint+0x79>
    x = xx;
 590:	89 c1                	mov    %eax,%ecx
  neg = 0;
 592:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 599:	eb bc                	jmp    557 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 59b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5a0:	89 f0                	mov    %esi,%eax
 5a2:	e8 6d ff ff ff       	call   514 <putc>
  while(--i >= 0)
 5a7:	83 eb 01             	sub    $0x1,%ebx
 5aa:	79 ef                	jns    59b <printint+0x6d>
}
 5ac:	83 c4 2c             	add    $0x2c,%esp
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    
 5b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b7:	eb ee                	jmp    5a7 <printint+0x79>

000005b9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b9:	55                   	push   %ebp
 5ba:	89 e5                	mov    %esp,%ebp
 5bc:	57                   	push   %edi
 5bd:	56                   	push   %esi
 5be:	53                   	push   %ebx
 5bf:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5c2:	8d 45 10             	lea    0x10(%ebp),%eax
 5c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5c8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5cd:	bb 00 00 00 00       	mov    $0x0,%ebx
 5d2:	eb 14                	jmp    5e8 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5d4:	89 fa                	mov    %edi,%edx
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	e8 36 ff ff ff       	call   514 <putc>
 5de:	eb 05                	jmp    5e5 <printf+0x2c>
      }
    } else if(state == '%'){
 5e0:	83 fe 25             	cmp    $0x25,%esi
 5e3:	74 25                	je     60a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5e5:	83 c3 01             	add    $0x1,%ebx
 5e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5eb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5ef:	84 c0                	test   %al,%al
 5f1:	0f 84 20 01 00 00    	je     717 <printf+0x15e>
    c = fmt[i] & 0xff;
 5f7:	0f be f8             	movsbl %al,%edi
 5fa:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5fd:	85 f6                	test   %esi,%esi
 5ff:	75 df                	jne    5e0 <printf+0x27>
      if(c == '%'){
 601:	83 f8 25             	cmp    $0x25,%eax
 604:	75 ce                	jne    5d4 <printf+0x1b>
        state = '%';
 606:	89 c6                	mov    %eax,%esi
 608:	eb db                	jmp    5e5 <printf+0x2c>
      if(c == 'd'){
 60a:	83 f8 25             	cmp    $0x25,%eax
 60d:	0f 84 cf 00 00 00    	je     6e2 <printf+0x129>
 613:	0f 8c dd 00 00 00    	jl     6f6 <printf+0x13d>
 619:	83 f8 78             	cmp    $0x78,%eax
 61c:	0f 8f d4 00 00 00    	jg     6f6 <printf+0x13d>
 622:	83 f8 63             	cmp    $0x63,%eax
 625:	0f 8c cb 00 00 00    	jl     6f6 <printf+0x13d>
 62b:	83 e8 63             	sub    $0x63,%eax
 62e:	83 f8 15             	cmp    $0x15,%eax
 631:	0f 87 bf 00 00 00    	ja     6f6 <printf+0x13d>
 637:	ff 24 85 18 09 00 00 	jmp    *0x918(,%eax,4)
        printint(fd, *ap, 10, 1);
 63e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 641:	8b 17                	mov    (%edi),%edx
 643:	83 ec 0c             	sub    $0xc,%esp
 646:	6a 01                	push   $0x1
 648:	b9 0a 00 00 00       	mov    $0xa,%ecx
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	e8 d9 fe ff ff       	call   52e <printint>
        ap++;
 655:	83 c7 04             	add    $0x4,%edi
 658:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 65b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 65e:	be 00 00 00 00       	mov    $0x0,%esi
 663:	eb 80                	jmp    5e5 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 665:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 668:	8b 17                	mov    (%edi),%edx
 66a:	83 ec 0c             	sub    $0xc,%esp
 66d:	6a 00                	push   $0x0
 66f:	b9 10 00 00 00       	mov    $0x10,%ecx
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	e8 b2 fe ff ff       	call   52e <printint>
        ap++;
 67c:	83 c7 04             	add    $0x4,%edi
 67f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 682:	83 c4 10             	add    $0x10,%esp
      state = 0;
 685:	be 00 00 00 00       	mov    $0x0,%esi
 68a:	e9 56 ff ff ff       	jmp    5e5 <printf+0x2c>
        s = (char*)*ap;
 68f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 692:	8b 30                	mov    (%eax),%esi
        ap++;
 694:	83 c0 04             	add    $0x4,%eax
 697:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 69a:	85 f6                	test   %esi,%esi
 69c:	75 15                	jne    6b3 <printf+0xfa>
          s = "(null)";
 69e:	be 10 09 00 00       	mov    $0x910,%esi
 6a3:	eb 0e                	jmp    6b3 <printf+0xfa>
          putc(fd, *s);
 6a5:	0f be d2             	movsbl %dl,%edx
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	e8 64 fe ff ff       	call   514 <putc>
          s++;
 6b0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6b3:	0f b6 16             	movzbl (%esi),%edx
 6b6:	84 d2                	test   %dl,%dl
 6b8:	75 eb                	jne    6a5 <printf+0xec>
      state = 0;
 6ba:	be 00 00 00 00       	mov    $0x0,%esi
 6bf:	e9 21 ff ff ff       	jmp    5e5 <printf+0x2c>
        putc(fd, *ap);
 6c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c7:	0f be 17             	movsbl (%edi),%edx
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	e8 42 fe ff ff       	call   514 <putc>
        ap++;
 6d2:	83 c7 04             	add    $0x4,%edi
 6d5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
 6dd:	e9 03 ff ff ff       	jmp    5e5 <printf+0x2c>
        putc(fd, c);
 6e2:	89 fa                	mov    %edi,%edx
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	e8 28 fe ff ff       	call   514 <putc>
      state = 0;
 6ec:	be 00 00 00 00       	mov    $0x0,%esi
 6f1:	e9 ef fe ff ff       	jmp    5e5 <printf+0x2c>
        putc(fd, '%');
 6f6:	ba 25 00 00 00       	mov    $0x25,%edx
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	e8 11 fe ff ff       	call   514 <putc>
        putc(fd, c);
 703:	89 fa                	mov    %edi,%edx
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	e8 07 fe ff ff       	call   514 <putc>
      state = 0;
 70d:	be 00 00 00 00       	mov    $0x0,%esi
 712:	e9 ce fe ff ff       	jmp    5e5 <printf+0x2c>
    }
  }
}
 717:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71a:	5b                   	pop    %ebx
 71b:	5e                   	pop    %esi
 71c:	5f                   	pop    %edi
 71d:	5d                   	pop    %ebp
 71e:	c3                   	ret    

0000071f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 71f:	55                   	push   %ebp
 720:	89 e5                	mov    %esp,%ebp
 722:	57                   	push   %edi
 723:	56                   	push   %esi
 724:	53                   	push   %ebx
 725:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 728:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72b:	a1 e8 0c 00 00       	mov    0xce8,%eax
 730:	eb 02                	jmp    734 <free+0x15>
 732:	89 d0                	mov    %edx,%eax
 734:	39 c8                	cmp    %ecx,%eax
 736:	73 04                	jae    73c <free+0x1d>
 738:	39 08                	cmp    %ecx,(%eax)
 73a:	77 12                	ja     74e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73c:	8b 10                	mov    (%eax),%edx
 73e:	39 c2                	cmp    %eax,%edx
 740:	77 f0                	ja     732 <free+0x13>
 742:	39 c8                	cmp    %ecx,%eax
 744:	72 08                	jb     74e <free+0x2f>
 746:	39 ca                	cmp    %ecx,%edx
 748:	77 04                	ja     74e <free+0x2f>
 74a:	89 d0                	mov    %edx,%eax
 74c:	eb e6                	jmp    734 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 74e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 751:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 754:	8b 10                	mov    (%eax),%edx
 756:	39 d7                	cmp    %edx,%edi
 758:	74 19                	je     773 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 75a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 763:	39 ce                	cmp    %ecx,%esi
 765:	74 1b                	je     782 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 767:	89 08                	mov    %ecx,(%eax)
  freep = p;
 769:	a3 e8 0c 00 00       	mov    %eax,0xce8
}
 76e:	5b                   	pop    %ebx
 76f:	5e                   	pop    %esi
 770:	5f                   	pop    %edi
 771:	5d                   	pop    %ebp
 772:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 773:	03 72 04             	add    0x4(%edx),%esi
 776:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 779:	8b 10                	mov    (%eax),%edx
 77b:	8b 12                	mov    (%edx),%edx
 77d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 780:	eb db                	jmp    75d <free+0x3e>
    p->s.size += bp->s.size;
 782:	03 53 fc             	add    -0x4(%ebx),%edx
 785:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 788:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78b:	89 10                	mov    %edx,(%eax)
 78d:	eb da                	jmp    769 <free+0x4a>

0000078f <morecore>:

static Header*
morecore(uint nu)
{
 78f:	55                   	push   %ebp
 790:	89 e5                	mov    %esp,%ebp
 792:	53                   	push   %ebx
 793:	83 ec 04             	sub    $0x4,%esp
 796:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 798:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 79d:	77 05                	ja     7a4 <morecore+0x15>
    nu = 4096;
 79f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7a4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	50                   	push   %eax
 7af:	e8 38 fd ff ff       	call   4ec <sbrk>
  if(p == (char*)-1)
 7b4:	83 c4 10             	add    $0x10,%esp
 7b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ba:	74 1c                	je     7d8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7bf:	83 c0 08             	add    $0x8,%eax
 7c2:	83 ec 0c             	sub    $0xc,%esp
 7c5:	50                   	push   %eax
 7c6:	e8 54 ff ff ff       	call   71f <free>
  return freep;
 7cb:	a1 e8 0c 00 00       	mov    0xce8,%eax
 7d0:	83 c4 10             	add    $0x10,%esp
}
 7d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7d6:	c9                   	leave  
 7d7:	c3                   	ret    
    return 0;
 7d8:	b8 00 00 00 00       	mov    $0x0,%eax
 7dd:	eb f4                	jmp    7d3 <morecore+0x44>

000007df <malloc>:

void*
malloc(uint nbytes)
{
 7df:	55                   	push   %ebp
 7e0:	89 e5                	mov    %esp,%ebp
 7e2:	53                   	push   %ebx
 7e3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e6:	8b 45 08             	mov    0x8(%ebp),%eax
 7e9:	8d 58 07             	lea    0x7(%eax),%ebx
 7ec:	c1 eb 03             	shr    $0x3,%ebx
 7ef:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7f2:	8b 0d e8 0c 00 00    	mov    0xce8,%ecx
 7f8:	85 c9                	test   %ecx,%ecx
 7fa:	74 04                	je     800 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fc:	8b 01                	mov    (%ecx),%eax
 7fe:	eb 4a                	jmp    84a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 800:	c7 05 e8 0c 00 00 ec 	movl   $0xcec,0xce8
 807:	0c 00 00 
 80a:	c7 05 ec 0c 00 00 ec 	movl   $0xcec,0xcec
 811:	0c 00 00 
    base.s.size = 0;
 814:	c7 05 f0 0c 00 00 00 	movl   $0x0,0xcf0
 81b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 81e:	b9 ec 0c 00 00       	mov    $0xcec,%ecx
 823:	eb d7                	jmp    7fc <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 825:	74 19                	je     840 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 827:	29 da                	sub    %ebx,%edx
 829:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 82c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 82f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 832:	89 0d e8 0c 00 00    	mov    %ecx,0xce8
      return (void*)(p + 1);
 838:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 83b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 83e:	c9                   	leave  
 83f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 840:	8b 10                	mov    (%eax),%edx
 842:	89 11                	mov    %edx,(%ecx)
 844:	eb ec                	jmp    832 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 846:	89 c1                	mov    %eax,%ecx
 848:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 84a:	8b 50 04             	mov    0x4(%eax),%edx
 84d:	39 da                	cmp    %ebx,%edx
 84f:	73 d4                	jae    825 <malloc+0x46>
    if(p == freep)
 851:	39 05 e8 0c 00 00    	cmp    %eax,0xce8
 857:	75 ed                	jne    846 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 859:	89 d8                	mov    %ebx,%eax
 85b:	e8 2f ff ff ff       	call   78f <morecore>
 860:	85 c0                	test   %eax,%eax
 862:	75 e2                	jne    846 <malloc+0x67>
 864:	eb d5                	jmp    83b <malloc+0x5c>
