
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

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
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 74 07 00 00       	push   $0x774
  2f:	6a 01                	push   $0x1
  31:	e8 8f 04 00 00       	call   4c5 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 01 00 00       	call   180 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 0a 03 00 00       	call   368 <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 87 07 00 00       	push   $0x787
  70:	6a 01                	push   $0x1
  72:	e8 4e 04 00 00       	call   4c5 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 25 03 00 00       	call   3b0 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 e4 02 00 00       	call   390 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 d8 02 00 00       	call   398 <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 91 07 00 00       	push   $0x791
  c8:	6a 01                	push   $0x1
  ca:	e8 f6 03 00 00       	call   4c5 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 d3 02 00 00       	call   3b0 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 8a 02 00 00       	call   388 <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 86 02 00 00       	call   398 <close>

  wait();
 112:	e8 61 02 00 00       	call   378 <wait>

  exit();
 117:	e8 54 02 00 00       	call   370 <exit>

0000011c <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	56                   	push   %esi
 120:	53                   	push   %ebx
 121:	8b 75 08             	mov    0x8(%ebp),%esi
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 127:	89 f0                	mov    %esi,%eax
 129:	89 d1                	mov    %edx,%ecx
 12b:	83 c2 01             	add    $0x1,%edx
 12e:	89 c3                	mov    %eax,%ebx
 130:	83 c0 01             	add    $0x1,%eax
 133:	0f b6 09             	movzbl (%ecx),%ecx
 136:	88 0b                	mov    %cl,(%ebx)
 138:	84 c9                	test   %cl,%cl
 13a:	75 ed                	jne    129 <strcpy+0xd>
    ;
  return os;
}
 13c:	89 f0                	mov    %esi,%eax
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcmp>:

int strcmp(const char *p, const char *q)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 4d 08             	mov    0x8(%ebp),%ecx
 148:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 14b:	eb 06                	jmp    153 <strcmp+0x11>
    p++, q++;
 14d:	83 c1 01             	add    $0x1,%ecx
 150:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 153:	0f b6 01             	movzbl (%ecx),%eax
 156:	84 c0                	test   %al,%al
 158:	74 04                	je     15e <strcmp+0x1c>
 15a:	3a 02                	cmp    (%edx),%al
 15c:	74 ef                	je     14d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	29 d0                	sub    %edx,%eax
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

00000168 <strlen>:

uint strlen(const char *s)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 16e:	b8 00 00 00 00       	mov    $0x0,%eax
 173:	eb 03                	jmp    178 <strlen+0x10>
 175:	83 c0 01             	add    $0x1,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	75 f7                	jne    175 <strlen+0xd>
    ;
  return n;
}
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <memset>:

void *
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	89 d7                	mov    %edx,%edi
 189:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 7d fc             	mov    -0x4(%ebp),%edi
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <strchr>:

char *
strchr(const char *s, char c)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 1a3:	eb 03                	jmp    1a8 <strchr+0xf>
 1a5:	83 c0 01             	add    $0x1,%eax
 1a8:	0f b6 10             	movzbl (%eax),%edx
 1ab:	84 d2                	test   %dl,%dl
 1ad:	74 06                	je     1b5 <strchr+0x1c>
    if (*s == c)
 1af:	38 ca                	cmp    %cl,%dl
 1b1:	75 f2                	jne    1a5 <strchr+0xc>
 1b3:	eb 05                	jmp    1ba <strchr+0x21>
      return (char *)s;
  return 0;
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <gets>:

char *
gets(char *buf, int max)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	57                   	push   %edi
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	83 ec 1c             	sub    $0x1c,%esp
 1c5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 1c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cd:	89 de                	mov    %ebx,%esi
 1cf:	83 c3 01             	add    $0x1,%ebx
 1d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d5:	7d 2e                	jge    205 <gets+0x49>
  {
    cc = read(0, &c, 1);
 1d7:	83 ec 04             	sub    $0x4,%esp
 1da:	6a 01                	push   $0x1
 1dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1df:	50                   	push   %eax
 1e0:	6a 00                	push   $0x0
 1e2:	e8 a1 01 00 00       	call   388 <read>
    if (cc < 1)
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	7e 17                	jle    205 <gets+0x49>
      break;
    buf[i++] = c;
 1ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	0f 94 c2             	sete   %dl
 1fa:	3c 0d                	cmp    $0xd,%al
 1fc:	0f 94 c0             	sete   %al
 1ff:	08 c2                	or     %al,%dl
 201:	74 ca                	je     1cd <gets+0x11>
    buf[i++] = c;
 203:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 205:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 209:	89 f8                	mov    %edi,%eax
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <stat>:

int stat(const char *n, struct stat *st)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	83 ec 08             	sub    $0x8,%esp
 21b:	6a 00                	push   $0x0
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 8b 01 00 00       	call   3b0 <open>
  if (fd < 0)
 225:	83 c4 10             	add    $0x10,%esp
 228:	85 c0                	test   %eax,%eax
 22a:	78 24                	js     250 <stat+0x3d>
 22c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	push   0xc(%ebp)
 234:	50                   	push   %eax
 235:	e8 8e 01 00 00       	call   3c8 <fstat>
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 54 01 00 00       	call   398 <close>
  return r;
 244:	83 c4 10             	add    $0x10,%esp
}
 247:	89 f0                	mov    %esi,%eax
 249:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb f0                	jmp    247 <stat+0x34>

00000257 <atoi>:

int atoi(const char *s)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 263:	eb 10                	jmp    275 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 265:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 268:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	0f be c0             	movsbl %al,%eax
 271:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e5                	jbe    265 <atoi+0xe>
  return n;
}
 280:	89 d0                	mov    %edx,%eax
 282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	8b 75 08             	mov    0x8(%ebp),%esi
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 295:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 297:	eb 0d                	jmp    2a6 <memmove+0x1f>
    *dst++ = *src++;
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	88 02                	mov    %al,(%edx)
 29e:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a1:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 2a4:	89 d8                	mov    %ebx,%eax
 2a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7f ec                	jg     299 <memmove+0x12>
  return vdst;
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 2b9:	83 38 01             	cmpl   $0x1,(%eax)
 2bc:	74 fb                	je     2b9 <lock_acquire+0x6>
    ;
  lock->flag = 1;
 2be:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <lock_release>:
void lock_release(lock_t *lock)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2c9:	8b 45 08             	mov    0x8(%ebp),%eax
 2cc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    

000002d4 <lock_init>:
void lock_init(lock_t *lock)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret    

000002e2 <thread_create>:
{
 2e2:	55                   	push   %ebp
 2e3:	89 e5                	mov    %esp,%ebp
 2e5:	53                   	push   %ebx
 2e6:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 2e9:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 2ec:	53                   	push   %ebx
 2ed:	e8 e2 ff ff ff       	call   2d4 <lock_init>
  lock_acquire(&lock);
 2f2:	89 1c 24             	mov    %ebx,(%esp)
 2f5:	e8 b9 ff ff ff       	call   2b3 <lock_acquire>
  void *stack = malloc(4096 * 2);
 2fa:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 301:	e8 e5 03 00 00       	call   6eb <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 306:	50                   	push   %eax
 307:	ff 75 10             	push   0x10(%ebp)
 30a:	ff 75 0c             	push   0xc(%ebp)
 30d:	ff 75 08             	push   0x8(%ebp)
 310:	e8 fb 00 00 00       	call   410 <clone>
}
 315:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 318:	c9                   	leave  
 319:	c3                   	ret    

0000031a <thread_join>:
{
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	56                   	push   %esi
 31e:	53                   	push   %ebx
 31f:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 322:	6a 04                	push   $0x4
 324:	e8 c2 03 00 00       	call   6eb <malloc>
 329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 32c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 32f:	89 04 24             	mov    %eax,(%esp)
 332:	e8 e1 00 00 00       	call   418 <join>
 337:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 339:	8d 75 f0             	lea    -0x10(%ebp),%esi
 33c:	89 34 24             	mov    %esi,(%esp)
 33f:	e8 90 ff ff ff       	call   2d4 <lock_init>
  lock_acquire(&lock);
 344:	89 34 24             	mov    %esi,(%esp)
 347:	e8 67 ff ff ff       	call   2b3 <lock_acquire>
  free(stack);
 34c:	83 c4 04             	add    $0x4,%esp
 34f:	ff 75 f4             	push   -0xc(%ebp)
 352:	e8 d4 02 00 00       	call   62b <free>
  lock_release(&lock);
 357:	89 34 24             	mov    %esi,(%esp)
 35a:	e8 67 ff ff ff       	call   2c6 <lock_release>
}
 35f:	89 d8                	mov    %ebx,%eax
 361:	8d 65 f8             	lea    -0x8(%ebp),%esp
 364:	5b                   	pop    %ebx
 365:	5e                   	pop    %esi
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    

