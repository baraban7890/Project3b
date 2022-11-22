
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void worker(void *arg1, void *arg2);

int main(int argc, char *argv[])
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
  13:	e8 8e 05 00 00       	call   5a6 <getpid>
   void *stack, *p = malloc(PGSIZE * 2);
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	68 00 20 00 00       	push   $0x2000
   ppid = getpid();
  20:	a3 5c 0e 00 00       	mov    %eax,0xe5c
   void *stack, *p = malloc(PGSIZE * 2);
  25:	e8 96 08 00 00       	call   8c0 <malloc>
   assert(p != NULL);
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	85 c0                	test   %eax,%eax
  2f:	0f 84 1f 01 00 00    	je     154 <main+0x154>
  35:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  37:	89 c6                	mov    %eax,%esi
  39:	25 ff 0f 00 00       	and    $0xfff,%eax
  3e:	75 60                	jne    a0 <main+0xa0>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
   else
     stack = p;

   int fd = open("tmp", O_WRONLY|O_CREATE);
  40:	83 ec 08             	sub    $0x8,%esp
  43:	68 01 02 00 00       	push   $0x201
  48:	68 1c 0a 00 00       	push   $0xa1c
  4d:	e8 14 05 00 00       	call   566 <open>
   assert(fd == 3);
  52:	83 c4 10             	add    $0x10,%esp
  55:	83 f8 03             	cmp    $0x3,%eax
  58:	74 52                	je     ac <main+0xac>
  5a:	6a 24                	push   $0x24
  5c:	68 bf 09 00 00       	push   $0x9bf
  61:	68 c8 09 00 00       	push   $0x9c8
  66:	6a 01                	push   $0x1
  68:	e8 23 06 00 00       	call   690 <printf>
  6d:	83 c4 0c             	add    $0xc,%esp
  70:	68 20 0a 00 00       	push   $0xa20
  75:	68 ec 09 00 00       	push   $0x9ec
  7a:	6a 01                	push   $0x1
  7c:	e8 0f 06 00 00       	call   690 <printf>
  81:	59                   	pop    %ecx
  82:	5b                   	pop    %ebx
  83:	68 00 0a 00 00       	push   $0xa00
  88:	6a 01                	push   $0x1
  8a:	e8 01 06 00 00       	call   690 <printf>
  8f:	5e                   	pop    %esi
  90:	ff 35 5c 0e 00 00    	push   0xe5c
  96:	e8 bb 04 00 00       	call   556 <kill>
  9b:	e8 86 04 00 00       	call   526 <exit>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a0:	89 da                	mov    %ebx,%edx
  a2:	29 c2                	sub    %eax,%edx
  a4:	8d b2 00 10 00 00    	lea    0x1000(%edx),%esi
  aa:	eb 94                	jmp    40 <main+0x40>
   int clone_pid = clone(worker, 0, 0, stack);
  ac:	56                   	push   %esi
  ad:	6a 00                	push   $0x0
  af:	6a 00                	push   $0x0
  b1:	68 b0 01 00 00       	push   $0x1b0
  b6:	e8 0b 05 00 00       	call   5c6 <clone>
   assert(clone_pid > 0);
  bb:	83 c4 10             	add    $0x10,%esp
   int clone_pid = clone(worker, 0, 0, stack);
  be:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c0:	85 c0                	test   %eax,%eax
  c2:	0f 8e ac 00 00 00    	jle    174 <main+0x174>
  c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cf:	90                   	nop
   while(!newfd);
  d0:	a1 58 0e 00 00       	mov    0xe58,%eax
  d5:	85 c0                	test   %eax,%eax
  d7:	74 f7                	je     d0 <main+0xd0>
   assert(write(newfd, "goodbye\n", 8) == -1);
  d9:	a1 58 0e 00 00       	mov    0xe58,%eax
  de:	52                   	push   %edx
  df:	6a 08                	push   $0x8
  e1:	68 36 0a 00 00       	push   $0xa36
  e6:	50                   	push   %eax
  e7:	e8 5a 04 00 00       	call   546 <write>
  ec:	83 c4 10             	add    $0x10,%esp
  ef:	83 c0 01             	add    $0x1,%eax
  f2:	74 20                	je     114 <main+0x114>
  f4:	6a 28                	push   $0x28
  f6:	68 bf 09 00 00       	push   $0x9bf
  fb:	68 c8 09 00 00       	push   $0x9c8
 100:	6a 01                	push   $0x1
 102:	e8 89 05 00 00       	call   690 <printf>
 107:	83 c4 0c             	add    $0xc,%esp
 10a:	68 64 0a 00 00       	push   $0xa64
 10f:	e9 61 ff ff ff       	jmp    75 <main+0x75>
   printf(1, "TEST PASSED\n");
 114:	50                   	push   %eax
 115:	50                   	push   %eax
 116:	68 3f 0a 00 00       	push   $0xa3f
 11b:	6a 01                	push   $0x1
 11d:	e8 6e 05 00 00       	call   690 <printf>

   void *join_stack;
   int join_pid = join(&join_stack);
 122:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 125:	89 04 24             	mov    %eax,(%esp)
 128:	e8 a1 04 00 00       	call   5ce <join>
   assert(join_pid == clone_pid);
 12d:	83 c4 10             	add    $0x10,%esp
 130:	39 c6                	cmp    %eax,%esi
 132:	74 60                	je     194 <main+0x194>
 134:	6a 2d                	push   $0x2d
 136:	68 bf 09 00 00       	push   $0x9bf
 13b:	68 c8 09 00 00       	push   $0x9c8
 140:	6a 01                	push   $0x1
 142:	e8 49 05 00 00       	call   690 <printf>
 147:	83 c4 0c             	add    $0xc,%esp
 14a:	68 4c 0a 00 00       	push   $0xa4c
 14f:	e9 21 ff ff ff       	jmp    75 <main+0x75>
   assert(p != NULL);
 154:	6a 1d                	push   $0x1d
 156:	68 bf 09 00 00       	push   $0x9bf
 15b:	68 c8 09 00 00       	push   $0x9c8
 160:	6a 01                	push   $0x1
 162:	e8 29 05 00 00       	call   690 <printf>
 167:	83 c4 0c             	add    $0xc,%esp
 16a:	68 12 0a 00 00       	push   $0xa12
 16f:	e9 01 ff ff ff       	jmp    75 <main+0x75>
   assert(clone_pid > 0);
 174:	6a 26                	push   $0x26
 176:	68 bf 09 00 00       	push   $0x9bf
 17b:	68 c8 09 00 00       	push   $0x9c8
 180:	6a 01                	push   $0x1
 182:	e8 09 05 00 00       	call   690 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 28 0a 00 00       	push   $0xa28
 18f:	e9 e1 fe ff ff       	jmp    75 <main+0x75>
   free(p);
 194:	83 ec 0c             	sub    $0xc,%esp
 197:	53                   	push   %ebx
 198:	e8 93 06 00 00       	call   830 <free>
   exit();
 19d:	e8 84 03 00 00       	call   526 <exit>
 1a2:	66 90                	xchg   %ax,%ax
 1a4:	66 90                	xchg   %ax,%ax
 1a6:	66 90                	xchg   %ax,%ax
 1a8:	66 90                	xchg   %ax,%ax
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <worker>:
}

