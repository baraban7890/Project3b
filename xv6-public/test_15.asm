
_test_15:     file format elf32-i386


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
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   ppid = getpid();
   f:	e8 e2 04 00 00       	call   4f6 <getpid>

   lock_init(&lock);
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	68 58 0d 00 00       	push   $0xd58
   ppid = getpid();
  1c:	a3 60 0d 00 00       	mov    %eax,0xd60
   lock_init(&lock);
  21:	e8 3a 04 00 00       	call   460 <lock_init>

   int i;
   for (i = 0; i < num_threads; i++) {
  26:	a1 54 0d 00 00       	mov    0xd54,%eax
  2b:	83 c4 10             	add    $0x10,%esp
  2e:	85 c0                	test   %eax,%eax
  30:	0f 8e b4 00 00 00    	jle    ea <main+0xea>
  36:	31 db                	xor    %ebx,%ebx
  38:	eb 12                	jmp    4c <main+0x4c>
  3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  40:	a1 54 0d 00 00       	mov    0xd54,%eax
  45:	83 c3 01             	add    $0x1,%ebx
  48:	39 d8                	cmp    %ebx,%eax
  4a:	7e 5e                	jle    aa <main+0xaa>
      int thread_pid = thread_create(worker, 0, 0);
  4c:	83 ec 04             	sub    $0x4,%esp
  4f:	6a 00                	push   $0x0
  51:	6a 00                	push   $0x0
  53:	68 30 01 00 00       	push   $0x130
  58:	e8 73 03 00 00       	call   3d0 <thread_create>
      assert(thread_pid > 0);
  5d:	83 c4 10             	add    $0x10,%esp
  60:	85 c0                	test   %eax,%eax
  62:	7f dc                	jg     40 <main+0x40>
  64:	6a 25                	push   $0x25
  66:	68 08 09 00 00       	push   $0x908
  6b:	68 12 09 00 00       	push   $0x912
  70:	6a 01                	push   $0x1
  72:	e8 69 05 00 00       	call   5e0 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 1a 09 00 00       	push   $0x91a
   }

   for (i = 0; i < num_threads; i++) {
      int join_pid = thread_join();
      assert(join_pid > 0);
  7f:	68 29 09 00 00       	push   $0x929
  84:	6a 01                	push   $0x1
  86:	e8 55 05 00 00       	call   5e0 <printf>
  8b:	5a                   	pop    %edx
  8c:	59                   	pop    %ecx
  8d:	68 3d 09 00 00       	push   $0x93d
  92:	6a 01                	push   $0x1
  94:	e8 47 05 00 00       	call   5e0 <printf>
  99:	5b                   	pop    %ebx
  9a:	ff 35 60 0d 00 00    	push   0xd60
  a0:	e8 01 04 00 00       	call   4a6 <kill>
  a5:	e8 cc 03 00 00       	call   476 <exit>
   for (i = 0; i < num_threads; i++) {
  aa:	85 c0                	test   %eax,%eax
  ac:	7e 3c                	jle    ea <main+0xea>
  ae:	31 db                	xor    %ebx,%ebx
  b0:	eb 12                	jmp    c4 <main+0xc4>
  b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b8:	a1 54 0d 00 00       	mov    0xd54,%eax
  bd:	83 c3 01             	add    $0x1,%ebx
  c0:	39 d8                	cmp    %ebx,%eax
  c2:	7e 26                	jle    ea <main+0xea>
      int join_pid = thread_join();
  c4:	e8 37 03 00 00       	call   400 <thread_join>
      assert(join_pid > 0);
  c9:	85 c0                	test   %eax,%eax
  cb:	7f eb                	jg     b8 <main+0xb8>
  cd:	6a 2a                	push   $0x2a
  cf:	68 08 09 00 00       	push   $0x908
  d4:	68 12 09 00 00       	push   $0x912
  d9:	6a 01                	push   $0x1
  db:	e8 00 05 00 00       	call   5e0 <printf>
  e0:	83 c4 0c             	add    $0xc,%esp
  e3:	68 4a 09 00 00       	push   $0x94a
  e8:	eb 95                	jmp    7f <main+0x7f>
   }

   assert(global == num_threads * loops);
  ea:	0f af 05 50 0d 00 00 	imul   0xd50,%eax
  f1:	3b 05 5c 0d 00 00    	cmp    0xd5c,%eax
  f7:	74 20                	je     119 <main+0x119>
  f9:	6a 2d                	push   $0x2d
  fb:	68 08 09 00 00       	push   $0x908
 100:	68 12 09 00 00       	push   $0x912
 105:	6a 01                	push   $0x1
 107:	e8 d4 04 00 00       	call   5e0 <printf>
 10c:	83 c4 0c             	add    $0xc,%esp
 10f:	68 57 09 00 00       	push   $0x957
 114:	e9 66 ff ff ff       	jmp    7f <main+0x7f>

   printf(1, "TEST PASSED\n");
 119:	50                   	push   %eax
 11a:	50                   	push   %eax
 11b:	68 75 09 00 00       	push   $0x975
 120:	6a 01                	push   $0x1
 122:	e8 b9 04 00 00       	call   5e0 <printf>
   exit();
 127:	e8 4a 03 00 00       	call   476 <exit>
 12c:	66 90                	xchg   %ax,%ax
 12e:	66 90                	xchg   %ax,%ax

00000130 <worker>:
}