00000368 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 368:	b8 01 00 00 00       	mov    $0x1,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <exit>:
SYSCALL(exit)
 370:	b8 02 00 00 00       	mov    $0x2,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <wait>:
SYSCALL(wait)
 378:	b8 03 00 00 00       	mov    $0x3,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <pipe>:
SYSCALL(pipe)
 380:	b8 04 00 00 00       	mov    $0x4,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <read>:
SYSCALL(read)
 388:	b8 05 00 00 00       	mov    $0x5,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <write>:
SYSCALL(write)
 390:	b8 10 00 00 00       	mov    $0x10,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <close>:
SYSCALL(close)
 398:	b8 15 00 00 00       	mov    $0x15,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <kill>:
SYSCALL(kill)
 3a0:	b8 06 00 00 00       	mov    $0x6,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <exec>:
SYSCALL(exec)
 3a8:	b8 07 00 00 00       	mov    $0x7,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <open>:
SYSCALL(open)
 3b0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <mknod>:
SYSCALL(mknod)
 3b8:	b8 11 00 00 00       	mov    $0x11,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <unlink>:
SYSCALL(unlink)
 3c0:	b8 12 00 00 00       	mov    $0x12,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <fstat>:
SYSCALL(fstat)
 3c8:	b8 08 00 00 00       	mov    $0x8,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <link>:
SYSCALL(link)
 3d0:	b8 13 00 00 00       	mov    $0x13,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <mkdir>:
SYSCALL(mkdir)
 3d8:	b8 14 00 00 00       	mov    $0x14,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <chdir>:
SYSCALL(chdir)
 3e0:	b8 09 00 00 00       	mov    $0x9,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <dup>:
SYSCALL(dup)
 3e8:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <getpid>:
SYSCALL(getpid)
 3f0:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <sbrk>:
SYSCALL(sbrk)
 3f8:	b8 0c 00 00 00       	mov    $0xc,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <sleep>:
SYSCALL(sleep)
 400:	b8 0d 00 00 00       	mov    $0xd,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <uptime>:
SYSCALL(uptime)
 408:	b8 0e 00 00 00       	mov    $0xe,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <clone>:
SYSCALL(clone)
 410:	b8 16 00 00 00       	mov    $0x16,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <join>:
 418:	b8 17 00 00 00       	mov    $0x17,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	83 ec 1c             	sub    $0x1c,%esp
 426:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 429:	6a 01                	push   $0x1
 42b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 42e:	52                   	push   %edx
 42f:	50                   	push   %eax
 430:	e8 5b ff ff ff       	call   390 <write>
}
 435:	83 c4 10             	add    $0x10,%esp
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	57                   	push   %edi
 43e:	56                   	push   %esi
 43f:	53                   	push   %ebx
 440:	83 ec 2c             	sub    $0x2c,%esp
 443:	89 45 d0             	mov    %eax,-0x30(%ebp)
 446:	89 d0                	mov    %edx,%eax
 448:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 44a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 44e:	0f 95 c1             	setne  %cl
 451:	c1 ea 1f             	shr    $0x1f,%edx
 454:	84 d1                	test   %dl,%cl
 456:	74 44                	je     49c <printint+0x62>
    neg = 1;
    x = -xx;
 458:	f7 d8                	neg    %eax
 45a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 45c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 463:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 468:	89 c8                	mov    %ecx,%eax
 46a:	ba 00 00 00 00       	mov    $0x0,%edx
 46f:	f7 f6                	div    %esi
 471:	89 df                	mov    %ebx,%edi
 473:	83 c3 01             	add    $0x1,%ebx
 476:	0f b6 92 f8 07 00 00 	movzbl 0x7f8(%edx),%edx
 47d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 481:	89 ca                	mov    %ecx,%edx
 483:	89 c1                	mov    %eax,%ecx
 485:	39 d6                	cmp    %edx,%esi
 487:	76 df                	jbe    468 <printint+0x2e>
  if(neg)
 489:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 48d:	74 31                	je     4c0 <printint+0x86>
    buf[i++] = '-';
 48f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 494:	8d 5f 02             	lea    0x2(%edi),%ebx
 497:	8b 75 d0             	mov    -0x30(%ebp),%esi
 49a:	eb 17                	jmp    4b3 <printint+0x79>
    x = xx;
 49c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 49e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4a5:	eb bc                	jmp    463 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4a7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4ac:	89 f0                	mov    %esi,%eax
 4ae:	e8 6d ff ff ff       	call   420 <putc>
  while(--i >= 0)
 4b3:	83 eb 01             	sub    $0x1,%ebx
 4b6:	79 ef                	jns    4a7 <printint+0x6d>
}
 4b8:	83 c4 2c             	add    $0x2c,%esp
 4bb:	5b                   	pop    %ebx
 4bc:	5e                   	pop    %esi
 4bd:	5f                   	pop    %edi
 4be:	5d                   	pop    %ebp
 4bf:	c3                   	ret    
 4c0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4c3:	eb ee                	jmp    4b3 <printint+0x79>

