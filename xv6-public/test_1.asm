
_test_1:     file format elf32-i386


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
  13:	e8 fe 04 00 00       	call   516 <getpid>
   void *stack, *p = malloc(PGSIZE*2);
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	68 00 20 00 00       	push   $0x2000
   ppid = getpid();
  20:	a3 74 0d 00 00       	mov    %eax,0xd74
   void *stack, *p = malloc(PGSIZE*2);
  25:	e8 06 08 00 00       	call   830 <malloc>
   assert(p != NULL);
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	85 c0                	test   %eax,%eax
  2f:	0f 84 db 00 00 00    	je     110 <main+0x110>
   if((uint)p % PGSIZE)
  35:	89 c2                	mov    %eax,%edx
  37:	89 c3                	mov    %eax,%ebx
  39:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  3f:	0f 85 94 00 00 00    	jne    d9 <main+0xd9>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
   else
     stack = p;

   int clone_pid = clone(worker, 0, 0, stack);
  45:	50                   	push   %eax
  46:	6a 00                	push   $0x0
  48:	6a 00                	push   $0x0
  4a:	68 30 01 00 00       	push   $0x130
  4f:	e8 e2 04 00 00       	call   536 <clone>
   assert(clone_pid > 0);
  54:	83 c4 10             	add    $0x10,%esp
   int clone_pid = clone(worker, 0, 0, stack);
  57:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  59:	85 c0                	test   %eax,%eax
  5b:	0f 8e 92 00 00 00    	jle    f3 <main+0xf3>
  61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   while(global != 5);
  68:	8b 15 70 0d 00 00    	mov    0xd70,%edx
  6e:	83 fa 05             	cmp    $0x5,%edx
  71:	75 f5                	jne    68 <main+0x68>
   printf(1, "TEST PASSED\n");
  73:	50                   	push   %eax
  74:	50                   	push   %eax
  75:	68 7e 09 00 00       	push   $0x97e
  7a:	6a 01                	push   $0x1
  7c:	e8 7f 05 00 00       	call   600 <printf>
   
   void *join_stack;
   int join_pid = join(&join_stack);
  81:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 b2 04 00 00       	call   53e <join>
   assert(join_pid == clone_pid);
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	39 c6                	cmp    %eax,%esi
  91:	74 52                	je     e5 <main+0xe5>
  93:	6a 29                	push   $0x29
  95:	68 28 09 00 00       	push   $0x928
  9a:	68 31 09 00 00       	push   $0x931
  9f:	6a 01                	push   $0x1
  a1:	e8 5a 05 00 00       	call   600 <printf>
  a6:	83 c4 0c             	add    $0xc,%esp
  a9:	68 8b 09 00 00       	push   $0x98b
   assert(clone_pid > 0);
  ae:	68 45 09 00 00       	push   $0x945
  b3:	6a 01                	push   $0x1
  b5:	e8 46 05 00 00       	call   600 <printf>
  ba:	5a                   	pop    %edx
  bb:	59                   	pop    %ecx
  bc:	68 59 09 00 00       	push   $0x959
  c1:	6a 01                	push   $0x1
  c3:	e8 38 05 00 00       	call   600 <printf>
  c8:	5b                   	pop    %ebx
  c9:	ff 35 74 0d 00 00    	push   0xd74
  cf:	e8 f2 03 00 00       	call   4c6 <kill>
  d4:	e8 bd 03 00 00       	call   496 <exit>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  d9:	29 d0                	sub    %edx,%eax
  db:	05 00 10 00 00       	add    $0x1000,%eax
  e0:	e9 60 ff ff ff       	jmp    45 <main+0x45>
   free(p);
  e5:	83 ec 0c             	sub    $0xc,%esp
  e8:	53                   	push   %ebx
  e9:	e8 b2 06 00 00       	call   7a0 <free>
   exit();
  ee:	e8 a3 03 00 00       	call   496 <exit>
   assert(clone_pid > 0);
  f3:	6a 23                	push   $0x23
  f5:	68 28 09 00 00       	push   $0x928
  fa:	68 31 09 00 00       	push   $0x931
  ff:	6a 01                	push   $0x1
 101:	e8 fa 04 00 00       	call   600 <printf>
 106:	83 c4 0c             	add    $0xc,%esp
 109:	68 70 09 00 00       	push   $0x970
 10e:	eb 9e                	jmp    ae <main+0xae>
   assert(p != NULL);
 110:	6a 1c                	push   $0x1c
 112:	68 28 09 00 00       	push   $0x928
 117:	68 31 09 00 00       	push   $0x931
 11c:	6a 01                	push   $0x1
 11e:	e8 dd 04 00 00       	call   600 <printf>
 123:	83 c4 0c             	add    $0xc,%esp
 126:	68 66 09 00 00       	push   $0x966
 12b:	eb 81                	jmp    ae <main+0xae>
 12d:	66 90                	xchg   %ax,%ax
 12f:	90                   	nop