void
worker(void *arg1, void *arg2) {
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
 1b6:	6a 06                	push   $0x6
 1b8:	68 b8 09 00 00       	push   $0x9b8
 1bd:	6a 03                	push   $0x3
 1bf:	e8 82 03 00 00       	call   546 <write>
 1c4:	83 c4 10             	add    $0x10,%esp
 1c7:	83 f8 06             	cmp    $0x6,%eax
 1ca:	74 46                	je     212 <worker+0x62>
 1cc:	6a 34                	push   $0x34
 1ce:	68 bf 09 00 00       	push   $0x9bf
 1d3:	68 c8 09 00 00       	push   $0x9c8
 1d8:	6a 01                	push   $0x1
 1da:	e8 b1 04 00 00       	call   690 <printf>
 1df:	83 c4 0c             	add    $0xc,%esp
 1e2:	68 d0 09 00 00       	push   $0x9d0
 1e7:	68 ec 09 00 00       	push   $0x9ec
 1ec:	6a 01                	push   $0x1
 1ee:	e8 9d 04 00 00       	call   690 <printf>
 1f3:	5a                   	pop    %edx
 1f4:	59                   	pop    %ecx
 1f5:	68 00 0a 00 00       	push   $0xa00
 1fa:	6a 01                	push   $0x1
 1fc:	e8 8f 04 00 00       	call   690 <printf>
 201:	58                   	pop    %eax
 202:	ff 35 5c 0e 00 00    	push   0xe5c
 208:	e8 49 03 00 00       	call   556 <kill>
 20d:	e8 14 03 00 00       	call   526 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
 212:	50                   	push   %eax
 213:	50                   	push   %eax
 214:	68 01 02 00 00       	push   $0x201
 219:	68 0d 0a 00 00       	push   $0xa0d
 21e:	e8 43 03 00 00       	call   566 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 223:	f0 87 05 58 0e 00 00 	lock xchg %eax,0xe58
   exit();
 22a:	e8 f7 02 00 00       	call   526 <exit>
 22f:	90                   	nop

00000230 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 230:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 231:	31 c0                	xor    %eax,%eax
{
 233:	89 e5                	mov    %esp,%ebp
 235:	53                   	push   %ebx
 236:	8b 4d 08             	mov    0x8(%ebp),%ecx
 239:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 240:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 244:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 247:	83 c0 01             	add    $0x1,%eax
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strcpy+0x10>
    ;
  return os;
}
 24e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 251:	89 c8                	mov    %ecx,%eax
 253:	c9                   	leave  
 254:	c3                   	ret    
 255:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <strcmp>:

int strcmp(const char *p, const char *q)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
 267:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 26a:	0f b6 02             	movzbl (%edx),%eax
 26d:	84 c0                	test   %al,%al
 26f:	75 17                	jne    288 <strcmp+0x28>
 271:	eb 3a                	jmp    2ad <strcmp+0x4d>
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 27c:	83 c2 01             	add    $0x1,%edx
 27f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 282:	84 c0                	test   %al,%al
 284:	74 1a                	je     2a0 <strcmp+0x40>
    p++, q++;
 286:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 288:	0f b6 19             	movzbl (%ecx),%ebx
 28b:	38 c3                	cmp    %al,%bl
 28d:	74 e9                	je     278 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 28f:	29 d8                	sub    %ebx,%eax
}
 291:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 294:	c9                   	leave  
 295:	c3                   	ret    
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2a4:	31 c0                	xor    %eax,%eax
 2a6:	29 d8                	sub    %ebx,%eax
}
 2a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2ab:	c9                   	leave  
 2ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2ad:	0f b6 19             	movzbl (%ecx),%ebx
 2b0:	31 c0                	xor    %eax,%eax
 2b2:	eb db                	jmp    28f <strcmp+0x2f>
 2b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <strlen>:

uint strlen(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 2c6:	80 3a 00             	cmpb   $0x0,(%edx)
 2c9:	74 15                	je     2e0 <strlen+0x20>
 2cb:	31 c0                	xor    %eax,%eax
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
 2d0:	83 c0 01             	add    $0x1,%eax
 2d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2d7:	89 c1                	mov    %eax,%ecx
 2d9:	75 f5                	jne    2d0 <strlen+0x10>
    ;
  return n;
}
 2db:	89 c8                	mov    %ecx,%eax
 2dd:	5d                   	pop    %ebp
 2de:	c3                   	ret    
 2df:	90                   	nop
  for (n = 0; s[n]; n++)
 2e0:	31 c9                	xor    %ecx,%ecx
}
 2e2:	5d                   	pop    %ebp
 2e3:	89 c8                	mov    %ecx,%eax
 2e5:	c3                   	ret    
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 2f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	89 d7                	mov    %edx,%edi
 2ff:	fc                   	cld    
 300:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 302:	8b 7d fc             	mov    -0x4(%ebp),%edi
 305:	89 d0                	mov    %edx,%eax
 307:	c9                   	leave  
 308:	c3                   	ret    
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <strchr>:

char *
strchr(const char *s, char c)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 31a:	0f b6 10             	movzbl (%eax),%edx
 31d:	84 d2                	test   %dl,%dl
 31f:	75 12                	jne    333 <strchr+0x23>
 321:	eb 1d                	jmp    340 <strchr+0x30>
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
 328:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 32c:	83 c0 01             	add    $0x1,%eax
 32f:	84 d2                	test   %dl,%dl
 331:	74 0d                	je     340 <strchr+0x30>
    if (*s == c)
 333:	38 d1                	cmp    %dl,%cl
 335:	75 f1                	jne    328 <strchr+0x18>
      return (char *)s;
  return 0;
}
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 340:	31 c0                	xor    %eax,%eax
}
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    
 344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <gets>:

char *
gets(char *buf, int max)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 355:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 358:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 359:	31 db                	xor    %ebx,%ebx
{
 35b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 35e:	eb 27                	jmp    387 <gets+0x37>
    cc = read(0, &c, 1);
 360:	83 ec 04             	sub    $0x4,%esp
 363:	6a 01                	push   $0x1
 365:	57                   	push   %edi
 366:	6a 00                	push   $0x0
 368:	e8 d1 01 00 00       	call   53e <read>
    if (cc < 1)
 36d:	83 c4 10             	add    $0x10,%esp
 370:	85 c0                	test   %eax,%eax
 372:	7e 1d                	jle    391 <gets+0x41>
      break;
    buf[i++] = c;
 374:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 378:	8b 55 08             	mov    0x8(%ebp),%edx
 37b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 37f:	3c 0a                	cmp    $0xa,%al
 381:	74 1d                	je     3a0 <gets+0x50>
 383:	3c 0d                	cmp    $0xd,%al
 385:	74 19                	je     3a0 <gets+0x50>
  for (i = 0; i + 1 < max;)
 387:	89 de                	mov    %ebx,%esi
 389:	83 c3 01             	add    $0x1,%ebx
 38c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 38f:	7c cf                	jl     360 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 391:	8b 45 08             	mov    0x8(%ebp),%eax
 394:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 398:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39b:	5b                   	pop    %ebx
 39c:	5e                   	pop    %esi
 39d:	5f                   	pop    %edi
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    
  buf[i] = '\0';
 3a0:	8b 45 08             	mov    0x8(%ebp),%eax
 3a3:	89 de                	mov    %ebx,%esi
 3a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ac:	5b                   	pop    %ebx
 3ad:	5e                   	pop    %esi
 3ae:	5f                   	pop    %edi
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <stat>:

int stat(const char *n, struct stat *st)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	6a 00                	push   $0x0
 3ca:	ff 75 08             	push   0x8(%ebp)
 3cd:	e8 94 01 00 00       	call   566 <open>
  if (fd < 0)
 3d2:	83 c4 10             	add    $0x10,%esp
 3d5:	85 c0                	test   %eax,%eax
 3d7:	78 27                	js     400 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3d9:	83 ec 08             	sub    $0x8,%esp
 3dc:	ff 75 0c             	push   0xc(%ebp)
 3df:	89 c3                	mov    %eax,%ebx
 3e1:	50                   	push   %eax
 3e2:	e8 97 01 00 00       	call   57e <fstat>
  close(fd);
 3e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ea:	89 c6                	mov    %eax,%esi
  close(fd);
 3ec:	e8 5d 01 00 00       	call   54e <close>
  return r;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f7:	89 f0                	mov    %esi,%eax
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 400:	be ff ff ff ff       	mov    $0xffffffff,%esi
 405:	eb ed                	jmp    3f4 <stat+0x34>
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax

00000410 <atoi>:

int atoi(const char *s)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 417:	0f be 02             	movsbl (%edx),%eax
 41a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 41d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 420:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 425:	77 1e                	ja     445 <atoi+0x35>
 427:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 430:	83 c2 01             	add    $0x1,%edx
 433:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 436:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 43a:	0f be 02             	movsbl (%edx),%eax
 43d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 440:	80 fb 09             	cmp    $0x9,%bl
 443:	76 eb                	jbe    430 <atoi+0x20>
  return n;
}
 445:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 448:	89 c8                	mov    %ecx,%eax
 44a:	c9                   	leave  
 44b:	c3                   	ret    
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	8b 45 10             	mov    0x10(%ebp),%eax
 457:	8b 55 08             	mov    0x8(%ebp),%edx
 45a:	56                   	push   %esi
 45b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 45e:	85 c0                	test   %eax,%eax
 460:	7e 13                	jle    475 <memmove+0x25>
 462:	01 d0                	add    %edx,%eax
  dst = vdst;
 464:	89 d7                	mov    %edx,%edi
 466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 470:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 471:	39 f8                	cmp    %edi,%eax
 473:	75 fb                	jne    470 <memmove+0x20>
  return vdst;
}
 475:	5e                   	pop    %esi
 476:	89 d0                	mov    %edx,%eax
 478:	5f                   	pop    %edi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 486:	68 00 20 00 00       	push   $0x2000
 48b:	e8 30 04 00 00       	call   8c0 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 490:	50                   	push   %eax
 491:	ff 75 10             	push   0x10(%ebp)
 494:	ff 75 0c             	push   0xc(%ebp)
 497:	ff 75 08             	push   0x8(%ebp)
 49a:	e8 27 01 00 00       	call   5c6 <clone>

  return pid;
}
 49f:	c9                   	leave  
 4a0:	c3                   	ret    
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop

000004b0 <thread_join>:

int thread_join()
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 4b7:	6a 04                	push   $0x4
 4b9:	e8 02 04 00 00       	call   8c0 <malloc>
 4be:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 4c1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c4:	89 04 24             	mov    %eax,(%esp)
 4c7:	e8 02 01 00 00       	call   5ce <join>
 4cc:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 4ce:	58                   	pop    %eax
 4cf:	ff 75 f4             	push   -0xc(%ebp)
 4d2:	e8 59 03 00 00       	call   830 <free>
  lock_release(&lock);

  return pid;
}
 4d7:	89 d8                	mov    %ebx,%eax
 4d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4dc:	c9                   	leave  
 4dd:	c3                   	ret    
 4de:	66 90                	xchg   %ax,%ax

000004e0 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 4e6:	83 38 01             	cmpl   $0x1,(%eax)
 4e9:	75 05                	jne    4f0 <lock_acquire+0x10>
 4eb:	eb fe                	jmp    4eb <lock_acquire+0xb>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 4f0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <lock_release>:
void lock_release(lock_t *lock)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    
 50e:	66 90                	xchg   %ax,%ax

00000510 <lock_init>:
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    

0000051e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 51e:	b8 01 00 00 00       	mov    $0x1,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <exit>:
SYSCALL(exit)
 526:	b8 02 00 00 00       	mov    $0x2,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <wait>:
SYSCALL(wait)
 52e:	b8 03 00 00 00       	mov    $0x3,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <pipe>:
SYSCALL(pipe)
 536:	b8 04 00 00 00       	mov    $0x4,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <read>:
SYSCALL(read)
 53e:	b8 05 00 00 00       	mov    $0x5,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <write>:
SYSCALL(write)
 546:	b8 10 00 00 00       	mov    $0x10,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <close>:
SYSCALL(close)
 54e:	b8 15 00 00 00       	mov    $0x15,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <kill>:
SYSCALL(kill)
 556:	b8 06 00 00 00       	mov    $0x6,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <exec>:
SYSCALL(exec)
 55e:	b8 07 00 00 00       	mov    $0x7,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <open>:
SYSCALL(open)
 566:	b8 0f 00 00 00       	mov    $0xf,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <mknod>:
SYSCALL(mknod)
 56e:	b8 11 00 00 00       	mov    $0x11,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <unlink>:
SYSCALL(unlink)
 576:	b8 12 00 00 00       	mov    $0x12,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <fstat>:
SYSCALL(fstat)
 57e:	b8 08 00 00 00       	mov    $0x8,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <link>:
SYSCALL(link)
 586:	b8 13 00 00 00       	mov    $0x13,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <mkdir>:
SYSCALL(mkdir)
 58e:	b8 14 00 00 00       	mov    $0x14,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <chdir>:
SYSCALL(chdir)
 596:	b8 09 00 00 00       	mov    $0x9,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <dup>:
SYSCALL(dup)
 59e:	b8 0a 00 00 00       	mov    $0xa,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <getpid>:
SYSCALL(getpid)
 5a6:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <sbrk>:
SYSCALL(sbrk)
 5ae:	b8 0c 00 00 00       	mov    $0xc,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <sleep>:
SYSCALL(sleep)
 5b6:	b8 0d 00 00 00       	mov    $0xd,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <uptime>:
SYSCALL(uptime)
 5be:	b8 0e 00 00 00       	mov    $0xe,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <clone>:
SYSCALL(clone)
 5c6:	b8 16 00 00 00       	mov    $0x16,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <join>:
 5ce:	b8 17 00 00 00       	mov    $0x17,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    
 5d6:	66 90                	xchg   %ax,%ax
 5d8:	66 90                	xchg   %ax,%ax
 5da:	66 90                	xchg   %ax,%ax
 5dc:	66 90                	xchg   %ax,%ax
 5de:	66 90                	xchg   %ax,%ax

