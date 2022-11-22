2400 #include "types.h"
2401 #include "defs.h"
2402 #include "param.h"
2403 #include "memlayout.h"
2404 #include "mmu.h"
2405 #include "x86.h"
2406 #include "proc.h"
2407 #include "spinlock.h"
2408 
2409 struct {
2410   struct spinlock lock;
2411   struct proc proc[NPROC];
2412 } ptable;
2413 
2414 static struct proc *initproc;
2415 
2416 int nextpid = 1;
2417 extern void forkret(void);
2418 extern void trapret(void);
2419 
2420 static void wakeup1(void *chan);
2421 
2422 void
2423 pinit(void)
2424 {
2425   initlock(&ptable.lock, "ptable");
2426 }
2427 
2428 // Must be called with interrupts disabled
2429 int
2430 cpuid() {
2431   return mycpu()-cpus;
2432 }
2433 
2434 // Must be called with interrupts disabled to avoid the caller being
2435 // rescheduled between reading lapicid and running through the loop.
2436 struct cpu*
2437 mycpu(void)
2438 {
2439   int apicid, i;
2440 
2441   if(readeflags()&FL_IF)
2442     panic("mycpu called with interrupts enabled\n");
2443 
2444   apicid = lapicid();
2445   // APIC IDs are not guaranteed to be contiguous. Maybe we should have
2446   // a reverse map, or reserve a register to store &cpus[i].
2447   for (i = 0; i < ncpu; ++i) {
2448     if (cpus[i].apicid == apicid)
2449       return &cpus[i];
2450   }
2451   panic("unknown apicid\n");
2452 }
2453 
2454 // Disable interrupts so that we are not rescheduled
2455 // while reading proc from the cpu structure
2456 struct proc*
2457 myproc(void) {
2458   struct cpu *c;
2459   struct proc *p;
2460   pushcli();
2461   c = mycpu();
2462   p = c->proc;
2463   popcli();
2464   return p;
2465 }
2466 
2467 
2468 // Look in the process table for an UNUSED proc.
2469 // If found, change state to EMBRYO and initialize
2470 // state required to run in the kernel.
2471 // Otherwise return 0.
2472 static struct proc*
2473 allocproc(void)
2474 {
2475   struct proc *p;
2476   char *sp;
2477 
2478   acquire(&ptable.lock);
2479 
2480   for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
2481     if(p->state == UNUSED)
2482       goto found;
2483 
2484   release(&ptable.lock);
2485   return 0;
2486 
2487 found:
2488   p->state = EMBRYO;
2489   p->pid = nextpid++;
2490 
2491   release(&ptable.lock);
2492 
2493   // Allocate kernel stack.
2494   if((p->kstack = kalloc()) == 0){
2495     p->state = UNUSED;
2496     return 0;
2497   }
2498   sp = p->kstack + KSTACKSIZE;
2499 
2500   // Leave room for trap frame.
2501   sp -= sizeof *p->tf;
2502   p->tf = (struct trapframe*)sp;
2503 
2504   // Set up new context to start executing at forkret,
2505   // which returns to trapret.
2506   sp -= 4;
2507   *(uint*)sp = (uint)trapret;
2508 
2509 
2510   sp -= sizeof *p->context;
2511   p->context = (struct context*)sp;
2512   memset(p->context, 0, sizeof *p->context);
2513   p->context->eip = (uint)forkret;
2514 
2515   return p;
2516 }
2517 
2518 
2519 
2520 
2521 
2522 
2523 
2524 
2525 
2526 
2527 
2528 
2529 
2530 
2531 
2532 
2533 
2534 
2535 
2536 
2537 
2538 
2539 
2540 
2541 
2542 
2543 
2544 
2545 
2546 
2547 
2548 
2549 
2550 // Set up first user process.
2551 void
2552 userinit(void)
2553 {
2554   struct proc *p;
2555   extern char _binary_initcode_start[], _binary_initcode_size[];
2556 
2557   p = allocproc();
2558 
2559   initproc = p;
2560   if((p->pgdir = setupkvm()) == 0)
2561     panic("userinit: out of memory?");
2562   inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
2563   p->sz = PGSIZE;
2564   memset(p->tf, 0, sizeof(*p->tf));
2565   p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
2566   p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
2567   p->tf->es = p->tf->ds;
2568   p->tf->ss = p->tf->ds;
2569   p->tf->eflags = FL_IF;
2570   p->tf->esp = PGSIZE;
2571   p->tf->eip = 0;  // beginning of initcode.S
2572 
2573   safestrcpy(p->name, "initcode", sizeof(p->name));
2574   p->cwd = namei("/");
2575 
2576   // this assignment to p->state lets other cores
2577   // run this process. the acquire forces the above
2578   // writes to be visible, and the lock is also needed
2579   // because the assignment might not be atomic.
2580   acquire(&ptable.lock);
2581 
2582   p->state = RUNNABLE;
2583 
2584   release(&ptable.lock);
2585 }
2586 
2587 
2588 
2589 
2590 
2591 
2592 
2593 
2594 
2595 
2596 
2597 
2598 
2599 
2600 // Grow current process's memory by n bytes.
2601 // Return 0 on success, -1 on failure.
2602 int
2603 growproc(int n)
2604 {
2605   uint sz;
2606   struct proc *curproc = myproc();
2607   struct proc *p;
2608 
2609   sz = curproc->sz;
2610   if(n > 0){
2611     if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
2612       return -1;
2613   } else if(n < 0){
2614     if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
2615       return -1;
2616   }
2617   curproc->sz = sz;
2618   acquire(&ptable.lock);
2619   for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
2620       if(p->pgdir != curproc->pgdir)
2621         continue;
2622       p->sz = sz;
2623       switchuvm(p);
2624   }
2625   release(&ptable.lock);
2626   switchuvm(curproc);
2627   return 0;
2628 }
2629 
2630 // Create a new process copying p as the parent.
2631 // Sets up stack to return as if from system call.
2632 // Caller must set state of returned proc to RUNNABLE.
2633 int
2634 fork(void)
2635 {
2636   int i, pid;
2637   struct proc *np;
2638   struct proc *curproc = myproc();
2639 
2640   // Allocate process.
2641   if((np = allocproc()) == 0){
2642     return -1;
2643   }
2644 
2645   // Copy process state from proc.
2646   if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
2647     kfree(np->kstack);
2648     np->kstack = 0;
2649     np->state = UNUSED;
2650     return -1;
2651   }
2652   np->sz = curproc->sz;
2653   np->parent = curproc;
2654   *np->tf = *curproc->tf;
2655 
2656   // Clear %eax so that fork returns 0 in the child.
2657   np->tf->eax = 0;
2658 
2659   for(i = 0; i < NOFILE; i++)
2660     if(curproc->ofile[i])
2661       np->ofile[i] = filedup(curproc->ofile[i]);
2662   np->cwd = idup(curproc->cwd);
2663 
2664   safestrcpy(np->name, curproc->name, sizeof(curproc->name));
2665 
2666   pid = np->pid;
2667 
2668   acquire(&ptable.lock);
2669 
2670   np->state = RUNNABLE;
2671 
2672   release(&ptable.lock);
2673 
2674   return pid;
2675 }
2676 
2677 // Exit the current process.  Does not return.
2678 // An exited process remains in the zombie state
2679 // until its parent calls wait() to find out it exited.
2680 void
2681 exit(void)
2682 {
2683   struct proc *curproc = myproc();
2684   struct proc *p;
2685   int fd;
2686 
2687   if(curproc == initproc)
2688     panic("init exiting");
2689 
2690   // Close all open files.
2691   for(fd = 0; fd < NOFILE; fd++){
2692     if(curproc->ofile[fd]){
2693       fileclose(curproc->ofile[fd]);
2694       curproc->ofile[fd] = 0;
2695     }
2696   }
2697 
2698 
2699 
2700   begin_op();
2701   iput(curproc->cwd);
2702   end_op();
2703   curproc->cwd = 0;
2704 
2705   acquire(&ptable.lock);
2706 
2707   // Parent might be sleeping in wait().
2708   wakeup1(curproc->parent);
2709 
2710   // Pass abandoned children to init.
2711   for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
2712     if(p->parent == curproc){
2713         if (p->pgdir == curproc->pgdir) {
2714         // p->state = ZOMBIE;
2715          kfree(p->kstack);
2716          p->kstack = 0;
2717          p->state = UNUSED;
2718       }
2719       else
2720       {
2721         p->parent = initproc;
2722         if(p->state == ZOMBIE)
2723           wakeup1(initproc);
2724       }
2725     }
2726   }
2727 
2728   // Jump into the scheduler, never to return.
2729   curproc->state = ZOMBIE;
2730   sched();
2731   panic("zombie exit");
2732 }
2733 
2734 // Wait for a child process to exit and return its pid.
2735 // Return -1 if this process has no children.
2736 int
2737 wait(void)
2738 {
2739   struct proc *p;
2740   int havekids, pid;
2741   struct proc *curproc = myproc();
2742 
2743 
2744   acquire(&ptable.lock);
2745   for(;;){
2746     // Scan through table looking for exited children.
2747     havekids = 0;
2748     for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
2749       if(p->parent != curproc || p->pgdir == curproc->pgdir)
2750         continue;
2751       havekids = 1;
2752       if(p->state == ZOMBIE){
2753         // Found one.
2754         pid = p->pid;
2755         kfree(p->kstack);
2756         p->kstack = 0;
2757         freevm(p->pgdir);
2758         p->pid = 0;
2759         p->parent = 0;
2760         p->name[0] = 0;
2761         p->killed = 0;
2762         p->state = UNUSED;
2763         release(&ptable.lock);
2764         return pid;
2765       }
2766     }
2767 
2768     // No point waiting if we don't have any children.
2769     if(!havekids || curproc->killed){
2770       release(&ptable.lock);
2771       return -1;
2772     }
2773 
2774     // Wait for children to exit.  (See wakeup1 call in proc_exit.)
2775     sleep(curproc, &ptable.lock);  //DOC: wait-sleep
2776   }
2777 }
2778 
2779 
2780 
2781 
2782 
2783 
2784 
2785 
2786 
2787 
2788 
2789 
2790 
2791 
2792 
2793 
2794 
2795 
2796 
2797 
2798 
2799 
2800 // Per-CPU process scheduler.
2801 // Each CPU calls scheduler() after setting itself up.
2802 // Scheduler never returns.  It loops, doing:
2803 //  - choose a process to run
2804 //  - swtch to start running that process
2805 //  - eventually that process transfers control
2806 //      via swtch back to the scheduler.
2807 void
2808 scheduler(void)
2809 {
2810   struct proc *p;
2811   struct cpu *c = mycpu();
2812   c->proc = 0;
2813 
2814   for(;;){
2815     // Enable interrupts on this processor.
2816     sti();
2817 
2818     // Loop over process table looking for process to run.
2819     acquire(&ptable.lock);
2820     for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
2821       if(p->state != RUNNABLE)
2822         continue;
2823 
2824       // Switch to chosen process.  It is the process's job
2825       // to release ptable.lock and then reacquire it
2826       // before jumping back to us.
2827       c->proc = p;
2828       switchuvm(p);
2829       p->state = RUNNING;
2830 
2831       swtch(&(c->scheduler), p->context);
2832       switchkvm();
2833 
2834       // Process is done running for now.
2835       // It should have changed its p->state before coming back.
2836       c->proc = 0;
2837     }
2838     release(&ptable.lock);
2839 
2840   }
2841 }
2842 
2843 
2844 
2845 
2846 
2847 
2848 
2849 
2850 // Enter scheduler.  Must hold only ptable.lock
2851 // and have changed proc->state. Saves and restores
2852 // intena because intena is a property of this
2853 // kernel thread, not this CPU. It should
2854 // be proc->intena and proc->ncli, but that would
2855 // break in the few places where a lock is held but
2856 // there's no process.
2857 void
2858 sched(void)
2859 {
2860   int intena;
2861   struct proc *p = myproc();
2862 
2863   if(!holding(&ptable.lock))
2864     panic("sched ptable.lock");
2865   if(mycpu()->ncli != 1)
2866     panic("sched locks");
2867   if(p->state == RUNNING)
2868     panic("sched running");
2869   if(readeflags()&FL_IF)
2870     panic("sched interruptible");
2871   intena = mycpu()->intena;
2872   swtch(&p->context, mycpu()->scheduler);
2873   mycpu()->intena = intena;
2874 }
2875 
2876 // Give up the CPU for one scheduling round.
2877 void
2878 yield(void)
2879 {
2880   acquire(&ptable.lock);  //DOC: yieldlock
2881   myproc()->state = RUNNABLE;
2882   sched();
2883   release(&ptable.lock);
2884 }
2885 
2886 
2887 
2888 
2889 
2890 
2891 
2892 
2893 
2894 
2895 
2896 
2897 
2898 
2899 
2900 // A fork child's very first scheduling by scheduler()
2901 // will swtch here.  "Return" to user space.
2902 void
2903 forkret(void)
2904 {
2905   static int first = 1;
2906   // Still holding ptable.lock from scheduler.
2907   release(&ptable.lock);
2908 
2909   if (first) {
2910     // Some initialization functions must be run in the context
2911     // of a regular process (e.g., they call sleep), and thus cannot
2912     // be run from main().
2913     first = 0;
2914     iinit(ROOTDEV);
2915     initlog(ROOTDEV);
2916   }
2917 
2918   // Return to "caller", actually trapret (see allocproc).
2919 }
2920 
2921 // Atomically release lock and sleep on chan.
2922 // Reacquires lock when awakened.
2923 void
2924 sleep(void *chan, struct spinlock *lk)
2925 {
2926   struct proc *p = myproc();
2927 
2928   if(p == 0)
2929     panic("sleep");
2930 
2931   if(lk == 0)
2932     panic("sleep without lk");
2933 
2934   // Must acquire ptable.lock in order to
2935   // change p->state and then call sched.
2936   // Once we hold ptable.lock, we can be
2937   // guaranteed that we won't miss any wakeup
2938   // (wakeup runs with ptable.lock locked),
2939   // so it's okay to release lk.
2940   if(lk != &ptable.lock){  //DOC: sleeplock0
2941     acquire(&ptable.lock);  //DOC: sleeplock1
2942     release(lk);
2943   }
2944   // Go to sleep.
2945   p->chan = chan;
2946   p->state = SLEEPING;
2947 
2948   sched();
2949 
2950   // Tidy up.
2951   p->chan = 0;
2952 
2953   // Reacquire original lock.
2954   if(lk != &ptable.lock){  //DOC: sleeplock2
2955     release(&ptable.lock);
2956     acquire(lk);
2957   }
2958 }
2959 
2960 
2961 
2962 
2963 
2964 
2965 
2966 
2967 
2968 
2969 
2970 
2971 
2972 
2973 
2974 
2975 
2976 
2977 
2978 
2979 
2980 
2981 
2982 
2983 
2984 
2985 
2986 
2987 
2988 
2989 
2990 
2991 
2992 
2993 
2994 
2995 
2996 
2997 
2998 
2999 
3000 // Wake up all processes sleeping on chan.
3001 // The ptable lock must be held.
3002 static void
3003 wakeup1(void *chan)
3004 {
3005   struct proc *p;
3006 
3007   for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
3008     if(p->state == SLEEPING && p->chan == chan)
3009       p->state = RUNNABLE;
3010 }
3011 
3012 // Wake up all processes sleeping on chan.
3013 void
3014 wakeup(void *chan)
3015 {
3016   acquire(&ptable.lock);
3017   wakeup1(chan);
3018   release(&ptable.lock);
3019 }
3020 
3021 // Kill the process with the given pid.
3022 // Process won't exit until it returns
3023 // to user space (see trap in trap.c).
3024 int
3025 kill(int pid)
3026 {
3027   struct proc *p;
3028 
3029   acquire(&ptable.lock);
3030   for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
3031     if(p->pid == pid){
3032       p->killed = 1;
3033       // Wake process from sleep if necessary.
3034       if(p->state == SLEEPING)
3035         p->state = RUNNABLE;
3036       release(&ptable.lock);
3037       return 0;
3038     }
3039   }
3040   release(&ptable.lock);
3041   return -1;
3042 }
3043 
3044 
3045 
3046 
3047 
3048 
3049 
3050 // Print a process listing to console.  For debugging.
3051 // Runs when user types ^P on console.
3052 // No lock to avoid wedging a stuck machine further.
3053 void
3054 procdump(void)
3055 {
3056   static char *states[] = {
3057   [UNUSED]    "unused",
3058   [EMBRYO]    "embryo",
3059   [SLEEPING]  "sleep ",
3060   [RUNNABLE]  "runble",
3061   [RUNNING]   "run   ",
3062   [ZOMBIE]    "zombie"
3063   };
3064   int i;
3065   struct proc *p;
3066   char *state;
3067   uint pc[10];
3068 
3069   for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
3070     if(p->state == UNUSED)
3071       continue;
3072     if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
3073       state = states[p->state];
3074     else
3075       state = "???";
3076     cprintf("%d %s %s", p->pid, state, p->name);
3077     if(p->state == SLEEPING){
3078       getcallerpcs((uint*)p->context->ebp+2, pc);
3079       for(i=0; i<10 && pc[i] != 0; i++)
3080         cprintf(" %p", pc[i]);
3081     }
3082     cprintf("\n");
3083   }
3084 }
3085 
3086 
3087 
3088 
3089 
3090 
3091 
3092 
3093 
3094 
3095 
3096 
3097 
3098 
3099 
3100 int clone(void(*fcn)(void *, void *), void *arg1, void *arg2, void *stack)
3101 {
3102   int i, pid;
3103   struct proc *np;
3104   struct proc *curproc = myproc();
3105 
3106   if(curproc->sz > (uint)stack)
3107   {
3108     return -1;
3109   } // piazza post # 1589
3110 
3111   // Allocate process.
3112   if((np = allocproc()) == 0){
3113     return -1;
3114   }
3115 
3116   pid = np->pid;
3117 
3118   // Copy process state from proc.
3119   np->pgdir = curproc->pgdir;
3120   np->sz = curproc->sz;
3121   np->parent = curproc;
3122   *np->tf = *curproc->tf;
3123 
3124 
3125 
3126 
3127   // Clear %eax so that fork returns 0 in the child.
3128   np->tf->eax = 0;
3129 
3130   *(uint*)(stack + PGSIZE - 3 * sizeof(void *)) = (uint) arg2;
3131   *(uint*)(stack + PGSIZE - 2 * sizeof(void *)) = (uint) arg1;
3132   *(uint*)(stack + PGSIZE - 1 * sizeof(void *)) = 0xFFFFFFFF;
3133 
3134   np->tf->esp = (uint)stack +  PGSIZE - 3 * sizeof(void*);
3135   np->tf->ebp = np->tf->esp;
3136   np->tf->eip = (uint) fcn; // function pointer
3137   np->ustack = stack; //sets
3138 
3139   for(i = 0; i < NOFILE; i++)
3140     if(curproc->ofile[i])
3141       np->ofile[i] = filedup(curproc->ofile[i]);
3142   np->cwd = idup(curproc->cwd);
3143 
3144 
3145   safestrcpy(np->name, curproc->name, sizeof(curproc->name));
3146 
3147   pid = np->pid;
3148   acquire(&ptable.lock);
3149 
3150   np->state = RUNNABLE;
3151 
3152   release(&ptable.lock);
3153 
3154   return pid;
3155 }
3156 
3157 int join(void **stack)
3158 {
3159   struct proc *p;
3160   int havekids, pid;
3161   struct proc *curproc = myproc();
3162 
3163   acquire(&ptable.lock);
3164   for(;;){
3165     // Scan through table looking for exited children.
3166     havekids = 0;
3167     for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
3168       if(p->parent != curproc || p->pgdir != curproc->pgdir)
3169         continue;
3170       havekids = 1;
3171       if(p->state == ZOMBIE){
3172         // Found one.
3173         pid = p->pid;
3174         kfree(p->kstack);
3175         p->kstack = 0;
3176         freevm(p->pgdir);
3177         *stack = p->ustack;
3178         p->ustack = 0;
3179         p->pid = 0;
3180         p->parent = 0;
3181         p->name[0] = 0;
3182         p->killed = 0;
3183         p->state = UNUSED;
3184         release(&ptable.lock);
3185         return pid;
3186       }
3187     }
3188 
3189     // No point waiting if we don't have any children.
3190     if(!havekids || curproc->killed){
3191       release(&ptable.lock);
3192       return -1;
3193     }
3194 
3195     // Wait for children to exit.  (See wakeup1 call in proc_exit.)
3196     sleep(curproc, &ptable.lock);  //DOC: wait-sleep
3197   }
3198 }
3199 
