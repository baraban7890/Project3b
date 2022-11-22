
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 80 0b 00 00       	push   $0xb80
  15:	56                   	push   %esi
  16:	e8 49 03 00 00       	call   364 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 80 0b 00 00       	push   $0xb80
  2d:	6a 01                	push   $0x1
  2f:	e8 38 03 00 00       	call   36c <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 50 07 00 00       	push   $0x750
  43:	6a 01                	push   $0x1
  45:	e8 57 04 00 00       	call   4a1 <printf>
      exit();
  4a:	e8 fd 02 00 00       	call   34c <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 62 07 00 00       	push   $0x762
  60:	6a 01                	push   $0x1
  62:	e8 3a 04 00 00       	call   4a1 <printf>
    exit();
  67:	e8 e0 02 00 00       	call   34c <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 a6 02 00 00       	call   34c <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 bd 02 00 00       	call   374 <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 b8 02 00 00       	call   38c <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 73 07 00 00       	push   $0x773
  e7:	6a 01                	push   $0x1
  e9:	e8 b3 03 00 00       	call   4a1 <printf>
      exit();
  ee:	e8 59 02 00 00       	call   34c <exit>
  }
  exit();
  f3:	e8 54 02 00 00       	call   34c <exit>

000000f8 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	56                   	push   %esi
  fc:	53                   	push   %ebx
  fd:	8b 75 08             	mov    0x8(%ebp),%esi
 100:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 103:	89 f0                	mov    %esi,%eax
 105:	89 d1                	mov    %edx,%ecx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	89 c3                	mov    %eax,%ebx
 10c:	83 c0 01             	add    $0x1,%eax
 10f:	0f b6 09             	movzbl (%ecx),%ecx
 112:	88 0b                	mov    %cl,(%ebx)
 114:	84 c9                	test   %cl,%cl
 116:	75 ed                	jne    105 <strcpy+0xd>
    ;
  return os;
}
 118:	89 f0                	mov    %esi,%eax
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strcmp>:

int strcmp(const char *p, const char *q)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 127:	eb 06                	jmp    12f <strcmp+0x11>
    p++, q++;
 129:	83 c1 01             	add    $0x1,%ecx
 12c:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 12f:	0f b6 01             	movzbl (%ecx),%eax
 132:	84 c0                	test   %al,%al
 134:	74 04                	je     13a <strcmp+0x1c>
 136:	3a 02                	cmp    (%edx),%al
 138:	74 ef                	je     129 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 13a:	0f b6 c0             	movzbl %al,%eax
 13d:	0f b6 12             	movzbl (%edx),%edx
 140:	29 d0                	sub    %edx,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strlen>:

uint strlen(const char *s)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 14a:	b8 00 00 00 00       	mov    $0x0,%eax
 14f:	eb 03                	jmp    154 <strlen+0x10>
 151:	83 c0 01             	add    $0x1,%eax
 154:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 158:	75 f7                	jne    151 <strlen+0xd>
    ;
  return n;
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <memset>:

void *
memset(void *dst, int c, uint n)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 163:	89 d7                	mov    %edx,%edi
 165:	8b 4d 10             	mov    0x10(%ebp),%ecx
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	fc                   	cld    
 16c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 16e:	89 d0                	mov    %edx,%eax
 170:	8b 7d fc             	mov    -0x4(%ebp),%edi
 173:	c9                   	leave  
 174:	c3                   	ret    

00000175 <strchr>:

char *
strchr(const char *s, char c)
{
 175:	55                   	push   %ebp
 176:	89 e5                	mov    %esp,%ebp
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 17f:	eb 03                	jmp    184 <strchr+0xf>
 181:	83 c0 01             	add    $0x1,%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	84 d2                	test   %dl,%dl
 189:	74 06                	je     191 <strchr+0x1c>
    if (*s == c)
 18b:	38 ca                	cmp    %cl,%dl
 18d:	75 f2                	jne    181 <strchr+0xc>
 18f:	eb 05                	jmp    196 <strchr+0x21>
      return (char *)s;
  return 0;
 191:	b8 00 00 00 00       	mov    $0x0,%eax
}
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    

00000198 <gets>:

char *
gets(char *buf, int max)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	57                   	push   %edi
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 1a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a9:	89 de                	mov    %ebx,%esi
 1ab:	83 c3 01             	add    $0x1,%ebx
 1ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b1:	7d 2e                	jge    1e1 <gets+0x49>
  {
    cc = read(0, &c, 1);
 1b3:	83 ec 04             	sub    $0x4,%esp
 1b6:	6a 01                	push   $0x1
 1b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1bb:	50                   	push   %eax
 1bc:	6a 00                	push   $0x0
 1be:	e8 a1 01 00 00       	call   364 <read>
    if (cc < 1)
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 17                	jle    1e1 <gets+0x49>
      break;
    buf[i++] = c;
 1ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ce:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	0f 94 c2             	sete   %dl
 1d6:	3c 0d                	cmp    $0xd,%al
 1d8:	0f 94 c0             	sete   %al
 1db:	08 c2                	or     %al,%dl
 1dd:	74 ca                	je     1a9 <gets+0x11>
    buf[i++] = c;
 1df:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1e1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e5:	89 f8                	mov    %edi,%eax
 1e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <stat>:

int stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	push   0x8(%ebp)
 1fc:	e8 8b 01 00 00       	call   38c <open>
  if (fd < 0)
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	78 24                	js     22c <stat+0x3d>
 208:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	e8 8e 01 00 00       	call   3a4 <fstat>
 216:	89 c6                	mov    %eax,%esi
  close(fd);
 218:	89 1c 24             	mov    %ebx,(%esp)
 21b:	e8 54 01 00 00       	call   374 <close>
  return r;
 220:	83 c4 10             	add    $0x10,%esp
}
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
    return -1;
 22c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 231:	eb f0                	jmp    223 <stat+0x34>

00000233 <atoi>:

int atoi(const char *s)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	53                   	push   %ebx
 237:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23a:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 23f:	eb 10                	jmp    251 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 241:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 244:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 247:	83 c1 01             	add    $0x1,%ecx
 24a:	0f be c0             	movsbl %al,%eax
 24d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 251:	0f b6 01             	movzbl (%ecx),%eax
 254:	8d 58 d0             	lea    -0x30(%eax),%ebx
 257:	80 fb 09             	cmp    $0x9,%bl
 25a:	76 e5                	jbe    241 <atoi+0xe>
  return n;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 271:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 273:	eb 0d                	jmp    282 <memmove+0x1f>
    *dst++ = *src++;
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	88 02                	mov    %al,(%edx)
 27a:	8d 49 01             	lea    0x1(%ecx),%ecx
 27d:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 280:	89 d8                	mov    %ebx,%eax
 282:	8d 58 ff             	lea    -0x1(%eax),%ebx
 285:	85 c0                	test   %eax,%eax
 287:	7f ec                	jg     275 <memmove+0x12>
  return vdst;
}
 289:	89 f0                	mov    %esi,%eax
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    

0000028f <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 295:	83 38 01             	cmpl   $0x1,(%eax)
 298:	74 fb                	je     295 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 29a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 2a0:	5d                   	pop    %ebp
 2a1:	c3                   	ret    

000002a2 <lock_release>:
void lock_release(lock_t *lock)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    

000002b0 <lock_init>:
void lock_init(lock_t *lock)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2bc:	5d                   	pop    %ebp
 2bd:	c3                   	ret    

000002be <thread_create>:
{
 2be:	55                   	push   %ebp
 2bf:	89 e5                	mov    %esp,%ebp
 2c1:	53                   	push   %ebx
 2c2:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 2c5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 2c8:	53                   	push   %ebx
 2c9:	e8 e2 ff ff ff       	call   2b0 <lock_init>
  lock_acquire(&lock);
 2ce:	89 1c 24             	mov    %ebx,(%esp)
 2d1:	e8 b9 ff ff ff       	call   28f <lock_acquire>
  void *stack = malloc(4096 * 2);
 2d6:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 2dd:	e8 e5 03 00 00       	call   6c7 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 2e2:	50                   	push   %eax
 2e3:	ff 75 10             	push   0x10(%ebp)
 2e6:	ff 75 0c             	push   0xc(%ebp)
 2e9:	ff 75 08             	push   0x8(%ebp)
 2ec:	e8 fb 00 00 00       	call   3ec <clone>
}
 2f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f4:	c9                   	leave  
 2f5:	c3                   	ret    