000004c5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	57                   	push   %edi
 4c9:	56                   	push   %esi
 4ca:	53                   	push   %ebx
 4cb:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4ce:	8d 45 10             	lea    0x10(%ebp),%eax
 4d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4d4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4d9:	bb 00 00 00 00       	mov    $0x0,%ebx
 4de:	eb 14                	jmp    4f4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4e0:	89 fa                	mov    %edi,%edx
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	e8 36 ff ff ff       	call   420 <putc>
 4ea:	eb 05                	jmp    4f1 <printf+0x2c>
      }
    } else if(state == '%'){
 4ec:	83 fe 25             	cmp    $0x25,%esi
 4ef:	74 25                	je     516 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4f1:	83 c3 01             	add    $0x1,%ebx
 4f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4fb:	84 c0                	test   %al,%al
 4fd:	0f 84 20 01 00 00    	je     623 <printf+0x15e>
    c = fmt[i] & 0xff;
 503:	0f be f8             	movsbl %al,%edi
 506:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 509:	85 f6                	test   %esi,%esi
 50b:	75 df                	jne    4ec <printf+0x27>
      if(c == '%'){
 50d:	83 f8 25             	cmp    $0x25,%eax
 510:	75 ce                	jne    4e0 <printf+0x1b>
        state = '%';
 512:	89 c6                	mov    %eax,%esi
 514:	eb db                	jmp    4f1 <printf+0x2c>
      if(c == 'd'){
 516:	83 f8 25             	cmp    $0x25,%eax
 519:	0f 84 cf 00 00 00    	je     5ee <printf+0x129>
 51f:	0f 8c dd 00 00 00    	jl     602 <printf+0x13d>
 525:	83 f8 78             	cmp    $0x78,%eax
 528:	0f 8f d4 00 00 00    	jg     602 <printf+0x13d>
 52e:	83 f8 63             	cmp    $0x63,%eax
 531:	0f 8c cb 00 00 00    	jl     602 <printf+0x13d>
 537:	83 e8 63             	sub    $0x63,%eax
 53a:	83 f8 15             	cmp    $0x15,%eax
 53d:	0f 87 bf 00 00 00    	ja     602 <printf+0x13d>
 543:	ff 24 85 a0 07 00 00 	jmp    *0x7a0(,%eax,4)
        printint(fd, *ap, 10, 1);
 54a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 54d:	8b 17                	mov    (%edi),%edx
 54f:	83 ec 0c             	sub    $0xc,%esp
 552:	6a 01                	push   $0x1
 554:	b9 0a 00 00 00       	mov    $0xa,%ecx
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	e8 d9 fe ff ff       	call   43a <printint>
        ap++;
 561:	83 c7 04             	add    $0x4,%edi
 564:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 567:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56a:	be 00 00 00 00       	mov    $0x0,%esi
 56f:	eb 80                	jmp    4f1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 571:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 574:	8b 17                	mov    (%edi),%edx
 576:	83 ec 0c             	sub    $0xc,%esp
 579:	6a 00                	push   $0x0
 57b:	b9 10 00 00 00       	mov    $0x10,%ecx
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	e8 b2 fe ff ff       	call   43a <printint>
        ap++;
 588:	83 c7 04             	add    $0x4,%edi
 58b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 58e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 591:	be 00 00 00 00       	mov    $0x0,%esi
 596:	e9 56 ff ff ff       	jmp    4f1 <printf+0x2c>
        s = (char*)*ap;
 59b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59e:	8b 30                	mov    (%eax),%esi
        ap++;
 5a0:	83 c0 04             	add    $0x4,%eax
 5a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5a6:	85 f6                	test   %esi,%esi
 5a8:	75 15                	jne    5bf <printf+0xfa>
          s = "(null)";
 5aa:	be 97 07 00 00       	mov    $0x797,%esi
 5af:	eb 0e                	jmp    5bf <printf+0xfa>
          putc(fd, *s);
 5b1:	0f be d2             	movsbl %dl,%edx
 5b4:	8b 45 08             	mov    0x8(%ebp),%eax
 5b7:	e8 64 fe ff ff       	call   420 <putc>
          s++;
 5bc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5bf:	0f b6 16             	movzbl (%esi),%edx
 5c2:	84 d2                	test   %dl,%dl
 5c4:	75 eb                	jne    5b1 <printf+0xec>
      state = 0;
 5c6:	be 00 00 00 00       	mov    $0x0,%esi
 5cb:	e9 21 ff ff ff       	jmp    4f1 <printf+0x2c>
        putc(fd, *ap);
 5d0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5d3:	0f be 17             	movsbl (%edi),%edx
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	e8 42 fe ff ff       	call   420 <putc>
        ap++;
 5de:	83 c7 04             	add    $0x4,%edi
 5e1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5e4:	be 00 00 00 00       	mov    $0x0,%esi
 5e9:	e9 03 ff ff ff       	jmp    4f1 <printf+0x2c>
        putc(fd, c);
 5ee:	89 fa                	mov    %edi,%edx
 5f0:	8b 45 08             	mov    0x8(%ebp),%eax
 5f3:	e8 28 fe ff ff       	call   420 <putc>
      state = 0;
 5f8:	be 00 00 00 00       	mov    $0x0,%esi
 5fd:	e9 ef fe ff ff       	jmp    4f1 <printf+0x2c>
        putc(fd, '%');
 602:	ba 25 00 00 00       	mov    $0x25,%edx
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	e8 11 fe ff ff       	call   420 <putc>
        putc(fd, c);
 60f:	89 fa                	mov    %edi,%edx
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	e8 07 fe ff ff       	call   420 <putc>
      state = 0;
 619:	be 00 00 00 00       	mov    $0x0,%esi
 61e:	e9 ce fe ff ff       	jmp    4f1 <printf+0x2c>
    }
  }
}
 623:	8d 65 f4             	lea    -0xc(%ebp),%esp
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    

