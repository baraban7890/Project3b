
_test_9:     file format elf32-i386


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
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  13:	e8 4e 05 00 00       	call   566 <getpid>
   void *stack, *p = malloc(PGSIZE * 2);
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	68 00 20 00 00       	push   $0x2000
   ppid = getpid();
  20:	a3 44 0e 00 00       	mov    %eax,0xe44
   void *stack, *p = malloc(PGSIZE * 2);
  25:	e8 56 08 00 00       	call   880 <malloc>
   assert(p != NULL);
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	85 c0                	test   %eax,%eax
  2f:	0f 84 d3 00 00 00    	je     108 <main+0x108>
   if((uint)p % PGSIZE)
  35:	89 c2                	mov    %eax,%edx
  37:	89 c3                	mov    %eax,%ebx
  39:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  3f:	0f 85 8c 00 00 00    	jne    d1 <main+0xd1>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
   else
     stack = p;

   int clone_pid = clone(worker, stack, 0, stack);
  45:	50                   	push   %eax
  46:	6a 00                	push   $0x0
  48:	50                   	push   %eax
  49:	68 30 01 00 00       	push   $0x130
  4e:	e8 33 05 00 00       	call   586 <clone>
   assert(clone_pid > 0);
  53:	83 c4 10             	add    $0x10,%esp
   int clone_pid = clone(worker, stack, 0, stack);
  56:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  58:	85 c0                	test   %eax,%eax
  5a:	0f 8e 8b 00 00 00    	jle    eb <main+0xeb>
   while(global != 5);
  60:	8b 15 40 0e 00 00    	mov    0xe40,%edx
  66:	83 fa 05             	cmp    $0x5,%edx
  69:	75 f5                	jne    60 <main+0x60>
   printf(1, "TEST PASSED\n");
  6b:	50                   	push   %eax
  6c:	50                   	push   %eax
  6d:	68 c2 09 00 00       	push   $0x9c2
  72:	6a 01                	push   $0x1
  74:	e8 d7 05 00 00       	call   650 <printf>

   void *join_stack;
   int join_pid = join(&join_stack);
  79:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  7c:	89 04 24             	mov    %eax,(%esp)
  7f:	e8 0a 05 00 00       	call   58e <join>
   assert(join_pid == clone_pid);
  84:	83 c4 10             	add    $0x10,%esp
  87:	39 c6                	cmp    %eax,%esi
  89:	74 52                	je     dd <main+0xdd>
  8b:	6a 29                	push   $0x29
  8d:	68 78 09 00 00       	push   $0x978
  92:	68 81 09 00 00       	push   $0x981
  97:	6a 01                	push   $0x1
  99:	e8 b2 05 00 00       	call   650 <printf>
  9e:	83 c4 0c             	add    $0xc,%esp
  a1:	68 cf 09 00 00       	push   $0x9cf
   assert(clone_pid > 0);
  a6:	68 89 09 00 00       	push   $0x989
  ab:	6a 01                	push   $0x1
  ad:	e8 9e 05 00 00       	call   650 <printf>
  b2:	5a                   	pop    %edx
  b3:	59                   	pop    %ecx
  b4:	68 9d 09 00 00       	push   $0x99d
  b9:	6a 01                	push   $0x1
  bb:	e8 90 05 00 00       	call   650 <printf>
  c0:	5b                   	pop    %ebx
  c1:	ff 35 44 0e 00 00    	push   0xe44
  c7:	e8 4a 04 00 00       	call   516 <kill>
  cc:	e8 15 04 00 00       	call   4e6 <exit>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  d1:	29 d0                	sub    %edx,%eax
  d3:	05 00 10 00 00       	add    $0x1000,%eax
  d8:	e9 68 ff ff ff       	jmp    45 <main+0x45>
   free(p);
  dd:	83 ec 0c             	sub    $0xc,%esp
  e0:	53                   	push   %ebx
  e1:	e8 0a 07 00 00       	call   7f0 <free>
   exit();
  e6:	e8 fb 03 00 00       	call   4e6 <exit>
   assert(clone_pid > 0);
  eb:	6a 23                	push   $0x23
  ed:	68 78 09 00 00       	push   $0x978
  f2:	68 81 09 00 00       	push   $0x981
  f7:	6a 01                	push   $0x1
  f9:	e8 52 05 00 00       	call   650 <printf>
  fe:	83 c4 0c             	add    $0xc,%esp
 101:	68 b4 09 00 00       	push   $0x9b4
 106:	eb 9e                	jmp    a6 <main+0xa6>
   assert(p != NULL);
 108:	6a 1c                	push   $0x1c
 10a:	68 78 09 00 00       	push   $0x978
 10f:	68 81 09 00 00       	push   $0x981
 114:	6a 01                	push   $0x1
 116:	e8 35 05 00 00       	call   650 <printf>
 11b:	83 c4 0c             	add    $0xc,%esp
 11e:	68 aa 09 00 00       	push   $0x9aa
 123:	eb 81                	jmp    a6 <main+0xa6>
 125:	66 90                	xchg   %ax,%ax
 127:	66 90                	xchg   %ax,%ax
 129:	66 90                	xchg   %ax,%ax
 12b:	66 90                	xchg   %ax,%ax
 12d:	66 90                	xchg   %ax,%ax
 12f:	90                   	nop