000002f6 <thread_join>:
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	56                   	push   %esi
 2fa:	53                   	push   %ebx
 2fb:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 2fe:	6a 04                	push   $0x4
 300:	e8 c2 03 00 00       	call   6c7 <malloc>
 305:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	89 04 24             	mov    %eax,(%esp)
 30e:	e8 e1 00 00 00       	call   3f4 <join>
 313:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 315:	8d 75 f0             	lea    -0x10(%ebp),%esi
 318:	89 34 24             	mov    %esi,(%esp)
 31b:	e8 90 ff ff ff       	call   2b0 <lock_init>
  lock_acquire(&lock);
 320:	89 34 24             	mov    %esi,(%esp)
 323:	e8 67 ff ff ff       	call   28f <lock_acquire>
  free(stack);
 328:	83 c4 04             	add    $0x4,%esp
 32b:	ff 75 f4             	push   -0xc(%ebp)
 32e:	e8 d4 02 00 00       	call   607 <free>
  lock_release(&lock);
 333:	89 34 24             	mov    %esi,(%esp)
 336:	e8 67 ff ff ff       	call   2a2 <lock_release>
}
 33b:	89 d8                	mov    %ebx,%eax
 33d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 340:	5b                   	pop    %ebx
 341:	5e                   	pop    %esi
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    

00000344 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 344:	b8 01 00 00 00       	mov    $0x1,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <exit>:
SYSCALL(exit)
 34c:	b8 02 00 00 00       	mov    $0x2,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <wait>:
SYSCALL(wait)
 354:	b8 03 00 00 00       	mov    $0x3,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <pipe>:
SYSCALL(pipe)
 35c:	b8 04 00 00 00       	mov    $0x4,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <read>:
SYSCALL(read)
 364:	b8 05 00 00 00       	mov    $0x5,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <write>:
SYSCALL(write)
 36c:	b8 10 00 00 00       	mov    $0x10,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <close>:
SYSCALL(close)
 374:	b8 15 00 00 00       	mov    $0x15,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <kill>:
SYSCALL(kill)
 37c:	b8 06 00 00 00       	mov    $0x6,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <exec>:
SYSCALL(exec)
 384:	b8 07 00 00 00       	mov    $0x7,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <open>:
SYSCALL(open)
 38c:	b8 0f 00 00 00       	mov    $0xf,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <mknod>:
SYSCALL(mknod)
 394:	b8 11 00 00 00       	mov    $0x11,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <unlink>:
SYSCALL(unlink)
 39c:	b8 12 00 00 00       	mov    $0x12,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <fstat>:
SYSCALL(fstat)
 3a4:	b8 08 00 00 00       	mov    $0x8,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <link>:
SYSCALL(link)
 3ac:	b8 13 00 00 00       	mov    $0x13,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <mkdir>:
SYSCALL(mkdir)
 3b4:	b8 14 00 00 00       	mov    $0x14,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <chdir>:
SYSCALL(chdir)
 3bc:	b8 09 00 00 00       	mov    $0x9,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <dup>:
SYSCALL(dup)
 3c4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <getpid>:
SYSCALL(getpid)
 3cc:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <sbrk>:
SYSCALL(sbrk)
 3d4:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <sleep>:
SYSCALL(sleep)
 3dc:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <uptime>:
SYSCALL(uptime)
 3e4:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <clone>:
SYSCALL(clone)
 3ec:	b8 16 00 00 00       	mov    $0x16,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <join>:
 3f4:	b8 17 00 00 00       	mov    $0x17,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 1c             	sub    $0x1c,%esp
 402:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 405:	6a 01                	push   $0x1
 407:	8d 55 f4             	lea    -0xc(%ebp),%edx
 40a:	52                   	push   %edx
 40b:	50                   	push   %eax
 40c:	e8 5b ff ff ff       	call   36c <write>
}
 411:	83 c4 10             	add    $0x10,%esp
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	57                   	push   %edi
 41a:	56                   	push   %esi
 41b:	53                   	push   %ebx
 41c:	83 ec 2c             	sub    $0x2c,%esp
 41f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 422:	89 d0                	mov    %edx,%eax
 424:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 426:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 42a:	0f 95 c1             	setne  %cl
 42d:	c1 ea 1f             	shr    $0x1f,%edx
 430:	84 d1                	test   %dl,%cl
 432:	74 44                	je     478 <printint+0x62>
    neg = 1;
    x = -xx;
 434:	f7 d8                	neg    %eax
 436:	89 c1                	mov    %eax,%ecx
    neg = 1;
 438:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 43f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 444:	89 c8                	mov    %ecx,%eax
 446:	ba 00 00 00 00       	mov    $0x0,%edx
 44b:	f7 f6                	div    %esi
 44d:	89 df                	mov    %ebx,%edi
 44f:	83 c3 01             	add    $0x1,%ebx
 452:	0f b6 92 e8 07 00 00 	movzbl 0x7e8(%edx),%edx
 459:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 45d:	89 ca                	mov    %ecx,%edx
 45f:	89 c1                	mov    %eax,%ecx
 461:	39 d6                	cmp    %edx,%esi
 463:	76 df                	jbe    444 <printint+0x2e>
  if(neg)
 465:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 469:	74 31                	je     49c <printint+0x86>
    buf[i++] = '-';
 46b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 470:	8d 5f 02             	lea    0x2(%edi),%ebx
 473:	8b 75 d0             	mov    -0x30(%ebp),%esi
 476:	eb 17                	jmp    48f <printint+0x79>
    x = xx;
 478:	89 c1                	mov    %eax,%ecx
  neg = 0;
 47a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 481:	eb bc                	jmp    43f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 483:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 488:	89 f0                	mov    %esi,%eax
 48a:	e8 6d ff ff ff       	call   3fc <putc>
  while(--i >= 0)
 48f:	83 eb 01             	sub    $0x1,%ebx
 492:	79 ef                	jns    483 <printint+0x6d>
}
 494:	83 c4 2c             	add    $0x2c,%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 49f:	eb ee                	jmp    48f <printint+0x79>

