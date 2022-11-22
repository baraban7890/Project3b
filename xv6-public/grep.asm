
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  12:	83 ec 08             	sub    $0x8,%esp
  15:	53                   	push   %ebx
  16:	57                   	push   %edi
  17:	e8 2c 00 00 00       	call   48 <matchhere>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	75 18                	jne    3b <matchstar+0x3b>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  23:	0f b6 13             	movzbl (%ebx),%edx
  26:	84 d2                	test   %dl,%dl
  28:	74 16                	je     40 <matchstar+0x40>
  2a:	83 c3 01             	add    $0x1,%ebx
  2d:	0f be d2             	movsbl %dl,%edx
  30:	39 f2                	cmp    %esi,%edx
  32:	74 de                	je     12 <matchstar+0x12>
  34:	83 fe 2e             	cmp    $0x2e,%esi
  37:	74 d9                	je     12 <matchstar+0x12>
  39:	eb 05                	jmp    40 <matchstar+0x40>
      return 1;
  3b:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <matchhere>:
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  51:	0f b6 02             	movzbl (%edx),%eax
  54:	84 c0                	test   %al,%al
  56:	74 68                	je     c0 <matchhere+0x78>
  if(re[1] == '*')
  58:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  5c:	80 f9 2a             	cmp    $0x2a,%cl
  5f:	74 1d                	je     7e <matchhere+0x36>
  if(re[0] == '$' && re[1] == '\0')
  61:	3c 24                	cmp    $0x24,%al
  63:	74 31                	je     96 <matchhere+0x4e>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	84 c9                	test   %cl,%cl
  6d:	74 58                	je     c7 <matchhere+0x7f>
  6f:	3c 2e                	cmp    $0x2e,%al
  71:	74 35                	je     a8 <matchhere+0x60>
  73:	38 c8                	cmp    %cl,%al
  75:	74 31                	je     a8 <matchhere+0x60>
  return 0;
  77:	b8 00 00 00 00       	mov    $0x0,%eax
  7c:	eb 47                	jmp    c5 <matchhere+0x7d>
    return matchstar(re[0], re+2, text);
  7e:	83 ec 04             	sub    $0x4,%esp
  81:	ff 75 0c             	push   0xc(%ebp)
  84:	83 c2 02             	add    $0x2,%edx
  87:	52                   	push   %edx
  88:	0f be c0             	movsbl %al,%eax
  8b:	50                   	push   %eax
  8c:	e8 6f ff ff ff       	call   0 <matchstar>
  91:	83 c4 10             	add    $0x10,%esp
  94:	eb 2f                	jmp    c5 <matchhere+0x7d>
  if(re[0] == '$' && re[1] == '\0')
  96:	84 c9                	test   %cl,%cl
  98:	75 cb                	jne    65 <matchhere+0x1d>
    return *text == '\0';
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	80 38 00             	cmpb   $0x0,(%eax)
  a0:	0f 94 c0             	sete   %al
  a3:	0f b6 c0             	movzbl %al,%eax
  a6:	eb 1d                	jmp    c5 <matchhere+0x7d>
    return matchhere(re+1, text+1);
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  ae:	83 c0 01             	add    $0x1,%eax
  b1:	50                   	push   %eax
  b2:	83 c2 01             	add    $0x1,%edx
  b5:	52                   	push   %edx
  b6:	e8 8d ff ff ff       	call   48 <matchhere>
  bb:	83 c4 10             	add    $0x10,%esp
  be:	eb 05                	jmp    c5 <matchhere+0x7d>
    return 1;
  c0:	b8 01 00 00 00       	mov    $0x1,%eax
}
  c5:	c9                   	leave  
  c6:	c3                   	ret    
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
  cc:	eb f7                	jmp    c5 <matchhere+0x7d>

