
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  10:	be 00 00 00 00       	mov    $0x0,%esi
  15:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  23:	83 ec 04             	sub    $0x4,%esp
  26:	68 00 02 00 00       	push   $0x200
  2b:	68 e0 0b 00 00       	push   $0xbe0
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 96 03 00 00       	call   3ce <read>
  38:	89 c7                	mov    %eax,%edi
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	7e 54                	jle    95 <wc+0x95>
    for(i=0; i<n; i++){
  41:	bb 00 00 00 00       	mov    $0x0,%ebx
  46:	eb 22                	jmp    6a <wc+0x6a>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	0f be c0             	movsbl %al,%eax
  4e:	50                   	push   %eax
  4f:	68 b8 07 00 00       	push   $0x7b8
  54:	e8 86 01 00 00       	call   1df <strchr>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	74 22                	je     82 <wc+0x82>
        inword = 0;
  60:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	39 fb                	cmp    %edi,%ebx
  6c:	7d b5                	jge    23 <wc+0x23>
      c++;
  6e:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  71:	0f b6 83 e0 0b 00 00 	movzbl 0xbe0(%ebx),%eax
  78:	3c 0a                	cmp    $0xa,%al
  7a:	75 cc                	jne    48 <wc+0x48>
        l++;
  7c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  80:	eb c6                	jmp    48 <wc+0x48>
      else if(!inword){
  82:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  86:	75 df                	jne    67 <wc+0x67>
        w++;
  88:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  8c:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  93:	eb d2                	jmp    67 <wc+0x67>
      }
    }
  }
  if(n < 0){
  95:	78 24                	js     bb <wc+0xbb>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  97:	83 ec 08             	sub    $0x8,%esp
  9a:	ff 75 0c             	push   0xc(%ebp)
  9d:	56                   	push   %esi
  9e:	ff 75 dc             	push   -0x24(%ebp)
  a1:	ff 75 e0             	push   -0x20(%ebp)
  a4:	68 ce 07 00 00       	push   $0x7ce
  a9:	6a 01                	push   $0x1
  ab:	e8 5b 04 00 00       	call   50b <printf>
}
  b0:	83 c4 20             	add    $0x20,%esp
  b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  b6:	5b                   	pop    %ebx
  b7:	5e                   	pop    %esi
  b8:	5f                   	pop    %edi
  b9:	5d                   	pop    %ebp
  ba:	c3                   	ret    
    printf(1, "wc: read error\n");
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 be 07 00 00       	push   $0x7be
  c3:	6a 01                	push   $0x1
  c5:	e8 41 04 00 00       	call   50b <printf>
    exit();
  ca:	e8 e7 02 00 00       	call   3b6 <exit>

000000cf <main>:

int
main(int argc, char *argv[])
{
  cf:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d3:	83 e4 f0             	and    $0xfffffff0,%esp
  d6:	ff 71 fc             	push   -0x4(%ecx)
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	57                   	push   %edi
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	51                   	push   %ecx
  e0:	83 ec 18             	sub    $0x18,%esp
  e3:	8b 01                	mov    (%ecx),%eax
  e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e8:	8b 51 04             	mov    0x4(%ecx),%edx
  eb:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  ee:	83 f8 01             	cmp    $0x1,%eax
  f1:	7e 07                	jle    fa <main+0x2b>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  f3:	be 01 00 00 00       	mov    $0x1,%esi
  f8:	eb 2d                	jmp    127 <main+0x58>
    wc(0, "");
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	68 cd 07 00 00       	push   $0x7cd
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 a8 02 00 00       	call   3b6 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 10e:	83 ec 08             	sub    $0x8,%esp
 111:	ff 37                	push   (%edi)
 113:	50                   	push   %eax
 114:	e8 e7 fe ff ff       	call   0 <wc>
    close(fd);
 119:	89 1c 24             	mov    %ebx,(%esp)
 11c:	e8 bd 02 00 00       	call   3de <close>
  for(i = 1; i < argc; i++){
 121:	83 c6 01             	add    $0x1,%esi
 124:	83 c4 10             	add    $0x10,%esp
 127:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 12a:	7d 31                	jge    15d <main+0x8e>
    if((fd = open(argv[i], 0)) < 0){
 12c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 12f:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 132:	83 ec 08             	sub    $0x8,%esp
 135:	6a 00                	push   $0x0
 137:	ff 37                	push   (%edi)
 139:	e8 b8 02 00 00       	call   3f6 <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 db 07 00 00       	push   $0x7db
 151:	6a 01                	push   $0x1
 153:	e8 b3 03 00 00       	call   50b <printf>
      exit();
 158:	e8 59 02 00 00       	call   3b6 <exit>
  }
  exit();
 15d:	e8 54 02 00 00       	call   3b6 <exit>

00000162 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	56                   	push   %esi
 166:	53                   	push   %ebx
 167:	8b 75 08             	mov    0x8(%ebp),%esi
 16a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 16d:	89 f0                	mov    %esi,%eax
 16f:	89 d1                	mov    %edx,%ecx
 171:	83 c2 01             	add    $0x1,%edx
 174:	89 c3                	mov    %eax,%ebx
 176:	83 c0 01             	add    $0x1,%eax
 179:	0f b6 09             	movzbl (%ecx),%ecx
 17c:	88 0b                	mov    %cl,(%ebx)
 17e:	84 c9                	test   %cl,%cl
 180:	75 ed                	jne    16f <strcpy+0xd>
    ;
  return os;
}
 182:	89 f0                	mov    %esi,%eax
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    

00000188 <strcmp>:

int strcmp(const char *p, const char *q)
{
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 191:	eb 06                	jmp    199 <strcmp+0x11>
    p++, q++;
 193:	83 c1 01             	add    $0x1,%ecx
 196:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 199:	0f b6 01             	movzbl (%ecx),%eax
 19c:	84 c0                	test   %al,%al
 19e:	74 04                	je     1a4 <strcmp+0x1c>
 1a0:	3a 02                	cmp    (%edx),%al
 1a2:	74 ef                	je     193 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1a4:	0f b6 c0             	movzbl %al,%eax
 1a7:	0f b6 12             	movzbl (%edx),%edx
 1aa:	29 d0                	sub    %edx,%eax
}
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <strlen>:

uint strlen(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 1b4:	b8 00 00 00 00       	mov    $0x0,%eax
 1b9:	eb 03                	jmp    1be <strlen+0x10>
 1bb:	83 c0 01             	add    $0x1,%eax
 1be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c2:	75 f7                	jne    1bb <strlen+0xd>
    ;
  return n;
}
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    

000001c6 <memset>:

void *
memset(void *dst, int c, uint n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	57                   	push   %edi
 1ca:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	fc                   	cld    
 1d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d8:	89 d0                	mov    %edx,%eax
 1da:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <strchr>:

char *
strchr(const char *s, char c)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 1e9:	eb 03                	jmp    1ee <strchr+0xf>
 1eb:	83 c0 01             	add    $0x1,%eax
 1ee:	0f b6 10             	movzbl (%eax),%edx
 1f1:	84 d2                	test   %dl,%dl
 1f3:	74 06                	je     1fb <strchr+0x1c>
    if (*s == c)
 1f5:	38 ca                	cmp    %cl,%dl
 1f7:	75 f2                	jne    1eb <strchr+0xc>
 1f9:	eb 05                	jmp    200 <strchr+0x21>
      return (char *)s;
  return 0;
 1fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 200:	5d                   	pop    %ebp
 201:	c3                   	ret    

00000202 <gets>:

char *
gets(char *buf, int max)
{
 202:	55                   	push   %ebp
 203:	89 e5                	mov    %esp,%ebp
 205:	57                   	push   %edi
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	83 ec 1c             	sub    $0x1c,%esp
 20b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 20e:	bb 00 00 00 00       	mov    $0x0,%ebx
 213:	89 de                	mov    %ebx,%esi
 215:	83 c3 01             	add    $0x1,%ebx
 218:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21b:	7d 2e                	jge    24b <gets+0x49>
  {
    cc = read(0, &c, 1);
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	6a 01                	push   $0x1
 222:	8d 45 e7             	lea    -0x19(%ebp),%eax
 225:	50                   	push   %eax
 226:	6a 00                	push   $0x0
 228:	e8 a1 01 00 00       	call   3ce <read>
    if (cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 17                	jle    24b <gets+0x49>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 23b:	3c 0a                	cmp    $0xa,%al
 23d:	0f 94 c2             	sete   %dl
 240:	3c 0d                	cmp    $0xd,%al
 242:	0f 94 c0             	sete   %al
 245:	08 c2                	or     %al,%dl
 247:	74 ca                	je     213 <gets+0x11>
    buf[i++] = c;
 249:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 24b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 24f:	89 f8                	mov    %edi,%eax
 251:	8d 65 f4             	lea    -0xc(%ebp),%esp
 254:	5b                   	pop    %ebx
 255:	5e                   	pop    %esi
 256:	5f                   	pop    %edi
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    

00000259 <stat>:

int stat(const char *n, struct stat *st)
{
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25e:	83 ec 08             	sub    $0x8,%esp
 261:	6a 00                	push   $0x0
 263:	ff 75 08             	push   0x8(%ebp)
 266:	e8 8b 01 00 00       	call   3f6 <open>
  if (fd < 0)
 26b:	83 c4 10             	add    $0x10,%esp
 26e:	85 c0                	test   %eax,%eax
 270:	78 24                	js     296 <stat+0x3d>
 272:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	ff 75 0c             	push   0xc(%ebp)
 27a:	50                   	push   %eax
 27b:	e8 8e 01 00 00       	call   40e <fstat>
 280:	89 c6                	mov    %eax,%esi
  close(fd);
 282:	89 1c 24             	mov    %ebx,(%esp)
 285:	e8 54 01 00 00       	call   3de <close>
  return r;
 28a:	83 c4 10             	add    $0x10,%esp
}
 28d:	89 f0                	mov    %esi,%eax
 28f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    
    return -1;
 296:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29b:	eb f0                	jmp    28d <stat+0x34>

0000029d <atoi>:

int atoi(const char *s)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	53                   	push   %ebx
 2a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 2a9:	eb 10                	jmp    2bb <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 2ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b1:	83 c1 01             	add    $0x1,%ecx
 2b4:	0f be c0             	movsbl %al,%eax
 2b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 2bb:	0f b6 01             	movzbl (%ecx),%eax
 2be:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c1:	80 fb 09             	cmp    $0x9,%bl
 2c4:	76 e5                	jbe    2ab <atoi+0xe>
  return n;
}
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 2dd:	eb 0d                	jmp    2ec <memmove+0x1f>
    *dst++ = *src++;
 2df:	0f b6 01             	movzbl (%ecx),%eax
 2e2:	88 02                	mov    %al,(%edx)
 2e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e7:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 2ea:	89 d8                	mov    %ebx,%eax
 2ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2ef:	85 c0                	test   %eax,%eax
 2f1:	7f ec                	jg     2df <memmove+0x12>
  return vdst;
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	5b                   	pop    %ebx
 2f6:	5e                   	pop    %esi
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 2f9:	55                   	push   %ebp
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 2ff:	83 38 01             	cmpl   $0x1,(%eax)
 302:	74 fb                	je     2ff <lock_acquire+0x6>
    ;
  lock->flag = 1;
 304:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 30a:	5d                   	pop    %ebp
 30b:	c3                   	ret    

0000030c <lock_release>:
void lock_release(lock_t *lock)
{
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <lock_init>:
void lock_init(lock_t *lock)
{
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
 320:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    

00000328 <thread_create>:
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	53                   	push   %ebx
 32c:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 32f:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 332:	53                   	push   %ebx
 333:	e8 e2 ff ff ff       	call   31a <lock_init>
  lock_acquire(&lock);
 338:	89 1c 24             	mov    %ebx,(%esp)
 33b:	e8 b9 ff ff ff       	call   2f9 <lock_acquire>
  void *stack = malloc(4096 * 2);
 340:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 347:	e8 e5 03 00 00       	call   731 <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 34c:	50                   	push   %eax
 34d:	ff 75 10             	push   0x10(%ebp)
 350:	ff 75 0c             	push   0xc(%ebp)
 353:	ff 75 08             	push   0x8(%ebp)
 356:	e8 fb 00 00 00       	call   456 <clone>
}
 35b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <thread_join>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 368:	6a 04                	push   $0x4
 36a:	e8 c2 03 00 00       	call   731 <malloc>
 36f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	89 04 24             	mov    %eax,(%esp)
 378:	e8 e1 00 00 00       	call   45e <join>
 37d:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 37f:	8d 75 f0             	lea    -0x10(%ebp),%esi
 382:	89 34 24             	mov    %esi,(%esp)
 385:	e8 90 ff ff ff       	call   31a <lock_init>
  lock_acquire(&lock);
 38a:	89 34 24             	mov    %esi,(%esp)
 38d:	e8 67 ff ff ff       	call   2f9 <lock_acquire>
  free(stack);
 392:	83 c4 04             	add    $0x4,%esp
 395:	ff 75 f4             	push   -0xc(%ebp)
 398:	e8 d4 02 00 00       	call   671 <free>
  lock_release(&lock);
 39d:	89 34 24             	mov    %esi,(%esp)
 3a0:	e8 67 ff ff ff       	call   30c <lock_release>
}
 3a5:	89 d8                	mov    %ebx,%eax
 3a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3aa:	5b                   	pop    %ebx
 3ab:	5e                   	pop    %esi
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ae:	b8 01 00 00 00       	mov    $0x1,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <exit>:
SYSCALL(exit)
 3b6:	b8 02 00 00 00       	mov    $0x2,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <wait>:
SYSCALL(wait)
 3be:	b8 03 00 00 00       	mov    $0x3,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <pipe>:
SYSCALL(pipe)
 3c6:	b8 04 00 00 00       	mov    $0x4,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <read>:
SYSCALL(read)
 3ce:	b8 05 00 00 00       	mov    $0x5,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <write>:
SYSCALL(write)
 3d6:	b8 10 00 00 00       	mov    $0x10,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <close>:
SYSCALL(close)
 3de:	b8 15 00 00 00       	mov    $0x15,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <kill>:
SYSCALL(kill)
 3e6:	b8 06 00 00 00       	mov    $0x6,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <exec>:
SYSCALL(exec)
 3ee:	b8 07 00 00 00       	mov    $0x7,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <open>:
SYSCALL(open)
 3f6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <mknod>:
SYSCALL(mknod)
 3fe:	b8 11 00 00 00       	mov    $0x11,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <unlink>:
SYSCALL(unlink)
 406:	b8 12 00 00 00       	mov    $0x12,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <fstat>:
SYSCALL(fstat)
 40e:	b8 08 00 00 00       	mov    $0x8,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <link>:
SYSCALL(link)
 416:	b8 13 00 00 00       	mov    $0x13,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <mkdir>:
SYSCALL(mkdir)
 41e:	b8 14 00 00 00       	mov    $0x14,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <chdir>:
SYSCALL(chdir)
 426:	b8 09 00 00 00       	mov    $0x9,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <dup>:
SYSCALL(dup)
 42e:	b8 0a 00 00 00       	mov    $0xa,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <getpid>:
SYSCALL(getpid)
 436:	b8 0b 00 00 00       	mov    $0xb,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <sbrk>:
SYSCALL(sbrk)
 43e:	b8 0c 00 00 00       	mov    $0xc,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <sleep>:
SYSCALL(sleep)
 446:	b8 0d 00 00 00       	mov    $0xd,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <uptime>:
SYSCALL(uptime)
 44e:	b8 0e 00 00 00       	mov    $0xe,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <clone>:
SYSCALL(clone)
 456:	b8 16 00 00 00       	mov    $0x16,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <join>:
 45e:	b8 17 00 00 00       	mov    $0x17,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	83 ec 1c             	sub    $0x1c,%esp
 46c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 46f:	6a 01                	push   $0x1
 471:	8d 55 f4             	lea    -0xc(%ebp),%edx
 474:	52                   	push   %edx
 475:	50                   	push   %eax
 476:	e8 5b ff ff ff       	call   3d6 <write>
}
 47b:	83 c4 10             	add    $0x10,%esp
 47e:	c9                   	leave  
 47f:	c3                   	ret    

00000480 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 2c             	sub    $0x2c,%esp
 489:	89 45 d0             	mov    %eax,-0x30(%ebp)
 48c:	89 d0                	mov    %edx,%eax
 48e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 490:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 494:	0f 95 c1             	setne  %cl
 497:	c1 ea 1f             	shr    $0x1f,%edx
 49a:	84 d1                	test   %dl,%cl
 49c:	74 44                	je     4e2 <printint+0x62>
    neg = 1;
    x = -xx;
 49e:	f7 d8                	neg    %eax
 4a0:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4a2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4a9:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4ae:	89 c8                	mov    %ecx,%eax
 4b0:	ba 00 00 00 00       	mov    $0x0,%edx
 4b5:	f7 f6                	div    %esi
 4b7:	89 df                	mov    %ebx,%edi
 4b9:	83 c3 01             	add    $0x1,%ebx
 4bc:	0f b6 92 50 08 00 00 	movzbl 0x850(%edx),%edx
 4c3:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4c7:	89 ca                	mov    %ecx,%edx
 4c9:	89 c1                	mov    %eax,%ecx
 4cb:	39 d6                	cmp    %edx,%esi
 4cd:	76 df                	jbe    4ae <printint+0x2e>
  if(neg)
 4cf:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4d3:	74 31                	je     506 <printint+0x86>
    buf[i++] = '-';
 4d5:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4da:	8d 5f 02             	lea    0x2(%edi),%ebx
 4dd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4e0:	eb 17                	jmp    4f9 <printint+0x79>
    x = xx;
 4e2:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4e4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4eb:	eb bc                	jmp    4a9 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4ed:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4f2:	89 f0                	mov    %esi,%eax
 4f4:	e8 6d ff ff ff       	call   466 <putc>
  while(--i >= 0)
 4f9:	83 eb 01             	sub    $0x1,%ebx
 4fc:	79 ef                	jns    4ed <printint+0x6d>
}
 4fe:	83 c4 2c             	add    $0x2c,%esp
 501:	5b                   	pop    %ebx
 502:	5e                   	pop    %esi
 503:	5f                   	pop    %edi
 504:	5d                   	pop    %ebp
 505:	c3                   	ret    
 506:	8b 75 d0             	mov    -0x30(%ebp),%esi
 509:	eb ee                	jmp    4f9 <printint+0x79>

0000050b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	57                   	push   %edi
 50f:	56                   	push   %esi
 510:	53                   	push   %ebx
 511:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 514:	8d 45 10             	lea    0x10(%ebp),%eax
 517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 51a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 51f:	bb 00 00 00 00       	mov    $0x0,%ebx
 524:	eb 14                	jmp    53a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 526:	89 fa                	mov    %edi,%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	e8 36 ff ff ff       	call   466 <putc>
 530:	eb 05                	jmp    537 <printf+0x2c>
      }
    } else if(state == '%'){
 532:	83 fe 25             	cmp    $0x25,%esi
 535:	74 25                	je     55c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 537:	83 c3 01             	add    $0x1,%ebx
 53a:	8b 45 0c             	mov    0xc(%ebp),%eax
 53d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 541:	84 c0                	test   %al,%al
 543:	0f 84 20 01 00 00    	je     669 <printf+0x15e>
    c = fmt[i] & 0xff;
 549:	0f be f8             	movsbl %al,%edi
 54c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 54f:	85 f6                	test   %esi,%esi
 551:	75 df                	jne    532 <printf+0x27>
      if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	75 ce                	jne    526 <printf+0x1b>
        state = '%';
 558:	89 c6                	mov    %eax,%esi
 55a:	eb db                	jmp    537 <printf+0x2c>
      if(c == 'd'){
 55c:	83 f8 25             	cmp    $0x25,%eax
 55f:	0f 84 cf 00 00 00    	je     634 <printf+0x129>
 565:	0f 8c dd 00 00 00    	jl     648 <printf+0x13d>
 56b:	83 f8 78             	cmp    $0x78,%eax
 56e:	0f 8f d4 00 00 00    	jg     648 <printf+0x13d>
 574:	83 f8 63             	cmp    $0x63,%eax
 577:	0f 8c cb 00 00 00    	jl     648 <printf+0x13d>
 57d:	83 e8 63             	sub    $0x63,%eax
 580:	83 f8 15             	cmp    $0x15,%eax
 583:	0f 87 bf 00 00 00    	ja     648 <printf+0x13d>
 589:	ff 24 85 f8 07 00 00 	jmp    *0x7f8(,%eax,4)
        printint(fd, *ap, 10, 1);
 590:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 593:	8b 17                	mov    (%edi),%edx
 595:	83 ec 0c             	sub    $0xc,%esp
 598:	6a 01                	push   $0x1
 59a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 59f:	8b 45 08             	mov    0x8(%ebp),%eax
 5a2:	e8 d9 fe ff ff       	call   480 <printint>
        ap++;
 5a7:	83 c7 04             	add    $0x4,%edi
 5aa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5ad:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b0:	be 00 00 00 00       	mov    $0x0,%esi
 5b5:	eb 80                	jmp    537 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ba:	8b 17                	mov    (%edi),%edx
 5bc:	83 ec 0c             	sub    $0xc,%esp
 5bf:	6a 00                	push   $0x0
 5c1:	b9 10 00 00 00       	mov    $0x10,%ecx
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
 5c9:	e8 b2 fe ff ff       	call   480 <printint>
        ap++;
 5ce:	83 c7 04             	add    $0x4,%edi
 5d1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5d4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5d7:	be 00 00 00 00       	mov    $0x0,%esi
 5dc:	e9 56 ff ff ff       	jmp    537 <printf+0x2c>
        s = (char*)*ap;
 5e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e4:	8b 30                	mov    (%eax),%esi
        ap++;
 5e6:	83 c0 04             	add    $0x4,%eax
 5e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5ec:	85 f6                	test   %esi,%esi
 5ee:	75 15                	jne    605 <printf+0xfa>
          s = "(null)";
 5f0:	be ef 07 00 00       	mov    $0x7ef,%esi
 5f5:	eb 0e                	jmp    605 <printf+0xfa>
          putc(fd, *s);
 5f7:	0f be d2             	movsbl %dl,%edx
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	e8 64 fe ff ff       	call   466 <putc>
          s++;
 602:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 605:	0f b6 16             	movzbl (%esi),%edx
 608:	84 d2                	test   %dl,%dl
 60a:	75 eb                	jne    5f7 <printf+0xec>
      state = 0;
 60c:	be 00 00 00 00       	mov    $0x0,%esi
 611:	e9 21 ff ff ff       	jmp    537 <printf+0x2c>
        putc(fd, *ap);
 616:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 619:	0f be 17             	movsbl (%edi),%edx
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	e8 42 fe ff ff       	call   466 <putc>
        ap++;
 624:	83 c7 04             	add    $0x4,%edi
 627:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 62a:	be 00 00 00 00       	mov    $0x0,%esi
 62f:	e9 03 ff ff ff       	jmp    537 <printf+0x2c>
        putc(fd, c);
 634:	89 fa                	mov    %edi,%edx
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	e8 28 fe ff ff       	call   466 <putc>
      state = 0;
 63e:	be 00 00 00 00       	mov    $0x0,%esi
 643:	e9 ef fe ff ff       	jmp    537 <printf+0x2c>
        putc(fd, '%');
 648:	ba 25 00 00 00       	mov    $0x25,%edx
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	e8 11 fe ff ff       	call   466 <putc>
        putc(fd, c);
 655:	89 fa                	mov    %edi,%edx
 657:	8b 45 08             	mov    0x8(%ebp),%eax
 65a:	e8 07 fe ff ff       	call   466 <putc>
      state = 0;
 65f:	be 00 00 00 00       	mov    $0x0,%esi
 664:	e9 ce fe ff ff       	jmp    537 <printf+0x2c>
    }
  }
}
 669:	8d 65 f4             	lea    -0xc(%ebp),%esp
 66c:	5b                   	pop    %ebx
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    