00000130 <worker>:
}

void
worker(void *arg1, void *arg2) {
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
 136:	a1 70 0d 00 00       	mov    0xd70,%eax
 13b:	83 f8 01             	cmp    $0x1,%eax
 13e:	74 46                	je     186 <worker+0x56>
 140:	6a 30                	push   $0x30
 142:	68 28 09 00 00       	push   $0x928
 147:	68 31 09 00 00       	push   $0x931
 14c:	6a 01                	push   $0x1
 14e:	e8 ad 04 00 00       	call   600 <printf>
 153:	83 c4 0c             	add    $0xc,%esp
 156:	68 39 09 00 00       	push   $0x939
 15b:	68 45 09 00 00       	push   $0x945
 160:	6a 01                	push   $0x1
 162:	e8 99 04 00 00       	call   600 <printf>
 167:	58                   	pop    %eax
 168:	5a                   	pop    %edx
 169:	68 59 09 00 00       	push   $0x959
 16e:	6a 01                	push   $0x1
 170:	e8 8b 04 00 00       	call   600 <printf>
 175:	59                   	pop    %ecx
 176:	ff 35 74 0d 00 00    	push   0xd74
 17c:	e8 45 03 00 00       	call   4c6 <kill>
 181:	e8 10 03 00 00       	call   496 <exit>
   global = 5;
 186:	c7 05 70 0d 00 00 05 	movl   $0x5,0xd70
 18d:	00 00 00 
   exit();
 190:	e8 01 03 00 00       	call   496 <exit>
 195:	66 90                	xchg   %ax,%ax
 197:	66 90                	xchg   %ax,%ax
 199:	66 90                	xchg   %ax,%ax
 19b:	66 90                	xchg   %ax,%ax
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 1a0:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 1a1:	31 c0                	xor    %eax,%eax
{
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	53                   	push   %ebx
 1a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 1b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1b7:	83 c0 01             	add    $0x1,%eax
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c1:	89 c8                	mov    %ecx,%eax
 1c3:	c9                   	leave  
 1c4:	c3                   	ret    
 1c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 1da:	0f b6 02             	movzbl (%edx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 17                	jne    1f8 <strcmp+0x28>
 1e1:	eb 3a                	jmp    21d <strcmp+0x4d>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1ec:	83 c2 01             	add    $0x1,%edx
 1ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 1f2:	84 c0                	test   %al,%al
 1f4:	74 1a                	je     210 <strcmp+0x40>
    p++, q++;
 1f6:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 1f8:	0f b6 19             	movzbl (%ecx),%ebx
 1fb:	38 c3                	cmp    %al,%bl
 1fd:	74 e9                	je     1e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ff:	29 d8                	sub    %ebx,%eax
}
 201:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 204:	c9                   	leave  
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 210:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 214:	31 c0                	xor    %eax,%eax
 216:	29 d8                	sub    %ebx,%eax
}
 218:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21b:	c9                   	leave  
 21c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 21d:	0f b6 19             	movzbl (%ecx),%ebx
 220:	31 c0                	xor    %eax,%eax
 222:	eb db                	jmp    1ff <strcmp+0x2f>
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strlen>:

uint strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 236:	80 3a 00             	cmpb   $0x0,(%edx)
 239:	74 15                	je     250 <strlen+0x20>
 23b:	31 c0                	xor    %eax,%eax
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c0 01             	add    $0x1,%eax
 243:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 247:	89 c1                	mov    %eax,%ecx
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	89 c8                	mov    %ecx,%eax
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop
  for (n = 0; s[n]; n++)
 250:	31 c9                	xor    %ecx,%ecx
}
 252:	5d                   	pop    %ebp
 253:	89 c8                	mov    %ecx,%eax
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <memset>:

void *
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	8b 7d fc             	mov    -0x4(%ebp),%edi
 275:	89 d0                	mov    %edx,%eax
 277:	c9                   	leave  
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <strchr>:

char *
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 28a:	0f b6 10             	movzbl (%eax),%edx
 28d:	84 d2                	test   %dl,%dl
 28f:	75 12                	jne    2a3 <strchr+0x23>
 291:	eb 1d                	jmp    2b0 <strchr+0x30>
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 29c:	83 c0 01             	add    $0x1,%eax
 29f:	84 d2                	test   %dl,%dl
 2a1:	74 0d                	je     2b0 <strchr+0x30>
    if (*s == c)
 2a3:	38 d1                	cmp    %dl,%cl
 2a5:	75 f1                	jne    298 <strchr+0x18>
      return (char *)s;
  return 0;
}
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2b0:	31 c0                	xor    %eax,%eax
}
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <gets>:

char *
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 2c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2c8:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 2c9:	31 db                	xor    %ebx,%ebx
{
 2cb:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 2ce:	eb 27                	jmp    2f7 <gets+0x37>
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	6a 01                	push   $0x1
 2d5:	57                   	push   %edi
 2d6:	6a 00                	push   $0x0
 2d8:	e8 d1 01 00 00       	call   4ae <read>
    if (cc < 1)
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7e 1d                	jle    301 <gets+0x41>
      break;
    buf[i++] = c;
 2e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 2ef:	3c 0a                	cmp    $0xa,%al
 2f1:	74 1d                	je     310 <gets+0x50>
 2f3:	3c 0d                	cmp    $0xd,%al
 2f5:	74 19                	je     310 <gets+0x50>
  for (i = 0; i + 1 < max;)
 2f7:	89 de                	mov    %ebx,%esi
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ff:	7c cf                	jl     2d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 308:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5f                   	pop    %edi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    
  buf[i] = '\0';
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	89 de                	mov    %ebx,%esi
 315:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 319:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31c:	5b                   	pop    %ebx
 31d:	5e                   	pop    %esi
 31e:	5f                   	pop    %edi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 328:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <stat>:

int stat(const char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	push   0x8(%ebp)
 33d:	e8 94 01 00 00       	call   4d6 <open>
  if (fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	push   0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 97 01 00 00       	call   4ee <fstat>
  close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35a:	89 c6                	mov    %eax,%esi
  close(fd);
 35c:	e8 5d 01 00 00       	call   4be <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax

00000380 <atoi>:

int atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 387:	0f be 02             	movsbl (%edx),%eax
 38a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 38d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 390:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 395:	77 1e                	ja     3b5 <atoi+0x35>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b8:	89 c8                	mov    %ecx,%eax
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 45 10             	mov    0x10(%ebp),%eax
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ca:	56                   	push   %esi
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7e 13                	jle    3e5 <memmove+0x25>
 3d2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d4:	89 d7                	mov    %edx,%edi
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 3f6:	68 00 20 00 00       	push   $0x2000
 3fb:	e8 30 04 00 00       	call   830 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 400:	50                   	push   %eax
 401:	ff 75 10             	push   0x10(%ebp)
 404:	ff 75 0c             	push   0xc(%ebp)
 407:	ff 75 08             	push   0x8(%ebp)
 40a:	e8 27 01 00 00       	call   536 <clone>

  return pid;
}
 40f:	c9                   	leave  
 410:	c3                   	ret    
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <thread_join>:

int thread_join()
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 427:	6a 04                	push   $0x4
 429:	e8 02 04 00 00       	call   830 <malloc>
 42e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 431:	8d 45 f4             	lea    -0xc(%ebp),%eax
 434:	89 04 24             	mov    %eax,(%esp)
 437:	e8 02 01 00 00       	call   53e <join>
 43c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 43e:	58                   	pop    %eax
 43f:	ff 75 f4             	push   -0xc(%ebp)
 442:	e8 59 03 00 00       	call   7a0 <free>
  lock_release(&lock);

  return pid;
}
 447:	89 d8                	mov    %ebx,%eax
 449:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44c:	c9                   	leave  
 44d:	c3                   	ret    
 44e:	66 90                	xchg   %ax,%ax

00000450 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 456:	83 38 01             	cmpl   $0x1,(%eax)
 459:	75 05                	jne    460 <lock_acquire+0x10>
 45b:	eb fe                	jmp    45b <lock_acquire+0xb>
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 460:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <lock_release>:
void lock_release(lock_t *lock)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 47c:	5d                   	pop    %ebp
 47d:	c3                   	ret    
 47e:	66 90                	xchg   %ax,%ax

00000480 <lock_init>:
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 48c:	5d                   	pop    %ebp
 48d:	c3                   	ret    

0000048e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48e:	b8 01 00 00 00       	mov    $0x1,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <exit>:
SYSCALL(exit)
 496:	b8 02 00 00 00       	mov    $0x2,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <wait>:
SYSCALL(wait)
 49e:	b8 03 00 00 00       	mov    $0x3,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <pipe>:
SYSCALL(pipe)
 4a6:	b8 04 00 00 00       	mov    $0x4,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <read>:
SYSCALL(read)
 4ae:	b8 05 00 00 00       	mov    $0x5,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <write>:
SYSCALL(write)
 4b6:	b8 10 00 00 00       	mov    $0x10,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <close>:
SYSCALL(close)
 4be:	b8 15 00 00 00       	mov    $0x15,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <kill>:
SYSCALL(kill)
 4c6:	b8 06 00 00 00       	mov    $0x6,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <exec>:
SYSCALL(exec)
 4ce:	b8 07 00 00 00       	mov    $0x7,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <open>:
SYSCALL(open)
 4d6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <mknod>:
SYSCALL(mknod)
 4de:	b8 11 00 00 00       	mov    $0x11,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <unlink>:
SYSCALL(unlink)
 4e6:	b8 12 00 00 00       	mov    $0x12,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <fstat>:
SYSCALL(fstat)
 4ee:	b8 08 00 00 00       	mov    $0x8,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <link>:
SYSCALL(link)
 4f6:	b8 13 00 00 00       	mov    $0x13,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <mkdir>:
SYSCALL(mkdir)
 4fe:	b8 14 00 00 00       	mov    $0x14,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <chdir>:
SYSCALL(chdir)
 506:	b8 09 00 00 00       	mov    $0x9,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <dup>:
SYSCALL(dup)
 50e:	b8 0a 00 00 00       	mov    $0xa,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <getpid>:
SYSCALL(getpid)
 516:	b8 0b 00 00 00       	mov    $0xb,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <sbrk>:
SYSCALL(sbrk)
 51e:	b8 0c 00 00 00       	mov    $0xc,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <sleep>:
SYSCALL(sleep)
 526:	b8 0d 00 00 00       	mov    $0xd,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <uptime>:
SYSCALL(uptime)
 52e:	b8 0e 00 00 00       	mov    $0xe,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <clone>:
SYSCALL(clone)
 536:	b8 16 00 00 00       	mov    $0x16,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <join>:
 53e:	b8 17 00 00 00       	mov    $0x17,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    
 546:	66 90                	xchg   %ax,%ax
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
 559:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 55c:	89 d1                	mov    %edx,%ecx
{
 55e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 561:	85 d2                	test   %edx,%edx
 563:	0f 89 7f 00 00 00    	jns    5e8 <printint+0x98>
 569:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 56d:	74 79                	je     5e8 <printint+0x98>
    neg = 1;
 56f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 576:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 578:	31 db                	xor    %ebx,%ebx
 57a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 580:	89 c8                	mov    %ecx,%eax
 582:	31 d2                	xor    %edx,%edx
 584:	89 cf                	mov    %ecx,%edi
 586:	f7 75 c4             	divl   -0x3c(%ebp)
 589:	0f b6 92 00 0a 00 00 	movzbl 0xa00(%edx),%edx
 590:	89 45 c0             	mov    %eax,-0x40(%ebp)
 593:	89 d8                	mov    %ebx,%eax
 595:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 598:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 59b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 59e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5a1:	76 dd                	jbe    580 <printint+0x30>
  if(neg)
 5a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5a6:	85 c9                	test   %ecx,%ecx
 5a8:	74 0c                	je     5b6 <printint+0x66>
    buf[i++] = '-';
 5aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5bd:	eb 07                	jmp    5c6 <printint+0x76>
 5bf:	90                   	nop
    putc(fd, buf[i]);
 5c0:	0f b6 13             	movzbl (%ebx),%edx
 5c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5c6:	83 ec 04             	sub    $0x4,%esp
 5c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5cc:	6a 01                	push   $0x1
 5ce:	56                   	push   %esi
 5cf:	57                   	push   %edi
 5d0:	e8 e1 fe ff ff       	call   4b6 <write>
  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x70>
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ef:	eb 87                	jmp    578 <printint+0x28>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 60c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 60f:	0f b6 13             	movzbl (%ebx),%edx
 612:	84 d2                	test   %dl,%dl
 614:	74 6a                	je     680 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 616:	8d 45 10             	lea    0x10(%ebp),%eax
 619:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 61c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 61f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 621:	89 45 d0             	mov    %eax,-0x30(%ebp)
 624:	eb 36                	jmp    65c <printf+0x5c>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
 630:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 633:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	74 15                	je     652 <printf+0x52>
  write(fd, &c, 1);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	88 55 e7             	mov    %dl,-0x19(%ebp)
 643:	6a 01                	push   $0x1
 645:	57                   	push   %edi
 646:	56                   	push   %esi
 647:	e8 6a fe ff ff       	call   4b6 <write>
 64c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 64f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 652:	0f b6 13             	movzbl (%ebx),%edx
 655:	83 c3 01             	add    $0x1,%ebx
 658:	84 d2                	test   %dl,%dl
 65a:	74 24                	je     680 <printf+0x80>
    c = fmt[i] & 0xff;
 65c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 65f:	85 c9                	test   %ecx,%ecx
 661:	74 cd                	je     630 <printf+0x30>
      }
    } else if(state == '%'){
 663:	83 f9 25             	cmp    $0x25,%ecx
 666:	75 ea                	jne    652 <printf+0x52>
      if(c == 'd'){
 668:	83 f8 25             	cmp    $0x25,%eax
 66b:	0f 84 07 01 00 00    	je     778 <printf+0x178>
 671:	83 e8 63             	sub    $0x63,%eax
 674:	83 f8 15             	cmp    $0x15,%eax
 677:	77 17                	ja     690 <printf+0x90>
 679:	ff 24 85 a8 09 00 00 	jmp    *0x9a8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
 683:	5b                   	pop    %ebx
 684:	5e                   	pop    %esi
 685:	5f                   	pop    %edi
 686:	5d                   	pop    %ebp
 687:	c3                   	ret    
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 696:	6a 01                	push   $0x1
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69e:	e8 13 fe ff ff       	call   4b6 <write>
        putc(fd, c);
 6a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6a7:	83 c4 0c             	add    $0xc,%esp
 6aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6ad:	6a 01                	push   $0x1
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 00 fe ff ff       	call   4b6 <write>
        putc(fd, c);
 6b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b9:	31 c9                	xor    %ecx,%ecx
 6bb:	eb 95                	jmp    652 <printf+0x52>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c8:	6a 00                	push   $0x0
 6ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	89 f0                	mov    %esi,%eax
 6d1:	e8 7a fe ff ff       	call   550 <printint>
        ap++;
 6d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6dd:	31 c9                	xor    %ecx,%ecx
 6df:	e9 6e ff ff ff       	jmp    652 <printf+0x52>
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6eb:	8b 10                	mov    (%eax),%edx
        ap++;
 6ed:	83 c0 04             	add    $0x4,%eax
 6f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6f3:	85 d2                	test   %edx,%edx
 6f5:	0f 84 8d 00 00 00    	je     788 <printf+0x188>
        while(*s != 0){
 6fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 700:	84 c0                	test   %al,%al
 702:	0f 84 4a ff ff ff    	je     652 <printf+0x52>
 708:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 70b:	89 d3                	mov    %edx,%ebx
 70d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
          s++;
 713:	83 c3 01             	add    $0x1,%ebx
 716:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	57                   	push   %edi
 71c:	56                   	push   %esi
 71d:	e8 94 fd ff ff       	call   4b6 <write>
        while(*s != 0){
 722:	0f b6 03             	movzbl (%ebx),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x110>
      state = 0;
 72c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 72f:	31 c9                	xor    %ecx,%ecx
 731:	e9 1c ff ff ff       	jmp    652 <printf+0x52>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	6a 01                	push   $0x1
 74a:	e9 7b ff ff ff       	jmp    6ca <printf+0xca>
 74f:	90                   	nop
        putc(fd, *ap);
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
 75a:	57                   	push   %edi
 75b:	56                   	push   %esi
        putc(fd, *ap);
 75c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 75f:	e8 52 fd ff ff       	call   4b6 <write>
        ap++;
 764:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 768:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76b:	31 c9                	xor    %ecx,%ecx
 76d:	e9 e0 fe ff ff       	jmp    652 <printf+0x52>
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 778:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 77b:	83 ec 04             	sub    $0x4,%esp
 77e:	e9 2a ff ff ff       	jmp    6ad <printf+0xad>
 783:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 787:	90                   	nop
          s = "(null)";
 788:	ba a1 09 00 00       	mov    $0x9a1,%edx
        while(*s != 0){
 78d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 790:	b8 28 00 00 00       	mov    $0x28,%eax
 795:	89 d3                	mov    %edx,%ebx
 797:	e9 74 ff ff ff       	jmp    710 <printf+0x110>
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	a1 78 0d 00 00       	mov    0xd78,%eax
{
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	53                   	push   %ebx
 7ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7b8:	89 c2                	mov    %eax,%edx
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	39 ca                	cmp    %ecx,%edx
 7be:	73 30                	jae    7f0 <free+0x50>
 7c0:	39 c1                	cmp    %eax,%ecx
 7c2:	72 04                	jb     7c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	39 c2                	cmp    %eax,%edx
 7c6:	72 f0                	jb     7b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ce:	39 f8                	cmp    %edi,%eax
 7d0:	74 30                	je     802 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d5:	8b 42 04             	mov    0x4(%edx),%eax
 7d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7db:	39 f1                	cmp    %esi,%ecx
 7dd:	74 3a                	je     819 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7e1:	5b                   	pop    %ebx
  freep = p;
 7e2:	89 15 78 0d 00 00    	mov    %edx,0xd78
}
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f0:	39 c2                	cmp    %eax,%edx
 7f2:	72 c4                	jb     7b8 <free+0x18>
 7f4:	39 c1                	cmp    %eax,%ecx
 7f6:	73 c0                	jae    7b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fe:	39 f8                	cmp    %edi,%eax
 800:	75 d0                	jne    7d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 802:	03 70 04             	add    0x4(%eax),%esi
 805:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 808:	8b 02                	mov    (%edx),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 80f:	8b 42 04             	mov    0x4(%edx),%eax
 812:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 815:	39 f1                	cmp    %esi,%ecx
 817:	75 c6                	jne    7df <free+0x3f>
    p->s.size += bp->s.size;
 819:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 81c:	89 15 78 0d 00 00    	mov    %edx,0xd78
    p->s.size += bp->s.size;
 822:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 825:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 828:	89 0a                	mov    %ecx,(%edx)
}
 82a:	5b                   	pop    %ebx
 82b:	5e                   	pop    %esi
 82c:	5f                   	pop    %edi
 82d:	5d                   	pop    %ebp
 82e:	c3                   	ret    
 82f:	90                   	nop

00000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 83c:	8b 3d 78 0d 00 00    	mov    0xd78,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 842:	8d 70 07             	lea    0x7(%eax),%esi
 845:	c1 ee 03             	shr    $0x3,%esi
 848:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 84b:	85 ff                	test   %edi,%edi
 84d:	0f 84 9d 00 00 00    	je     8f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 853:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 855:	8b 4a 04             	mov    0x4(%edx),%ecx
 858:	39 f1                	cmp    %esi,%ecx
 85a:	73 6a                	jae    8c6 <malloc+0x96>
 85c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 861:	39 de                	cmp    %ebx,%esi
 863:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 866:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 86d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 870:	eb 17                	jmp    889 <malloc+0x59>
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 878:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 87a:	8b 48 04             	mov    0x4(%eax),%ecx
 87d:	39 f1                	cmp    %esi,%ecx
 87f:	73 4f                	jae    8d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 881:	8b 3d 78 0d 00 00    	mov    0xd78,%edi
 887:	89 c2                	mov    %eax,%edx
 889:	39 d7                	cmp    %edx,%edi
 88b:	75 eb                	jne    878 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 88d:	83 ec 0c             	sub    $0xc,%esp
 890:	ff 75 e4             	push   -0x1c(%ebp)
 893:	e8 86 fc ff ff       	call   51e <sbrk>
  if(p == (char*)-1)
 898:	83 c4 10             	add    $0x10,%esp
 89b:	83 f8 ff             	cmp    $0xffffffff,%eax
 89e:	74 1c                	je     8bc <malloc+0x8c>
  hp->s.size = nu;
 8a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a3:	83 ec 0c             	sub    $0xc,%esp
 8a6:	83 c0 08             	add    $0x8,%eax
 8a9:	50                   	push   %eax
 8aa:	e8 f1 fe ff ff       	call   7a0 <free>
  return freep;
 8af:	8b 15 78 0d 00 00    	mov    0xd78,%edx
      if((p = morecore(nunits)) == 0)
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	85 d2                	test   %edx,%edx
 8ba:	75 bc                	jne    878 <malloc+0x48>
        return 0;
  }
}
 8bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8bf:	31 c0                	xor    %eax,%eax
}
 8c1:	5b                   	pop    %ebx
 8c2:	5e                   	pop    %esi
 8c3:	5f                   	pop    %edi
 8c4:	5d                   	pop    %ebp
 8c5:	c3                   	ret    
    if(p->s.size >= nunits){
 8c6:	89 d0                	mov    %edx,%eax
 8c8:	89 fa                	mov    %edi,%edx
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8d0:	39 ce                	cmp    %ecx,%esi
 8d2:	74 4c                	je     920 <malloc+0xf0>
        p->s.size -= nunits;
 8d4:	29 f1                	sub    %esi,%ecx
 8d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8df:	89 15 78 0d 00 00    	mov    %edx,0xd78
}
 8e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8e8:	83 c0 08             	add    $0x8,%eax
}
 8eb:	5b                   	pop    %ebx
 8ec:	5e                   	pop    %esi
 8ed:	5f                   	pop    %edi
 8ee:	5d                   	pop    %ebp
 8ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8f0:	c7 05 78 0d 00 00 7c 	movl   $0xd7c,0xd78
 8f7:	0d 00 00 
    base.s.size = 0;
 8fa:	bf 7c 0d 00 00       	mov    $0xd7c,%edi
    base.s.ptr = freep = prevp = &base;
 8ff:	c7 05 7c 0d 00 00 7c 	movl   $0xd7c,0xd7c
 906:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 90b:	c7 05 80 0d 00 00 00 	movl   $0x0,0xd80
 912:	00 00 00 
    if(p->s.size >= nunits){
 915:	e9 42 ff ff ff       	jmp    85c <malloc+0x2c>
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 920:	8b 08                	mov    (%eax),%ecx
 922:	89 0a                	mov    %ecx,(%edx)
 924:	eb b9                	jmp    8df <malloc+0xaf>