000000ce <match>:
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	56                   	push   %esi
  d2:	53                   	push   %ebx
  d3:	8b 75 08             	mov    0x8(%ebp),%esi
  d6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  d9:	80 3e 5e             	cmpb   $0x5e,(%esi)
  dc:	75 14                	jne    f2 <match+0x24>
    return matchhere(re+1, text);
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	53                   	push   %ebx
  e2:	83 c6 01             	add    $0x1,%esi
  e5:	56                   	push   %esi
  e6:	e8 5d ff ff ff       	call   48 <matchhere>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	eb 22                	jmp    112 <match+0x44>
  }while(*text++ != '\0');
  f0:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  f2:	83 ec 08             	sub    $0x8,%esp
  f5:	53                   	push   %ebx
  f6:	56                   	push   %esi
  f7:	e8 4c ff ff ff       	call   48 <matchhere>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	85 c0                	test   %eax,%eax
 101:	75 0a                	jne    10d <match+0x3f>
  }while(*text++ != '\0');
 103:	8d 53 01             	lea    0x1(%ebx),%edx
 106:	80 3b 00             	cmpb   $0x0,(%ebx)
 109:	75 e5                	jne    f0 <match+0x22>
 10b:	eb 05                	jmp    112 <match+0x44>
      return 1;
 10d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 112:	8d 65 f8             	lea    -0x8(%ebp),%esp
 115:	5b                   	pop    %ebx
 116:	5e                   	pop    %esi
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <grep>:
{
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	57                   	push   %edi
 11d:	56                   	push   %esi
 11e:	53                   	push   %ebx
 11f:	83 ec 1c             	sub    $0x1c,%esp
 122:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 125:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 12c:	eb 53                	jmp    181 <grep+0x68>
      p = q+1;
 12e:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 131:	83 ec 08             	sub    $0x8,%esp
 134:	6a 0a                	push   $0xa
 136:	56                   	push   %esi
 137:	e8 e1 01 00 00       	call   31d <strchr>
 13c:	89 c3                	mov    %eax,%ebx
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	74 2d                	je     172 <grep+0x59>
      *q = 0;
 145:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 148:	83 ec 08             	sub    $0x8,%esp
 14b:	56                   	push   %esi
 14c:	57                   	push   %edi
 14d:	e8 7c ff ff ff       	call   ce <match>
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	74 d5                	je     12e <grep+0x15>
        *q = '\n';
 159:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 15c:	8d 43 01             	lea    0x1(%ebx),%eax
 15f:	83 ec 04             	sub    $0x4,%esp
 162:	29 f0                	sub    %esi,%eax
 164:	50                   	push   %eax
 165:	56                   	push   %esi
 166:	6a 01                	push   $0x1
 168:	e8 a7 03 00 00       	call   514 <write>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	eb bc                	jmp    12e <grep+0x15>
    if(p == buf)
 172:	81 fe a0 0d 00 00    	cmp    $0xda0,%esi
 178:	74 62                	je     1dc <grep+0xc3>
    if(m > 0){
 17a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 17d:	85 c9                	test   %ecx,%ecx
 17f:	7f 3b                	jg     1bc <grep+0xa3>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 181:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 186:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 189:	29 c8                	sub    %ecx,%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	50                   	push   %eax
 18f:	8d 81 a0 0d 00 00    	lea    0xda0(%ecx),%eax
 195:	50                   	push   %eax
 196:	ff 75 0c             	push   0xc(%ebp)
 199:	e8 6e 03 00 00       	call   50c <read>
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 40                	jle    1e5 <grep+0xcc>
    m += n;
 1a5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1ab:	c6 82 a0 0d 00 00 00 	movb   $0x0,0xda0(%edx)
    p = buf;
 1b2:	be a0 0d 00 00       	mov    $0xda0,%esi
    while((q = strchr(p, '\n')) != 0){
 1b7:	e9 75 ff ff ff       	jmp    131 <grep+0x18>
      m -= p - buf;
 1bc:	89 f0                	mov    %esi,%eax
 1be:	2d a0 0d 00 00       	sub    $0xda0,%eax
 1c3:	29 c1                	sub    %eax,%ecx
 1c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1c8:	83 ec 04             	sub    $0x4,%esp
 1cb:	51                   	push   %ecx
 1cc:	56                   	push   %esi
 1cd:	68 a0 0d 00 00       	push   $0xda0
 1d2:	e8 34 02 00 00       	call   40b <memmove>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	eb a5                	jmp    181 <grep+0x68>
      m = 0;
 1dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1e3:	eb 9c                	jmp    181 <grep+0x68>
}
 1e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5f                   	pop    %edi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    

000001ed <main>:
{
 1ed:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1f1:	83 e4 f0             	and    $0xfffffff0,%esp
 1f4:	ff 71 fc             	push   -0x4(%ecx)
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	57                   	push   %edi
 1fb:	56                   	push   %esi
 1fc:	53                   	push   %ebx
 1fd:	51                   	push   %ecx
 1fe:	83 ec 18             	sub    $0x18,%esp
 201:	8b 01                	mov    (%ecx),%eax
 203:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 206:	8b 51 04             	mov    0x4(%ecx),%edx
 209:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 20c:	83 f8 01             	cmp    $0x1,%eax
 20f:	7e 50                	jle    261 <main+0x74>
  pattern = argv[1];
 211:	8b 45 e0             	mov    -0x20(%ebp),%eax
 214:	8b 40 04             	mov    0x4(%eax),%eax
 217:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 21a:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 21e:	7e 55                	jle    275 <main+0x88>
  for(i = 2; i < argc; i++){
 220:	be 02 00 00 00       	mov    $0x2,%esi
 225:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 228:	7d 71                	jge    29b <main+0xae>
    if((fd = open(argv[i], 0)) < 0){
 22a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22d:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 00                	push   $0x0
 235:	ff 37                	push   (%edi)
 237:	e8 f8 02 00 00       	call   534 <open>
 23c:	89 c3                	mov    %eax,%ebx
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	78 40                	js     285 <main+0x98>
    grep(pattern, fd);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	50                   	push   %eax
 249:	ff 75 dc             	push   -0x24(%ebp)
 24c:	e8 c8 fe ff ff       	call   119 <grep>
    close(fd);
 251:	89 1c 24             	mov    %ebx,(%esp)
 254:	e8 c3 02 00 00       	call   51c <close>
  for(i = 2; i < argc; i++){
 259:	83 c6 01             	add    $0x1,%esi
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	eb c4                	jmp    225 <main+0x38>
    printf(2, "usage: grep pattern [file ...]\n");
 261:	83 ec 08             	sub    $0x8,%esp
 264:	68 f8 08 00 00       	push   $0x8f8
 269:	6a 02                	push   $0x2
 26b:	e8 d9 03 00 00       	call   649 <printf>
    exit();
 270:	e8 7f 02 00 00       	call   4f4 <exit>
    grep(pattern, 0);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	50                   	push   %eax
 27b:	e8 99 fe ff ff       	call   119 <grep>
    exit();
 280:	e8 6f 02 00 00       	call   4f4 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 285:	83 ec 04             	sub    $0x4,%esp
 288:	ff 37                	push   (%edi)
 28a:	68 18 09 00 00       	push   $0x918
 28f:	6a 01                	push   $0x1
 291:	e8 b3 03 00 00       	call   649 <printf>
      exit();
 296:	e8 59 02 00 00       	call   4f4 <exit>
  exit();
 29b:	e8 54 02 00 00       	call   4f4 <exit>

000002a0 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	8b 75 08             	mov    0x8(%ebp),%esi
 2a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2ab:	89 f0                	mov    %esi,%eax
 2ad:	89 d1                	mov    %edx,%ecx
 2af:	83 c2 01             	add    $0x1,%edx
 2b2:	89 c3                	mov    %eax,%ebx
 2b4:	83 c0 01             	add    $0x1,%eax
 2b7:	0f b6 09             	movzbl (%ecx),%ecx
 2ba:	88 0b                	mov    %cl,(%ebx)
 2bc:	84 c9                	test   %cl,%cl
 2be:	75 ed                	jne    2ad <strcpy+0xd>
    ;
  return os;
}
 2c0:	89 f0                	mov    %esi,%eax
 2c2:	5b                   	pop    %ebx
 2c3:	5e                   	pop    %esi
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <strcmp>:

int strcmp(const char *p, const char *q)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 2cf:	eb 06                	jmp    2d7 <strcmp+0x11>
    p++, q++;
 2d1:	83 c1 01             	add    $0x1,%ecx
 2d4:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 2d7:	0f b6 01             	movzbl (%ecx),%eax
 2da:	84 c0                	test   %al,%al
 2dc:	74 04                	je     2e2 <strcmp+0x1c>
 2de:	3a 02                	cmp    (%edx),%al
 2e0:	74 ef                	je     2d1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2e2:	0f b6 c0             	movzbl %al,%eax
 2e5:	0f b6 12             	movzbl (%edx),%edx
 2e8:	29 d0                	sub    %edx,%eax
}
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    

000002ec <strlen>:

uint strlen(const char *s)
{
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 2f2:	b8 00 00 00 00       	mov    $0x0,%eax
 2f7:	eb 03                	jmp    2fc <strlen+0x10>
 2f9:	83 c0 01             	add    $0x1,%eax
 2fc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 300:	75 f7                	jne    2f9 <strlen+0xd>
    ;
  return n;
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <memset>:

void *
memset(void *dst, int c, uint n)
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	57                   	push   %edi
 308:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 30b:	89 d7                	mov    %edx,%edi
 30d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 310:	8b 45 0c             	mov    0xc(%ebp),%eax
 313:	fc                   	cld    
 314:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 316:	89 d0                	mov    %edx,%eax
 318:	8b 7d fc             	mov    -0x4(%ebp),%edi
 31b:	c9                   	leave  
 31c:	c3                   	ret    

0000031d <strchr>:

char *
strchr(const char *s, char c)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 327:	eb 03                	jmp    32c <strchr+0xf>
 329:	83 c0 01             	add    $0x1,%eax
 32c:	0f b6 10             	movzbl (%eax),%edx
 32f:	84 d2                	test   %dl,%dl
 331:	74 06                	je     339 <strchr+0x1c>
    if (*s == c)
 333:	38 ca                	cmp    %cl,%dl
 335:	75 f2                	jne    329 <strchr+0xc>
 337:	eb 05                	jmp    33e <strchr+0x21>
      return (char *)s;
  return 0;
 339:	b8 00 00 00 00       	mov    $0x0,%eax
}
 33e:	5d                   	pop    %ebp
 33f:	c3                   	ret    

00000340 <gets>:

char *
gets(char *buf, int max)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	83 ec 1c             	sub    $0x1c,%esp
 349:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 34c:	bb 00 00 00 00       	mov    $0x0,%ebx
 351:	89 de                	mov    %ebx,%esi
 353:	83 c3 01             	add    $0x1,%ebx
 356:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 359:	7d 2e                	jge    389 <gets+0x49>
  {
    cc = read(0, &c, 1);
 35b:	83 ec 04             	sub    $0x4,%esp
 35e:	6a 01                	push   $0x1
 360:	8d 45 e7             	lea    -0x19(%ebp),%eax
 363:	50                   	push   %eax
 364:	6a 00                	push   $0x0
 366:	e8 a1 01 00 00       	call   50c <read>
    if (cc < 1)
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	85 c0                	test   %eax,%eax
 370:	7e 17                	jle    389 <gets+0x49>
      break;
    buf[i++] = c;
 372:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 376:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 379:	3c 0a                	cmp    $0xa,%al
 37b:	0f 94 c2             	sete   %dl
 37e:	3c 0d                	cmp    $0xd,%al
 380:	0f 94 c0             	sete   %al
 383:	08 c2                	or     %al,%dl
 385:	74 ca                	je     351 <gets+0x11>
    buf[i++] = c;
 387:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 389:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 38d:	89 f8                	mov    %edi,%eax
 38f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 392:	5b                   	pop    %ebx
 393:	5e                   	pop    %esi
 394:	5f                   	pop    %edi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    

00000397 <stat>:

int stat(const char *n, struct stat *st)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	56                   	push   %esi
 39b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 39c:	83 ec 08             	sub    $0x8,%esp
 39f:	6a 00                	push   $0x0
 3a1:	ff 75 08             	push   0x8(%ebp)
 3a4:	e8 8b 01 00 00       	call   534 <open>
  if (fd < 0)
 3a9:	83 c4 10             	add    $0x10,%esp
 3ac:	85 c0                	test   %eax,%eax
 3ae:	78 24                	js     3d4 <stat+0x3d>
 3b0:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3b2:	83 ec 08             	sub    $0x8,%esp
 3b5:	ff 75 0c             	push   0xc(%ebp)
 3b8:	50                   	push   %eax
 3b9:	e8 8e 01 00 00       	call   54c <fstat>
 3be:	89 c6                	mov    %eax,%esi
  close(fd);
 3c0:	89 1c 24             	mov    %ebx,(%esp)
 3c3:	e8 54 01 00 00       	call   51c <close>
  return r;
 3c8:	83 c4 10             	add    $0x10,%esp
}
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d0:	5b                   	pop    %ebx
 3d1:	5e                   	pop    %esi
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
    return -1;
 3d4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d9:	eb f0                	jmp    3cb <stat+0x34>

000003db <atoi>:

int atoi(const char *s)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	53                   	push   %ebx
 3df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3e2:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 3e7:	eb 10                	jmp    3f9 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 3e9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3ec:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ef:	83 c1 01             	add    $0x1,%ecx
 3f2:	0f be c0             	movsbl %al,%eax
 3f5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 3f9:	0f b6 01             	movzbl (%ecx),%eax
 3fc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3ff:	80 fb 09             	cmp    $0x9,%bl
 402:	76 e5                	jbe    3e9 <atoi+0xe>
  return n;
}
 404:	89 d0                	mov    %edx,%eax
 406:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 409:	c9                   	leave  
 40a:	c3                   	ret    

0000040b <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	56                   	push   %esi
 40f:	53                   	push   %ebx
 410:	8b 75 08             	mov    0x8(%ebp),%esi
 413:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 416:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 419:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 41b:	eb 0d                	jmp    42a <memmove+0x1f>
    *dst++ = *src++;
 41d:	0f b6 01             	movzbl (%ecx),%eax
 420:	88 02                	mov    %al,(%edx)
 422:	8d 49 01             	lea    0x1(%ecx),%ecx
 425:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 428:	89 d8                	mov    %ebx,%eax
 42a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 42d:	85 c0                	test   %eax,%eax
 42f:	7f ec                	jg     41d <memmove+0x12>
  return vdst;
}
 431:	89 f0                	mov    %esi,%eax
 433:	5b                   	pop    %ebx
 434:	5e                   	pop    %esi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    

00000437 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 43d:	83 38 01             	cmpl   $0x1,(%eax)
 440:	74 fb                	je     43d <lock_acquire+0x6>
    ;
  lock->flag = 1;
 442:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 448:	5d                   	pop    %ebp
 449:	c3                   	ret    

0000044a <lock_release>:
void lock_release(lock_t *lock)
{
 44a:	55                   	push   %ebp
 44b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    

00000458 <lock_init>:
void lock_init(lock_t *lock)
{
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
 45e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    

00000466 <thread_create>:
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	53                   	push   %ebx
 46a:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 46d:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 470:	53                   	push   %ebx
 471:	e8 e2 ff ff ff       	call   458 <lock_init>
  lock_acquire(&lock);
 476:	89 1c 24             	mov    %ebx,(%esp)
 479:	e8 b9 ff ff ff       	call   437 <lock_acquire>
  void *stack = malloc(4096 * 2);
 47e:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 485:	e8 e5 03 00 00       	call   86f <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 48a:	50                   	push   %eax
 48b:	ff 75 10             	push   0x10(%ebp)
 48e:	ff 75 0c             	push   0xc(%ebp)
 491:	ff 75 08             	push   0x8(%ebp)
 494:	e8 fb 00 00 00       	call   594 <clone>
}
 499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49c:	c9                   	leave  
 49d:	c3                   	ret    

0000049e <thread_join>:
{
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
 4a1:	56                   	push   %esi
 4a2:	53                   	push   %ebx
 4a3:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 4a6:	6a 04                	push   $0x4
 4a8:	e8 c2 03 00 00       	call   86f <malloc>
 4ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 4b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b3:	89 04 24             	mov    %eax,(%esp)
 4b6:	e8 e1 00 00 00       	call   59c <join>
 4bb:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 4bd:	8d 75 f0             	lea    -0x10(%ebp),%esi
 4c0:	89 34 24             	mov    %esi,(%esp)
 4c3:	e8 90 ff ff ff       	call   458 <lock_init>
  lock_acquire(&lock);
 4c8:	89 34 24             	mov    %esi,(%esp)
 4cb:	e8 67 ff ff ff       	call   437 <lock_acquire>
  free(stack);
 4d0:	83 c4 04             	add    $0x4,%esp
 4d3:	ff 75 f4             	push   -0xc(%ebp)
 4d6:	e8 d4 02 00 00       	call   7af <free>
  lock_release(&lock);
 4db:	89 34 24             	mov    %esi,(%esp)
 4de:	e8 67 ff ff ff       	call   44a <lock_release>
}
 4e3:	89 d8                	mov    %ebx,%eax
 4e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e8:	5b                   	pop    %ebx
 4e9:	5e                   	pop    %esi
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret    

000004ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ec:	b8 01 00 00 00       	mov    $0x1,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <exit>:
SYSCALL(exit)
 4f4:	b8 02 00 00 00       	mov    $0x2,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <wait>:
SYSCALL(wait)
 4fc:	b8 03 00 00 00       	mov    $0x3,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <pipe>:
SYSCALL(pipe)
 504:	b8 04 00 00 00       	mov    $0x4,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <read>:
SYSCALL(read)
 50c:	b8 05 00 00 00       	mov    $0x5,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <write>:
SYSCALL(write)
 514:	b8 10 00 00 00       	mov    $0x10,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <close>:
SYSCALL(close)
 51c:	b8 15 00 00 00       	mov    $0x15,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <kill>:
SYSCALL(kill)
 524:	b8 06 00 00 00       	mov    $0x6,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <exec>:
SYSCALL(exec)
 52c:	b8 07 00 00 00       	mov    $0x7,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <open>:
SYSCALL(open)
 534:	b8 0f 00 00 00       	mov    $0xf,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <mknod>:
SYSCALL(mknod)
 53c:	b8 11 00 00 00       	mov    $0x11,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <unlink>:
SYSCALL(unlink)
 544:	b8 12 00 00 00       	mov    $0x12,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <fstat>:
SYSCALL(fstat)
 54c:	b8 08 00 00 00       	mov    $0x8,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <link>:
SYSCALL(link)
 554:	b8 13 00 00 00       	mov    $0x13,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <mkdir>:
SYSCALL(mkdir)
 55c:	b8 14 00 00 00       	mov    $0x14,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <chdir>:
SYSCALL(chdir)
 564:	b8 09 00 00 00       	mov    $0x9,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <dup>:
SYSCALL(dup)
 56c:	b8 0a 00 00 00       	mov    $0xa,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <getpid>:
SYSCALL(getpid)
 574:	b8 0b 00 00 00       	mov    $0xb,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <sbrk>:
SYSCALL(sbrk)
 57c:	b8 0c 00 00 00       	mov    $0xc,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <sleep>:
SYSCALL(sleep)
 584:	b8 0d 00 00 00       	mov    $0xd,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <uptime>:
SYSCALL(uptime)
 58c:	b8 0e 00 00 00       	mov    $0xe,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <clone>:
SYSCALL(clone)
 594:	b8 16 00 00 00       	mov    $0x16,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <join>:
 59c:	b8 17 00 00 00       	mov    $0x17,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	83 ec 1c             	sub    $0x1c,%esp
 5aa:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ad:	6a 01                	push   $0x1
 5af:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b2:	52                   	push   %edx
 5b3:	50                   	push   %eax
 5b4:	e8 5b ff ff ff       	call   514 <write>
}
 5b9:	83 c4 10             	add    $0x10,%esp
 5bc:	c9                   	leave  
 5bd:	c3                   	ret    

000005be <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	57                   	push   %edi
 5c2:	56                   	push   %esi
 5c3:	53                   	push   %ebx
 5c4:	83 ec 2c             	sub    $0x2c,%esp
 5c7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ca:	89 d0                	mov    %edx,%eax
 5cc:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ce:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d2:	0f 95 c1             	setne  %cl
 5d5:	c1 ea 1f             	shr    $0x1f,%edx
 5d8:	84 d1                	test   %dl,%cl
 5da:	74 44                	je     620 <printint+0x62>
    neg = 1;
    x = -xx;
 5dc:	f7 d8                	neg    %eax
 5de:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5e0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5e7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5ec:	89 c8                	mov    %ecx,%eax
 5ee:	ba 00 00 00 00       	mov    $0x0,%edx
 5f3:	f7 f6                	div    %esi
 5f5:	89 df                	mov    %ebx,%edi
 5f7:	83 c3 01             	add    $0x1,%ebx
 5fa:	0f b6 92 90 09 00 00 	movzbl 0x990(%edx),%edx
 601:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 605:	89 ca                	mov    %ecx,%edx
 607:	89 c1                	mov    %eax,%ecx
 609:	39 d6                	cmp    %edx,%esi
 60b:	76 df                	jbe    5ec <printint+0x2e>
  if(neg)
 60d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 611:	74 31                	je     644 <printint+0x86>
    buf[i++] = '-';
 613:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 618:	8d 5f 02             	lea    0x2(%edi),%ebx
 61b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 61e:	eb 17                	jmp    637 <printint+0x79>
    x = xx;
 620:	89 c1                	mov    %eax,%ecx
  neg = 0;
 622:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 629:	eb bc                	jmp    5e7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 62b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 630:	89 f0                	mov    %esi,%eax
 632:	e8 6d ff ff ff       	call   5a4 <putc>
  while(--i >= 0)
 637:	83 eb 01             	sub    $0x1,%ebx
 63a:	79 ef                	jns    62b <printint+0x6d>
}
 63c:	83 c4 2c             	add    $0x2c,%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    
 644:	8b 75 d0             	mov    -0x30(%ebp),%esi
 647:	eb ee                	jmp    637 <printint+0x79>

00000649 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 649:	55                   	push   %ebp
 64a:	89 e5                	mov    %esp,%ebp
 64c:	57                   	push   %edi
 64d:	56                   	push   %esi
 64e:	53                   	push   %ebx
 64f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 652:	8d 45 10             	lea    0x10(%ebp),%eax
 655:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 658:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 65d:	bb 00 00 00 00       	mov    $0x0,%ebx
 662:	eb 14                	jmp    678 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 664:	89 fa                	mov    %edi,%edx
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	e8 36 ff ff ff       	call   5a4 <putc>
 66e:	eb 05                	jmp    675 <printf+0x2c>
      }
    } else if(state == '%'){
 670:	83 fe 25             	cmp    $0x25,%esi
 673:	74 25                	je     69a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 675:	83 c3 01             	add    $0x1,%ebx
 678:	8b 45 0c             	mov    0xc(%ebp),%eax
 67b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 67f:	84 c0                	test   %al,%al
 681:	0f 84 20 01 00 00    	je     7a7 <printf+0x15e>
    c = fmt[i] & 0xff;
 687:	0f be f8             	movsbl %al,%edi
 68a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 68d:	85 f6                	test   %esi,%esi
 68f:	75 df                	jne    670 <printf+0x27>
      if(c == '%'){
 691:	83 f8 25             	cmp    $0x25,%eax
 694:	75 ce                	jne    664 <printf+0x1b>
        state = '%';
 696:	89 c6                	mov    %eax,%esi
 698:	eb db                	jmp    675 <printf+0x2c>
      if(c == 'd'){
 69a:	83 f8 25             	cmp    $0x25,%eax
 69d:	0f 84 cf 00 00 00    	je     772 <printf+0x129>
 6a3:	0f 8c dd 00 00 00    	jl     786 <printf+0x13d>
 6a9:	83 f8 78             	cmp    $0x78,%eax
 6ac:	0f 8f d4 00 00 00    	jg     786 <printf+0x13d>
 6b2:	83 f8 63             	cmp    $0x63,%eax
 6b5:	0f 8c cb 00 00 00    	jl     786 <printf+0x13d>
 6bb:	83 e8 63             	sub    $0x63,%eax
 6be:	83 f8 15             	cmp    $0x15,%eax
 6c1:	0f 87 bf 00 00 00    	ja     786 <printf+0x13d>
 6c7:	ff 24 85 38 09 00 00 	jmp    *0x938(,%eax,4)
        printint(fd, *ap, 10, 1);
 6ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d1:	8b 17                	mov    (%edi),%edx
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	6a 01                	push   $0x1
 6d8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	e8 d9 fe ff ff       	call   5be <printint>
        ap++;
 6e5:	83 c7 04             	add    $0x4,%edi
 6e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6eb:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ee:	be 00 00 00 00       	mov    $0x0,%esi
 6f3:	eb 80                	jmp    675 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6f5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f8:	8b 17                	mov    (%edi),%edx
 6fa:	83 ec 0c             	sub    $0xc,%esp
 6fd:	6a 00                	push   $0x0
 6ff:	b9 10 00 00 00       	mov    $0x10,%ecx
 704:	8b 45 08             	mov    0x8(%ebp),%eax
 707:	e8 b2 fe ff ff       	call   5be <printint>
        ap++;
 70c:	83 c7 04             	add    $0x4,%edi
 70f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 712:	83 c4 10             	add    $0x10,%esp
      state = 0;
 715:	be 00 00 00 00       	mov    $0x0,%esi
 71a:	e9 56 ff ff ff       	jmp    675 <printf+0x2c>
        s = (char*)*ap;
 71f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 722:	8b 30                	mov    (%eax),%esi
        ap++;
 724:	83 c0 04             	add    $0x4,%eax
 727:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 72a:	85 f6                	test   %esi,%esi
 72c:	75 15                	jne    743 <printf+0xfa>
          s = "(null)";
 72e:	be 2e 09 00 00       	mov    $0x92e,%esi
 733:	eb 0e                	jmp    743 <printf+0xfa>
          putc(fd, *s);
 735:	0f be d2             	movsbl %dl,%edx
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	e8 64 fe ff ff       	call   5a4 <putc>
          s++;
 740:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 743:	0f b6 16             	movzbl (%esi),%edx
 746:	84 d2                	test   %dl,%dl
 748:	75 eb                	jne    735 <printf+0xec>
      state = 0;
 74a:	be 00 00 00 00       	mov    $0x0,%esi
 74f:	e9 21 ff ff ff       	jmp    675 <printf+0x2c>
        putc(fd, *ap);
 754:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 757:	0f be 17             	movsbl (%edi),%edx
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	e8 42 fe ff ff       	call   5a4 <putc>
        ap++;
 762:	83 c7 04             	add    $0x4,%edi
 765:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 768:	be 00 00 00 00       	mov    $0x0,%esi
 76d:	e9 03 ff ff ff       	jmp    675 <printf+0x2c>
        putc(fd, c);
 772:	89 fa                	mov    %edi,%edx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 28 fe ff ff       	call   5a4 <putc>
      state = 0;
 77c:	be 00 00 00 00       	mov    $0x0,%esi
 781:	e9 ef fe ff ff       	jmp    675 <printf+0x2c>
        putc(fd, '%');
 786:	ba 25 00 00 00       	mov    $0x25,%edx
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	e8 11 fe ff ff       	call   5a4 <putc>
        putc(fd, c);
 793:	89 fa                	mov    %edi,%edx
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	e8 07 fe ff ff       	call   5a4 <putc>
      state = 0;
 79d:	be 00 00 00 00       	mov    $0x0,%esi
 7a2:	e9 ce fe ff ff       	jmp    675 <printf+0x2c>
    }
  }
}
 7a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7aa:	5b                   	pop    %ebx
 7ab:	5e                   	pop    %esi
 7ac:	5f                   	pop    %edi
 7ad:	5d                   	pop    %ebp
 7ae:	c3                   	ret    