00000671 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 671:	55                   	push   %ebp
 672:	89 e5                	mov    %esp,%ebp
 674:	57                   	push   %edi
 675:	56                   	push   %esi
 676:	53                   	push   %ebx
 677:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 67a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67d:	a1 e0 0d 00 00       	mov    0xde0,%eax
 682:	eb 02                	jmp    686 <free+0x15>
 684:	89 d0                	mov    %edx,%eax
 686:	39 c8                	cmp    %ecx,%eax
 688:	73 04                	jae    68e <free+0x1d>
 68a:	39 08                	cmp    %ecx,(%eax)
 68c:	77 12                	ja     6a0 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 68e:	8b 10                	mov    (%eax),%edx
 690:	39 c2                	cmp    %eax,%edx
 692:	77 f0                	ja     684 <free+0x13>
 694:	39 c8                	cmp    %ecx,%eax
 696:	72 08                	jb     6a0 <free+0x2f>
 698:	39 ca                	cmp    %ecx,%edx
 69a:	77 04                	ja     6a0 <free+0x2f>
 69c:	89 d0                	mov    %edx,%eax
 69e:	eb e6                	jmp    686 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6a6:	8b 10                	mov    (%eax),%edx
 6a8:	39 d7                	cmp    %edx,%edi
 6aa:	74 19                	je     6c5 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ac:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6af:	8b 50 04             	mov    0x4(%eax),%edx
 6b2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6b5:	39 ce                	cmp    %ecx,%esi
 6b7:	74 1b                	je     6d4 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6b9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6bb:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 6c0:	5b                   	pop    %ebx
 6c1:	5e                   	pop    %esi
 6c2:	5f                   	pop    %edi
 6c3:	5d                   	pop    %ebp
 6c4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6c5:	03 72 04             	add    0x4(%edx),%esi
 6c8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6cb:	8b 10                	mov    (%eax),%edx
 6cd:	8b 12                	mov    (%edx),%edx
 6cf:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6d2:	eb db                	jmp    6af <free+0x3e>
    p->s.size += bp->s.size;
 6d4:	03 53 fc             	add    -0x4(%ebx),%edx
 6d7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6da:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6dd:	89 10                	mov    %edx,(%eax)
 6df:	eb da                	jmp    6bb <free+0x4a>

