
_test_17:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void merge_sort(void *array, void *size);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 eb 05 00 00       	call   602 <getpid>
  17:	a3 0c 0e 00 00       	mov    %eax,0xe0c
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 d0 08 00 00       	call   8fd <malloc>
  2d:	a3 08 0e 00 00       	mov    %eax,0xe08
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d 08 0e 00 00    	mov    0xe08,%ecx
  47:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    for(int i = 0; i < size; i++){
  4a:	83 c2 01             	add    $0x1,%edx
  4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  50:	39 d0                	cmp    %edx,%eax
  52:	7f e8                	jg     3c <main+0x3c>
    }

   int thread_pid = thread_create(merge_sort, global, &size);
  54:	83 ec 04             	sub    $0x4,%esp
  57:	8d 45 f4             	lea    -0xc(%ebp),%eax
  5a:	50                   	push   %eax
  5b:	ff 35 08 0e 00 00    	push   0xe08
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 89 04 00 00       	call   4f4 <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 b3 04 00 00       	call   52c <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 08 0e 00 00       	mov    0xe08,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 84 09 00 00       	push   $0x984
  a0:	68 8e 09 00 00       	push   $0x98e
  a5:	6a 01                	push   $0x1
  a7:	e8 2b 06 00 00       	call   6d7 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 ec 09 00 00       	push   $0x9ec
  b4:	68 a5 09 00 00       	push   $0x9a5
  b9:	6a 01                	push   $0x1
  bb:	e8 17 06 00 00       	call   6d7 <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 b9 09 00 00       	push   $0x9b9
  c8:	6a 01                	push   $0x1
  ca:	e8 08 06 00 00       	call   6d7 <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 0c 0e 00 00    	push   0xe0c
  d8:	e8 d5 04 00 00       	call   5b2 <kill>
  dd:	e8 a0 04 00 00       	call   582 <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 84 09 00 00       	push   $0x984
  e9:	68 8e 09 00 00       	push   $0x98e
  ee:	6a 01                	push   $0x1
  f0:	e8 e2 05 00 00       	call   6d7 <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 96 09 00 00       	push   $0x996
  fd:	68 a5 09 00 00       	push   $0x9a5
 102:	6a 01                	push   $0x1
 104:	e8 ce 05 00 00       	call   6d7 <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 b9 09 00 00       	push   $0x9b9
 111:	6a 01                	push   $0x1
 113:	e8 bf 05 00 00       	call   6d7 <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 0c 0e 00 00    	push   0xe0c
 121:	e8 8c 04 00 00       	call   5b2 <kill>
 126:	e8 57 04 00 00       	call   582 <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 84 09 00 00       	push   $0x984
 132:	68 8e 09 00 00       	push   $0x98e
 137:	6a 01                	push   $0x1
 139:	e8 99 05 00 00       	call   6d7 <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 c6 09 00 00       	push   $0x9c6
 146:	68 a5 09 00 00       	push   $0x9a5
 14b:	6a 01                	push   $0x1
 14d:	e8 85 05 00 00       	call   6d7 <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 b9 09 00 00       	push   $0x9b9
 15a:	6a 01                	push   $0x1
 15c:	e8 76 05 00 00       	call   6d7 <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 0c 0e 00 00    	push   0xe0c
 16a:	e8 43 04 00 00       	call   5b2 <kill>
 16f:	e8 0e 04 00 00       	call   582 <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 84 09 00 00       	push   $0x984
 17b:	68 8e 09 00 00       	push   $0x98e
 180:	6a 01                	push   $0x1
 182:	e8 50 05 00 00       	call   6d7 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 dd 09 00 00       	push   $0x9dd
 18f:	68 a5 09 00 00       	push   $0x9a5
 194:	6a 01                	push   $0x1
 196:	e8 3c 05 00 00       	call   6d7 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 b9 09 00 00       	push   $0x9b9
 1a3:	6a 01                	push   $0x1
 1a5:	e8 2d 05 00 00       	call   6d7 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 0c 0e 00 00    	push   0xe0c
 1b3:	e8 fa 03 00 00       	call   5b2 <kill>
 1b8:	e8 c5 03 00 00       	call   582 <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 fd 09 00 00       	push   $0x9fd
 1c5:	6a 01                	push   $0x1
 1c7:	e8 0b 05 00 00       	call   6d7 <printf>
   exit();
 1cc:	e8 b1 03 00 00       	call   582 <exit>

000001d1 <merge>:
}

