3900 #include "types.h"
3901 #include "x86.h"
3902 #include "defs.h"
3903 #include "date.h"
3904 #include "param.h"
3905 #include "memlayout.h"
3906 #include "mmu.h"
3907 #include "proc.h"
3908 
3909 int sys_fork(void)
3910 {
3911   return fork();
3912 }
3913 
3914 int sys_exit(void)
3915 {
3916   exit();
3917   return 0; // not reached
3918 }
3919 
3920 int sys_wait(void)
3921 {
3922   return wait();
3923 }
3924 
3925 int sys_kill(void)
3926 {
3927   int pid;
3928 
3929   if (argint(0, &pid) < 0)
3930     return -1;
3931   return kill(pid);
3932 }
3933 
3934 int sys_getpid(void)
3935 {
3936   return myproc()->pid;
3937 }
3938 
3939 
3940 
3941 
3942 
3943 
3944 
3945 
3946 
3947 
3948 
3949 
3950 int sys_sbrk(void)
3951 {
3952   int addr;
3953   int n;
3954 
3955   if (argint(0, &n) < 0)
3956     return -1;
3957   addr = myproc()->sz;
3958   if (growproc(n) < 0)
3959     return -1;
3960   return addr;
3961 }
3962 
3963 int sys_sleep(void)
3964 {
3965   int n;
3966   uint ticks0;
3967 
3968   if (argint(0, &n) < 0)
3969     return -1;
3970   acquire(&tickslock);
3971   ticks0 = ticks;
3972   while (ticks - ticks0 < n)
3973   {
3974     if (myproc()->killed)
3975     {
3976       release(&tickslock);
3977       return -1;
3978     }
3979     sleep(&ticks, &tickslock);
3980   }
3981   release(&tickslock);
3982   return 0;
3983 }
3984 
3985 // return how many clock tick interrupts have occurred
3986 // since start.
3987 int sys_uptime(void)
3988 {
3989   uint xticks;
3990 
3991   acquire(&tickslock);
3992   xticks = ticks;
3993   release(&tickslock);
3994   return xticks;
3995 }
3996 
3997 
3998 
3999 
4000 int sys_clone(void)
4001 {
4002   int stack,arg1,arg2,fcn;
4003 
4004   if (argint(0,&fcn) < 0) {
4005     return -1;
4006   }
4007   if (argint(1,&arg1) < 0) {
4008     return -1;
4009   }
4010   if (argint(2, &arg2) < 0) {
4011     return -1;
4012   }
4013   if (argint(3, &stack) < 0) {
4014     return -1;
4015   }
4016   if((int) stack %4096 != 0) // not page aligned
4017   {
4018     return -1;
4019   }
4020   if((int) stack/4096 != 1) //not one page
4021   {
4022     return -1;
4023   }
4024   return clone((void*)fcn,(void*)arg1,(void*)arg2,(void*)stack);
4025 }
4026 
4027 int sys_join(void)
4028 {
4029   int stack;
4030   if (argint(0, &stack)) {
4031     return -1;
4032   }
4033   if(stack < 0)
4034   {
4035     return -1;
4036   }
4037   return join((void**)stack);
4038 }
4039 
4040 
4041 
4042 
4043 
4044 
4045 
4046 
4047 
4048 
4049 