000006e1 <morecore>:

static Header*
morecore(uint nu)
{
 6e1:	55                   	push   %ebp
 6e2:	89 e5                	mov    %esp,%ebp
 6e4:	53                   	push   %ebx
 6e5:	83 ec 04             	sub    $0x4,%esp
 6e8:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6ea:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6ef:	77 05                	ja     6f6 <morecore+0x15>
    nu = 4096;
 6f1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6fd:	83 ec 0c             	sub    $0xc,%esp
 700:	50                   	push   %eax
 701:	e8 38 fd ff ff       	call   43e <sbrk>
  if(p == (char*)-1)
 706:	83 c4 10             	add    $0x10,%esp
 709:	83 f8 ff             	cmp    $0xffffffff,%eax
 70c:	74 1c                	je     72a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 70e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 711:	83 c0 08             	add    $0x8,%eax
 714:	83 ec 0c             	sub    $0xc,%esp
 717:	50                   	push   %eax
 718:	e8 54 ff ff ff       	call   671 <free>
  return freep;
 71d:	a1 e0 0d 00 00       	mov    0xde0,%eax
 722:	83 c4 10             	add    $0x10,%esp
}
 725:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 728:	c9                   	leave  
 729:	c3                   	ret    
    return 0;
 72a:	b8 00 00 00 00       	mov    $0x0,%eax
 72f:	eb f4                	jmp    725 <morecore+0x44>