void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	57                   	push   %edi
 1d5:	56                   	push   %esi
 1d6:	53                   	push   %ebx
 1d7:	83 ec 04             	sub    $0x4,%esp
    int i = 0;
    int j = 0;
    int k = 0;
 1da:	b8 00 00 00 00       	mov    $0x0,%eax
    int j = 0;
 1df:	ba 00 00 00 00       	mov    $0x0,%edx
    int i = 0;
 1e4:	b9 00 00 00 00       	mov    $0x0,%ecx
    while(i < size_left && j < size_right){
 1e9:	eb 0c                	jmp    1f7 <merge+0x26>
        if(array[i] < array_right[j]){
            temp_array[k] = array[i];
            i++;
        }
        else{
            temp_array[k] = array_right[j];
 1eb:	8b 7d 18             	mov    0x18(%ebp),%edi
 1ee:	89 34 87             	mov    %esi,(%edi,%eax,4)
            j++;
 1f1:	83 c2 01             	add    $0x1,%edx
        }
        k++;
 1f4:	83 c0 01             	add    $0x1,%eax
    while(i < size_left && j < size_right){
 1f7:	3b 4d 10             	cmp    0x10(%ebp),%ecx
 1fa:	0f 9c c3             	setl   %bl
 1fd:	89 de                	mov    %ebx,%esi
 1ff:	3b 55 14             	cmp    0x14(%ebp),%edx
 202:	0f 9c c3             	setl   %bl
 205:	89 df                	mov    %ebx,%edi
 207:	89 f3                	mov    %esi,%ebx
 209:	84 db                	test   %bl,%bl
 20b:	74 50                	je     25d <merge+0x8c>
 20d:	89 fb                	mov    %edi,%ebx
 20f:	84 db                	test   %bl,%bl
 211:	74 1b                	je     22e <merge+0x5d>
        if(array[i] < array_right[j]){
 213:	8b 7d 08             	mov    0x8(%ebp),%edi
 216:	8b 3c 8f             	mov    (%edi,%ecx,4),%edi
 219:	8b 75 0c             	mov    0xc(%ebp),%esi
 21c:	8b 34 96             	mov    (%esi,%edx,4),%esi
 21f:	39 f7                	cmp    %esi,%edi
 221:	7d c8                	jge    1eb <merge+0x1a>
            temp_array[k] = array[i];
 223:	8b 75 18             	mov    0x18(%ebp),%esi
 226:	89 3c 86             	mov    %edi,(%esi,%eax,4)
            i++;
 229:	83 c1 01             	add    $0x1,%ecx
 22c:	eb c6                	jmp    1f4 <merge+0x23>
 22e:	8b 7d 08             	mov    0x8(%ebp),%edi
 231:	8b 5d 18             	mov    0x18(%ebp),%ebx
 234:	89 55 f0             	mov    %edx,-0x10(%ebp)
 237:	8b 75 10             	mov    0x10(%ebp),%esi
 23a:	eb 0c                	jmp    248 <merge+0x77>
    }
    while(i < size_left){
        temp_array[k] = array[i];
 23c:	8b 14 8f             	mov    (%edi,%ecx,4),%edx
 23f:	89 14 83             	mov    %edx,(%ebx,%eax,4)
        i++;
 242:	83 c1 01             	add    $0x1,%ecx
        k++;
 245:	83 c0 01             	add    $0x1,%eax
    while(i < size_left){
 248:	39 f1                	cmp    %esi,%ecx
 24a:	7c f0                	jl     23c <merge+0x6b>
 24c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 24f:	89 75 10             	mov    %esi,0x10(%ebp)
 252:	89 7d 08             	mov    %edi,0x8(%ebp)
 255:	8b 75 0c             	mov    0xc(%ebp),%esi
 258:	8b 4d 14             	mov    0x14(%ebp),%ecx
 25b:	eb 1a                	jmp    277 <merge+0xa6>
 25d:	89 55 f0             	mov    %edx,-0x10(%ebp)
 260:	8b 7d 08             	mov    0x8(%ebp),%edi
 263:	8b 75 10             	mov    0x10(%ebp),%esi
 266:	8b 5d 18             	mov    0x18(%ebp),%ebx
 269:	eb dd                	jmp    248 <merge+0x77>
    }
    while(j < size_right){
        temp_array[k] = array_right[j];
 26b:	8b 3c 96             	mov    (%esi,%edx,4),%edi
 26e:	89 3c 83             	mov    %edi,(%ebx,%eax,4)
        j++;
 271:	83 c2 01             	add    $0x1,%edx
        k++;
 274:	83 c0 01             	add    $0x1,%eax
    while(j < size_right){
 277:	39 ca                	cmp    %ecx,%edx
 279:	7c f0                	jl     26b <merge+0x9a>
    }
    for(int i = 0; i < size_left + size_right; i++){
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
 283:	8b 4d 10             	mov    0x10(%ebp),%ecx
 286:	8b 75 14             	mov    0x14(%ebp),%esi
 289:	eb 09                	jmp    294 <merge+0xc3>
        array[i] = temp_array[i];
 28b:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 28e:	89 14 87             	mov    %edx,(%edi,%eax,4)
    for(int i = 0; i < size_left + size_right; i++){
 291:	83 c0 01             	add    $0x1,%eax
 294:	8d 14 31             	lea    (%ecx,%esi,1),%edx
 297:	39 c2                	cmp    %eax,%edx
 299:	7f f0                	jg     28b <merge+0xba>
    }
   
}
 29b:	83 c4 04             	add    $0x4,%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5f                   	pop    %edi
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <merge_sort>:

void merge_sort(void *arg1, void *arg2) {
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	57                   	push   %edi
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
 2a9:	83 ec 1c             	sub    $0x1c,%esp
 2ac:	8b 75 08             	mov    0x8(%ebp),%esi
   int *array = (int*)arg1;
   int size = *(int*)arg2;
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	8b 18                	mov    (%eax),%ebx

   if (size==1){
 2b4:	83 fb 01             	cmp    $0x1,%ebx
 2b7:	74 70                	je     329 <merge_sort+0x86>
       exit();
   }

   
   int size_left = size/2;
 2b9:	b9 02 00 00 00       	mov    $0x2,%ecx
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	99                   	cltd   
 2c1:	f7 f9                	idiv   %ecx
 2c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   int size_right = size-size/2;
 2c6:	89 da                	mov    %ebx,%edx
 2c8:	29 c2                	sub    %eax,%edx
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)

   int* array_right = (int*)(array + size_left);
 2cd:	8d 3c 86             	lea    (%esi,%eax,4),%edi
//    merge_sort(array_right, size_right);

//    int nested_thread_pid_l = thread_create(merge_sort, array, &size_left);
//    int nested_thread_pid_r = thread_create(merge_sort, array_right, &size_right);
   
   thread_create(merge_sort, array, &size_left);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 2d6:	50                   	push   %eax
 2d7:	56                   	push   %esi
 2d8:	68 a3 02 00 00       	push   $0x2a3
 2dd:	e8 12 02 00 00       	call   4f4 <thread_create>
   thread_create(merge_sort, array_right, &size_right);
 2e2:	83 c4 0c             	add    $0xc,%esp
 2e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
 2e8:	50                   	push   %eax
 2e9:	57                   	push   %edi
 2ea:	68 a3 02 00 00       	push   $0x2a3
 2ef:	e8 00 02 00 00       	call   4f4 <thread_create>

   thread_join();
 2f4:	e8 33 02 00 00       	call   52c <thread_join>
   thread_join();
 2f9:	e8 2e 02 00 00       	call   52c <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 f4 05 00 00       	call   8fd <malloc>
 309:	89 c3                	mov    %eax,%ebx

   merge(array,array_right,size_left,size_right,temp_array);
 30b:	89 04 24             	mov    %eax,(%esp)
 30e:	ff 75 e0             	push   -0x20(%ebp)
 311:	ff 75 e4             	push   -0x1c(%ebp)
 314:	57                   	push   %edi
 315:	56                   	push   %esi
 316:	e8 b6 fe ff ff       	call   1d1 <merge>

   free(temp_array);
 31b:	83 c4 14             	add    $0x14,%esp
 31e:	53                   	push   %ebx
 31f:	e8 19 05 00 00       	call   83d <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 59 02 00 00       	call   582 <exit>
       exit();
 329:	e8 54 02 00 00       	call   582 <exit>

0000032e <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	56                   	push   %esi
 332:	53                   	push   %ebx
 333:	8b 75 08             	mov    0x8(%ebp),%esi
 336:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 339:	89 f0                	mov    %esi,%eax
 33b:	89 d1                	mov    %edx,%ecx
 33d:	83 c2 01             	add    $0x1,%edx
 340:	89 c3                	mov    %eax,%ebx
 342:	83 c0 01             	add    $0x1,%eax
 345:	0f b6 09             	movzbl (%ecx),%ecx
 348:	88 0b                	mov    %cl,(%ebx)
 34a:	84 c9                	test   %cl,%cl
 34c:	75 ed                	jne    33b <strcpy+0xd>
    ;
  return os;
}
 34e:	89 f0                	mov    %esi,%eax
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <strcmp>:

int strcmp(const char *p, const char *q)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while (*p && *p == *q)
 35d:	eb 06                	jmp    365 <strcmp+0x11>
    p++, q++;
 35f:	83 c1 01             	add    $0x1,%ecx
 362:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
 365:	0f b6 01             	movzbl (%ecx),%eax
 368:	84 c0                	test   %al,%al
 36a:	74 04                	je     370 <strcmp+0x1c>
 36c:	3a 02                	cmp    (%edx),%al
 36e:	74 ef                	je     35f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 370:	0f b6 c0             	movzbl %al,%eax
 373:	0f b6 12             	movzbl (%edx),%edx
 376:	29 d0                	sub    %edx,%eax
}
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <strlen>:

uint strlen(const char *s)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for (n = 0; s[n]; n++)
 380:	b8 00 00 00 00       	mov    $0x0,%eax
 385:	eb 03                	jmp    38a <strlen+0x10>
 387:	83 c0 01             	add    $0x1,%eax
 38a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38e:	75 f7                	jne    387 <strlen+0xd>
    ;
  return n;
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <memset>:

void *
memset(void *dst, int c, uint n)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	57                   	push   %edi
 396:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 399:	89 d7                	mov    %edx,%edi
 39b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	fc                   	cld    
 3a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a4:	89 d0                	mov    %edx,%eax
 3a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a9:	c9                   	leave  
 3aa:	c3                   	ret    

000003ab <strchr>:

char *
strchr(const char *s, char c)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	8b 45 08             	mov    0x8(%ebp),%eax
 3b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 3b5:	eb 03                	jmp    3ba <strchr+0xf>
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 06                	je     3c7 <strchr+0x1c>
    if (*s == c)
 3c1:	38 ca                	cmp    %cl,%dl
 3c3:	75 f2                	jne    3b7 <strchr+0xc>
 3c5:	eb 05                	jmp    3cc <strchr+0x21>
      return (char *)s;
  return 0;
 3c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <gets>:

char *
gets(char *buf, int max)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	57                   	push   %edi
 3d2:	56                   	push   %esi
 3d3:	53                   	push   %ebx
 3d4:	83 ec 1c             	sub    $0x1c,%esp
 3d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
 3da:	bb 00 00 00 00       	mov    $0x0,%ebx
 3df:	89 de                	mov    %ebx,%esi
 3e1:	83 c3 01             	add    $0x1,%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	7d 2e                	jge    417 <gets+0x49>
  {
    cc = read(0, &c, 1);
 3e9:	83 ec 04             	sub    $0x4,%esp
 3ec:	6a 01                	push   $0x1
 3ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f1:	50                   	push   %eax
 3f2:	6a 00                	push   $0x0
 3f4:	e8 a1 01 00 00       	call   59a <read>
    if (cc < 1)
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	85 c0                	test   %eax,%eax
 3fe:	7e 17                	jle    417 <gets+0x49>
      break;
    buf[i++] = c;
 400:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 404:	88 04 37             	mov    %al,(%edi,%esi,1)
    if (c == '\n' || c == '\r')
 407:	3c 0a                	cmp    $0xa,%al
 409:	0f 94 c2             	sete   %dl
 40c:	3c 0d                	cmp    $0xd,%al
 40e:	0f 94 c0             	sete   %al
 411:	08 c2                	or     %al,%dl
 413:	74 ca                	je     3df <gets+0x11>
    buf[i++] = c;
 415:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 417:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41b:	89 f8                	mov    %edi,%eax
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    

00000425 <stat>:

int stat(const char *n, struct stat *st)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	56                   	push   %esi
 429:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42a:	83 ec 08             	sub    $0x8,%esp
 42d:	6a 00                	push   $0x0
 42f:	ff 75 08             	push   0x8(%ebp)
 432:	e8 8b 01 00 00       	call   5c2 <open>
  if (fd < 0)
 437:	83 c4 10             	add    $0x10,%esp
 43a:	85 c0                	test   %eax,%eax
 43c:	78 24                	js     462 <stat+0x3d>
 43e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 440:	83 ec 08             	sub    $0x8,%esp
 443:	ff 75 0c             	push   0xc(%ebp)
 446:	50                   	push   %eax
 447:	e8 8e 01 00 00       	call   5da <fstat>
 44c:	89 c6                	mov    %eax,%esi
  close(fd);
 44e:	89 1c 24             	mov    %ebx,(%esp)
 451:	e8 54 01 00 00       	call   5aa <close>
  return r;
 456:	83 c4 10             	add    $0x10,%esp
}
 459:	89 f0                	mov    %esi,%eax
 45b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
    return -1;
 462:	be ff ff ff ff       	mov    $0xffffffff,%esi
 467:	eb f0                	jmp    459 <stat+0x34>

00000469 <atoi>:

int atoi(const char *s)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	53                   	push   %ebx
 46d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 470:	ba 00 00 00 00       	mov    $0x0,%edx
  while ('0' <= *s && *s <= '9')
 475:	eb 10                	jmp    487 <atoi+0x1e>
    n = n * 10 + *s++ - '0';
 477:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 47a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 47d:	83 c1 01             	add    $0x1,%ecx
 480:	0f be c0             	movsbl %al,%eax
 483:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while ('0' <= *s && *s <= '9')
 487:	0f b6 01             	movzbl (%ecx),%eax
 48a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48d:	80 fb 09             	cmp    $0x9,%bl
 490:	76 e5                	jbe    477 <atoi+0xe>
  return n;
}
 492:	89 d0                	mov    %edx,%eax
 494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while (n-- > 0)
 4a9:	eb 0d                	jmp    4b8 <memmove+0x1f>
    *dst++ = *src++;
 4ab:	0f b6 01             	movzbl (%ecx),%eax
 4ae:	88 02                	mov    %al,(%edx)
 4b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b3:	8d 52 01             	lea    0x1(%edx),%edx
  while (n-- > 0)
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4bb:	85 c0                	test   %eax,%eax
 4bd:	7f ec                	jg     4ab <memmove+0x12>
  return vdst;
}
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    