void
worker(void *arg1, void *arg2) {
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
 137:	a1 50 0d 00 00       	mov    0xd50,%eax
 13c:	85 c0                	test   %eax,%eax
 13e:	7e 36                	jle    176 <worker+0x46>
 140:	31 db                	xor    %ebx,%ebx
 142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      lock_acquire(&lock);
 148:	83 ec 0c             	sub    $0xc,%esp
   for (i = 0; i < loops; i++) {
 14b:	83 c3 01             	add    $0x1,%ebx
      lock_acquire(&lock);
 14e:	68 58 0d 00 00       	push   $0xd58
 153:	e8 d8 02 00 00       	call   430 <lock_acquire>
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
      global = tmp + 1;
      lock_release(&lock);
 158:	c7 04 24 58 0d 00 00 	movl   $0xd58,(%esp)
      global = tmp + 1;
 15f:	83 05 5c 0d 00 00 01 	addl   $0x1,0xd5c
      lock_release(&lock);
 166:	e8 e5 02 00 00       	call   450 <lock_release>
   for (i = 0; i < loops; i++) {
 16b:	83 c4 10             	add    $0x10,%esp
 16e:	39 1d 50 0d 00 00    	cmp    %ebx,0xd50
 174:	7f d2                	jg     148 <worker+0x18>
   }
   exit();
 176:	e8 fb 02 00 00       	call   476 <exit>
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
 1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strcmp>:

int strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c7:	90                   	nop
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
    p++, q++;
 1d6:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strlen>:

uint strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop
  for (n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void *
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave  
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char *
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if (*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char *)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <gets>:

char *
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2a8:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 d1 01 00 00       	call   48e <read>
    if (cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 1d                	je     2f0 <gets+0x50>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 19                	je     2f0 <gets+0x50>
  for (i = 0; i + 1 < max;)
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2eb:	5b                   	pop    %ebx
 2ec:	5e                   	pop    %esi
 2ed:	5f                   	pop    %edi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    
  buf[i] = '\0';
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	89 de                	mov    %ebx,%esi
 2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5f                   	pop    %edi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <stat>:

int stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	push   0x8(%ebp)
 31d:	e8 94 01 00 00       	call   4b6 <open>
  if (fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 97 01 00 00       	call   4ce <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 5d 01 00 00       	call   49e <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

00000360 <atoi>:

int atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave  
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 3d6:	68 00 20 00 00       	push   $0x2000
 3db:	e8 30 04 00 00       	call   810 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 3e0:	50                   	push   %eax
 3e1:	ff 75 10             	push   0x10(%ebp)
 3e4:	ff 75 0c             	push   0xc(%ebp)
 3e7:	ff 75 08             	push   0x8(%ebp)
 3ea:	e8 27 01 00 00       	call   516 <clone>

  return pid;
}
 3ef:	c9                   	leave  
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <thread_join>:

int thread_join()
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 407:	6a 04                	push   $0x4
 409:	e8 02 04 00 00       	call   810 <malloc>
 40e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 411:	8d 45 f4             	lea    -0xc(%ebp),%eax
 414:	89 04 24             	mov    %eax,(%esp)
 417:	e8 02 01 00 00       	call   51e <join>
 41c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 41e:	58                   	pop    %eax
 41f:	ff 75 f4             	push   -0xc(%ebp)
 422:	e8 59 03 00 00       	call   780 <free>
  lock_release(&lock);

  return pid;
}
 427:	89 d8                	mov    %ebx,%eax
 429:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 42c:	c9                   	leave  
 42d:	c3                   	ret    
 42e:	66 90                	xchg   %ax,%ax

00000430 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 436:	83 38 01             	cmpl   $0x1,(%eax)
 439:	75 05                	jne    440 <lock_acquire+0x10>
 43b:	eb fe                	jmp    43b <lock_acquire+0xb>
 43d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 440:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <lock_release>:
void lock_release(lock_t *lock)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    
 45e:	66 90                	xchg   %ax,%ax

00000460 <lock_init>:
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 46c:	5d                   	pop    %ebp
 46d:	c3                   	ret    

0000046e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 46e:	b8 01 00 00 00       	mov    $0x1,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <exit>:
SYSCALL(exit)
 476:	b8 02 00 00 00       	mov    $0x2,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <wait>:
SYSCALL(wait)
 47e:	b8 03 00 00 00       	mov    $0x3,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <pipe>:
SYSCALL(pipe)
 486:	b8 04 00 00 00       	mov    $0x4,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <read>:
SYSCALL(read)
 48e:	b8 05 00 00 00       	mov    $0x5,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <write>:
SYSCALL(write)
 496:	b8 10 00 00 00       	mov    $0x10,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <close>:
SYSCALL(close)
 49e:	b8 15 00 00 00       	mov    $0x15,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <kill>:
SYSCALL(kill)
 4a6:	b8 06 00 00 00       	mov    $0x6,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <exec>:
SYSCALL(exec)
 4ae:	b8 07 00 00 00       	mov    $0x7,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <open>:
SYSCALL(open)
 4b6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <mknod>:
SYSCALL(mknod)
 4be:	b8 11 00 00 00       	mov    $0x11,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <unlink>:
SYSCALL(unlink)
 4c6:	b8 12 00 00 00       	mov    $0x12,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <fstat>:
SYSCALL(fstat)
 4ce:	b8 08 00 00 00       	mov    $0x8,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <link>:
SYSCALL(link)
 4d6:	b8 13 00 00 00       	mov    $0x13,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <mkdir>:
SYSCALL(mkdir)
 4de:	b8 14 00 00 00       	mov    $0x14,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <chdir>:
SYSCALL(chdir)
 4e6:	b8 09 00 00 00       	mov    $0x9,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <dup>:
SYSCALL(dup)
 4ee:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <getpid>:
SYSCALL(getpid)
 4f6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <sbrk>:
SYSCALL(sbrk)
 4fe:	b8 0c 00 00 00       	mov    $0xc,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <sleep>:
SYSCALL(sleep)
 506:	b8 0d 00 00 00       	mov    $0xd,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <uptime>:
SYSCALL(uptime)
 50e:	b8 0e 00 00 00       	mov    $0xe,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <clone>:
SYSCALL(clone)
 516:	b8 16 00 00 00       	mov    $0x16,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <join>:
 51e:	b8 17 00 00 00       	mov    $0x17,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    
 526:	66 90                	xchg   %ax,%ax
 528:	66 90                	xchg   %ax,%ax
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 3c             	sub    $0x3c,%esp
 539:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 53c:	89 d1                	mov    %edx,%ecx
{
 53e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 541:	85 d2                	test   %edx,%edx
 543:	0f 89 7f 00 00 00    	jns    5c8 <printint+0x98>
 549:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 54d:	74 79                	je     5c8 <printint+0x98>
    neg = 1;
 54f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 556:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 558:	31 db                	xor    %ebx,%ebx
 55a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 560:	89 c8                	mov    %ecx,%eax
 562:	31 d2                	xor    %edx,%edx
 564:	89 cf                	mov    %ecx,%edi
 566:	f7 75 c4             	divl   -0x3c(%ebp)
 569:	0f b6 92 e4 09 00 00 	movzbl 0x9e4(%edx),%edx
 570:	89 45 c0             	mov    %eax,-0x40(%ebp)
 573:	89 d8                	mov    %ebx,%eax
 575:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 578:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 57b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 57e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 581:	76 dd                	jbe    560 <printint+0x30>
  if(neg)
 583:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 586:	85 c9                	test   %ecx,%ecx
 588:	74 0c                	je     596 <printint+0x66>
    buf[i++] = '-';
 58a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 58f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 591:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 596:	8b 7d b8             	mov    -0x48(%ebp),%edi
 599:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 59d:	eb 07                	jmp    5a6 <printint+0x76>
 59f:	90                   	nop
    putc(fd, buf[i]);
 5a0:	0f b6 13             	movzbl (%ebx),%edx
 5a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5a6:	83 ec 04             	sub    $0x4,%esp
 5a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ac:	6a 01                	push   $0x1
 5ae:	56                   	push   %esi
 5af:	57                   	push   %edi
 5b0:	e8 e1 fe ff ff       	call   496 <write>
  while(--i >= 0)
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	39 de                	cmp    %ebx,%esi
 5ba:	75 e4                	jne    5a0 <printint+0x70>
}
 5bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5f                   	pop    %edi
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5cf:	eb 87                	jmp    558 <printint+0x28>
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5ef:	0f b6 13             	movzbl (%ebx),%edx
 5f2:	84 d2                	test   %dl,%dl
 5f4:	74 6a                	je     660 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5f6:	8d 45 10             	lea    0x10(%ebp),%eax
 5f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 601:	89 45 d0             	mov    %eax,-0x30(%ebp)
 604:	eb 36                	jmp    63c <printf+0x5c>
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
 610:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 613:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	74 15                	je     632 <printf+0x52>
  write(fd, &c, 1);
 61d:	83 ec 04             	sub    $0x4,%esp
 620:	88 55 e7             	mov    %dl,-0x19(%ebp)
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	56                   	push   %esi
 627:	e8 6a fe ff ff       	call   496 <write>
 62c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 62f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 632:	0f b6 13             	movzbl (%ebx),%edx
 635:	83 c3 01             	add    $0x1,%ebx
 638:	84 d2                	test   %dl,%dl
 63a:	74 24                	je     660 <printf+0x80>
    c = fmt[i] & 0xff;
 63c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 63f:	85 c9                	test   %ecx,%ecx
 641:	74 cd                	je     610 <printf+0x30>
      }
    } else if(state == '%'){
 643:	83 f9 25             	cmp    $0x25,%ecx
 646:	75 ea                	jne    632 <printf+0x52>
      if(c == 'd'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	0f 84 07 01 00 00    	je     758 <printf+0x178>
 651:	83 e8 63             	sub    $0x63,%eax
 654:	83 f8 15             	cmp    $0x15,%eax
 657:	77 17                	ja     670 <printf+0x90>
 659:	ff 24 85 8c 09 00 00 	jmp    *0x98c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 660:	8d 65 f4             	lea    -0xc(%ebp),%esp
 663:	5b                   	pop    %ebx
 664:	5e                   	pop    %esi
 665:	5f                   	pop    %edi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret    
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 676:	6a 01                	push   $0x1
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 67e:	e8 13 fe ff ff       	call   496 <write>
        putc(fd, c);
 683:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 687:	83 c4 0c             	add    $0xc,%esp
 68a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 68d:	6a 01                	push   $0x1
 68f:	57                   	push   %edi
 690:	56                   	push   %esi
 691:	e8 00 fe ff ff       	call   496 <write>
        putc(fd, c);
 696:	83 c4 10             	add    $0x10,%esp
      state = 0;
 699:	31 c9                	xor    %ecx,%ecx
 69b:	eb 95                	jmp    632 <printf+0x52>
 69d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a8:	6a 00                	push   $0x0
 6aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	89 f0                	mov    %esi,%eax
 6b1:	e8 7a fe ff ff       	call   530 <printint>
        ap++;
 6b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bd:	31 c9                	xor    %ecx,%ecx
 6bf:	e9 6e ff ff ff       	jmp    632 <printf+0x52>
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6cb:	8b 10                	mov    (%eax),%edx
        ap++;
 6cd:	83 c0 04             	add    $0x4,%eax
 6d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6d3:	85 d2                	test   %edx,%edx
 6d5:	0f 84 8d 00 00 00    	je     768 <printf+0x188>
        while(*s != 0){
 6db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6e0:	84 c0                	test   %al,%al
 6e2:	0f 84 4a ff ff ff    	je     632 <printf+0x52>
 6e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6eb:	89 d3                	mov    %edx,%ebx
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6f3:	83 c3 01             	add    $0x1,%ebx
 6f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f9:	6a 01                	push   $0x1
 6fb:	57                   	push   %edi
 6fc:	56                   	push   %esi
 6fd:	e8 94 fd ff ff       	call   496 <write>
        while(*s != 0){
 702:	0f b6 03             	movzbl (%ebx),%eax
 705:	83 c4 10             	add    $0x10,%esp
 708:	84 c0                	test   %al,%al
 70a:	75 e4                	jne    6f0 <printf+0x110>
      state = 0;
 70c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 70f:	31 c9                	xor    %ecx,%ecx
 711:	e9 1c ff ff ff       	jmp    632 <printf+0x52>
 716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 0a 00 00 00       	mov    $0xa,%ecx
 728:	6a 01                	push   $0x1
 72a:	e9 7b ff ff ff       	jmp    6aa <printf+0xca>
 72f:	90                   	nop
        putc(fd, *ap);
 730:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 736:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 738:	6a 01                	push   $0x1
 73a:	57                   	push   %edi
 73b:	56                   	push   %esi
        putc(fd, *ap);
 73c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 73f:	e8 52 fd ff ff       	call   496 <write>
        ap++;
 744:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 748:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74b:	31 c9                	xor    %ecx,%ecx
 74d:	e9 e0 fe ff ff       	jmp    632 <printf+0x52>
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 758:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 75b:	83 ec 04             	sub    $0x4,%esp
 75e:	e9 2a ff ff ff       	jmp    68d <printf+0xad>
 763:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 767:	90                   	nop
          s = "(null)";
 768:	ba 82 09 00 00       	mov    $0x982,%edx
        while(*s != 0){
 76d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 770:	b8 28 00 00 00       	mov    $0x28,%eax
 775:	89 d3                	mov    %edx,%ebx
 777:	e9 74 ff ff ff       	jmp    6f0 <printf+0x110>
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	a1 64 0d 00 00       	mov    0xd64,%eax
{
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 78e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 798:	89 c2                	mov    %eax,%edx
 79a:	8b 00                	mov    (%eax),%eax
 79c:	39 ca                	cmp    %ecx,%edx
 79e:	73 30                	jae    7d0 <free+0x50>
 7a0:	39 c1                	cmp    %eax,%ecx
 7a2:	72 04                	jb     7a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	39 c2                	cmp    %eax,%edx
 7a6:	72 f0                	jb     798 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	74 30                	je     7e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7b5:	8b 42 04             	mov    0x4(%edx),%eax
 7b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7bb:	39 f1                	cmp    %esi,%ecx
 7bd:	74 3a                	je     7f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7c1:	5b                   	pop    %ebx
  freep = p;
 7c2:	89 15 64 0d 00 00    	mov    %edx,0xd64
}
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret    
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d0:	39 c2                	cmp    %eax,%edx
 7d2:	72 c4                	jb     798 <free+0x18>
 7d4:	39 c1                	cmp    %eax,%ecx
 7d6:	73 c0                	jae    798 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7de:	39 f8                	cmp    %edi,%eax
 7e0:	75 d0                	jne    7b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7e2:	03 70 04             	add    0x4(%eax),%esi
 7e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e8:	8b 02                	mov    (%edx),%eax
 7ea:	8b 00                	mov    (%eax),%eax
 7ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ef:	8b 42 04             	mov    0x4(%edx),%eax
 7f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7f5:	39 f1                	cmp    %esi,%ecx
 7f7:	75 c6                	jne    7bf <free+0x3f>
    p->s.size += bp->s.size;
 7f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7fc:	89 15 64 0d 00 00    	mov    %edx,0xd64
    p->s.size += bp->s.size;
 802:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 805:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 808:	89 0a                	mov    %ecx,(%edx)
}
 80a:	5b                   	pop    %ebx
 80b:	5e                   	pop    %esi
 80c:	5f                   	pop    %edi
 80d:	5d                   	pop    %ebp
 80e:	c3                   	ret    
 80f:	90                   	nop

00000810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 81c:	8b 3d 64 0d 00 00    	mov    0xd64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	8d 70 07             	lea    0x7(%eax),%esi
 825:	c1 ee 03             	shr    $0x3,%esi
 828:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 82b:	85 ff                	test   %edi,%edi
 82d:	0f 84 9d 00 00 00    	je     8d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 833:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 835:	8b 4a 04             	mov    0x4(%edx),%ecx
 838:	39 f1                	cmp    %esi,%ecx
 83a:	73 6a                	jae    8a6 <malloc+0x96>
 83c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 841:	39 de                	cmp    %ebx,%esi
 843:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 846:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 84d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 850:	eb 17                	jmp    869 <malloc+0x59>
 852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 858:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 85a:	8b 48 04             	mov    0x4(%eax),%ecx
 85d:	39 f1                	cmp    %esi,%ecx
 85f:	73 4f                	jae    8b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 861:	8b 3d 64 0d 00 00    	mov    0xd64,%edi
 867:	89 c2                	mov    %eax,%edx
 869:	39 d7                	cmp    %edx,%edi
 86b:	75 eb                	jne    858 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 86d:	83 ec 0c             	sub    $0xc,%esp
 870:	ff 75 e4             	push   -0x1c(%ebp)
 873:	e8 86 fc ff ff       	call   4fe <sbrk>
  if(p == (char*)-1)
 878:	83 c4 10             	add    $0x10,%esp
 87b:	83 f8 ff             	cmp    $0xffffffff,%eax
 87e:	74 1c                	je     89c <malloc+0x8c>
  hp->s.size = nu;
 880:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 883:	83 ec 0c             	sub    $0xc,%esp
 886:	83 c0 08             	add    $0x8,%eax
 889:	50                   	push   %eax
 88a:	e8 f1 fe ff ff       	call   780 <free>
  return freep;
 88f:	8b 15 64 0d 00 00    	mov    0xd64,%edx
      if((p = morecore(nunits)) == 0)
 895:	83 c4 10             	add    $0x10,%esp
 898:	85 d2                	test   %edx,%edx
 89a:	75 bc                	jne    858 <malloc+0x48>
        return 0;
  }
}
 89c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 89f:	31 c0                	xor    %eax,%eax
}
 8a1:	5b                   	pop    %ebx
 8a2:	5e                   	pop    %esi
 8a3:	5f                   	pop    %edi
 8a4:	5d                   	pop    %ebp
 8a5:	c3                   	ret    
    if(p->s.size >= nunits){
 8a6:	89 d0                	mov    %edx,%eax
 8a8:	89 fa                	mov    %edi,%edx
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b0:	39 ce                	cmp    %ecx,%esi
 8b2:	74 4c                	je     900 <malloc+0xf0>
        p->s.size -= nunits;
 8b4:	29 f1                	sub    %esi,%ecx
 8b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8bf:	89 15 64 0d 00 00    	mov    %edx,0xd64
}
 8c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
}
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 64 0d 00 00 68 	movl   $0xd68,0xd64
 8d7:	0d 00 00 
    base.s.size = 0;
 8da:	bf 68 0d 00 00       	mov    $0xd68,%edi
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 68 0d 00 00 68 	movl   $0xd68,0xd68
 8e6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8eb:	c7 05 6c 0d 00 00 00 	movl   $0x0,0xd6c
 8f2:	00 00 00 
    if(p->s.size >= nunits){
 8f5:	e9 42 ff ff ff       	jmp    83c <malloc+0x2c>
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 900:	8b 08                	mov    (%eax),%ecx
 902:	89 0a                	mov    %ecx,(%edx)
 904:	eb b9                	jmp    8bf <malloc+0xaf>
