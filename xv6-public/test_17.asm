
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
  12:	e8 3f 06 00 00       	call   656 <getpid>
   4. Merge function
   */


    int size = 11;
    global = (int*)malloc(size * sizeof(int));
  17:	83 ec 0c             	sub    $0xc,%esp
    int size = 11;
  1a:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  21:	6a 2c                	push   $0x2c
   ppid = getpid();
  23:	a3 f0 0e 00 00       	mov    %eax,0xef0
    global = (int*)malloc(size * sizeof(int));
  28:	e8 43 09 00 00       	call   970 <malloc>
    for(int i = 0; i < size; i++){
  2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30:	83 c4 10             	add    $0x10,%esp
    global = (int*)malloc(size * sizeof(int));
  33:	a3 ec 0e 00 00       	mov    %eax,0xeec
    for(int i = 0; i < size; i++){
  38:	85 d2                	test   %edx,%edx
  3a:	7e 1b                	jle    57 <main+0x57>
  3c:	31 c9                	xor    %ecx,%ecx
  3e:	eb 05                	jmp    45 <main+0x45>
        global[i] = size - i - 1;
    }

   int thread_pid = thread_create(merge_sort, global, &size);
  40:	a1 ec 0e 00 00       	mov    0xeec,%eax
        global[i] = size - i - 1;
  45:	29 ca                	sub    %ecx,%edx
  47:	83 ea 01             	sub    $0x1,%edx
  4a:	89 14 88             	mov    %edx,(%eax,%ecx,4)
    for(int i = 0; i < size; i++){
  4d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  50:	83 c1 01             	add    $0x1,%ecx
  53:	39 ca                	cmp    %ecx,%edx
  55:	7f e9                	jg     40 <main+0x40>
   int thread_pid = thread_create(merge_sort, global, &size);
  57:	83 ec 04             	sub    $0x4,%esp
  5a:	8d 45 f4             	lea    -0xc(%ebp),%eax
  5d:	50                   	push   %eax
  5e:	ff 35 ec 0e 00 00    	push   0xeec
  64:	68 50 02 00 00       	push   $0x250
  69:	e8 c2 04 00 00       	call   530 <thread_create>
   assert(thread_pid > 0);
  6e:	83 c4 10             	add    $0x10,%esp
   int thread_pid = thread_create(merge_sort, global, &size);
  71:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  73:	85 c0                	test   %eax,%eax
  75:	0f 8e 84 00 00 00    	jle    ff <main+0xff>

   int join_pid = thread_join();
  7b:	e8 e0 04 00 00       	call   560 <thread_join>
   assert(join_pid == thread_pid);
  80:	39 c3                	cmp    %eax,%ebx
  82:	75 35                	jne    b9 <main+0xb9>
   assert(global[0] == 0);
  84:	a1 ec 0e 00 00       	mov    0xeec,%eax
  89:	83 38 00             	cmpl   $0x0,(%eax)
  8c:	0f 85 9d 00 00 00    	jne    12f <main+0x12f>
   assert(global[10] == 10); 
  92:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  96:	0f 84 80 00 00 00    	je     11c <main+0x11c>
  9c:	6a 35                	push   $0x35
  9e:	68 68 0a 00 00       	push   $0xa68
  a3:	68 72 0a 00 00       	push   $0xa72
  a8:	6a 01                	push   $0x1
  aa:	e8 91 06 00 00       	call   740 <printf>
  af:	83 c4 0c             	add    $0xc,%esp
  b2:	68 d0 0a 00 00       	push   $0xad0
  b7:	eb 1b                	jmp    d4 <main+0xd4>
   assert(join_pid == thread_pid);
  b9:	6a 33                	push   $0x33
  bb:	68 68 0a 00 00       	push   $0xa68
  c0:	68 72 0a 00 00       	push   $0xa72
  c5:	6a 01                	push   $0x1
  c7:	e8 74 06 00 00       	call   740 <printf>
  cc:	83 c4 0c             	add    $0xc,%esp
  cf:	68 aa 0a 00 00       	push   $0xaaa
  d4:	68 89 0a 00 00       	push   $0xa89
  d9:	6a 01                	push   $0x1
  db:	e8 60 06 00 00       	call   740 <printf>
  e0:	5a                   	pop    %edx
  e1:	59                   	pop    %ecx
  e2:	68 9d 0a 00 00       	push   $0xa9d
  e7:	6a 01                	push   $0x1
  e9:	e8 52 06 00 00       	call   740 <printf>
  ee:	5b                   	pop    %ebx
  ef:	ff 35 f0 0e 00 00    	push   0xef0
  f5:	e8 0c 05 00 00       	call   606 <kill>
  fa:	e8 d7 04 00 00       	call   5d6 <exit>
   assert(thread_pid > 0);
  ff:	6a 30                	push   $0x30
 101:	68 68 0a 00 00       	push   $0xa68
 106:	68 72 0a 00 00       	push   $0xa72
 10b:	6a 01                	push   $0x1
 10d:	e8 2e 06 00 00       	call   740 <printf>
 112:	83 c4 0c             	add    $0xc,%esp
 115:	68 7a 0a 00 00       	push   $0xa7a
 11a:	eb b8                	jmp    d4 <main+0xd4>

   printf(1, "TEST PASSED\n");
 11c:	50                   	push   %eax
 11d:	50                   	push   %eax
 11e:	68 e1 0a 00 00       	push   $0xae1
 123:	6a 01                	push   $0x1
 125:	e8 16 06 00 00       	call   740 <printf>
   exit();
 12a:	e8 a7 04 00 00       	call   5d6 <exit>
   assert(global[0] == 0);
 12f:	6a 34                	push   $0x34
 131:	68 68 0a 00 00       	push   $0xa68
 136:	68 72 0a 00 00       	push   $0xa72
 13b:	6a 01                	push   $0x1
 13d:	e8 fe 05 00 00       	call   740 <printf>
 142:	83 c4 0c             	add    $0xc,%esp
 145:	68 c1 0a 00 00       	push   $0xac1
 14a:	eb 88                	jmp    d4 <main+0xd4>
 14c:	66 90                	xchg   %ax,%ax
 14e:	66 90                	xchg   %ax,%ax

00000150 <merge>:
}

void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 150:	55                   	push   %ebp
    int i = 0;
    int j = 0;
    int k = 0;
 151:	31 d2                	xor    %edx,%edx
    int i = 0;
 153:	31 c9                	xor    %ecx,%ecx
void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 155:	89 e5                	mov    %esp,%ebp
 157:	57                   	push   %edi
 158:	56                   	push   %esi
 159:	53                   	push   %ebx
    int j = 0;
 15a:	31 db                	xor    %ebx,%ebx
void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 15c:	83 ec 0c             	sub    $0xc,%esp
 15f:	8b 7d 10             	mov    0x10(%ebp),%edi
    while(i < size_left && j < size_right){
 162:	85 ff                	test   %edi,%edi
 164:	7e 41                	jle    1a7 <merge+0x57>
 166:	8b 45 14             	mov    0x14(%ebp),%eax
 169:	85 c0                	test   %eax,%eax
 16b:	7f 18                	jg     185 <merge+0x35>
 16d:	eb 38                	jmp    1a7 <merge+0x57>
 16f:	90                   	nop
        if(array[i] < array_right[j]){
            temp_array[k] = array[i];
 170:	8b 75 18             	mov    0x18(%ebp),%esi
            i++;
 173:	83 c1 01             	add    $0x1,%ecx
            temp_array[k] = array[i];
 176:	89 04 96             	mov    %eax,(%esi,%edx,4)
        }
        else{
            temp_array[k] = array_right[j];
            j++;
        }
        k++;
 179:	83 c2 01             	add    $0x1,%edx
    while(i < size_left && j < size_right){
 17c:	39 f9                	cmp    %edi,%ecx
 17e:	7d 27                	jge    1a7 <merge+0x57>
 180:	3b 5d 14             	cmp    0x14(%ebp),%ebx
 183:	7d 22                	jge    1a7 <merge+0x57>
        if(array[i] < array_right[j]){
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	8b 75 0c             	mov    0xc(%ebp),%esi
 18b:	8b 04 88             	mov    (%eax,%ecx,4),%eax
 18e:	8b 34 9e             	mov    (%esi,%ebx,4),%esi
 191:	39 f0                	cmp    %esi,%eax
 193:	7c db                	jl     170 <merge+0x20>
            j++;
 195:	89 f0                	mov    %esi,%eax
            temp_array[k] = array[i];
 197:	8b 75 18             	mov    0x18(%ebp),%esi
            j++;
 19a:	83 c3 01             	add    $0x1,%ebx
            temp_array[k] = array[i];
 19d:	89 04 96             	mov    %eax,(%esi,%edx,4)
        k++;
 1a0:	83 c2 01             	add    $0x1,%edx
    while(i < size_left && j < size_right){
 1a3:	39 f9                	cmp    %edi,%ecx
 1a5:	7c d9                	jl     180 <merge+0x30>
    }
    while(i < size_left){
 1a7:	39 cf                	cmp    %ecx,%edi
 1a9:	7e 3e                	jle    1e9 <merge+0x99>
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
 1ae:	8b 75 18             	mov    0x18(%ebp),%esi
 1b1:	89 55 e8             	mov    %edx,-0x18(%ebp)
 1b4:	8d 04 88             	lea    (%eax,%ecx,4),%eax
 1b7:	8d 34 96             	lea    (%esi,%edx,4),%esi
 1ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
 1c0:	8d 04 b8             	lea    (%eax,%edi,4),%eax
 1c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 1c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1c9:	89 4d f0             	mov    %ecx,-0x10(%ebp)
 1cc:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 1cf:	90                   	nop
        temp_array[k] = array[i];
 1d0:	8b 10                	mov    (%eax),%edx
    while(i < size_left){
 1d2:	83 c0 04             	add    $0x4,%eax
 1d5:	83 c6 04             	add    $0x4,%esi
        temp_array[k] = array[i];
 1d8:	89 56 fc             	mov    %edx,-0x4(%esi)
    while(i < size_left){
 1db:	39 c8                	cmp    %ecx,%eax
 1dd:	75 f1                	jne    1d0 <merge+0x80>
        i++;
        k++;
 1df:	8b 55 e8             	mov    -0x18(%ebp),%edx
 1e2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 1e5:	01 fa                	add    %edi,%edx
 1e7:	29 ca                	sub    %ecx,%edx
    }
    while(j < size_right){
 1e9:	39 5d 14             	cmp    %ebx,0x14(%ebp)
 1ec:	7e 29                	jle    217 <merge+0xc7>
 1ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f1:	8b 4d 14             	mov    0x14(%ebp),%ecx
 1f4:	8d 04 98             	lea    (%eax,%ebx,4),%eax
 1f7:	8b 5d 18             	mov    0x18(%ebp),%ebx
 1fa:	8d 14 93             	lea    (%ebx,%edx,4),%edx
 1fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 200:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
        temp_array[k] = array_right[j];
 208:	8b 18                	mov    (%eax),%ebx
    while(j < size_right){
 20a:	83 c0 04             	add    $0x4,%eax
 20d:	83 c2 04             	add    $0x4,%edx
        temp_array[k] = array_right[j];
 210:	89 5a fc             	mov    %ebx,-0x4(%edx)
    while(j < size_right){
 213:	39 c1                	cmp    %eax,%ecx
 215:	75 f1                	jne    208 <merge+0xb8>
        j++;
        k++;
    }
    for(int i = 0; i < size_left + size_right; i++){
 217:	03 7d 14             	add    0x14(%ebp),%edi
 21a:	85 ff                	test   %edi,%edi
 21c:	7e 21                	jle    23f <merge+0xef>
 21e:	8b 45 18             	mov    0x18(%ebp),%eax
 221:	8b 55 08             	mov    0x8(%ebp),%edx
 224:	8d 1c b8             	lea    (%eax,%edi,4),%ebx
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax
        array[i] = temp_array[i];
 230:	8b 08                	mov    (%eax),%ecx
    for(int i = 0; i < size_left + size_right; i++){
 232:	83 c0 04             	add    $0x4,%eax
 235:	83 c2 04             	add    $0x4,%edx
        array[i] = temp_array[i];
 238:	89 4a fc             	mov    %ecx,-0x4(%edx)
    for(int i = 0; i < size_left + size_right; i++){
 23b:	39 d8                	cmp    %ebx,%eax
 23d:	75 f1                	jne    230 <merge+0xe0>
    }
   
}
 23f:	83 c4 0c             	add    $0xc,%esp
 242:	5b                   	pop    %ebx
 243:	5e                   	pop    %esi
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <merge_sort>:

void merge_sort(void *arg1, void *arg2) {
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	53                   	push   %ebx
 256:	83 ec 1c             	sub    $0x1c,%esp
   int *array = (int*)arg1;
   int size = *(int*)arg2;
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
void merge_sort(void *arg1, void *arg2) {
 25c:	8b 75 08             	mov    0x8(%ebp),%esi
   int size = *(int*)arg2;
 25f:	8b 18                	mov    (%eax),%ebx

   if (size==1){
 261:	83 fb 01             	cmp    $0x1,%ebx
 264:	74 6e                	je     2d4 <merge_sort+0x84>
       exit();
   }

   
   int size_left = size/2;
 266:	89 d8                	mov    %ebx,%eax
 268:	b9 02 00 00 00       	mov    $0x2,%ecx
 26d:	99                   	cltd   
 26e:	f7 f9                	idiv   %ecx
   int size_right = size-size/2;
 270:	89 da                	mov    %ebx,%edx
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 272:	c1 e3 02             	shl    $0x2,%ebx
   int size_right = size-size/2;
 275:	29 c2                	sub    %eax,%edx
   int* array_right = (int*)(array + size_left);
 277:	8d 3c 86             	lea    (%esi,%eax,4),%edi
   int size_left = size/2;
 27a:	89 45 e0             	mov    %eax,-0x20(%ebp)
   thread_create(merge_sort, array, &size_left);
 27d:	50                   	push   %eax
 27e:	8d 45 e0             	lea    -0x20(%ebp),%eax
 281:	50                   	push   %eax
 282:	56                   	push   %esi
 283:	68 50 02 00 00       	push   $0x250
   int size_right = size-size/2;
 288:	89 55 e4             	mov    %edx,-0x1c(%ebp)
   thread_create(merge_sort, array, &size_left);
 28b:	e8 a0 02 00 00       	call   530 <thread_create>
   thread_create(merge_sort, array_right, &size_right);
 290:	83 c4 0c             	add    $0xc,%esp
 293:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 296:	50                   	push   %eax
 297:	57                   	push   %edi
 298:	68 50 02 00 00       	push   $0x250
 29d:	e8 8e 02 00 00       	call   530 <thread_create>
   thread_join();
 2a2:	e8 b9 02 00 00       	call   560 <thread_join>
   thread_join();
 2a7:	e8 b4 02 00 00       	call   560 <thread_join>
   int* temp_array = malloc(size*sizeof(int));
 2ac:	89 1c 24             	mov    %ebx,(%esp)
 2af:	e8 bc 06 00 00       	call   970 <malloc>

   merge(array,array_right,size_left,size_right,temp_array);
 2b4:	89 04 24             	mov    %eax,(%esp)
   int* temp_array = malloc(size*sizeof(int));
 2b7:	89 c3                	mov    %eax,%ebx
   merge(array,array_right,size_left,size_right,temp_array);
 2b9:	ff 75 e4             	push   -0x1c(%ebp)
 2bc:	ff 75 e0             	push   -0x20(%ebp)
 2bf:	57                   	push   %edi
 2c0:	56                   	push   %esi
 2c1:	e8 8a fe ff ff       	call   150 <merge>

   free(temp_array);
 2c6:	83 c4 14             	add    $0x14,%esp
 2c9:	53                   	push   %ebx
 2ca:	e8 11 06 00 00       	call   8e0 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 2cf:	e8 02 03 00 00       	call   5d6 <exit>
       exit();
 2d4:	e8 fd 02 00 00       	call   5d6 <exit>
 2d9:	66 90                	xchg   %ax,%ax
 2db:	66 90                	xchg   %ax,%ax
 2dd:	66 90                	xchg   %ax,%ax
 2df:	90                   	nop

000002e0 <strcpy>:
#include "x86.h"


char *
strcpy(char *s, const char *t)
{
 2e0:	55                   	push   %ebp
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
 2e1:	31 c0                	xor    %eax,%eax
{
 2e3:	89 e5                	mov    %esp,%ebp
 2e5:	53                   	push   %ebx
 2e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0)
 2f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2f7:	83 c0 01             	add    $0x1,%eax
 2fa:	84 d2                	test   %dl,%dl
 2fc:	75 f2                	jne    2f0 <strcpy+0x10>
    ;
  return os;
}
 2fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 301:	89 c8                	mov    %ecx,%eax
 303:	c9                   	leave  
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <strcmp>:

int strcmp(const char *p, const char *q)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 55 08             	mov    0x8(%ebp),%edx
 317:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 31a:	0f b6 02             	movzbl (%edx),%eax
 31d:	84 c0                	test   %al,%al
 31f:	75 17                	jne    338 <strcmp+0x28>
 321:	eb 3a                	jmp    35d <strcmp+0x4d>
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
 328:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 32c:	83 c2 01             	add    $0x1,%edx
 32f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 332:	84 c0                	test   %al,%al
 334:	74 1a                	je     350 <strcmp+0x40>
    p++, q++;
 336:	89 d9                	mov    %ebx,%ecx
  while (*p && *p == *q)
 338:	0f b6 19             	movzbl (%ecx),%ebx
 33b:	38 c3                	cmp    %al,%bl
 33d:	74 e9                	je     328 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 33f:	29 d8                	sub    %ebx,%eax
}
 341:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 344:	c9                   	leave  
 345:	c3                   	ret    
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 350:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 354:	31 c0                	xor    %eax,%eax
 356:	29 d8                	sub    %ebx,%eax
}
 358:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35b:	c9                   	leave  
 35c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 35d:	0f b6 19             	movzbl (%ecx),%ebx
 360:	31 c0                	xor    %eax,%eax
 362:	eb db                	jmp    33f <strcmp+0x2f>
 364:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <strlen>:

uint strlen(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for (n = 0; s[n]; n++)
 376:	80 3a 00             	cmpb   $0x0,(%edx)
 379:	74 15                	je     390 <strlen+0x20>
 37b:	31 c0                	xor    %eax,%eax
 37d:	8d 76 00             	lea    0x0(%esi),%esi
 380:	83 c0 01             	add    $0x1,%eax
 383:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 387:	89 c1                	mov    %eax,%ecx
 389:	75 f5                	jne    380 <strlen+0x10>
    ;
  return n;
}
 38b:	89 c8                	mov    %ecx,%eax
 38d:	5d                   	pop    %ebp
 38e:	c3                   	ret    
 38f:	90                   	nop
  for (n = 0; s[n]; n++)
 390:	31 c9                	xor    %ecx,%ecx
}
 392:	5d                   	pop    %ebp
 393:	89 c8                	mov    %ecx,%eax
 395:	c3                   	ret    
 396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi

000003a0 <memset>:

void *
memset(void *dst, int c, uint n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	89 d7                	mov    %edx,%edi
 3af:	fc                   	cld    
 3b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3b5:	89 d0                	mov    %edx,%eax
 3b7:	c9                   	leave  
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strchr>:

char *
strchr(const char *s, char c)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for (; *s; s++)
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	84 d2                	test   %dl,%dl
 3cf:	75 12                	jne    3e3 <strchr+0x23>
 3d1:	eb 1d                	jmp    3f0 <strchr+0x30>
 3d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d7:	90                   	nop
 3d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3dc:	83 c0 01             	add    $0x1,%eax
 3df:	84 d2                	test   %dl,%dl
 3e1:	74 0d                	je     3f0 <strchr+0x30>
    if (*s == c)
 3e3:	38 d1                	cmp    %dl,%cl
 3e5:	75 f1                	jne    3d8 <strchr+0x18>
      return (char *)s;
  return 0;
}
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3f0:	31 c0                	xor    %eax,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <gets>:

char *
gets(char *buf, int max)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
 405:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 408:	53                   	push   %ebx
  for (i = 0; i + 1 < max;)
 409:	31 db                	xor    %ebx,%ebx
{
 40b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i + 1 < max;)
 40e:	eb 27                	jmp    437 <gets+0x37>
    cc = read(0, &c, 1);
 410:	83 ec 04             	sub    $0x4,%esp
 413:	6a 01                	push   $0x1
 415:	57                   	push   %edi
 416:	6a 00                	push   $0x0
 418:	e8 d1 01 00 00       	call   5ee <read>
    if (cc < 1)
 41d:	83 c4 10             	add    $0x10,%esp
 420:	85 c0                	test   %eax,%eax
 422:	7e 1d                	jle    441 <gets+0x41>
      break;
    buf[i++] = c;
 424:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 428:	8b 55 08             	mov    0x8(%ebp),%edx
 42b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r')
 42f:	3c 0a                	cmp    $0xa,%al
 431:	74 1d                	je     450 <gets+0x50>
 433:	3c 0d                	cmp    $0xd,%al
 435:	74 19                	je     450 <gets+0x50>
  for (i = 0; i + 1 < max;)
 437:	89 de                	mov    %ebx,%esi
 439:	83 c3 01             	add    $0x1,%ebx
 43c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 43f:	7c cf                	jl     410 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 441:	8b 45 08             	mov    0x8(%ebp),%eax
 444:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 448:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44b:	5b                   	pop    %ebx
 44c:	5e                   	pop    %esi
 44d:	5f                   	pop    %edi
 44e:	5d                   	pop    %ebp
 44f:	c3                   	ret    
  buf[i] = '\0';
 450:	8b 45 08             	mov    0x8(%ebp),%eax
 453:	89 de                	mov    %ebx,%esi
 455:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 459:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45c:	5b                   	pop    %ebx
 45d:	5e                   	pop    %esi
 45e:	5f                   	pop    %edi
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <stat>:

int stat(const char *n, struct stat *st)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	56                   	push   %esi
 474:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 475:	83 ec 08             	sub    $0x8,%esp
 478:	6a 00                	push   $0x0
 47a:	ff 75 08             	push   0x8(%ebp)
 47d:	e8 94 01 00 00       	call   616 <open>
  if (fd < 0)
 482:	83 c4 10             	add    $0x10,%esp
 485:	85 c0                	test   %eax,%eax
 487:	78 27                	js     4b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 489:	83 ec 08             	sub    $0x8,%esp
 48c:	ff 75 0c             	push   0xc(%ebp)
 48f:	89 c3                	mov    %eax,%ebx
 491:	50                   	push   %eax
 492:	e8 97 01 00 00       	call   62e <fstat>
  close(fd);
 497:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 49a:	89 c6                	mov    %eax,%esi
  close(fd);
 49c:	e8 5d 01 00 00       	call   5fe <close>
  return r;
 4a1:	83 c4 10             	add    $0x10,%esp
}
 4a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a7:	89 f0                	mov    %esi,%eax
 4a9:	5b                   	pop    %ebx
 4aa:	5e                   	pop    %esi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4b5:	eb ed                	jmp    4a4 <stat+0x34>
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax

000004c0 <atoi>:

int atoi(const char *s)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	53                   	push   %ebx
 4c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
 4c7:	0f be 02             	movsbl (%edx),%eax
 4ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 4d5:	77 1e                	ja     4f5 <atoi+0x35>
 4d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4de:	66 90                	xchg   %ax,%ax
    n = n * 10 + *s++ - '0';
 4e0:	83 c2 01             	add    $0x1,%edx
 4e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 4ea:	0f be 02             	movsbl (%edx),%eax
 4ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f0:	80 fb 09             	cmp    $0x9,%bl
 4f3:	76 eb                	jbe    4e0 <atoi+0x20>
  return n;
}
 4f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f8:	89 c8                	mov    %ecx,%eax
 4fa:	c9                   	leave  
 4fb:	c3                   	ret    
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000500 <memmove>:

void *
memmove(void *vdst, const void *vsrc, int n)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	8b 45 10             	mov    0x10(%ebp),%eax
 507:	8b 55 08             	mov    0x8(%ebp),%edx
 50a:	56                   	push   %esi
 50b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
 50e:	85 c0                	test   %eax,%eax
 510:	7e 13                	jle    525 <memmove+0x25>
 512:	01 d0                	add    %edx,%eax
  dst = vdst;
 514:	89 d7                	mov    %edx,%edi
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 520:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 521:	39 f8                	cmp    %edi,%eax
 523:	75 fb                	jne    520 <memmove+0x20>
  return vdst;
}
 525:	5e                   	pop    %esi
 526:	89 d0                	mov    %edx,%eax
 528:	5f                   	pop    %edi
 529:	5d                   	pop    %ebp
 52a:	c3                   	ret    
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	83 ec 14             	sub    $0x14,%esp
  int pid;
  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);

  void *stack = malloc(4096 * 2);
 536:	68 00 20 00 00       	push   $0x2000
 53b:	e8 30 04 00 00       	call   970 <malloc>

  pid = clone(start_routine, arg1, arg2, stack);
 540:	50                   	push   %eax
 541:	ff 75 10             	push   0x10(%ebp)
 544:	ff 75 0c             	push   0xc(%ebp)
 547:	ff 75 08             	push   0x8(%ebp)
 54a:	e8 27 01 00 00       	call   676 <clone>

  return pid;
}
 54f:	c9                   	leave  
 550:	c3                   	ret    
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop

00000560 <thread_join>:

int thread_join()
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	53                   	push   %ebx
 564:	83 ec 20             	sub    $0x20,%esp
  int pid;
  void *stack = malloc(sizeof(void *));
 567:	6a 04                	push   $0x4
 569:	e8 02 04 00 00       	call   970 <malloc>
 56e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  pid = join(&stack);
 571:	8d 45 f4             	lea    -0xc(%ebp),%eax
 574:	89 04 24             	mov    %eax,(%esp)
 577:	e8 02 01 00 00       	call   67e <join>
 57c:	89 c3                	mov    %eax,%ebx

  lock_t lock;
  lock_init(&lock);
  lock_acquire(&lock);
  free(stack);
 57e:	58                   	pop    %eax
 57f:	ff 75 f4             	push   -0xc(%ebp)
 582:	e8 59 03 00 00       	call   8e0 <free>
  lock_release(&lock);

  return pid;
}
 587:	89 d8                	mov    %ebx,%eax
 589:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 58c:	c9                   	leave  
 58d:	c3                   	ret    
 58e:	66 90                	xchg   %ax,%ax

00000590 <lock_acquire>:

void lock_acquire(lock_t *lock)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	8b 45 08             	mov    0x8(%ebp),%eax
  while (lock->flag == 1)
 596:	83 38 01             	cmpl   $0x1,(%eax)
 599:	75 05                	jne    5a0 <lock_acquire+0x10>
 59b:	eb fe                	jmp    59b <lock_acquire+0xb>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
    ;
  lock->flag = 1;
 5a0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
}
 5a6:	5d                   	pop    %ebp
 5a7:	c3                   	ret    
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <lock_release>:
void lock_release(lock_t *lock)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    
 5be:	66 90                	xchg   %ax,%ax

000005c0 <lock_init>:
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5cc:	5d                   	pop    %ebp
 5cd:	c3                   	ret    

000005ce <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ce:	b8 01 00 00 00       	mov    $0x1,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <exit>:
SYSCALL(exit)
 5d6:	b8 02 00 00 00       	mov    $0x2,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <wait>:
SYSCALL(wait)
 5de:	b8 03 00 00 00       	mov    $0x3,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <pipe>:
SYSCALL(pipe)
 5e6:	b8 04 00 00 00       	mov    $0x4,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <read>:
SYSCALL(read)
 5ee:	b8 05 00 00 00       	mov    $0x5,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <write>:
SYSCALL(write)
 5f6:	b8 10 00 00 00       	mov    $0x10,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <close>:
SYSCALL(close)
 5fe:	b8 15 00 00 00       	mov    $0x15,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <kill>:
SYSCALL(kill)
 606:	b8 06 00 00 00       	mov    $0x6,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <exec>:
SYSCALL(exec)
 60e:	b8 07 00 00 00       	mov    $0x7,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <open>:
SYSCALL(open)
 616:	b8 0f 00 00 00       	mov    $0xf,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <mknod>:
SYSCALL(mknod)
 61e:	b8 11 00 00 00       	mov    $0x11,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <unlink>:
SYSCALL(unlink)
 626:	b8 12 00 00 00       	mov    $0x12,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <fstat>:
SYSCALL(fstat)
 62e:	b8 08 00 00 00       	mov    $0x8,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <link>:
SYSCALL(link)
 636:	b8 13 00 00 00       	mov    $0x13,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <mkdir>:
SYSCALL(mkdir)
 63e:	b8 14 00 00 00       	mov    $0x14,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <chdir>:
SYSCALL(chdir)
 646:	b8 09 00 00 00       	mov    $0x9,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <dup>:
SYSCALL(dup)
 64e:	b8 0a 00 00 00       	mov    $0xa,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <getpid>:
SYSCALL(getpid)
 656:	b8 0b 00 00 00       	mov    $0xb,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <sbrk>:
SYSCALL(sbrk)
 65e:	b8 0c 00 00 00       	mov    $0xc,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <sleep>:
SYSCALL(sleep)
 666:	b8 0d 00 00 00       	mov    $0xd,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <uptime>:
SYSCALL(uptime)
 66e:	b8 0e 00 00 00       	mov    $0xe,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <clone>:
SYSCALL(clone)
 676:	b8 16 00 00 00       	mov    $0x16,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <join>:
 67e:	b8 17 00 00 00       	mov    $0x17,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    
 686:	66 90                	xchg   %ax,%ax
 688:	66 90                	xchg   %ax,%ax
 68a:	66 90                	xchg   %ax,%ax
 68c:	66 90                	xchg   %ax,%ax
 68e:	66 90                	xchg   %ax,%ax

00000690 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 3c             	sub    $0x3c,%esp
 699:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 69c:	89 d1                	mov    %edx,%ecx
{
 69e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6a1:	85 d2                	test   %edx,%edx
 6a3:	0f 89 7f 00 00 00    	jns    728 <printint+0x98>
 6a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6ad:	74 79                	je     728 <printint+0x98>
    neg = 1;
 6af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6b8:	31 db                	xor    %ebx,%ebx
 6ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6c0:	89 c8                	mov    %ecx,%eax
 6c2:	31 d2                	xor    %edx,%edx
 6c4:	89 cf                	mov    %ecx,%edi
 6c6:	f7 75 c4             	divl   -0x3c(%ebp)
 6c9:	0f b6 92 50 0b 00 00 	movzbl 0xb50(%edx),%edx
 6d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6d3:	89 d8                	mov    %ebx,%eax
 6d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6e1:	76 dd                	jbe    6c0 <printint+0x30>
  if(neg)
 6e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6e6:	85 c9                	test   %ecx,%ecx
 6e8:	74 0c                	je     6f6 <printint+0x66>
    buf[i++] = '-';
 6ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6fd:	eb 07                	jmp    706 <printint+0x76>
 6ff:	90                   	nop
    putc(fd, buf[i]);
 700:	0f b6 13             	movzbl (%ebx),%edx
 703:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 706:	83 ec 04             	sub    $0x4,%esp
 709:	88 55 d7             	mov    %dl,-0x29(%ebp)
 70c:	6a 01                	push   $0x1
 70e:	56                   	push   %esi
 70f:	57                   	push   %edi
 710:	e8 e1 fe ff ff       	call   5f6 <write>
  while(--i >= 0)
 715:	83 c4 10             	add    $0x10,%esp
 718:	39 de                	cmp    %ebx,%esi
 71a:	75 e4                	jne    700 <printint+0x70>
}
 71c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 728:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 72f:	eb 87                	jmp    6b8 <printint+0x28>
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop

00000740 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 749:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 74c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 74f:	0f b6 13             	movzbl (%ebx),%edx
 752:	84 d2                	test   %dl,%dl
 754:	74 6a                	je     7c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 756:	8d 45 10             	lea    0x10(%ebp),%eax
 759:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 75c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 75f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 761:	89 45 d0             	mov    %eax,-0x30(%ebp)
 764:	eb 36                	jmp    79c <printf+0x5c>
 766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76d:	8d 76 00             	lea    0x0(%esi),%esi
 770:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 773:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 778:	83 f8 25             	cmp    $0x25,%eax
 77b:	74 15                	je     792 <printf+0x52>
  write(fd, &c, 1);
 77d:	83 ec 04             	sub    $0x4,%esp
 780:	88 55 e7             	mov    %dl,-0x19(%ebp)
 783:	6a 01                	push   $0x1
 785:	57                   	push   %edi
 786:	56                   	push   %esi
 787:	e8 6a fe ff ff       	call   5f6 <write>
 78c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 78f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 792:	0f b6 13             	movzbl (%ebx),%edx
 795:	83 c3 01             	add    $0x1,%ebx
 798:	84 d2                	test   %dl,%dl
 79a:	74 24                	je     7c0 <printf+0x80>
    c = fmt[i] & 0xff;
 79c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 79f:	85 c9                	test   %ecx,%ecx
 7a1:	74 cd                	je     770 <printf+0x30>
      }
    } else if(state == '%'){
 7a3:	83 f9 25             	cmp    $0x25,%ecx
 7a6:	75 ea                	jne    792 <printf+0x52>
      if(c == 'd'){
 7a8:	83 f8 25             	cmp    $0x25,%eax
 7ab:	0f 84 07 01 00 00    	je     8b8 <printf+0x178>
 7b1:	83 e8 63             	sub    $0x63,%eax
 7b4:	83 f8 15             	cmp    $0x15,%eax
 7b7:	77 17                	ja     7d0 <printf+0x90>
 7b9:	ff 24 85 f8 0a 00 00 	jmp    *0xaf8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c3:	5b                   	pop    %ebx
 7c4:	5e                   	pop    %esi
 7c5:	5f                   	pop    %edi
 7c6:	5d                   	pop    %ebp
 7c7:	c3                   	ret    
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
  write(fd, &c, 1);
 7d0:	83 ec 04             	sub    $0x4,%esp
 7d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7d6:	6a 01                	push   $0x1
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7de:	e8 13 fe ff ff       	call   5f6 <write>
        putc(fd, c);
 7e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7e7:	83 c4 0c             	add    $0xc,%esp
 7ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7ed:	6a 01                	push   $0x1
 7ef:	57                   	push   %edi
 7f0:	56                   	push   %esi
 7f1:	e8 00 fe ff ff       	call   5f6 <write>
        putc(fd, c);
 7f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7f9:	31 c9                	xor    %ecx,%ecx
 7fb:	eb 95                	jmp    792 <printf+0x52>
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	b9 10 00 00 00       	mov    $0x10,%ecx
 808:	6a 00                	push   $0x0
 80a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80d:	8b 10                	mov    (%eax),%edx
 80f:	89 f0                	mov    %esi,%eax
 811:	e8 7a fe ff ff       	call   690 <printint>
        ap++;
 816:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 81a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 81d:	31 c9                	xor    %ecx,%ecx
 81f:	e9 6e ff ff ff       	jmp    792 <printf+0x52>
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 828:	8b 45 d0             	mov    -0x30(%ebp),%eax
 82b:	8b 10                	mov    (%eax),%edx
        ap++;
 82d:	83 c0 04             	add    $0x4,%eax
 830:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 833:	85 d2                	test   %edx,%edx
 835:	0f 84 8d 00 00 00    	je     8c8 <printf+0x188>
        while(*s != 0){
 83b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 83e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 840:	84 c0                	test   %al,%al
 842:	0f 84 4a ff ff ff    	je     792 <printf+0x52>
 848:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 84b:	89 d3                	mov    %edx,%ebx
 84d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
          s++;
 853:	83 c3 01             	add    $0x1,%ebx
 856:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 859:	6a 01                	push   $0x1
 85b:	57                   	push   %edi
 85c:	56                   	push   %esi
 85d:	e8 94 fd ff ff       	call   5f6 <write>
        while(*s != 0){
 862:	0f b6 03             	movzbl (%ebx),%eax
 865:	83 c4 10             	add    $0x10,%esp
 868:	84 c0                	test   %al,%al
 86a:	75 e4                	jne    850 <printf+0x110>
      state = 0;
 86c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 86f:	31 c9                	xor    %ecx,%ecx
 871:	e9 1c ff ff ff       	jmp    792 <printf+0x52>
 876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	b9 0a 00 00 00       	mov    $0xa,%ecx
 888:	6a 01                	push   $0x1
 88a:	e9 7b ff ff ff       	jmp    80a <printf+0xca>
 88f:	90                   	nop
        putc(fd, *ap);
 890:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 893:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 896:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 898:	6a 01                	push   $0x1
 89a:	57                   	push   %edi
 89b:	56                   	push   %esi
        putc(fd, *ap);
 89c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 89f:	e8 52 fd ff ff       	call   5f6 <write>
        ap++;
 8a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ab:	31 c9                	xor    %ecx,%ecx
 8ad:	e9 e0 fe ff ff       	jmp    792 <printf+0x52>
 8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 8b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 8bb:	83 ec 04             	sub    $0x4,%esp
 8be:	e9 2a ff ff ff       	jmp    7ed <printf+0xad>
 8c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8c7:	90                   	nop
          s = "(null)";
 8c8:	ba ee 0a 00 00       	mov    $0xaee,%edx
        while(*s != 0){
 8cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8d0:	b8 28 00 00 00       	mov    $0x28,%eax
 8d5:	89 d3                	mov    %edx,%ebx
 8d7:	e9 74 ff ff ff       	jmp    850 <printf+0x110>
 8dc:	66 90                	xchg   %ax,%ax
 8de:	66 90                	xchg   %ax,%ax

000008e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e1:	a1 f4 0e 00 00       	mov    0xef4,%eax
{
 8e6:	89 e5                	mov    %esp,%ebp
 8e8:	57                   	push   %edi
 8e9:	56                   	push   %esi
 8ea:	53                   	push   %ebx
 8eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8f8:	89 c2                	mov    %eax,%edx
 8fa:	8b 00                	mov    (%eax),%eax
 8fc:	39 ca                	cmp    %ecx,%edx
 8fe:	73 30                	jae    930 <free+0x50>
 900:	39 c1                	cmp    %eax,%ecx
 902:	72 04                	jb     908 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 904:	39 c2                	cmp    %eax,%edx
 906:	72 f0                	jb     8f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 908:	8b 73 fc             	mov    -0x4(%ebx),%esi
 90b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 90e:	39 f8                	cmp    %edi,%eax
 910:	74 30                	je     942 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 912:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 915:	8b 42 04             	mov    0x4(%edx),%eax
 918:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 91b:	39 f1                	cmp    %esi,%ecx
 91d:	74 3a                	je     959 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 91f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 921:	5b                   	pop    %ebx
  freep = p;
 922:	89 15 f4 0e 00 00    	mov    %edx,0xef4
}
 928:	5e                   	pop    %esi
 929:	5f                   	pop    %edi
 92a:	5d                   	pop    %ebp
 92b:	c3                   	ret    
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 930:	39 c2                	cmp    %eax,%edx
 932:	72 c4                	jb     8f8 <free+0x18>
 934:	39 c1                	cmp    %eax,%ecx
 936:	73 c0                	jae    8f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 938:	8b 73 fc             	mov    -0x4(%ebx),%esi
 93b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 93e:	39 f8                	cmp    %edi,%eax
 940:	75 d0                	jne    912 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 942:	03 70 04             	add    0x4(%eax),%esi
 945:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 948:	8b 02                	mov    (%edx),%eax
 94a:	8b 00                	mov    (%eax),%eax
 94c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 94f:	8b 42 04             	mov    0x4(%edx),%eax
 952:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 955:	39 f1                	cmp    %esi,%ecx
 957:	75 c6                	jne    91f <free+0x3f>
    p->s.size += bp->s.size;
 959:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 95c:	89 15 f4 0e 00 00    	mov    %edx,0xef4
    p->s.size += bp->s.size;
 962:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 965:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 968:	89 0a                	mov    %ecx,(%edx)
}
 96a:	5b                   	pop    %ebx
 96b:	5e                   	pop    %esi
 96c:	5f                   	pop    %edi
 96d:	5d                   	pop    %ebp
 96e:	c3                   	ret    
 96f:	90                   	nop

00000970 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	57                   	push   %edi
 974:	56                   	push   %esi
 975:	53                   	push   %ebx
 976:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 979:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 97c:	8b 3d f4 0e 00 00    	mov    0xef4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 982:	8d 70 07             	lea    0x7(%eax),%esi
 985:	c1 ee 03             	shr    $0x3,%esi
 988:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 98b:	85 ff                	test   %edi,%edi
 98d:	0f 84 9d 00 00 00    	je     a30 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 993:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 995:	8b 4a 04             	mov    0x4(%edx),%ecx
 998:	39 f1                	cmp    %esi,%ecx
 99a:	73 6a                	jae    a06 <malloc+0x96>
 99c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9a1:	39 de                	cmp    %ebx,%esi
 9a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 9a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 9b0:	eb 17                	jmp    9c9 <malloc+0x59>
 9b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9ba:	8b 48 04             	mov    0x4(%eax),%ecx
 9bd:	39 f1                	cmp    %esi,%ecx
 9bf:	73 4f                	jae    a10 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9c1:	8b 3d f4 0e 00 00    	mov    0xef4,%edi
 9c7:	89 c2                	mov    %eax,%edx
 9c9:	39 d7                	cmp    %edx,%edi
 9cb:	75 eb                	jne    9b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9cd:	83 ec 0c             	sub    $0xc,%esp
 9d0:	ff 75 e4             	push   -0x1c(%ebp)
 9d3:	e8 86 fc ff ff       	call   65e <sbrk>
  if(p == (char*)-1)
 9d8:	83 c4 10             	add    $0x10,%esp
 9db:	83 f8 ff             	cmp    $0xffffffff,%eax
 9de:	74 1c                	je     9fc <malloc+0x8c>
  hp->s.size = nu;
 9e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9e3:	83 ec 0c             	sub    $0xc,%esp
 9e6:	83 c0 08             	add    $0x8,%eax
 9e9:	50                   	push   %eax
 9ea:	e8 f1 fe ff ff       	call   8e0 <free>
  return freep;
 9ef:	8b 15 f4 0e 00 00    	mov    0xef4,%edx
      if((p = morecore(nunits)) == 0)
 9f5:	83 c4 10             	add    $0x10,%esp
 9f8:	85 d2                	test   %edx,%edx
 9fa:	75 bc                	jne    9b8 <malloc+0x48>
        return 0;
  }
}
 9fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9ff:	31 c0                	xor    %eax,%eax
}
 a01:	5b                   	pop    %ebx
 a02:	5e                   	pop    %esi
 a03:	5f                   	pop    %edi
 a04:	5d                   	pop    %ebp
 a05:	c3                   	ret    
    if(p->s.size >= nunits){
 a06:	89 d0                	mov    %edx,%eax
 a08:	89 fa                	mov    %edi,%edx
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a10:	39 ce                	cmp    %ecx,%esi
 a12:	74 4c                	je     a60 <malloc+0xf0>
        p->s.size -= nunits;
 a14:	29 f1                	sub    %esi,%ecx
 a16:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a19:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a1c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a1f:	89 15 f4 0e 00 00    	mov    %edx,0xef4
}
 a25:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a28:	83 c0 08             	add    $0x8,%eax
}
 a2b:	5b                   	pop    %ebx
 a2c:	5e                   	pop    %esi
 a2d:	5f                   	pop    %edi
 a2e:	5d                   	pop    %ebp
 a2f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a30:	c7 05 f4 0e 00 00 f8 	movl   $0xef8,0xef4
 a37:	0e 00 00 
    base.s.size = 0;
 a3a:	bf f8 0e 00 00       	mov    $0xef8,%edi
    base.s.ptr = freep = prevp = &base;
 a3f:	c7 05 f8 0e 00 00 f8 	movl   $0xef8,0xef8
 a46:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a49:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a4b:	c7 05 fc 0e 00 00 00 	movl   $0x0,0xefc
 a52:	00 00 00 
    if(p->s.size >= nunits){
 a55:	e9 42 ff ff ff       	jmp    99c <malloc+0x2c>
 a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a60:	8b 08                	mov    (%eax),%ecx
 a62:	89 0a                	mov    %ecx,(%edx)
 a64:	eb b9                	jmp    a1f <malloc+0xaf>