000004c5 <lock_acquire>:

  return pid;
}

void lock_acquire(lock_t *lock)
{
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 4cb:	83 38 01             	cmpl   $0x1,(%eax)
 4ce:	74 fb                	je     4cb <lock_acquire+0x6>
    ;
  lock->flag = 1;
 4d0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    

000004d8 <lock_release>:
void lock_release(lock_t *lock)
{
 4d8:	55                   	push   %ebp
 4d9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e4:	5d                   	pop    %ebp
 4e5:	c3                   	ret    

000004e6 <lock_init>:
void lock_init(lock_t *lock)
{
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0; // lock is available
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    

000004f4 <thread_create>:
{
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	53                   	push   %ebx
 4f8:	83 ec 20             	sub    $0x20,%esp
  lock_init(&lock);
 4fb:	8d 5d f4             	lea    -0xc(%ebp),%ebx
 4fe:	53                   	push   %ebx
 4ff:	e8 e2 ff ff ff       	call   4e6 <lock_init>
  lock_acquire(&lock);
 504:	89 1c 24             	mov    %ebx,(%esp)
 507:	e8 b9 ff ff ff       	call   4c5 <lock_acquire>
  void *stack = malloc(4096 * 2);
 50c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 513:	e8 e5 03 00 00       	call   8fd <malloc>
  pid = clone(start_routine, arg1, arg2, stack);
 518:	50                   	push   %eax
 519:	ff 75 10             	push   0x10(%ebp)
 51c:	ff 75 0c             	push   0xc(%ebp)
 51f:	ff 75 08             	push   0x8(%ebp)
 522:	e8 fb 00 00 00       	call   622 <clone>
}
 527:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 52a:	c9                   	leave  
 52b:	c3                   	ret    

0000052c <thread_join>:
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	56                   	push   %esi
 530:	53                   	push   %ebx
 531:	83 ec 1c             	sub    $0x1c,%esp
  void *stack = malloc(sizeof(void *));
 534:	6a 04                	push   $0x4
 536:	e8 c2 03 00 00       	call   8fd <malloc>
 53b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  pid = join(&stack);
 53e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 541:	89 04 24             	mov    %eax,(%esp)
 544:	e8 e1 00 00 00       	call   62a <join>
 549:	89 c3                	mov    %eax,%ebx
  lock_init(&lock);
 54b:	8d 75 f0             	lea    -0x10(%ebp),%esi
 54e:	89 34 24             	mov    %esi,(%esp)
 551:	e8 90 ff ff ff       	call   4e6 <lock_init>
  lock_acquire(&lock);
 556:	89 34 24             	mov    %esi,(%esp)
 559:	e8 67 ff ff ff       	call   4c5 <lock_acquire>
  free(stack);
 55e:	83 c4 04             	add    $0x4,%esp
 561:	ff 75 f4             	push   -0xc(%ebp)
 564:	e8 d4 02 00 00       	call   83d <free>
  lock_release(&lock);
 569:	89 34 24             	mov    %esi,(%esp)
 56c:	e8 67 ff ff ff       	call   4d8 <lock_release>
}
 571:	89 d8                	mov    %ebx,%eax
 573:	8d 65 f8             	lea    -0x8(%ebp),%esp
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    

0000057a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57a:	b8 01 00 00 00       	mov    $0x1,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <exit>:
SYSCALL(exit)
 582:	b8 02 00 00 00       	mov    $0x2,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <wait>:
SYSCALL(wait)
 58a:	b8 03 00 00 00       	mov    $0x3,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <pipe>:
SYSCALL(pipe)
 592:	b8 04 00 00 00       	mov    $0x4,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <read>:
SYSCALL(read)
 59a:	b8 05 00 00 00       	mov    $0x5,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <write>:
SYSCALL(write)
 5a2:	b8 10 00 00 00       	mov    $0x10,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <close>:
SYSCALL(close)
 5aa:	b8 15 00 00 00       	mov    $0x15,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <kill>:
SYSCALL(kill)
 5b2:	b8 06 00 00 00       	mov    $0x6,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <exec>:
SYSCALL(exec)
 5ba:	b8 07 00 00 00       	mov    $0x7,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <open>:
SYSCALL(open)
 5c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <mknod>:
SYSCALL(mknod)
 5ca:	b8 11 00 00 00       	mov    $0x11,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <unlink>:
SYSCALL(unlink)
 5d2:	b8 12 00 00 00       	mov    $0x12,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <fstat>:
SYSCALL(fstat)
 5da:	b8 08 00 00 00       	mov    $0x8,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <link>:
SYSCALL(link)
 5e2:	b8 13 00 00 00       	mov    $0x13,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <mkdir>:
SYSCALL(mkdir)
 5ea:	b8 14 00 00 00       	mov    $0x14,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <chdir>:
SYSCALL(chdir)
 5f2:	b8 09 00 00 00       	mov    $0x9,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <dup>:
SYSCALL(dup)
 5fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <getpid>:
SYSCALL(getpid)
 602:	b8 0b 00 00 00       	mov    $0xb,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <sbrk>:
SYSCALL(sbrk)
 60a:	b8 0c 00 00 00       	mov    $0xc,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <sleep>:
SYSCALL(sleep)
 612:	b8 0d 00 00 00       	mov    $0xd,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <uptime>:
SYSCALL(uptime)
 61a:	b8 0e 00 00 00       	mov    $0xe,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <clone>:
SYSCALL(clone)
 622:	b8 16 00 00 00       	mov    $0x16,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <join>:
 62a:	b8 17 00 00 00       	mov    $0x17,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	83 ec 1c             	sub    $0x1c,%esp
 638:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 63b:	6a 01                	push   $0x1
 63d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 640:	52                   	push   %edx
 641:	50                   	push   %eax
 642:	e8 5b ff ff ff       	call   5a2 <write>
}
 647:	83 c4 10             	add    $0x10,%esp
 64a:	c9                   	leave  
 64b:	c3                   	ret    

0000064c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 64c:	55                   	push   %ebp
 64d:	89 e5                	mov    %esp,%ebp
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	53                   	push   %ebx
 652:	83 ec 2c             	sub    $0x2c,%esp
 655:	89 45 d0             	mov    %eax,-0x30(%ebp)
 658:	89 d0                	mov    %edx,%eax
 65a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 65c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 660:	0f 95 c1             	setne  %cl
 663:	c1 ea 1f             	shr    $0x1f,%edx
 666:	84 d1                	test   %dl,%cl
 668:	74 44                	je     6ae <printint+0x62>
    neg = 1;
    x = -xx;
 66a:	f7 d8                	neg    %eax
 66c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 66e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 675:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 67a:	89 c8                	mov    %ecx,%eax
 67c:	ba 00 00 00 00       	mov    $0x0,%edx
 681:	f7 f6                	div    %esi
 683:	89 df                	mov    %ebx,%edi
 685:	83 c3 01             	add    $0x1,%ebx
 688:	0f b6 92 6c 0a 00 00 	movzbl 0xa6c(%edx),%edx
 68f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 693:	89 ca                	mov    %ecx,%edx
 695:	89 c1                	mov    %eax,%ecx
 697:	39 d6                	cmp    %edx,%esi
 699:	76 df                	jbe    67a <printint+0x2e>
  if(neg)
 69b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 69f:	74 31                	je     6d2 <printint+0x86>
    buf[i++] = '-';
 6a1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6a6:	8d 5f 02             	lea    0x2(%edi),%ebx
 6a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ac:	eb 17                	jmp    6c5 <printint+0x79>
    x = xx;
 6ae:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6b7:	eb bc                	jmp    675 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6b9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6be:	89 f0                	mov    %esi,%eax
 6c0:	e8 6d ff ff ff       	call   632 <putc>
  while(--i >= 0)
 6c5:	83 eb 01             	sub    $0x1,%ebx
 6c8:	79 ef                	jns    6b9 <printint+0x6d>
}
 6ca:	83 c4 2c             	add    $0x2c,%esp
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
 6d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6d5:	eb ee                	jmp    6c5 <printint+0x79>