000005e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 3c             	sub    $0x3c,%esp
 5e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ec:	89 d1                	mov    %edx,%ecx
{
 5ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5f1:	85 d2                	test   %edx,%edx
 5f3:	0f 89 7f 00 00 00    	jns    678 <printint+0x98>
 5f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5fd:	74 79                	je     678 <printint+0x98>
    neg = 1;
 5ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 606:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 608:	31 db                	xor    %ebx,%ebx
 60a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 610:	89 c8                	mov    %ecx,%eax
 612:	31 d2                	xor    %edx,%edx
 614:	89 cf                	mov    %ecx,%edi
 616:	f7 75 c4             	divl   -0x3c(%ebp)
 619:	0f b6 92 e8 0a 00 00 	movzbl 0xae8(%edx),%edx
 620:	89 45 c0             	mov    %eax,-0x40(%ebp)
 623:	89 d8                	mov    %ebx,%eax
 625:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 628:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 62b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 62e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 631:	76 dd                	jbe    610 <printint+0x30>
  if(neg)
 633:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 636:	85 c9                	test   %ecx,%ecx
 638:	74 0c                	je     646 <printint+0x66>
    buf[i++] = '-';
 63a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 63f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 641:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 646:	8b 7d b8             	mov    -0x48(%ebp),%edi
 649:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 64d:	eb 07                	jmp    656 <printint+0x76>
 64f:	90                   	nop
    putc(fd, buf[i]);
 650:	0f b6 13             	movzbl (%ebx),%edx
 653:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 656:	83 ec 04             	sub    $0x4,%esp
 659:	88 55 d7             	mov    %dl,-0x29(%ebp)
 65c:	6a 01                	push   $0x1
 65e:	56                   	push   %esi
 65f:	57                   	push   %edi
 660:	e8 e1 fe ff ff       	call   546 <write>
  while(--i >= 0)
 665:	83 c4 10             	add    $0x10,%esp
 668:	39 de                	cmp    %ebx,%esi
 66a:	75 e4                	jne    650 <printint+0x70>
}
 66c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 678:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 67f:	eb 87                	jmp    608 <printint+0x28>
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop

00000690 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 699:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 69c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 69f:	0f b6 13             	movzbl (%ebx),%edx
 6a2:	84 d2                	test   %dl,%dl
 6a4:	74 6a                	je     710 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 6a6:	8d 45 10             	lea    0x10(%ebp),%eax
 6a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b4:	eb 36                	jmp    6ec <printf+0x5c>
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
 6c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6c8:	83 f8 25             	cmp    $0x25,%eax
 6cb:	74 15                	je     6e2 <printf+0x52>
  write(fd, &c, 1);
 6cd:	83 ec 04             	sub    $0x4,%esp
 6d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6d3:	6a 01                	push   $0x1
 6d5:	57                   	push   %edi
 6d6:	56                   	push   %esi
 6d7:	e8 6a fe ff ff       	call   546 <write>
 6dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 6df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6e2:	0f b6 13             	movzbl (%ebx),%edx
 6e5:	83 c3 01             	add    $0x1,%ebx
 6e8:	84 d2                	test   %dl,%dl
 6ea:	74 24                	je     710 <printf+0x80>
    c = fmt[i] & 0xff;
 6ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6ef:	85 c9                	test   %ecx,%ecx
 6f1:	74 cd                	je     6c0 <printf+0x30>
      }
    } else if(state == '%'){
 6f3:	83 f9 25             	cmp    $0x25,%ecx
 6f6:	75 ea                	jne    6e2 <printf+0x52>
      if(c == 'd'){
 6f8:	83 f8 25             	cmp    $0x25,%eax
 6fb:	0f 84 07 01 00 00    	je     808 <printf+0x178>
 701:	83 e8 63             	sub    $0x63,%eax
 704:	83 f8 15             	cmp    $0x15,%eax
 707:	77 17                	ja     720 <printf+0x90>
 709:	ff 24 85 90 0a 00 00 	jmp    *0xa90(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 710:	8d 65 f4             	lea    -0xc(%ebp),%esp
 713:	5b                   	pop    %ebx
 714:	5e                   	pop    %esi
 715:	5f                   	pop    %edi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 726:	6a 01                	push   $0x1
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 72e:	e8 13 fe ff ff       	call   546 <write>
        putc(fd, c);
 733:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 737:	83 c4 0c             	add    $0xc,%esp
 73a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 73d:	6a 01                	push   $0x1
 73f:	57                   	push   %edi
 740:	56                   	push   %esi
 741:	e8 00 fe ff ff       	call   546 <write>
        putc(fd, c);
 746:	83 c4 10             	add    $0x10,%esp
      state = 0;
 749:	31 c9                	xor    %ecx,%ecx
 74b:	eb 95                	jmp    6e2 <printf+0x52>
 74d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 10 00 00 00       	mov    $0x10,%ecx
 758:	6a 00                	push   $0x0
 75a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 75d:	8b 10                	mov    (%eax),%edx
 75f:	89 f0                	mov    %esi,%eax
 761:	e8 7a fe ff ff       	call   5e0 <printint>
        ap++;
 766:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 76a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76d:	31 c9                	xor    %ecx,%ecx
 76f:	e9 6e ff ff ff       	jmp    6e2 <printf+0x52>
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 778:	8b 45 d0             	mov    -0x30(%ebp),%eax
 77b:	8b 10                	mov    (%eax),%edx
        ap++;
 77d:	83 c0 04             	add    $0x4,%eax
 780:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 783:	85 d2                	test   %edx,%edx
 785:	0f 84 8d 00 00 00    	je     818 <printf+0x188>
        while(*s != 0){
 78b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 78e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 790:	84 c0                	test   %al,%al
 792:	0f 84 4a ff ff ff    	je     6e2 <printf+0x52>
 798:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 79b:	89 d3                	mov    %edx,%ebx
 79d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7a3:	83 c3 01             	add    $0x1,%ebx
 7a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7a9:	6a 01                	push   $0x1
 7ab:	57                   	push   %edi
 7ac:	56                   	push   %esi
 7ad:	e8 94 fd ff ff       	call   546 <write>
        while(*s != 0){
 7b2:	0f b6 03             	movzbl (%ebx),%eax
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	84 c0                	test   %al,%al
 7ba:	75 e4                	jne    7a0 <printf+0x110>
      state = 0;
 7bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7bf:	31 c9                	xor    %ecx,%ecx
 7c1:	e9 1c ff ff ff       	jmp    6e2 <printf+0x52>
 7c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d8:	6a 01                	push   $0x1
 7da:	e9 7b ff ff ff       	jmp    75a <printf+0xca>
 7df:	90                   	nop
        putc(fd, *ap);
 7e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7e8:	6a 01                	push   $0x1
 7ea:	57                   	push   %edi
 7eb:	56                   	push   %esi
        putc(fd, *ap);
 7ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7ef:	e8 52 fd ff ff       	call   546 <write>
        ap++;
 7f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7fb:	31 c9                	xor    %ecx,%ecx
 7fd:	e9 e0 fe ff ff       	jmp    6e2 <printf+0x52>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 808:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 80b:	83 ec 04             	sub    $0x4,%esp
 80e:	e9 2a ff ff ff       	jmp    73d <printf+0xad>
 813:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 817:	90                   	nop
          s = "(null)";
 818:	ba 87 0a 00 00       	mov    $0xa87,%edx
        while(*s != 0){
 81d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 820:	b8 28 00 00 00       	mov    $0x28,%eax
 825:	89 d3                	mov    %edx,%ebx
 827:	e9 74 ff ff ff       	jmp    7a0 <printf+0x110>
 82c:	66 90                	xchg   %ax,%ax
 82e:	66 90                	xchg   %ax,%ax

00000830 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 830:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 831:	a1 60 0e 00 00       	mov    0xe60,%eax
{
 836:	89 e5                	mov    %esp,%ebp
 838:	57                   	push   %edi
 839:	56                   	push   %esi
 83a:	53                   	push   %ebx
 83b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 83e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 848:	89 c2                	mov    %eax,%edx
 84a:	8b 00                	mov    (%eax),%eax
 84c:	39 ca                	cmp    %ecx,%edx
 84e:	73 30                	jae    880 <free+0x50>
 850:	39 c1                	cmp    %eax,%ecx
 852:	72 04                	jb     858 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 854:	39 c2                	cmp    %eax,%edx
 856:	72 f0                	jb     848 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 858:	8b 73 fc             	mov    -0x4(%ebx),%esi
 85b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 85e:	39 f8                	cmp    %edi,%eax
 860:	74 30                	je     892 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 862:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 865:	8b 42 04             	mov    0x4(%edx),%eax
 868:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 86b:	39 f1                	cmp    %esi,%ecx
 86d:	74 3a                	je     8a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 86f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 871:	5b                   	pop    %ebx
  freep = p;
 872:	89 15 60 0e 00 00    	mov    %edx,0xe60
}
 878:	5e                   	pop    %esi
 879:	5f                   	pop    %edi
 87a:	5d                   	pop    %ebp
 87b:	c3                   	ret    
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 880:	39 c2                	cmp    %eax,%edx
 882:	72 c4                	jb     848 <free+0x18>
 884:	39 c1                	cmp    %eax,%ecx
 886:	73 c0                	jae    848 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 888:	8b 73 fc             	mov    -0x4(%ebx),%esi
 88b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 88e:	39 f8                	cmp    %edi,%eax
 890:	75 d0                	jne    862 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 892:	03 70 04             	add    0x4(%eax),%esi
 895:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 898:	8b 02                	mov    (%edx),%eax
 89a:	8b 00                	mov    (%eax),%eax
 89c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 89f:	8b 42 04             	mov    0x4(%edx),%eax
 8a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8a5:	39 f1                	cmp    %esi,%ecx
 8a7:	75 c6                	jne    86f <free+0x3f>
    p->s.size += bp->s.size;
 8a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 8ac:	89 15 60 0e 00 00    	mov    %edx,0xe60
    p->s.size += bp->s.size;
 8b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8b8:	89 0a                	mov    %ecx,(%edx)
}
 8ba:	5b                   	pop    %ebx
 8bb:	5e                   	pop    %esi
 8bc:	5f                   	pop    %edi
 8bd:	5d                   	pop    %ebp
 8be:	c3                   	ret    
 8bf:	90                   	nop

000008c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	57                   	push   %edi
 8c4:	56                   	push   %esi
 8c5:	53                   	push   %ebx
 8c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8cc:	8b 3d 60 0e 00 00    	mov    0xe60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d2:	8d 70 07             	lea    0x7(%eax),%esi
 8d5:	c1 ee 03             	shr    $0x3,%esi
 8d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8db:	85 ff                	test   %edi,%edi
 8dd:	0f 84 9d 00 00 00    	je     980 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8e5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8e8:	39 f1                	cmp    %esi,%ecx
 8ea:	73 6a                	jae    956 <malloc+0x96>
 8ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8f1:	39 de                	cmp    %ebx,%esi
 8f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 900:	eb 17                	jmp    919 <malloc+0x59>
 902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 908:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 90a:	8b 48 04             	mov    0x4(%eax),%ecx
 90d:	39 f1                	cmp    %esi,%ecx
 90f:	73 4f                	jae    960 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 911:	8b 3d 60 0e 00 00    	mov    0xe60,%edi
 917:	89 c2                	mov    %eax,%edx
 919:	39 d7                	cmp    %edx,%edi
 91b:	75 eb                	jne    908 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 91d:	83 ec 0c             	sub    $0xc,%esp
 920:	ff 75 e4             	push   -0x1c(%ebp)
 923:	e8 86 fc ff ff       	call   5ae <sbrk>
  if(p == (char*)-1)
 928:	83 c4 10             	add    $0x10,%esp
 92b:	83 f8 ff             	cmp    $0xffffffff,%eax
 92e:	74 1c                	je     94c <malloc+0x8c>
  hp->s.size = nu;
 930:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 933:	83 ec 0c             	sub    $0xc,%esp
 936:	83 c0 08             	add    $0x8,%eax
 939:	50                   	push   %eax
 93a:	e8 f1 fe ff ff       	call   830 <free>
  return freep;
 93f:	8b 15 60 0e 00 00    	mov    0xe60,%edx
      if((p = morecore(nunits)) == 0)
 945:	83 c4 10             	add    $0x10,%esp
 948:	85 d2                	test   %edx,%edx
 94a:	75 bc                	jne    908 <malloc+0x48>
        return 0;
  }
}
 94c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 94f:	31 c0                	xor    %eax,%eax
}
 951:	5b                   	pop    %ebx
 952:	5e                   	pop    %esi
 953:	5f                   	pop    %edi
 954:	5d                   	pop    %ebp
 955:	c3                   	ret    
    if(p->s.size >= nunits){
 956:	89 d0                	mov    %edx,%eax
 958:	89 fa                	mov    %edi,%edx
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 960:	39 ce                	cmp    %ecx,%esi
 962:	74 4c                	je     9b0 <malloc+0xf0>
        p->s.size -= nunits;
 964:	29 f1                	sub    %esi,%ecx
 966:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 969:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 96c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 96f:	89 15 60 0e 00 00    	mov    %edx,0xe60
}
 975:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 978:	83 c0 08             	add    $0x8,%eax
}
 97b:	5b                   	pop    %ebx
 97c:	5e                   	pop    %esi
 97d:	5f                   	pop    %edi
 97e:	5d                   	pop    %ebp
 97f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 980:	c7 05 60 0e 00 00 64 	movl   $0xe64,0xe60
 987:	0e 00 00 
    base.s.size = 0;
 98a:	bf 64 0e 00 00       	mov    $0xe64,%edi
    base.s.ptr = freep = prevp = &base;
 98f:	c7 05 64 0e 00 00 64 	movl   $0xe64,0xe64
 996:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 999:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 99b:	c7 05 68 0e 00 00 00 	movl   $0x0,0xe68
 9a2:	00 00 00 
    if(p->s.size >= nunits){
 9a5:	e9 42 ff ff ff       	jmp    8ec <malloc+0x2c>
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9b0:	8b 08                	mov    (%eax),%ecx
 9b2:	89 0a                	mov    %ecx,(%edx)
 9b4:	eb b9                	jmp    96f <malloc+0xaf>