000004a1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	57                   	push   %edi
 4a5:	56                   	push   %esi
 4a6:	53                   	push   %ebx
 4a7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4aa:	8d 45 10             	lea    0x10(%ebp),%eax
 4ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4b0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4b5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4ba:	eb 14                	jmp    4d0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4bc:	89 fa                	mov    %edi,%edx
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	e8 36 ff ff ff       	call   3fc <putc>
 4c6:	eb 05                	jmp    4cd <printf+0x2c>
      }
    } else if(state == '%'){
 4c8:	83 fe 25             	cmp    $0x25,%esi
 4cb:	74 25                	je     4f2 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4cd:	83 c3 01             	add    $0x1,%ebx
 4d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4d7:	84 c0                	test   %al,%al
 4d9:	0f 84 20 01 00 00    	je     5ff <printf+0x15e>
    c = fmt[i] & 0xff;
 4df:	0f be f8             	movsbl %al,%edi
 4e2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4e5:	85 f6                	test   %esi,%esi
 4e7:	75 df                	jne    4c8 <printf+0x27>
      if(c == '%'){
 4e9:	83 f8 25             	cmp    $0x25,%eax
 4ec:	75 ce                	jne    4bc <printf+0x1b>
        state = '%';
 4ee:	89 c6                	mov    %eax,%esi
 4f0:	eb db                	jmp    4cd <printf+0x2c>
      if(c == 'd'){
 4f2:	83 f8 25             	cmp    $0x25,%eax
 4f5:	0f 84 cf 00 00 00    	je     5ca <printf+0x129>
 4fb:	0f 8c dd 00 00 00    	jl     5de <printf+0x13d>
 501:	83 f8 78             	cmp    $0x78,%eax
 504:	0f 8f d4 00 00 00    	jg     5de <printf+0x13d>
 50a:	83 f8 63             	cmp    $0x63,%eax
 50d:	0f 8c cb 00 00 00    	jl     5de <printf+0x13d>
 513:	83 e8 63             	sub    $0x63,%eax
 516:	83 f8 15             	cmp    $0x15,%eax
 519:	0f 87 bf 00 00 00    	ja     5de <printf+0x13d>
 51f:	ff 24 85 90 07 00 00 	jmp    *0x790(,%eax,4)
        printint(fd, *ap, 10, 1);
 526:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 529:	8b 17                	mov    (%edi),%edx
 52b:	83 ec 0c             	sub    $0xc,%esp
 52e:	6a 01                	push   $0x1
 530:	b9 0a 00 00 00       	mov    $0xa,%ecx
 535:	8b 45 08             	mov    0x8(%ebp),%eax
 538:	e8 d9 fe ff ff       	call   416 <printint>
        ap++;
 53d:	83 c7 04             	add    $0x4,%edi
 540:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 543:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 546:	be 00 00 00 00       	mov    $0x0,%esi
 54b:	eb 80                	jmp    4cd <printf+0x2c>
        printint(fd, *ap, 16, 0);
 54d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 550:	8b 17                	mov    (%edi),%edx
 552:	83 ec 0c             	sub    $0xc,%esp
 555:	6a 00                	push   $0x0
 557:	b9 10 00 00 00       	mov    $0x10,%ecx
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	e8 b2 fe ff ff       	call   416 <printint>
        ap++;
 564:	83 c7 04             	add    $0x4,%edi
 567:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 56a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56d:	be 00 00 00 00       	mov    $0x0,%esi
 572:	e9 56 ff ff ff       	jmp    4cd <printf+0x2c>
        s = (char*)*ap;
 577:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57a:	8b 30                	mov    (%eax),%esi
        ap++;
 57c:	83 c0 04             	add    $0x4,%eax
 57f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 582:	85 f6                	test   %esi,%esi
 584:	75 15                	jne    59b <printf+0xfa>
          s = "(null)";
 586:	be 88 07 00 00       	mov    $0x788,%esi
 58b:	eb 0e                	jmp    59b <printf+0xfa>
          putc(fd, *s);
 58d:	0f be d2             	movsbl %dl,%edx
 590:	8b 45 08             	mov    0x8(%ebp),%eax
 593:	e8 64 fe ff ff       	call   3fc <putc>
          s++;
 598:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 59b:	0f b6 16             	movzbl (%esi),%edx
 59e:	84 d2                	test   %dl,%dl
 5a0:	75 eb                	jne    58d <printf+0xec>
      state = 0;
 5a2:	be 00 00 00 00       	mov    $0x0,%esi
 5a7:	e9 21 ff ff ff       	jmp    4cd <printf+0x2c>
        putc(fd, *ap);
 5ac:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5af:	0f be 17             	movsbl (%edi),%edx
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	e8 42 fe ff ff       	call   3fc <putc>
        ap++;
 5ba:	83 c7 04             	add    $0x4,%edi
 5bd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5c0:	be 00 00 00 00       	mov    $0x0,%esi
 5c5:	e9 03 ff ff ff       	jmp    4cd <printf+0x2c>
        putc(fd, c);
 5ca:	89 fa                	mov    %edi,%edx
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
 5cf:	e8 28 fe ff ff       	call   3fc <putc>
      state = 0;
 5d4:	be 00 00 00 00       	mov    $0x0,%esi
 5d9:	e9 ef fe ff ff       	jmp    4cd <printf+0x2c>
        putc(fd, '%');
 5de:	ba 25 00 00 00       	mov    $0x25,%edx
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	e8 11 fe ff ff       	call   3fc <putc>
        putc(fd, c);
 5eb:	89 fa                	mov    %edi,%edx
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	e8 07 fe ff ff       	call   3fc <putc>
      state = 0;
 5f5:	be 00 00 00 00       	mov    $0x0,%esi
 5fa:	e9 ce fe ff ff       	jmp    4cd <printf+0x2c>
    }
  }
}
 5ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 602:	5b                   	pop    %ebx
 603:	5e                   	pop    %esi
 604:	5f                   	pop    %edi
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    

00000607 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 607:	55                   	push   %ebp
 608:	89 e5                	mov    %esp,%ebp
 60a:	57                   	push   %edi
 60b:	56                   	push   %esi
 60c:	53                   	push   %ebx
 60d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 610:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 613:	a1 80 0d 00 00       	mov    0xd80,%eax
 618:	eb 02                	jmp    61c <free+0x15>
 61a:	89 d0                	mov    %edx,%eax
 61c:	39 c8                	cmp    %ecx,%eax
 61e:	73 04                	jae    624 <free+0x1d>
 620:	39 08                	cmp    %ecx,(%eax)
 622:	77 12                	ja     636 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 624:	8b 10                	mov    (%eax),%edx
 626:	39 c2                	cmp    %eax,%edx
 628:	77 f0                	ja     61a <free+0x13>
 62a:	39 c8                	cmp    %ecx,%eax
 62c:	72 08                	jb     636 <free+0x2f>
 62e:	39 ca                	cmp    %ecx,%edx
 630:	77 04                	ja     636 <free+0x2f>
 632:	89 d0                	mov    %edx,%eax
 634:	eb e6                	jmp    61c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 636:	8b 73 fc             	mov    -0x4(%ebx),%esi
 639:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63c:	8b 10                	mov    (%eax),%edx
 63e:	39 d7                	cmp    %edx,%edi
 640:	74 19                	je     65b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64b:	39 ce                	cmp    %ecx,%esi
 64d:	74 1b                	je     66a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 64f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 651:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 65b:	03 72 04             	add    0x4(%edx),%esi
 65e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 661:	8b 10                	mov    (%eax),%edx
 663:	8b 12                	mov    (%edx),%edx
 665:	89 53 f8             	mov    %edx,-0x8(%ebx)
 668:	eb db                	jmp    645 <free+0x3e>
    p->s.size += bp->s.size;
 66a:	03 53 fc             	add    -0x4(%ebx),%edx
 66d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 670:	8b 53 f8             	mov    -0x8(%ebx),%edx
 673:	89 10                	mov    %edx,(%eax)
 675:	eb da                	jmp    651 <free+0x4a>