000006d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d7:	55                   	push   %ebp
 6d8:	89 e5                	mov    %esp,%ebp
 6da:	57                   	push   %edi
 6db:	56                   	push   %esi
 6dc:	53                   	push   %ebx
 6dd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e0:	8d 45 10             	lea    0x10(%ebp),%eax
 6e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f0:	eb 14                	jmp    706 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6f2:	89 fa                	mov    %edi,%edx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 36 ff ff ff       	call   632 <putc>
 6fc:	eb 05                	jmp    703 <printf+0x2c>
      }
    } else if(state == '%'){
 6fe:	83 fe 25             	cmp    $0x25,%esi
 701:	74 25                	je     728 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 703:	83 c3 01             	add    $0x1,%ebx
 706:	8b 45 0c             	mov    0xc(%ebp),%eax
 709:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 70d:	84 c0                	test   %al,%al
 70f:	0f 84 20 01 00 00    	je     835 <printf+0x15e>
    c = fmt[i] & 0xff;
 715:	0f be f8             	movsbl %al,%edi
 718:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 71b:	85 f6                	test   %esi,%esi
 71d:	75 df                	jne    6fe <printf+0x27>
      if(c == '%'){
 71f:	83 f8 25             	cmp    $0x25,%eax
 722:	75 ce                	jne    6f2 <printf+0x1b>
        state = '%';
 724:	89 c6                	mov    %eax,%esi
 726:	eb db                	jmp    703 <printf+0x2c>
      if(c == 'd'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	0f 84 cf 00 00 00    	je     800 <printf+0x129>
 731:	0f 8c dd 00 00 00    	jl     814 <printf+0x13d>
 737:	83 f8 78             	cmp    $0x78,%eax
 73a:	0f 8f d4 00 00 00    	jg     814 <printf+0x13d>
 740:	83 f8 63             	cmp    $0x63,%eax
 743:	0f 8c cb 00 00 00    	jl     814 <printf+0x13d>
 749:	83 e8 63             	sub    $0x63,%eax
 74c:	83 f8 15             	cmp    $0x15,%eax
 74f:	0f 87 bf 00 00 00    	ja     814 <printf+0x13d>
 755:	ff 24 85 14 0a 00 00 	jmp    *0xa14(,%eax,4)
        printint(fd, *ap, 10, 1);
 75c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75f:	8b 17                	mov    (%edi),%edx
 761:	83 ec 0c             	sub    $0xc,%esp
 764:	6a 01                	push   $0x1
 766:	b9 0a 00 00 00       	mov    $0xa,%ecx
 76b:	8b 45 08             	mov    0x8(%ebp),%eax
 76e:	e8 d9 fe ff ff       	call   64c <printint>
        ap++;
 773:	83 c7 04             	add    $0x4,%edi
 776:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 779:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 77c:	be 00 00 00 00       	mov    $0x0,%esi
 781:	eb 80                	jmp    703 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 783:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 786:	8b 17                	mov    (%edi),%edx
 788:	83 ec 0c             	sub    $0xc,%esp
 78b:	6a 00                	push   $0x0
 78d:	b9 10 00 00 00       	mov    $0x10,%ecx
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	e8 b2 fe ff ff       	call   64c <printint>
        ap++;
 79a:	83 c7 04             	add    $0x4,%edi
 79d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a3:	be 00 00 00 00       	mov    $0x0,%esi
 7a8:	e9 56 ff ff ff       	jmp    703 <printf+0x2c>
        s = (char*)*ap;
 7ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b0:	8b 30                	mov    (%eax),%esi
        ap++;
 7b2:	83 c0 04             	add    $0x4,%eax
 7b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7b8:	85 f6                	test   %esi,%esi
 7ba:	75 15                	jne    7d1 <printf+0xfa>
          s = "(null)";
 7bc:	be 0a 0a 00 00       	mov    $0xa0a,%esi
 7c1:	eb 0e                	jmp    7d1 <printf+0xfa>
          putc(fd, *s);
 7c3:	0f be d2             	movsbl %dl,%edx
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	e8 64 fe ff ff       	call   632 <putc>
          s++;
 7ce:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7d1:	0f b6 16             	movzbl (%esi),%edx
 7d4:	84 d2                	test   %dl,%dl
 7d6:	75 eb                	jne    7c3 <printf+0xec>
      state = 0;
 7d8:	be 00 00 00 00       	mov    $0x0,%esi
 7dd:	e9 21 ff ff ff       	jmp    703 <printf+0x2c>
        putc(fd, *ap);
 7e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e5:	0f be 17             	movsbl (%edi),%edx
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	e8 42 fe ff ff       	call   632 <putc>
        ap++;
 7f0:	83 c7 04             	add    $0x4,%edi
 7f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7f6:	be 00 00 00 00       	mov    $0x0,%esi
 7fb:	e9 03 ff ff ff       	jmp    703 <printf+0x2c>
        putc(fd, c);
 800:	89 fa                	mov    %edi,%edx
 802:	8b 45 08             	mov    0x8(%ebp),%eax
 805:	e8 28 fe ff ff       	call   632 <putc>
      state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
 80f:	e9 ef fe ff ff       	jmp    703 <printf+0x2c>
        putc(fd, '%');
 814:	ba 25 00 00 00       	mov    $0x25,%edx
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	e8 11 fe ff ff       	call   632 <putc>
        putc(fd, c);
 821:	89 fa                	mov    %edi,%edx
 823:	8b 45 08             	mov    0x8(%ebp),%eax
 826:	e8 07 fe ff ff       	call   632 <putc>
      state = 0;
 82b:	be 00 00 00 00       	mov    $0x0,%esi
 830:	e9 ce fe ff ff       	jmp    703 <printf+0x2c>
    }
  }
}
 835:	8d 65 f4             	lea    -0xc(%ebp),%esp
 838:	5b                   	pop    %ebx
 839:	5e                   	pop    %esi
 83a:	5f                   	pop    %edi
 83b:	5d                   	pop    %ebp
 83c:	c3                   	ret    