0000062b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	57                   	push   %edi
 62f:	56                   	push   %esi
 630:	53                   	push   %ebx
 631:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 634:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 637:	a1 4c 0b 00 00       	mov    0xb4c,%eax
 63c:	eb 02                	jmp    640 <free+0x15>
 63e:	89 d0                	mov    %edx,%eax
 640:	39 c8                	cmp    %ecx,%eax
 642:	73 04                	jae    648 <free+0x1d>
 644:	39 08                	cmp    %ecx,(%eax)
 646:	77 12                	ja     65a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 648:	8b 10                	mov    (%eax),%edx
 64a:	39 c2                	cmp    %eax,%edx
 64c:	77 f0                	ja     63e <free+0x13>
 64e:	39 c8                	cmp    %ecx,%eax
 650:	72 08                	jb     65a <free+0x2f>
 652:	39 ca                	cmp    %ecx,%edx
 654:	77 04                	ja     65a <free+0x2f>
 656:	89 d0                	mov    %edx,%eax
 658:	eb e6                	jmp    640 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 65a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 660:	8b 10                	mov    (%eax),%edx
 662:	39 d7                	cmp    %edx,%edi
 664:	74 19                	je     67f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 666:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 669:	8b 50 04             	mov    0x4(%eax),%edx
 66c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66f:	39 ce                	cmp    %ecx,%esi
 671:	74 1b                	je     68e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 673:	89 08                	mov    %ecx,(%eax)
  freep = p;
 675:	a3 4c 0b 00 00       	mov    %eax,0xb4c
}
 67a:	5b                   	pop    %ebx
 67b:	5e                   	pop    %esi
 67c:	5f                   	pop    %edi
 67d:	5d                   	pop    %ebp
 67e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 67f:	03 72 04             	add    0x4(%edx),%esi
 682:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 685:	8b 10                	mov    (%eax),%edx
 687:	8b 12                	mov    (%edx),%edx
 689:	89 53 f8             	mov    %edx,-0x8(%ebx)
 68c:	eb db                	jmp    669 <free+0x3e>
    p->s.size += bp->s.size;
 68e:	03 53 fc             	add    -0x4(%ebx),%edx
 691:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 694:	8b 53 f8             	mov    -0x8(%ebx),%edx
 697:	89 10                	mov    %edx,(%eax)
 699:	eb da                	jmp    675 <free+0x4a>