00000731 <malloc>:

void*
malloc(uint nbytes)
{
 731:	55                   	push   %ebp
 732:	89 e5                	mov    %esp,%ebp
 734:	53                   	push   %ebx
 735:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	8d 58 07             	lea    0x7(%eax),%ebx
 73e:	c1 eb 03             	shr    $0x3,%ebx
 741:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 744:	8b 0d e0 0d 00 00    	mov    0xde0,%ecx
 74a:	85 c9                	test   %ecx,%ecx
 74c:	74 04                	je     752 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74e:	8b 01                	mov    (%ecx),%eax
 750:	eb 4a                	jmp    79c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 752:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 759:	0d 00 00 
 75c:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 763:	0d 00 00 
    base.s.size = 0;
 766:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 76d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 770:	b9 e4 0d 00 00       	mov    $0xde4,%ecx
 775:	eb d7                	jmp    74e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 777:	74 19                	je     792 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 779:	29 da                	sub    %ebx,%edx
 77b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 77e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 781:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 784:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
      return (void*)(p + 1);
 78a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 78d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 790:	c9                   	leave  
 791:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 792:	8b 10                	mov    (%eax),%edx
 794:	89 11                	mov    %edx,(%ecx)
 796:	eb ec                	jmp    784 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 798:	89 c1                	mov    %eax,%ecx
 79a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 79c:	8b 50 04             	mov    0x4(%eax),%edx
 79f:	39 da                	cmp    %ebx,%edx
 7a1:	73 d4                	jae    777 <malloc+0x46>
    if(p == freep)
 7a3:	39 05 e0 0d 00 00    	cmp    %eax,0xde0
 7a9:	75 ed                	jne    798 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7ab:	89 d8                	mov    %ebx,%eax
 7ad:	e8 2f ff ff ff       	call   6e1 <morecore>
 7b2:	85 c0                	test   %eax,%eax
 7b4:	75 e2                	jne    798 <malloc+0x67>
 7b6:	eb d5                	jmp    78d <malloc+0x5c>