0000083d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 83d:	55                   	push   %ebp
 83e:	89 e5                	mov    %esp,%ebp
 840:	57                   	push   %edi
 841:	56                   	push   %esi
 842:	53                   	push   %ebx
 843:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 846:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 849:	a1 10 0e 00 00       	mov    0xe10,%eax
 84e:	eb 02                	jmp    852 <free+0x15>
 850:	89 d0                	mov    %edx,%eax
 852:	39 c8                	cmp    %ecx,%eax
 854:	73 04                	jae    85a <free+0x1d>
 856:	39 08                	cmp    %ecx,(%eax)
 858:	77 12                	ja     86c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 85a:	8b 10                	mov    (%eax),%edx
 85c:	39 c2                	cmp    %eax,%edx
 85e:	77 f0                	ja     850 <free+0x13>
 860:	39 c8                	cmp    %ecx,%eax
 862:	72 08                	jb     86c <free+0x2f>
 864:	39 ca                	cmp    %ecx,%edx
 866:	77 04                	ja     86c <free+0x2f>
 868:	89 d0                	mov    %edx,%eax
 86a:	eb e6                	jmp    852 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 86c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 872:	8b 10                	mov    (%eax),%edx
 874:	39 d7                	cmp    %edx,%edi
 876:	74 19                	je     891 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 878:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87b:	8b 50 04             	mov    0x4(%eax),%edx
 87e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 881:	39 ce                	cmp    %ecx,%esi
 883:	74 1b                	je     8a0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 885:	89 08                	mov    %ecx,(%eax)
  freep = p;
 887:	a3 10 0e 00 00       	mov    %eax,0xe10
}
 88c:	5b                   	pop    %ebx
 88d:	5e                   	pop    %esi
 88e:	5f                   	pop    %edi
 88f:	5d                   	pop    %ebp
 890:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 891:	03 72 04             	add    0x4(%edx),%esi
 894:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 897:	8b 10                	mov    (%eax),%edx
 899:	8b 12                	mov    (%edx),%edx
 89b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 89e:	eb db                	jmp    87b <free+0x3e>
    p->s.size += bp->s.size;
 8a0:	03 53 fc             	add    -0x4(%ebx),%edx
 8a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a9:	89 10                	mov    %edx,(%eax)
 8ab:	eb da                	jmp    887 <free+0x4a>