000007af <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7af:	55                   	push   %ebp
 7b0:	89 e5                	mov    %esp,%ebp
 7b2:	57                   	push   %edi
 7b3:	56                   	push   %esi
 7b4:	53                   	push   %ebx
 7b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bb:	a1 a0 11 00 00       	mov    0x11a0,%eax
 7c0:	eb 02                	jmp    7c4 <free+0x15>
 7c2:	89 d0                	mov    %edx,%eax
 7c4:	39 c8                	cmp    %ecx,%eax
 7c6:	73 04                	jae    7cc <free+0x1d>
 7c8:	39 08                	cmp    %ecx,(%eax)
 7ca:	77 12                	ja     7de <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cc:	8b 10                	mov    (%eax),%edx
 7ce:	39 c2                	cmp    %eax,%edx
 7d0:	77 f0                	ja     7c2 <free+0x13>
 7d2:	39 c8                	cmp    %ecx,%eax
 7d4:	72 08                	jb     7de <free+0x2f>
 7d6:	39 ca                	cmp    %ecx,%edx
 7d8:	77 04                	ja     7de <free+0x2f>
 7da:	89 d0                	mov    %edx,%eax
 7dc:	eb e6                	jmp    7c4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7de:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7e4:	8b 10                	mov    (%eax),%edx
 7e6:	39 d7                	cmp    %edx,%edi
 7e8:	74 19                	je     803 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ed:	8b 50 04             	mov    0x4(%eax),%edx
 7f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f3:	39 ce                	cmp    %ecx,%esi
 7f5:	74 1b                	je     812 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7f7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7f9:	a3 a0 11 00 00       	mov    %eax,0x11a0
}
 7fe:	5b                   	pop    %ebx
 7ff:	5e                   	pop    %esi
 800:	5f                   	pop    %edi
 801:	5d                   	pop    %ebp
 802:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 803:	03 72 04             	add    0x4(%edx),%esi
 806:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 809:	8b 10                	mov    (%eax),%edx
 80b:	8b 12                	mov    (%edx),%edx
 80d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 810:	eb db                	jmp    7ed <free+0x3e>
    p->s.size += bp->s.size;
 812:	03 53 fc             	add    -0x4(%ebx),%edx
 815:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 818:	8b 53 f8             	mov    -0x8(%ebx),%edx
 81b:	89 10                	mov    %edx,(%eax)
 81d:	eb da                	jmp    7f9 <free+0x4a>