00000130 <worker>:
}

void
worker(void *arg1, void *arg2) {
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	83 ec 08             	sub    $0x8,%esp
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	8d 4d 0c             	lea    0xc(%ebp),%ecx
 13c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
 142:	39 d1                	cmp    %edx,%ecx
 144:	75 7d                	jne    1c3 <worker+0x93>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
 146:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
 14c:	8d 4d 08             	lea    0x8(%ebp),%ecx
 14f:	39 d1                	cmp    %edx,%ecx
 151:	75 2a                	jne    17d <worker+0x4d>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
 153:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
 15a:	0f 84 80 00 00 00    	je     1e0 <worker+0xb0>
 160:	6a 32                	push   $0x32
 162:	68 78 09 00 00       	push   $0x978
 167:	68 81 09 00 00       	push   $0x981
 16c:	6a 01                	push   $0x1
 16e:	e8 dd 04 00 00       	call   650 <printf>
 173:	83 c4 0c             	add    $0xc,%esp
 176:	68 40 0a 00 00       	push   $0xa40
 17b:	eb 1b                	jmp    198 <worker+0x68>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
 17d:	6a 31                	push   $0x31
 17f:	68 78 09 00 00       	push   $0x978
 184:	68 81 09 00 00       	push   $0x981
 189:	6a 01                	push   $0x1
 18b:	e8 c0 04 00 00       	call   650 <printf>
 190:	83 c4 0c             	add    $0xc,%esp
 193:	68 14 0a 00 00       	push   $0xa14
 198:	68 89 09 00 00       	push   $0x989
 19d:	6a 01                	push   $0x1
 19f:	e8 ac 04 00 00       	call   650 <printf>
 1a4:	58                   	pop    %eax
 1a5:	5a                   	pop    %edx
 1a6:	68 9d 09 00 00       	push   $0x99d
 1ab:	6a 01                	push   $0x1
 1ad:	e8 9e 04 00 00       	call   650 <printf>
 1b2:	59                   	pop    %ecx
 1b3:	ff 35 44 0e 00 00    	push   0xe44
 1b9:	e8 58 03 00 00       	call   516 <kill>
 1be:	e8 23 03 00 00       	call   4e6 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
 1c3:	6a 30                	push   $0x30
 1c5:	68 78 09 00 00       	push   $0x978
 1ca:	68 81 09 00 00       	push   $0x981
 1cf:	6a 01                	push   $0x1
 1d1:	e8 7a 04 00 00       	call   650 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 e8 09 00 00       	push   $0x9e8
 1de:	eb b8                	jmp    198 <worker+0x68>
   global = 5;
 1e0:	c7 05 40 0e 00 00 05 	movl   $0x5,0xe40
 1e7:	00 00 00 
   exit();
 1ea:	e8 f7 02 00 00       	call   4e6 <exit>
 1ef:	90                   	nop

000001f0 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 1f0:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 1f1:	31 c0                	xor    %eax,%eax
{
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	53                   	push   %ebx
 1f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 200:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 204:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 207:	83 c0 01             	add    $0x1,%eax
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 20e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 211:	89 c8                	mov    %ecx,%eax
 213:	c9                   	leave  
 214:	c3                   	ret    
 215:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <strcmp>:

int strcmp(const char *p, const char *q)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 22a:	0f b6 02             	movzbl (%edx),%eax
 22d:	84 c0                	test   %al,%al
 22f:	75 17                	jne    248 <strcmp+0x28>
 231:	eb 3a                	jmp    26d <strcmp+0x4d>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 23c:	83 c2 01             	add    $0x1,%edx
 23f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 242:	84 c0                	test   %al,%al
 244:	74 1a                	je     260 <strcmp+0x40>
    p++, q++;
 246:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 248:	0f b6 19             	movzbl (%ecx),%ebx
 24b:	38 c3                	cmp    %al,%bl
 24d:	74 e9                	je     238 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 24f:	29 d8                	sub    %ebx,%eax
}
 251:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 254:	c9                   	leave  
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 260:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 264:	31 c0                	xor    %eax,%eax
 266:	29 d8                	sub    %ebx,%eax
}
 268:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 26b:	c9                   	leave  
 26c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 26d:	0f b6 19             	movzbl (%ecx),%ebx
 270:	31 c0                	xor    %eax,%eax
 272:	eb db                	jmp    24f <strcmp+0x2f>
 274:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <strlen>:

uint strlen(const char *s)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 286:	80 3a 00             	cmpb   $0x0,(%edx)
 289:	74 15                	je     2a0 <strlen+0x20>
 28b:	31 c0                	xor    %eax,%eax
 28d:	8d 76 00             	lea    0x0(%esi),%esi
 290:	83 c0 01             	add    $0x1,%eax
 293:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 297:	89 c1                	mov    %eax,%ecx
 299:	75 f5                	jne    290 <strlen+0x10>
    ;
  return n;
}
 29b:	89 c8                	mov    %ecx,%eax
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    
 29f:	90                   	nop
  for (n = 0; s[n]; n++)
 2a0:	31 c9                	xor    %ecx,%ecx
}
 2a2:	5d                   	pop    %ebp
 2a3:	89 c8                	mov    %ecx,%eax
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 d7                	mov    %edx,%edi
 2bf:	fc                   	cld    
 2c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2c5:	89 d0                	mov    %edx,%eax
 2c7:	c9                   	leave  
 2c8:	c3                   	ret    
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <strchr>:

char *
strchr(const char *s, char c)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 2da:	0f b6 10             	movzbl (%eax),%edx
 2dd:	84 d2                	test   %dl,%dl
 2df:	75 12                	jne    2f3 <strchr+0x23>
 2e1:	eb 1d                	jmp    300 <strchr+0x30>
 2e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e7:	90                   	nop
 2e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	84 d2                	test   %dl,%dl
 2f1:	74 0d                	je     300 <strchr+0x30>
    if (*s == c)
 2f3:	38 d1                	cmp    %dl,%cl
 2f5:	75 f1                	jne    2e8 <strchr+0x18>
      return (char *)s;
  return 0;
}
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 300:	31 c0                	xor    %eax,%eax
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <gets>:

char *
gets(char *buf, int max)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 315:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 318:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 319:	31 db                	xor    %ebx,%ebx
{
 31b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 31e:	eb 27                	jmp    347 <gets+0x37>
    cc = read(0, &c, 1);
 320:	83 ec 04             	sub    $0x4,%esp
 323:	6a 01                	push   $0x1
 325:	57                   	push   %edi
 326:	6a 00                	push   $0x0
 328:	e8 d1 01 00 00       	call   4fe <read>
    if (cc < 1)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	7e 1d                	jle    351 <gets+0x41>
      break;
    buf[i++] = c;
 334:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 338:	8b 55 08             	mov    0x8(%ebp),%edx
 33b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 33f:	3c 0a                	cmp    $0xa,%al
 341:	74 1d                	je     360 <gets+0x50>
 343:	3c 0d                	cmp    $0xd,%al
 345:	74 19                	je     360 <gets+0x50>
  for (i = 0; i + 1 < max;)
 347:	89 de                	mov    %ebx,%esi
 349:	83 c3 01             	add    $0x1,%ebx
 34c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 34f:	7c cf                	jl     320 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 358:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35b:	5b                   	pop    %ebx
 35c:	5e                   	pop    %esi
 35d:	5f                   	pop    %edi
 35e:	5d                   	pop    %ebp
 35f:	c3                   	ret    
  buf[i] = '\0';
 360:	8b 45 08             	mov    0x8(%ebp),%eax
 363:	89 de                	mov    %ebx,%esi
 365:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 369:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36c:	5b                   	pop    %ebx
 36d:	5e                   	pop    %esi
 36e:	5f                   	pop    %edi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <stat>:

int stat(const char *n, struct stat *st)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 385:	83 ec 08             	sub    $0x8,%esp
 388:	6a 00                	push   $0x0
 38a:	ff 75 08             	push   0x8(%ebp)
 38d:	e8 94 01 00 00       	call   526 <open>
  if (fd < 0)
 392:	83 c4 10             	add    $0x10,%esp
 395:	85 c0                	test   %eax,%eax
 397:	78 27                	js     3c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	ff 75 0c             	push   0xc(%ebp)
 39f:	89 c3                	mov    %eax,%ebx
 3a1:	50                   	push   %eax
 3a2:	e8 97 01 00 00       	call   53e <fstat>
  close(fd);
 3a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3aa:	89 c6                	mov    %eax,%esi
  close(fd);
 3ac:	e8 5d 01 00 00       	call   50e <close>
  return r;
 3b1:	83 c4 10             	add    $0x10,%esp
}
 3b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3c5:	eb ed                	jmp    3b4 <stat+0x34>
 3c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ce:	66 90                	xchg   %ax,%ax

000003d0 <atoi>:

int atoi(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 3d7:	0f be 02             	movsbl (%edx),%eax
 3da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 3e5:	77 1e                	ja     405 <atoi+0x35>
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 3fa:	0f be 02             	movsbl (%edx),%eax
 3fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 400:	80 fb 09             	cmp    $0x9,%bl
 403:	76 eb                	jbe    3f0 <atoi+0x20>
  return n;
}
 405:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 408:	89 c8                	mov    %ecx,%eax
 40a:	c9                   	leave  
 40b:	c3                   	ret    
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 45 10             	mov    0x10(%ebp),%eax
 417:	8b 55 08             	mov    0x8(%ebp),%edx
 41a:	56                   	push   %esi
 41b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 41e:	85 c0                	test   %eax,%eax
 420:	7e 13                	jle    435 <memmove+0x25>
 422:	01 d0                	add    %edx,%eax
  dst = vdst;
 424:	89 d7                	mov    %edx,%edi
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 430:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 431:	39 f8                	cmp    %edi,%eax
 433:	75 fb                	jne    430 <memmove+0x20>
  return vdst;
}
 435:	5e                   	pop    %esi
 436:	89 d0                	mov    %edx,%eax
 438:	5f                   	pop    %edi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    
 43b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 446:	68 00 20 00 00       	push   $0x2000
 44b:	e8 30 04 00 00       	call   880 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 450:	50                   	push   %eax
 451:	ff 75 10             	push   0x10(%ebp)
 454:	ff 75 0c             	push   0xc(%ebp)
 457:	ff 75 08             	push   0x8(%ebp)
 45a:	e8 27 01 00 00       	call   586 <clone>

  return pid;
}
 45f:	c9                   	leave  
 460:	c3                   	ret    
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <thread_join>:

int thread_join()
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 477:	6a 04                	push   $0x4
 479:	e8 02 04 00 00       	call   880 <malloc>
 47e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 481:	8d 45 f4             	lea    -0xc(%ebp),%eax
 484:	89 04 24             	mov    %eax,(%esp)
 487:	e8 02 01 00 00       	call   58e <join>
 48c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 48e:	58                   	pop    %eax
 48f:	ff 75 f4             	push   -0xc(%ebp)
 492:	e8 59 03 00 00       	call   7f0 <free>
  lock_release(&lock);

  return pid;
}
 497:	89 d8                	mov    %ebx,%eax
 499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49c:	c9                   	leave  
 49d:	c3                   	ret    
 49e:	66 90                	xchg   %ax,%ax