000008ad <morecore>:

static Header*
morecore(uint nu)
{
 8ad:	55                   	push   %ebp
 8ae:	89 e5                	mov    %esp,%ebp
 8b0:	53                   	push   %ebx
 8b1:	83 ec 04             	sub    $0x4,%esp
 8b4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8b6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8bb:	77 05                	ja     8c2 <morecore+0x15>
    nu = 4096;
 8bd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8c2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8c9:	83 ec 0c             	sub    $0xc,%esp
 8cc:	50                   	push   %eax
 8cd:	e8 38 fd ff ff       	call   60a <sbrk>
  if(p == (char*)-1)
 8d2:	83 c4 10             	add    $0x10,%esp
 8d5:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d8:	74 1c                	je     8f6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8da:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8dd:	83 c0 08             	add    $0x8,%eax
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	50                   	push   %eax
 8e4:	e8 54 ff ff ff       	call   83d <free>
  return freep;
 8e9:	a1 10 0e 00 00       	mov    0xe10,%eax
 8ee:	83 c4 10             	add    $0x10,%esp
}
 8f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f4:	c9                   	leave  
 8f5:	c3                   	ret    
    return 0;
 8f6:	b8 00 00 00 00       	mov    $0x0,%eax
 8fb:	eb f4                	jmp    8f1 <morecore+0x44>

