
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
   b:	e8 25 01 00 00       	call   135 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 40 03 00 00       	call   35d <write>
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  2c:	68 34 05 00 00       	push   $0x534
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 e8 02 00 00       	call   335 <fork>
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
  58:	e8 e0 02 00 00       	call   33d <exit>
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
  69:	e8 d7 02 00 00       	call   345 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 74 05 00 00       	push   $0x574
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 ad 02 00 00       	call   33d <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 3f 05 00 00       	push   $0x53f
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 99 02 00 00       	call   33d <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 9c 02 00 00       	call   345 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 66 05 00 00       	push   $0x566
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 53 05 00 00       	push   $0x553
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 64 02 00 00       	call   33d <exit>

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
  e4:	e8 54 02 00 00       	call   33d <exit>

000000e9 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	56                   	push   %esi
  ed:	53                   	push   %ebx
  ee:	8b 75 08             	mov    0x8(%ebp),%esi
  f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
  f4:	89 f0                	mov    %esi,%eax
  f6:	89 d1                	mov    %edx,%ecx
  f8:	83 c2 01             	add    $0x1,%edx
  fb:	89 c3                	mov    %eax,%ebx
  fd:	83 c0 01             	add    $0x1,%eax
 100:	0f b6 09             	movzbl (%ecx),%ecx
 103:	88 0b                	mov    %cl,(%ebx)
 105:	84 c9                	test   %cl,%cl
 107:	75 ed                	jne    f6 <strcpy+0xd>
    ;
  return os;
}
 109:	89 f0                	mov    %esi,%eax
 10b:	5b                   	pop    %ebx
 10c:	5e                   	pop    %esi
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <strcmp>:

int strcmp(const char *p, const char *q)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	8b 4d 08             	mov    0x8(%ebp),%ecx
 115:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 118:	eb 06                	jmp    120 <strcmp+0x11>
    p++, q++;
 11a:	83 c1 01             	add    $0x1,%ecx
 11d:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 120:	0f b6 01             	movzbl (%ecx),%eax
 123:	84 c0                	test   %al,%al
 125:	74 04                	je     12b <strcmp+0x1c>
 127:	3a 02                	cmp    (%edx),%al
 129:	74 ef                	je     11a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 12b:	0f b6 c0             	movzbl %al,%eax
 12e:	0f b6 12             	movzbl (%edx),%edx
 131:	29 d0                	sub    %edx,%eax
}
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strlen>:

uint strlen(const char *s)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 13b:	b8 00 00 00 00       	mov    $0x0,%eax
 140:	eb 03                	jmp    145 <strlen+0x10>
 142:	83 c0 01             	add    $0x1,%eax
 145:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 149:	75 f7                	jne    142 <strlen+0xd>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    

0000014d <memset>:

void *
memset(void *dst, int c, uint n)
{
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
 150:	57                   	push   %edi
 151:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 154:	89 d7                	mov    %edx,%edi
 156:	8b 4d 10             	mov    0x10(%ebp),%ecx
 159:	8b 45 0c             	mov    0xc(%ebp),%eax
 15c:	fc                   	cld    
 15d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 15f:	89 d0                	mov    %edx,%eax
 161:	8b 7d fc             	mov    -0x4(%ebp),%edi
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char *
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 170:	eb 03                	jmp    175 <strchr+0xf>
 172:	83 c0 01             	add    $0x1,%eax
 175:	0f b6 10             	movzbl (%eax),%edx
 178:	84 d2                	test   %dl,%dl
 17a:	74 06                	je     182 <strchr+0x1c>
    if (*s == c)
 17c:	38 ca                	cmp    %cl,%dl
 17e:	75 f2                	jne    172 <strchr+0xc>
 180:	eb 05                	jmp    187 <strchr+0x21>
      return (char *)s;
  return 0;
 182:	b8 00 00 00 00       	mov    $0x0,%eax
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    

00000189 <gets>:

char *
gets(char *buf, int max)
{
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	57                   	push   %edi
 18d:	56                   	push   %esi
 18e:	53                   	push   %ebx
 18f:	83 ec 1c             	sub    $0x1c,%esp
 192:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 195:	bb 00 00 00 00       	mov    $0x0,%ebx
 19a:	89 de                	mov    %ebx,%esi
 19c:	83 c3 01             	add    $0x1,%ebx
 19f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a2:	7d 2e                	jge    1d2 <gets+0x49>
  {
    cc = read(0, &c, 1);
 1a4:	83 ec 04             	sub    $0x4,%esp
 1a7:	6a 01                	push   $0x1
 1a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ac:	50                   	push   %eax
 1ad:	6a 00                	push   $0x0
 1af:	e8 a1 01 00 00       	call   355 <read>
    if (cc < 1)
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	85 c0                	test   %eax,%eax
 1b9:	7e 17                	jle    1d2 <gets+0x49>
      break;
    buf[i++] = c;
 1bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	0f 94 c2             	sete   %dl
 1c7:	3c 0d                	cmp    $0xd,%al
 1c9:	0f 94 c0             	sete   %al
 1cc:	08 c2                	or     %al,%dl
 1ce:	74 ca                	je     19a <gets+0x11>
    buf[i++] = c;
 1d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1d6:	89 f8                	mov    %edi,%eax
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    

000001e0 <stat>:

int stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 8b 01 00 00       	call   37d <open>
  if (fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 24                	js     21d <stat+0x3d>
 1f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1fb:	83 ec 08             	sub    $0x8,%esp
 1fe:	ff 75 0c             	push   0xc(%ebp)
 201:	50                   	push   %eax
 202:	e8 8e 01 00 00       	call   395 <fstat>
 207:	89 c6                	mov    %eax,%esi
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
 20c:	e8 54 01 00 00       	call   365 <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	89 f0                	mov    %esi,%eax
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
    return -1;
 21d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 222:	eb f0                	jmp    214 <stat+0x34>

00000224 <atoi>:

int atoi(const char *s)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 22b:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 230:	eb 10                	jmp    242 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 232:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 235:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 238:	83 c1 01             	add    $0x1,%ecx
 23b:	0f be c0             	movsbl %al,%eax
 23e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 242:	0f b6 01             	movzbl (%ecx),%eax
 245:	8d 58 d0             	lea    -0x30(%eax),%ebx
 248:	80 fb 09             	cmp    $0x9,%bl
 24b:	76 e5                	jbe    232 <atoi+0xe>
  return n;
}
 24d:	89 d0                	mov    %edx,%eax
 24f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 252:	c9                   	leave  
 253:	c3                   	ret    

00000254 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	56                   	push   %esi
 258:	53                   	push   %ebx
 259:	8b 75 08             	mov    0x8(%ebp),%esi
 25c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 25f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 262:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 264:	eb 0d                	jmp    273 <memmove+0x1f>
    *dst++ = *src++;
 266:	0f b6 01             	movzbl (%ecx),%eax
 269:	88 02                	mov    %al,(%edx)
 26b:	8d 49 01             	lea    0x1(%ecx),%ecx
 26e:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 271:	89 d8                	mov    %ebx,%eax
 273:	8d 58 ff             	lea    -0x1(%eax),%ebx
 276:	85 c0                	test   %eax,%eax
 278:	7f ec                	jg     266 <memmove+0x12>
  return vdst;
}
 27a:	89 f0                	mov    %esi,%eax
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 286:	83 38 01             	cmpl   $0x1,(%eax)
 289:	74 fb                	je     286 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 28b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    

00000293 <lock_release>:
void lock_release(lock_t *lock)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    

000002a1 <lock_init>:
void lock_init(lock_t *lock)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <thread_create>:
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	53                   	push   %ebx
 2b3:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 2b6:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 2b9:	53                   	push   %ebx
 2ba:	e8 e2 ff ff ff       	call   2a1 <lock_init>
  lock_acquire(&lock);
 2bf:	89 1c 24             	mov    %ebx,(%esp)
 2c2:	e8 b9 ff ff ff       	call   280 <lock_acquire>
  void *stack = malloc(4096 * 2);
 2c7:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 2ce:	e8 da 01 00 00       	call   4ad <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 2d3:	50                   	push   %eax
 2d4:	ff 75 10             	push   0x10(%ebp)
 2d7:	ff 75 0c             	push   0xc(%ebp)
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 fb 00 00 00       	call   3dd <clone>
}
 2e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <thread_join>:
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	56                   	push   %esi
 2eb:	53                   	push   %ebx
 2ec:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 2ef:	6a 04                	push   $0x4
 2f1:	e8 b7 01 00 00       	call   4ad <malloc>
 2f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 2f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fc:	89 04 24             	mov    %eax,(%esp)
 2ff:	e8 e1 00 00 00       	call   3e5 <join>
 304:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 306:	8d 75 f0             	lea    -0x10(%ebp),%esi
 309:	89 34 24             	mov    %esi,(%esp)
 30c:	e8 90 ff ff ff       	call   2a1 <lock_init>
  lock_acquire(&lock);
 311:	89 34 24             	mov    %esi,(%esp)
 314:	e8 67 ff ff ff       	call   280 <lock_acquire>
  free(stack);
 319:	83 c4 04             	add    $0x4,%esp
 31c:	ff 75 f4             	push   -0xc(%ebp)
 31f:	e8 c9 00 00 00       	call   3ed <free>
  lock_release(&lock);
 324:	89 34 24             	mov    %esi,(%esp)
 327:	e8 67 ff ff ff       	call   293 <lock_release>
}
 32c:	89 d8                	mov    %ebx,%eax
 32e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 331:	5b                   	pop    %ebx
 332:	5e                   	pop    %esi
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    