0000069b <morecore>:

static Header*
morecore(uint nu)
{
 69b:	55                   	push   %ebp
 69c:	89 e5                	mov    %esp,%ebp
 69e:	53                   	push   %ebx
 69f:	83 ec 04             	sub    $0x4,%esp
 6a2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6a4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6a9:	77 05                	ja     6b0 <morecore+0x15>
    nu = 4096;
 6ab:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6b0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6b7:	83 ec 0c             	sub    $0xc,%esp
 6ba:	50                   	push   %eax
 6bb:	e8 38 fd ff ff       	call   3f8 <sbrk>
  if(p == (char*)-1)
 6c0:	83 c4 10             	add    $0x10,%esp
 6c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c6:	74 1c                	je     6e4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6cb:	83 c0 08             	add    $0x8,%eax
 6ce:	83 ec 0c             	sub    $0xc,%esp
 6d1:	50                   	push   %eax
 6d2:	e8 54 ff ff ff       	call   62b <free>
  return freep;
 6d7:	a1 4c 0b 00 00       	mov    0xb4c,%eax
 6dc:	83 c4 10             	add    $0x10,%esp
}
 6df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e2:	c9                   	leave  
 6e3:	c3                   	ret    
    return 0;
 6e4:	b8 00 00 00 00       	mov    $0x0,%eax
 6e9:	eb f4                	jmp    6df <morecore+0x44>

000006eb <malloc>:

void*
malloc(uint nbytes)
{
 6eb:	55                   	push   %ebp
 6ec:	89 e5                	mov    %esp,%ebp
 6ee:	53                   	push   %ebx
 6ef:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 6f5:	8d 58 07             	lea    0x7(%eax),%ebx
 6f8:	c1 eb 03             	shr    $0x3,%ebx
 6fb:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6fe:	8b 0d 4c 0b 00 00    	mov    0xb4c,%ecx
 704:	85 c9                	test   %ecx,%ecx
 706:	74 04                	je     70c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 708:	8b 01                	mov    (%ecx),%eax
 70a:	eb 4a                	jmp    756 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 70c:	c7 05 4c 0b 00 00 50 	movl   $0xb50,0xb4c
 713:	0b 00 00 
 716:	c7 05 50 0b 00 00 50 	movl   $0xb50,0xb50
 71d:	0b 00 00 
    base.s.size = 0;
 720:	c7 05 54 0b 00 00 00 	movl   $0x0,0xb54
 727:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 72a:	b9 50 0b 00 00       	mov    $0xb50,%ecx
 72f:	eb d7                	jmp    708 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 731:	74 19                	je     74c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 733:	29 da                	sub    %ebx,%edx
 735:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 738:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 73b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 73e:	89 0d 4c 0b 00 00    	mov    %ecx,0xb4c
      return (void*)(p + 1);
 744:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 747:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 74a:	c9                   	leave  
 74b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 74c:	8b 10                	mov    (%eax),%edx
 74e:	89 11                	mov    %edx,(%ecx)
 750:	eb ec                	jmp    73e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 752:	89 c1                	mov    %eax,%ecx
 754:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 756:	8b 50 04             	mov    0x4(%eax),%edx
 759:	39 da                	cmp    %ebx,%edx
 75b:	73 d4                	jae    731 <malloc+0x46>
    if(p == freep)
 75d:	39 05 4c 0b 00 00    	cmp    %eax,0xb4c
 763:	75 ed                	jne    752 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 765:	89 d8                	mov    %ebx,%eax
 767:	e8 2f ff ff ff       	call   69b <morecore>
 76c:	85 c0                	test   %eax,%eax
 76e:	75 e2                	jne    752 <malloc+0x67>
 770:	eb d5                	jmp    747 <malloc+0x5c>