000008fd <malloc>:

void*
malloc(uint nbytes)
{
 8fd:	55                   	push   %ebp
 8fe:	89 e5                	mov    %esp,%ebp
 900:	53                   	push   %ebx
 901:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 904:	8b 45 08             	mov    0x8(%ebp),%eax
 907:	8d 58 07             	lea    0x7(%eax),%ebx
 90a:	c1 eb 03             	shr    $0x3,%ebx
 90d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 910:	8b 0d 10 0e 00 00    	mov    0xe10,%ecx
 916:	85 c9                	test   %ecx,%ecx
 918:	74 04                	je     91e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91a:	8b 01                	mov    (%ecx),%eax
 91c:	eb 4a                	jmp    968 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 91e:	c7 05 10 0e 00 00 14 	movl   $0xe14,0xe10
 925:	0e 00 00 
 928:	c7 05 14 0e 00 00 14 	movl   $0xe14,0xe14
 92f:	0e 00 00 
    base.s.size = 0;
 932:	c7 05 18 0e 00 00 00 	movl   $0x0,0xe18
 939:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 93c:	b9 14 0e 00 00       	mov    $0xe14,%ecx
 941:	eb d7                	jmp    91a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 943:	74 19                	je     95e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 945:	29 da                	sub    %ebx,%edx
 947:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 94d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 950:	89 0d 10 0e 00 00    	mov    %ecx,0xe10
      return (void*)(p + 1);
 956:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 959:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95c:	c9                   	leave  
 95d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 95e:	8b 10                	mov    (%eax),%edx
 960:	89 11                	mov    %edx,(%ecx)
 962:	eb ec                	jmp    950 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 964:	89 c1                	mov    %eax,%ecx
 966:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 968:	8b 50 04             	mov    0x4(%eax),%edx
 96b:	39 da                	cmp    %ebx,%edx
 96d:	73 d4                	jae    943 <malloc+0x46>
    if(p == freep)
 96f:	39 05 10 0e 00 00    	cmp    %eax,0xe10
 975:	75 ed                	jne    964 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 977:	89 d8                	mov    %ebx,%eax
 979:	e8 2f ff ff ff       	call   8ad <morecore>
 97e:	85 c0                	test   %eax,%eax
 980:	75 e2                	jne    964 <malloc+0x67>
 982:	eb d5                	jmp    959 <malloc+0x5c>