00000335 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 335:	b8 01 00 00 00       	mov    $0x1,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <exit>:
SYSCALL(exit)
 33d:	b8 02 00 00 00       	mov    $0x2,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <wait>:
SYSCALL(wait)
 345:	b8 03 00 00 00       	mov    $0x3,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <pipe>:
SYSCALL(pipe)
 34d:	b8 04 00 00 00       	mov    $0x4,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <read>:
SYSCALL(read)
 355:	b8 05 00 00 00       	mov    $0x5,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <write>:
SYSCALL(write)
 35d:	b8 10 00 00 00       	mov    $0x10,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <close>:
SYSCALL(close)
 365:	b8 15 00 00 00       	mov    $0x15,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <kill>:
SYSCALL(kill)
 36d:	b8 06 00 00 00       	mov    $0x6,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <exec>:
SYSCALL(exec)
 375:	b8 07 00 00 00       	mov    $0x7,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <open>:
SYSCALL(open)
 37d:	b8 0f 00 00 00       	mov    $0xf,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <mknod>:
SYSCALL(mknod)
 385:	b8 11 00 00 00       	mov    $0x11,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <unlink>:
SYSCALL(unlink)
 38d:	b8 12 00 00 00       	mov    $0x12,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <fstat>:
SYSCALL(fstat)
 395:	b8 08 00 00 00       	mov    $0x8,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <link>:
SYSCALL(link)
 39d:	b8 13 00 00 00       	mov    $0x13,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <mkdir>:
SYSCALL(mkdir)
 3a5:	b8 14 00 00 00       	mov    $0x14,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <chdir>:
SYSCALL(chdir)
 3ad:	b8 09 00 00 00       	mov    $0x9,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <dup>:
SYSCALL(dup)
 3b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <getpid>:
SYSCALL(getpid)
 3bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <sbrk>:
SYSCALL(sbrk)
 3c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <sleep>:
SYSCALL(sleep)
 3cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <uptime>:
SYSCALL(uptime)
 3d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <clone>:
SYSCALL(clone)
 3dd:	b8 16 00 00 00       	mov    $0x16,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <join>:
 3e5:	b8 17 00 00 00       	mov    $0x17,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	57                   	push   %edi
 3f1:	56                   	push   %esi
 3f2:	53                   	push   %ebx
 3f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 3f6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3f9:	a1 90 08 00 00       	mov    0x890,%eax
 3fe:	eb 02                	jmp    402 <free+0x15>
 400:	89 d0                	mov    %edx,%eax
 402:	39 c8                	cmp    %ecx,%eax
 404:	73 04                	jae    40a <free+0x1d>
 406:	39 08                	cmp    %ecx,(%eax)
 408:	77 12                	ja     41c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 40a:	8b 10                	mov    (%eax),%edx
 40c:	39 c2                	cmp    %eax,%edx
 40e:	77 f0                	ja     400 <free+0x13>
 410:	39 c8                	cmp    %ecx,%eax
 412:	72 08                	jb     41c <free+0x2f>
 414:	39 ca                	cmp    %ecx,%edx
 416:	77 04                	ja     41c <free+0x2f>
 418:	89 d0                	mov    %edx,%eax
 41a:	eb e6                	jmp    402 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 41c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 41f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 422:	8b 10                	mov    (%eax),%edx
 424:	39 d7                	cmp    %edx,%edi
 426:	74 19                	je     441 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 428:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 42b:	8b 50 04             	mov    0x4(%eax),%edx
 42e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 431:	39 ce                	cmp    %ecx,%esi
 433:	74 1b                	je     450 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 435:	89 08                	mov    %ecx,(%eax)
  freep = p;
 437:	a3 90 08 00 00       	mov    %eax,0x890
}
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5f                   	pop    %edi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 441:	03 72 04             	add    0x4(%edx),%esi
 444:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 447:	8b 10                	mov    (%eax),%edx
 449:	8b 12                	mov    (%edx),%edx
 44b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 44e:	eb db                	jmp    42b <free+0x3e>
    p->s.size += bp->s.size;
 450:	03 53 fc             	add    -0x4(%ebx),%edx
 453:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 456:	8b 53 f8             	mov    -0x8(%ebx),%edx
 459:	89 10                	mov    %edx,(%eax)
 45b:	eb da                	jmp    437 <free+0x4a>