0000081f <morecore>:

static Header*
morecore(uint nu)
{
 81f:	55                   	push   %ebp
 820:	89 e5                	mov    %esp,%ebp
 822:	53                   	push   %ebx
 823:	83 ec 04             	sub    $0x4,%esp
 826:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 828:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 82d:	77 05                	ja     834 <morecore+0x15>
    nu = 4096;
 82f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 834:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83b:	83 ec 0c             	sub    $0xc,%esp
 83e:	50                   	push   %eax
 83f:	e8 38 fd ff ff       	call   57c <sbrk>
  if(p == (char*)-1)
 844:	83 c4 10             	add    $0x10,%esp
 847:	83 f8 ff             	cmp    $0xffffffff,%eax
 84a:	74 1c                	je     868 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 84c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 84f:	83 c0 08             	add    $0x8,%eax
 852:	83 ec 0c             	sub    $0xc,%esp
 855:	50                   	push   %eax
 856:	e8 54 ff ff ff       	call   7af <free>
  return freep;
 85b:	a1 a0 11 00 00       	mov    0x11a0,%eax
 860:	83 c4 10             	add    $0x10,%esp
}
 863:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 866:	c9                   	leave  
 867:	c3                   	ret    
    return 0;
 868:	b8 00 00 00 00       	mov    $0x0,%eax
 86d:	eb f4                	jmp    863 <morecore+0x44>