000004a0 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 4a6:	83 38 01             	cmpl   $0x1,(%eax)
 4a9:	75 05                	jne    4b0 <lock_acquire+0x10>
 4ab:	eb fe                	jmp    4ab <lock_acquire+0xb>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 4b0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop

000004c0 <lock_release>:
void lock_release(lock_t *lock)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4cc:	5d                   	pop    %ebp
 4cd:	c3                   	ret    
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <lock_init>:
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4de:	b8 01 00 00 00       	mov    $0x1,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <exit>:
SYSCALL(exit)
 4e6:	b8 02 00 00 00       	mov    $0x2,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <wait>:
SYSCALL(wait)
 4ee:	b8 03 00 00 00       	mov    $0x3,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <pipe>:
SYSCALL(pipe)
 4f6:	b8 04 00 00 00       	mov    $0x4,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <read>:
SYSCALL(read)
 4fe:	b8 05 00 00 00       	mov    $0x5,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <write>:
SYSCALL(write)
 506:	b8 10 00 00 00       	mov    $0x10,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <close>:
SYSCALL(close)
 50e:	b8 15 00 00 00       	mov    $0x15,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <kill>:
SYSCALL(kill)
 516:	b8 06 00 00 00       	mov    $0x6,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <exec>:
SYSCALL(exec)
 51e:	b8 07 00 00 00       	mov    $0x7,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <open>:
SYSCALL(open)
 526:	b8 0f 00 00 00       	mov    $0xf,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <mknod>:
SYSCALL(mknod)
 52e:	b8 11 00 00 00       	mov    $0x11,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <unlink>:
SYSCALL(unlink)
 536:	b8 12 00 00 00       	mov    $0x12,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <fstat>:
SYSCALL(fstat)
 53e:	b8 08 00 00 00       	mov    $0x8,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <link>:
SYSCALL(link)
 546:	b8 13 00 00 00       	mov    $0x13,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <mkdir>:
SYSCALL(mkdir)
 54e:	b8 14 00 00 00       	mov    $0x14,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <chdir>:
SYSCALL(chdir)
 556:	b8 09 00 00 00       	mov    $0x9,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <dup>:
SYSCALL(dup)
 55e:	b8 0a 00 00 00       	mov    $0xa,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <getpid>:
SYSCALL(getpid)
 566:	b8 0b 00 00 00       	mov    $0xb,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <sbrk>:
SYSCALL(sbrk)
 56e:	b8 0c 00 00 00       	mov    $0xc,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <sleep>:
SYSCALL(sleep)
 576:	b8 0d 00 00 00       	mov    $0xd,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <uptime>:
SYSCALL(uptime)
 57e:	b8 0e 00 00 00       	mov    $0xe,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <clone>:
SYSCALL(clone)
 586:	b8 16 00 00 00       	mov    $0x16,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <join>:
 58e:	b8 17 00 00 00       	mov    $0x17,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    
 596:	66 90                	xchg   %ax,%ax
 598:	66 90                	xchg   %ax,%ax
 59a:	66 90                	xchg   %ax,%ax
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ac:	89 d1                	mov    %edx,%ecx
{
 5ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5b1:	85 d2                	test   %edx,%edx
 5b3:	0f 89 7f 00 00 00    	jns    638 <printint+0x98>
 5b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5bd:	74 79                	je     638 <printint+0x98>
    neg = 1;
 5bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5c8:	31 db                	xor    %ebx,%ebx
 5ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	89 cf                	mov    %ecx,%edi
 5d6:	f7 75 c4             	divl   -0x3c(%ebp)
 5d9:	0f b6 92 d0 0a 00 00 	movzbl 0xad0(%edx),%edx
 5e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5f1:	76 dd                	jbe    5d0 <printint+0x30>
  if(neg)
 5f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5f6:	85 c9                	test   %ecx,%ecx
 5f8:	74 0c                	je     606 <printint+0x66>
    buf[i++] = '-';
 5fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 601:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 606:	8b 7d b8             	mov    -0x48(%ebp),%edi
 609:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 60d:	eb 07                	jmp    616 <printint+0x76>
 60f:	90                   	nop
    putc(fd, buf[i]);
 610:	0f b6 13             	movzbl (%ebx),%edx
 613:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 616:	83 ec 04             	sub    $0x4,%esp
 619:	88 55 d7             	mov    %dl,-0x29(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	56                   	push   %esi
 61f:	57                   	push   %edi
 620:	e8 e1 fe ff ff       	call   506 <write>
  while(--i >= 0)
 625:	83 c4 10             	add    $0x10,%esp
 628:	39 de                	cmp    %ebx,%esi
 62a:	75 e4                	jne    610 <printint+0x70>
}
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 638:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 63f:	eb 87                	jmp    5c8 <printint+0x28>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 659:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 65c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 65f:	0f b6 13             	movzbl (%ebx),%edx
 662:	84 d2                	test   %dl,%dl
 664:	74 6a                	je     6d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 666:	8d 45 10             	lea    0x10(%ebp),%eax
 669:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 66c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 66f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 671:	89 45 d0             	mov    %eax,-0x30(%ebp)
 674:	eb 36                	jmp    6ac <printf+0x5c>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 683:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	74 15                	je     6a2 <printf+0x52>
  write(fd, &c, 1);
 68d:	83 ec 04             	sub    $0x4,%esp
 690:	88 55 e7             	mov    %dl,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	56                   	push   %esi
 697:	e8 6a fe ff ff       	call   506 <write>
 69c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 69f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6a2:	0f b6 13             	movzbl (%ebx),%edx
 6a5:	83 c3 01             	add    $0x1,%ebx
 6a8:	84 d2                	test   %dl,%dl
 6aa:	74 24                	je     6d0 <printf+0x80>
    c = fmt[i] & 0xff;
 6ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6af:	85 c9                	test   %ecx,%ecx
 6b1:	74 cd                	je     680 <printf+0x30>
      }
    } else if(state == '%'){
 6b3:	83 f9 25             	cmp    $0x25,%ecx
 6b6:	75 ea                	jne    6a2 <printf+0x52>
      if(c == 'd'){
 6b8:	83 f8 25             	cmp    $0x25,%eax
 6bb:	0f 84 07 01 00 00    	je     7c8 <printf+0x178>
 6c1:	83 e8 63             	sub    $0x63,%eax
 6c4:	83 f8 15             	cmp    $0x15,%eax
 6c7:	77 17                	ja     6e0 <printf+0x90>
 6c9:	ff 24 85 78 0a 00 00 	jmp    *0xa78(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 6e6:	6a 01                	push   $0x1
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6ee:	e8 13 fe ff ff       	call   506 <write>
        putc(fd, c);
 6f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6f7:	83 c4 0c             	add    $0xc,%esp
 6fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6fd:	6a 01                	push   $0x1
 6ff:	57                   	push   %edi
 700:	56                   	push   %esi
 701:	e8 00 fe ff ff       	call   506 <write>
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      state = 0;
 709:	31 c9                	xor    %ecx,%ecx
 70b:	eb 95                	jmp    6a2 <printf+0x52>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 10 00 00 00       	mov    $0x10,%ecx
 718:	6a 00                	push   $0x0
 71a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 71d:	8b 10                	mov    (%eax),%edx
 71f:	89 f0                	mov    %esi,%eax
 721:	e8 7a fe ff ff       	call   5a0 <printint>
        ap++;
 726:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 72a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72d:	31 c9                	xor    %ecx,%ecx
 72f:	e9 6e ff ff ff       	jmp    6a2 <printf+0x52>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 738:	8b 45 d0             	mov    -0x30(%ebp),%eax
 73b:	8b 10                	mov    (%eax),%edx
        ap++;
 73d:	83 c0 04             	add    $0x4,%eax
 740:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 743:	85 d2                	test   %edx,%edx
 745:	0f 84 8d 00 00 00    	je     7d8 <printf+0x188>
        while(*s != 0){
 74b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 74e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 750:	84 c0                	test   %al,%al
 752:	0f 84 4a ff ff ff    	je     6a2 <printf+0x52>
 758:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 75b:	89 d3                	mov    %edx,%ebx
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 760:	83 ec 04             	sub    $0x4,%esp
          s++;
 763:	83 c3 01             	add    $0x1,%ebx
 766:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 769:	6a 01                	push   $0x1
 76b:	57                   	push   %edi
 76c:	56                   	push   %esi
 76d:	e8 94 fd ff ff       	call   506 <write>
        while(*s != 0){
 772:	0f b6 03             	movzbl (%ebx),%eax
 775:	83 c4 10             	add    $0x10,%esp
 778:	84 c0                	test   %al,%al
 77a:	75 e4                	jne    760 <printf+0x110>
      state = 0;
 77c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 77f:	31 c9                	xor    %ecx,%ecx
 781:	e9 1c ff ff ff       	jmp    6a2 <printf+0x52>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 0a 00 00 00       	mov    $0xa,%ecx
 798:	6a 01                	push   $0x1
 79a:	e9 7b ff ff ff       	jmp    71a <printf+0xca>
 79f:	90                   	nop
        putc(fd, *ap);
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7a8:	6a 01                	push   $0x1
 7aa:	57                   	push   %edi
 7ab:	56                   	push   %esi
        putc(fd, *ap);
 7ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7af:	e8 52 fd ff ff       	call   506 <write>
        ap++;
 7b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bb:	31 c9                	xor    %ecx,%ecx
 7bd:	e9 e0 fe ff ff       	jmp    6a2 <printf+0x52>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 7c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7cb:	83 ec 04             	sub    $0x4,%esp
 7ce:	e9 2a ff ff ff       	jmp    6fd <printf+0xad>
 7d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7d7:	90                   	nop
          s = "(null)";
 7d8:	ba 6e 0a 00 00       	mov    $0xa6e,%edx
        while(*s != 0){
 7dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7e0:	b8 28 00 00 00       	mov    $0x28,%eax
 7e5:	89 d3                	mov    %edx,%ebx
 7e7:	e9 74 ff ff ff       	jmp    760 <printf+0x110>
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	a1 48 0e 00 00       	mov    0xe48,%eax
{
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 808:	89 c2                	mov    %eax,%edx
 80a:	8b 00                	mov    (%eax),%eax
 80c:	39 ca                	cmp    %ecx,%edx
 80e:	73 30                	jae    840 <free+0x50>
 810:	39 c1                	cmp    %eax,%ecx
 812:	72 04                	jb     818 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 814:	39 c2                	cmp    %eax,%edx
 816:	72 f0                	jb     808 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 f8                	cmp    %edi,%eax
 820:	74 30                	je     852 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 822:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 825:	8b 42 04             	mov    0x4(%edx),%eax
 828:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 82b:	39 f1                	cmp    %esi,%ecx
 82d:	74 3a                	je     869 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 82f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 831:	5b                   	pop    %ebx
  freep = p;
 832:	89 15 48 0e 00 00    	mov    %edx,0xe48
}
 838:	5e                   	pop    %esi
 839:	5f                   	pop    %edi
 83a:	5d                   	pop    %ebp
 83b:	c3                   	ret    
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	39 c2                	cmp    %eax,%edx
 842:	72 c4                	jb     808 <free+0x18>
 844:	39 c1                	cmp    %eax,%ecx
 846:	73 c0                	jae    808 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 f8                	cmp    %edi,%eax
 850:	75 d0                	jne    822 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 852:	03 70 04             	add    0x4(%eax),%esi
 855:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 858:	8b 02                	mov    (%edx),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 85f:	8b 42 04             	mov    0x4(%edx),%eax
 862:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 865:	39 f1                	cmp    %esi,%ecx
 867:	75 c6                	jne    82f <free+0x3f>
    p->s.size += bp->s.size;
 869:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 86c:	89 15 48 0e 00 00    	mov    %edx,0xe48
    p->s.size += bp->s.size;
 872:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 875:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 878:	89 0a                	mov    %ecx,(%edx)
}
 87a:	5b                   	pop    %ebx
 87b:	5e                   	pop    %esi
 87c:	5f                   	pop    %edi
 87d:	5d                   	pop    %ebp
 87e:	c3                   	ret    
 87f:	90                   	nop

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 88c:	8b 3d 48 0e 00 00    	mov    0xe48,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	8d 70 07             	lea    0x7(%eax),%esi
 895:	c1 ee 03             	shr    $0x3,%esi
 898:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 89b:	85 ff                	test   %edi,%edi
 89d:	0f 84 9d 00 00 00    	je     940 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8a8:	39 f1                	cmp    %esi,%ecx
 8aa:	73 6a                	jae    916 <malloc+0x96>
 8ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8b1:	39 de                	cmp    %ebx,%esi
 8b3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8c0:	eb 17                	jmp    8d9 <malloc+0x59>
 8c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ca:	8b 48 04             	mov    0x4(%eax),%ecx
 8cd:	39 f1                	cmp    %esi,%ecx
 8cf:	73 4f                	jae    920 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8d1:	8b 3d 48 0e 00 00    	mov    0xe48,%edi
 8d7:	89 c2                	mov    %eax,%edx
 8d9:	39 d7                	cmp    %edx,%edi
 8db:	75 eb                	jne    8c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8dd:	83 ec 0c             	sub    $0xc,%esp
 8e0:	ff 75 e4             	push   -0x1c(%ebp)
 8e3:	e8 86 fc ff ff       	call   56e <sbrk>
  if(p == (char*)-1)
 8e8:	83 c4 10             	add    $0x10,%esp
 8eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ee:	74 1c                	je     90c <malloc+0x8c>
  hp->s.size = nu;
 8f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8f3:	83 ec 0c             	sub    $0xc,%esp
 8f6:	83 c0 08             	add    $0x8,%eax
 8f9:	50                   	push   %eax
 8fa:	e8 f1 fe ff ff       	call   7f0 <free>
  return freep;
 8ff:	8b 15 48 0e 00 00    	mov    0xe48,%edx
      if((p = morecore(nunits)) == 0)
 905:	83 c4 10             	add    $0x10,%esp
 908:	85 d2                	test   %edx,%edx
 90a:	75 bc                	jne    8c8 <malloc+0x48>
        return 0;
  }
}
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 90f:	31 c0                	xor    %eax,%eax
}
 911:	5b                   	pop    %ebx
 912:	5e                   	pop    %esi
 913:	5f                   	pop    %edi
 914:	5d                   	pop    %ebp
 915:	c3                   	ret    
    if(p->s.size >= nunits){
 916:	89 d0                	mov    %edx,%eax
 918:	89 fa                	mov    %edi,%edx
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 920:	39 ce                	cmp    %ecx,%esi
 922:	74 4c                	je     970 <malloc+0xf0>
        p->s.size -= nunits;
 924:	29 f1                	sub    %esi,%ecx
 926:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 929:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 92c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 92f:	89 15 48 0e 00 00    	mov    %edx,0xe48
}
 935:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 938:	83 c0 08             	add    $0x8,%eax
}
 93b:	5b                   	pop    %ebx
 93c:	5e                   	pop    %esi
 93d:	5f                   	pop    %edi
 93e:	5d                   	pop    %ebp
 93f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 940:	c7 05 48 0e 00 00 4c 	movl   $0xe4c,0xe48
 947:	0e 00 00 
    base.s.size = 0;
 94a:	bf 4c 0e 00 00       	mov    $0xe4c,%edi
    base.s.ptr = freep = prevp = &base;
 94f:	c7 05 4c 0e 00 00 4c 	movl   $0xe4c,0xe4c
 956:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 959:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 95b:	c7 05 50 0e 00 00 00 	movl   $0x0,0xe50
 962:	00 00 00 
    if(p->s.size >= nunits){
 965:	e9 42 ff ff ff       	jmp    8ac <malloc+0x2c>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 970:	8b 08                	mov    (%eax),%ecx
 972:	89 0a                	mov    %ecx,(%edx)
 974:	eb b9                	jmp    92f <malloc+0xaf>