00000677 <morecore>:

static Header*
morecore(uint nu)
{
 677:	55                   	push   %ebp
 678:	89 e5                	mov    %esp,%ebp
 67a:	53                   	push   %ebx
 67b:	83 ec 04             	sub    $0x4,%esp
 67e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 680:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 685:	77 05                	ja     68c <morecore+0x15>
    nu = 4096;
 687:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 68c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	50                   	push   %eax
 697:	e8 38 fd ff ff       	call   3d4 <sbrk>
  if(p == (char*)-1)
 69c:	83 c4 10             	add    $0x10,%esp
 69f:	83 f8 ff             	cmp    $0xffffffff,%eax
 6a2:	74 1c                	je     6c0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6a4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a7:	83 c0 08             	add    $0x8,%eax
 6aa:	83 ec 0c             	sub    $0xc,%esp
 6ad:	50                   	push   %eax
 6ae:	e8 54 ff ff ff       	call   607 <free>
  return freep;
 6b3:	a1 80 0d 00 00       	mov    0xd80,%eax
 6b8:	83 c4 10             	add    $0x10,%esp
}
 6bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6be:	c9                   	leave  
 6bf:	c3                   	ret    
    return 0;
 6c0:	b8 00 00 00 00       	mov    $0x0,%eax
 6c5:	eb f4                	jmp    6bb <morecore+0x44>

000006c7 <malloc>:

void*
malloc(uint nbytes)
{
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	53                   	push   %ebx
 6cb:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	8d 58 07             	lea    0x7(%eax),%ebx
 6d4:	c1 eb 03             	shr    $0x3,%ebx
 6d7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6da:	8b 0d 80 0d 00 00    	mov    0xd80,%ecx
 6e0:	85 c9                	test   %ecx,%ecx
 6e2:	74 04                	je     6e8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e4:	8b 01                	mov    (%ecx),%eax
 6e6:	eb 4a                	jmp    732 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6e8:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 6ef:	0d 00 00 
 6f2:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 6f9:	0d 00 00 
    base.s.size = 0;
 6fc:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 703:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 706:	b9 84 0d 00 00       	mov    $0xd84,%ecx
 70b:	eb d7                	jmp    6e4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 70d:	74 19                	je     728 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 70f:	29 da                	sub    %ebx,%edx
 711:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 714:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 717:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 71a:	89 0d 80 0d 00 00    	mov    %ecx,0xd80
      return (void*)(p + 1);
 720:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 723:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 726:	c9                   	leave  
 727:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 728:	8b 10                	mov    (%eax),%edx
 72a:	89 11                	mov    %edx,(%ecx)
 72c:	eb ec                	jmp    71a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 72e:	89 c1                	mov    %eax,%ecx
 730:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 732:	8b 50 04             	mov    0x4(%eax),%edx
 735:	39 da                	cmp    %ebx,%edx
 737:	73 d4                	jae    70d <malloc+0x46>
    if(p == freep)
 739:	39 05 80 0d 00 00    	cmp    %eax,0xd80
 73f:	75 ed                	jne    72e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 741:	89 d8                	mov    %ebx,%eax
 743:	e8 2f ff ff ff       	call   677 <morecore>
 748:	85 c0                	test   %eax,%eax
 74a:	75 e2                	jne    72e <malloc+0x67>
 74c:	eb d5                	jmp    723 <malloc+0x5c>