0000086f <malloc>:

void*
malloc(uint nbytes)
{
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
 872:	53                   	push   %ebx
 873:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	8d 58 07             	lea    0x7(%eax),%ebx
 87c:	c1 eb 03             	shr    $0x3,%ebx
 87f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 882:	8b 0d a0 11 00 00    	mov    0x11a0,%ecx
 888:	85 c9                	test   %ecx,%ecx
 88a:	74 04                	je     890 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88c:	8b 01                	mov    (%ecx),%eax
 88e:	eb 4a                	jmp    8da <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 a0 11 00 00 a4 	movl   $0x11a4,0x11a0
 897:	11 00 00 
 89a:	c7 05 a4 11 00 00 a4 	movl   $0x11a4,0x11a4
 8a1:	11 00 00 
    base.s.size = 0;
 8a4:	c7 05 a8 11 00 00 00 	movl   $0x0,0x11a8
 8ab:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ae:	b9 a4 11 00 00       	mov    $0x11a4,%ecx
 8b3:	eb d7                	jmp    88c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b5:	74 19                	je     8d0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8b7:	29 da                	sub    %ebx,%edx
 8b9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8bc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8bf:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c2:	89 0d a0 11 00 00    	mov    %ecx,0x11a0
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ce:	c9                   	leave  
 8cf:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 10                	mov    (%eax),%edx
 8d2:	89 11                	mov    %edx,(%ecx)
 8d4:	eb ec                	jmp    8c2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d6:	89 c1                	mov    %eax,%ecx
 8d8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8da:	8b 50 04             	mov    0x4(%eax),%edx
 8dd:	39 da                	cmp    %ebx,%edx
 8df:	73 d4                	jae    8b5 <malloc+0x46>
    if(p == freep)
 8e1:	39 05 a0 11 00 00    	cmp    %eax,0x11a0
 8e7:	75 ed                	jne    8d6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8e9:	89 d8                	mov    %ebx,%eax
 8eb:	e8 2f ff ff ff       	call   81f <morecore>
 8f0:	85 c0                	test   %eax,%eax
 8f2:	75 e2                	jne    8d6 <malloc+0x67>
 8f4:	eb d5                	jmp    8cb <malloc+0x5c>