0000045d <morecore>:

static Header*
morecore(uint nu)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	53                   	push   %ebx
 461:	83 ec 04             	sub    $0x4,%esp
 464:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 466:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 46b:	77 05                	ja     472 <morecore+0x15>
    nu = 4096;
 46d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 472:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 479:	83 ec 0c             	sub    $0xc,%esp
 47c:	50                   	push   %eax
 47d:	e8 43 ff ff ff       	call   3c5 <sbrk>
  if(p == (char*)-1)
 482:	83 c4 10             	add    $0x10,%esp
 485:	83 f8 ff             	cmp    $0xffffffff,%eax
 488:	74 1c                	je     4a6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 48a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 48d:	83 c0 08             	add    $0x8,%eax
 490:	83 ec 0c             	sub    $0xc,%esp
 493:	50                   	push   %eax
 494:	e8 54 ff ff ff       	call   3ed <free>
  return freep;
 499:	a1 90 08 00 00       	mov    0x890,%eax
 49e:	83 c4 10             	add    $0x10,%esp
}
 4a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a4:	c9                   	leave  
 4a5:	c3                   	ret    
    return 0;
 4a6:	b8 00 00 00 00       	mov    $0x0,%eax
 4ab:	eb f4                	jmp    4a1 <morecore+0x44>

000004ad <malloc>:

void*
malloc(uint nbytes)
{
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
 4b0:	53                   	push   %ebx
 4b1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	8d 58 07             	lea    0x7(%eax),%ebx
 4ba:	c1 eb 03             	shr    $0x3,%ebx
 4bd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 4c0:	8b 0d 90 08 00 00    	mov    0x890,%ecx
 4c6:	85 c9                	test   %ecx,%ecx
 4c8:	74 04                	je     4ce <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4ca:	8b 01                	mov    (%ecx),%eax
 4cc:	eb 4a                	jmp    518 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 4ce:	c7 05 90 08 00 00 94 	movl   $0x894,0x890
 4d5:	08 00 00 
 4d8:	c7 05 94 08 00 00 94 	movl   $0x894,0x894
 4df:	08 00 00 
    base.s.size = 0;
 4e2:	c7 05 98 08 00 00 00 	movl   $0x0,0x898
 4e9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 4ec:	b9 94 08 00 00       	mov    $0x894,%ecx
 4f1:	eb d7                	jmp    4ca <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 4f3:	74 19                	je     50e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 4f5:	29 da                	sub    %ebx,%edx
 4f7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 4fa:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 4fd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 500:	89 0d 90 08 00 00    	mov    %ecx,0x890
      return (void*)(p + 1);
 506:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 509:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50c:	c9                   	leave  
 50d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 50e:	8b 10                	mov    (%eax),%edx
 510:	89 11                	mov    %edx,(%ecx)
 512:	eb ec                	jmp    500 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 514:	89 c1                	mov    %eax,%ecx
 516:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 518:	8b 50 04             	mov    0x4(%eax),%edx
 51b:	39 da                	cmp    %ebx,%edx
 51d:	73 d4                	jae    4f3 <malloc+0x46>
    if(p == freep)
 51f:	39 05 90 08 00 00    	cmp    %eax,0x890
 525:	75 ed                	jne    514 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 527:	89 d8                	mov    %ebx,%eax
 529:	e8 2f ff ff ff       	call   45d <morecore>
 52e:	85 c0                	test   %eax,%eax
 530:	75 e2                	jne    514 <malloc+0x67>
 532:	eb d5                	jmp    509 <malloc+0x5c>
