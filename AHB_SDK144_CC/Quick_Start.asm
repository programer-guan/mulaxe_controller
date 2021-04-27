
========================================================================

** ELF Header Information

    File Name: Objects\Quick_Start.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x00000119
    Flags: EF_ARM_HASENTRY + EF_ARM_ABI_FLOAT_SOFT (0x05000202)

    ARM ELF revision: 5 (ABI version 2)

    Conforms to Soft float procedure-call standard

    Built with
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 18

    Program header offset: 261132 (0x0003fc0c)
    Section header offset: 261164 (0x0003fc2c)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 14880 bytes (0x3a20)
    Size in memory: 17176 bytes (0x4318)
    Flags         : PF_X + PF_W + PF_R + PF_ARM_ENTRY (0x80000007)
    Alignment     : 8


========================================================================

** Section #1

    Name        : RO_IRAM1
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC (0x00000002)
    Addr        : 0x00000000
    File Offset : 52 (0x34)
    Size        : 136 bytes (0x88)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #2

    Name        : INT_CALLBACK_TBL
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x00000088
    File Offset : 188 (0xbc)
    Size        : 144 bytes (0x90)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #3

    Name        : RO_IRAM2
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_EXECINSTR (0x00000006)
    Addr        : 0x00000118
    File Offset : 332 (0x14c)
    Size        : 14320 bytes (0x37f0)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

    $t
    !!!main
    __main
        0x00000118:    f000f802    ....    BL       __scatterload ; 0x120
        0x0000011c:    f000f862    ..b.    BL       __rt_entry ; 0x1e4
    !!!scatter
    __scatterload
    __scatterload_rt2
    __scatterload_rt2_thumb_only
        0x00000120:    a00a        ..      ADR      r0,{pc}+0x2c ; 0x14c
        0x00000122:    e8900c00    ....    LDM      r0,{r10,r11}
        0x00000126:    4482        .D      ADD      r10,r10,r0
        0x00000128:    4483        .D      ADD      r11,r11,r0
        0x0000012a:    f1aa0701    ....    SUB      r7,r10,#1
    __scatterload_null
        0x0000012e:    45da        .E      CMP      r10,r11
        0x00000130:    d101        ..      BNE      0x136 ; __scatterload_null + 8
        0x00000132:    f000f857    ..W.    BL       __rt_entry ; 0x1e4
        0x00000136:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x12f
        0x0000013a:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x0000013e:    f0130f01    ....    TST      r3,#1
        0x00000142:    bf18        ..      IT       NE
        0x00000144:    1afb        ..      SUBNE    r3,r7,r3
        0x00000146:    f0430301    C...    ORR      r3,r3,#1
        0x0000014a:    4718        .G      BX       r3
    $d
        0x0000014c:    0000379c    .7..    DCD    14236
        0x00000150:    000037bc    .7..    DCD    14268
    $t
    !!dczerorl2
    __decompress
    __decompress1
        0x00000154:    440a        .D      ADD      r2,r2,r1
        0x00000156:    f04f0c00    O...    MOV      r12,#0
        0x0000015a:    f8103b01    ...;    LDRB     r3,[r0],#1
        0x0000015e:    f0130407    ....    ANDS     r4,r3,#7
        0x00000162:    bf08        ..      IT       EQ
        0x00000164:    f8104b01    ...K    LDRBEQ   r4,[r0],#1
        0x00000168:    111d        ..      ASRS     r5,r3,#4
        0x0000016a:    bf08        ..      IT       EQ
        0x0000016c:    f8105b01    ...[    LDRBEQ   r5,[r0],#1
        0x00000170:    1e64        d.      SUBS     r4,r4,#1
        0x00000172:    d005        ..      BEQ      0x180 ; __decompress + 44
        0x00000174:    f8106b01    ...k    LDRB     r6,[r0],#1
        0x00000178:    1e64        d.      SUBS     r4,r4,#1
        0x0000017a:    f8016b01    ...k    STRB     r6,[r1],#1
        0x0000017e:    d1f9        ..      BNE      0x174 ; __decompress + 32
        0x00000180:    f0130f08    ....    TST      r3,#8
        0x00000184:    bf1e        ..      ITTT     NE
        0x00000186:    f8104b01    ...K    LDRBNE   r4,[r0],#1
        0x0000018a:    1cad        ..      ADDNE    r5,r5,#2
        0x0000018c:    1b0c        ..      SUBNE    r4,r1,r4
        0x0000018e:    d109        ..      BNE      0x1a4 ; __decompress + 80
        0x00000190:    1e6d        m.      SUBS     r5,r5,#1
        0x00000192:    bf58        X.      IT       PL
        0x00000194:    f801cb01    ....    STRBPL   r12,[r1],#1
        0x00000198:    d5fa        ..      BPL      0x190 ; __decompress + 60
        0x0000019a:    e005        ..      B        0x1a8 ; __decompress + 84
        0x0000019c:    f8146b01    ...k    LDRB     r6,[r4],#1
        0x000001a0:    f8016b01    ...k    STRB     r6,[r1],#1
        0x000001a4:    1e6d        m.      SUBS     r5,r5,#1
        0x000001a6:    d5f9        ..      BPL      0x19c ; __decompress + 72
        0x000001a8:    4291        .B      CMP      r1,r2
        0x000001aa:    d3d6        ..      BCC      0x15a ; __decompress + 6
        0x000001ac:    4770        pG      BX       lr
        0x000001ae:    0000        ..      MOVS     r0,r0
    !!handler_zi
    __scatterload_zeroinit
        0x000001b0:    2300        .#      MOVS     r3,#0
        0x000001b2:    2400        .$      MOVS     r4,#0
        0x000001b4:    2500        .%      MOVS     r5,#0
        0x000001b6:    2600        .&      MOVS     r6,#0
        0x000001b8:    3a10        .:      SUBS     r2,r2,#0x10
        0x000001ba:    bf28        (.      IT       CS
        0x000001bc:    c178        x.      STMCS    r1!,{r3-r6}
        0x000001be:    d8fb        ..      BHI      0x1b8 ; __scatterload_zeroinit + 8
        0x000001c0:    0752        R.      LSLS     r2,r2,#29
        0x000001c2:    bf28        (.      IT       CS
        0x000001c4:    c130        0.      STMCS    r1!,{r4,r5}
        0x000001c6:    bf48        H.      IT       MI
        0x000001c8:    600b        .`      STRMI    r3,[r1,#0]
        0x000001ca:    4770        pG      BX       lr
    .ARM.Collect$$_printf_percent$$00000009
    .ARM.Collect$$_printf_percent$$00000000
    _printf_d
    _printf_percent
        0x000001cc:    2964        d)      CMP      r1,#0x64
        0x000001ce:    f00080a3    ....    BEQ.W    _printf_int_dec ; 0x318
    .ARM.Collect$$_printf_percent$$00000014
    _printf_s
        0x000001d2:    2973        s)      CMP      r1,#0x73
        0x000001d4:    f000817d    ..}.    BEQ.W    _printf_string ; 0x4d2
    .ARM.Collect$$_printf_percent$$00000017
    _printf_percent_end
        0x000001d8:    2000        .       MOVS     r0,#0
        0x000001da:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x000001dc:    b51f        ..      PUSH     {r0-r4,lr}
    .ARM.Collect$$libinit$$00000002
    .ARM.Collect$$libinit$$00000004
    .ARM.Collect$$libinit$$0000000A
    .ARM.Collect$$libinit$$0000000C
    .ARM.Collect$$libinit$$0000000E
    .ARM.Collect$$libinit$$00000011
    .ARM.Collect$$libinit$$00000013
    .ARM.Collect$$libinit$$00000015
    .ARM.Collect$$libinit$$00000017
    .ARM.Collect$$libinit$$00000019
    .ARM.Collect$$libinit$$0000001B
    .ARM.Collect$$libinit$$0000001D
    .ARM.Collect$$libinit$$0000001F
    .ARM.Collect$$libinit$$00000021
    .ARM.Collect$$libinit$$00000023
    .ARM.Collect$$libinit$$00000025
    .ARM.Collect$$libinit$$0000002C
    .ARM.Collect$$libinit$$0000002E
    .ARM.Collect$$libinit$$00000030
    .ARM.Collect$$libinit$$00000032
    .ARM.Collect$$libinit$$00000033
    __rt_lib_init_alloca_1
    __rt_lib_init_argv_1
    __rt_lib_init_atexit_1
    __rt_lib_init_clock_1
    __rt_lib_init_cpp_1
    __rt_lib_init_exceptions_1
    __rt_lib_init_fp_1
    __rt_lib_init_fp_trap_1
    __rt_lib_init_getenv_1
    __rt_lib_init_heap_1
    __rt_lib_init_lc_collate_1
    __rt_lib_init_lc_ctype_1
    __rt_lib_init_lc_monetary_1
    __rt_lib_init_lc_numeric_1
    __rt_lib_init_lc_time_1
    __rt_lib_init_preinit_1
    __rt_lib_init_rand_1
    __rt_lib_init_return
    __rt_lib_init_signal_1
    __rt_lib_init_stdio_1
    __rt_lib_init_user_alloc_1
        0x000001de:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x000001e0:    b510        ..      PUSH     {r4,lr}
    .ARM.Collect$$libshutdown$$00000002
    .ARM.Collect$$libshutdown$$00000004
    .ARM.Collect$$libshutdown$$00000007
    .ARM.Collect$$libshutdown$$0000000A
    .ARM.Collect$$libshutdown$$0000000C
    .ARM.Collect$$libshutdown$$0000000F
    .ARM.Collect$$libshutdown$$00000010
    __rt_lib_shutdown_cpp_1
    __rt_lib_shutdown_fp_trap_1
    __rt_lib_shutdown_heap_1
    __rt_lib_shutdown_return
    __rt_lib_shutdown_signal_1
    __rt_lib_shutdown_stdio_1
    __rt_lib_shutdown_user_alloc_1
        0x000001e2:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x000001e4:    f000f9f6    ....    BL       __user_setup_stackheap ; 0x5d4
        0x000001e8:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x000001ea:    f7fffff7    ....    BL       __rt_lib_init ; 0x1dc
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x000001ee:    f002fdd3    ....    BL       main ; 0x2d98
        0x000001f2:    f000fa14    ....    BL       exit ; 0x61e
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x000001f6:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x000001f8:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0x1e0
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x000001fc:    bc03        ..      POP      {r0,r1}
        0x000001fe:    f000f8f7    ....    BL       _sys_exit ; 0x3f0
        0x00000202:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x00000204:    4809        .H      LDR      r0,[pc,#36] ; [0x22c] = 0x2bc9
        0x00000206:    4780        .G      BLX      r0
        0x00000208:    4809        .H      LDR      r0,[pc,#36] ; [0x230] = 0x119
        0x0000020a:    4700        .G      BX       r0
    NMI_Handler
        0x0000020c:    e7fe        ..      B        NMI_Handler ; 0x20c
    HardFault_Handler
        0x0000020e:    e7fe        ..      B        HardFault_Handler ; 0x20e
    MemManage_Handler
        0x00000210:    e7fe        ..      B        MemManage_Handler ; 0x210
    BusFault_Handler
        0x00000212:    e7fe        ..      B        BusFault_Handler ; 0x212
    UsageFault_Handler
        0x00000214:    e7fe        ..      B        UsageFault_Handler ; 0x214
    SVC_Handler
        0x00000216:    e7fe        ..      B        SVC_Handler ; 0x216
    DebugMon_Handler
        0x00000218:    e7fe        ..      B        DebugMon_Handler ; 0x218
    PendSV_Handler
        0x0000021a:    e7fe        ..      B        PendSV_Handler ; 0x21a
    SysTick_Handler
        0x0000021c:    e7fe        ..      B        SysTick_Handler ; 0x21c
        0x0000021e:    e7fe        ..      B        0x21e ; SysTick_Handler + 2
    __user_initial_stackheap
        0x00000220:    4804        .H      LDR      r0,[pc,#16] ; [0x234] = 0x20000510
        0x00000222:    4905        .I      LDR      r1,[pc,#20] ; [0x238] = 0x20000a10
        0x00000224:    4a05        .J      LDR      r2,[pc,#20] ; [0x23c] = 0x20000610
        0x00000226:    4b06        .K      LDR      r3,[pc,#24] ; [0x240] = 0x20000610
        0x00000228:    4770        pG      BX       lr
    $d
        0x0000022a:    0000        ..      DCW    0
        0x0000022c:    00002bc9    .+..    DCD    11209
        0x00000230:    00000119    ....    DCD    281
        0x00000234:    20000510    ...     DCD    536872208
        0x00000238:    20000a10    ...     DCD    536873488
        0x0000023c:    20000610    ...     DCD    536872464
        0x00000240:    20000610    ...     DCD    536872464
    $t
    .text
    __2printf
        0x00000244:    b40f        ..      PUSH     {r0-r3}
        0x00000246:    4904        .I      LDR      r1,[pc,#16] ; [0x258] = 0x20000440
        0x00000248:    b510        ..      PUSH     {r4,lr}
        0x0000024a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000024c:    9802        ..      LDR      r0,[sp,#8]
        0x0000024e:    f000f945    ..E.    BL       _printf_char_file ; 0x4dc
        0x00000252:    bc10        ..      POP      {r4}
        0x00000254:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000258:    20000440    @..     DCD    536872000
    $t
    .text
    __printf
        0x0000025c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000260:    460e        .F      MOV      r6,r1
        0x00000262:    4604        .F      MOV      r4,r0
        0x00000264:    2000        .       MOVS     r0,#0
        0x00000266:    6220         b      STR      r0,[r4,#0x20]
        0x00000268:    4620         F      MOV      r0,r4
        0x0000026a:    68e1        .h      LDR      r1,[r4,#0xc]
        0x0000026c:    4788        .G      BLX      r1
        0x0000026e:    b330        0.      CBZ      r0,0x2be ; __printf + 98
        0x00000270:    2825        %(      CMP      r0,#0x25
        0x00000272:    d005        ..      BEQ      0x280 ; __printf + 36
        0x00000274:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000278:    4790        .G      BLX      r2
        0x0000027a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000027c:    1c40        @.      ADDS     r0,r0,#1
        0x0000027e:    e7f2        ..      B        0x266 ; __printf + 10
        0x00000280:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000282:    4620         F      MOV      r0,r4
        0x00000284:    2700        .'      MOVS     r7,#0
        0x00000286:    4788        .G      BLX      r1
        0x00000288:    0005        ..      MOVS     r5,r0
        0x0000028a:    d018        ..      BEQ      0x2be ; __printf + 98
        0x0000028c:    f1a50041    ..A.    SUB      r0,r5,#0x41
        0x00000290:    2819        .(      CMP      r0,#0x19
        0x00000292:    d802        ..      BHI      0x29a ; __printf + 62
        0x00000294:    3520         5      ADDS     r5,r5,#0x20
        0x00000296:    f44f6700    O..g    MOV      r7,#0x800
        0x0000029a:    4632        2F      MOV      r2,r6
        0x0000029c:    4629        )F      MOV      r1,r5
        0x0000029e:    4620         F      MOV      r0,r4
        0x000002a0:    6027        '`      STR      r7,[r4,#0]
        0x000002a2:    f7ffff93    ....    BL       _printf_d ; 0x1cc
        0x000002a6:    b140        @.      CBZ      r0,0x2ba ; __printf + 94
        0x000002a8:    2801        .(      CMP      r0,#1
        0x000002aa:    d004        ..      BEQ      0x2b6 ; __printf + 90
        0x000002ac:    1df6        ..      ADDS     r6,r6,#7
        0x000002ae:    f0260607    &...    BIC      r6,r6,#7
        0x000002b2:    3608        .6      ADDS     r6,r6,#8
        0x000002b4:    e7d8        ..      B        0x268 ; __printf + 12
        0x000002b6:    1d36        6.      ADDS     r6,r6,#4
        0x000002b8:    e7d6        ..      B        0x268 ; __printf + 12
        0x000002ba:    4628        (F      MOV      r0,r5
        0x000002bc:    e7da        ..      B        0x274 ; __printf + 24
        0x000002be:    6a20         j      LDR      r0,[r4,#0x20]
        0x000002c0:    e8bd81f0    ....    POP      {r4-r8,pc}
    .text
    _printf_str
        0x000002c4:    b570        p.      PUSH     {r4-r6,lr}
        0x000002c6:    460c        .F      MOV      r4,r1
        0x000002c8:    4605        .F      MOV      r5,r0
        0x000002ca:    2a01        .*      CMP      r2,#1
        0x000002cc:    d005        ..      BEQ      0x2da ; _printf_str + 22
        0x000002ce:    7828        (x      LDRB     r0,[r5,#0]
        0x000002d0:    0680        ..      LSLS     r0,r0,#26
        0x000002d2:    d500        ..      BPL      0x2d6 ; _printf_str + 18
        0x000002d4:    69ea        .i      LDR      r2,[r5,#0x1c]
        0x000002d6:    2300        .#      MOVS     r3,#0
        0x000002d8:    e002        ..      B        0x2e0 ; _printf_str + 28
        0x000002da:    2301        .#      MOVS     r3,#1
        0x000002dc:    e005        ..      B        0x2ea ; _printf_str + 38
        0x000002de:    1c5b        [.      ADDS     r3,r3,#1
        0x000002e0:    4293        .B      CMP      r3,r2
        0x000002e2:    d202        ..      BCS      0x2ea ; _printf_str + 38
        0x000002e4:    5ce0        .\      LDRB     r0,[r4,r3]
        0x000002e6:    2800        .(      CMP      r0,#0
        0x000002e8:    d1f9        ..      BNE      0x2de ; _printf_str + 26
        0x000002ea:    69a8        .i      LDR      r0,[r5,#0x18]
        0x000002ec:    18e6        ..      ADDS     r6,r4,r3
        0x000002ee:    1ac0        ..      SUBS     r0,r0,r3
        0x000002f0:    61a8        .a      STR      r0,[r5,#0x18]
        0x000002f2:    6a28        (j      LDR      r0,[r5,#0x20]
        0x000002f4:    4418        .D      ADD      r0,r0,r3
        0x000002f6:    6228        (b      STR      r0,[r5,#0x20]
        0x000002f8:    4628        (F      MOV      r0,r5
        0x000002fa:    f3af8000    ....    NOP.W    
        0x000002fe:    e004        ..      B        0x30a ; _printf_str + 70
        0x00000300:    e9d52101    ...!    LDRD     r2,r1,[r5,#4]
        0x00000304:    f8140b01    ....    LDRB     r0,[r4],#1
        0x00000308:    4790        .G      BLX      r2
        0x0000030a:    42b4        .B      CMP      r4,r6
        0x0000030c:    d3f8        ..      BCC      0x300 ; _printf_str + 60
        0x0000030e:    4628        (F      MOV      r0,r5
        0x00000310:    f3af8000    ....    NOP.W    
        0x00000314:    bd70        p.      POP      {r4-r6,pc}
        0x00000316:    0000        ..      MOVS     r0,r0
    .text
    _printf_int_dec
        0x00000318:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000031c:    4606        .F      MOV      r6,r0
        0x0000031e:    2400        .$      MOVS     r4,#0
        0x00000320:    6810        .h      LDR      r0,[r2,#0]
        0x00000322:    2975        u)      CMP      r1,#0x75
        0x00000324:    4631        1F      MOV      r1,r6
        0x00000326:    a516        ..      ADR      r5,{pc}+0x5a ; 0x380
        0x00000328:    d010        ..      BEQ      0x34c ; _printf_int_dec + 52
        0x0000032a:    f3af8000    ....    NOP.W    
        0x0000032e:    2800        .(      CMP      r0,#0
        0x00000330:    da02        ..      BGE      0x338 ; _printf_int_dec + 32
        0x00000332:    4240        @B      RSBS     r0,r0,#0
        0x00000334:    a513        ..      ADR      r5,{pc}+0x50 ; 0x384
        0x00000336:    e007        ..      B        0x348 ; _printf_int_dec + 48
        0x00000338:    6831        1h      LDR      r1,[r6,#0]
        0x0000033a:    078a        ..      LSLS     r2,r1,#30
        0x0000033c:    d501        ..      BPL      0x342 ; _printf_int_dec + 42
        0x0000033e:    a512        ..      ADR      r5,{pc}+0x4a ; 0x388
        0x00000340:    e002        ..      B        0x348 ; _printf_int_dec + 48
        0x00000342:    0749        I.      LSLS     r1,r1,#29
        0x00000344:    d504        ..      BPL      0x350 ; _printf_int_dec + 56
        0x00000346:    a511        ..      ADR      r5,{pc}+0x46 ; 0x38c
        0x00000348:    2401        .$      MOVS     r4,#1
        0x0000034a:    e001        ..      B        0x350 ; _printf_int_dec + 56
        0x0000034c:    f3af8000    ....    NOP.W    
        0x00000350:    2100        .!      MOVS     r1,#0
        0x00000352:    220a        ."      MOVS     r2,#0xa
        0x00000354:    f1060724    ..$.    ADD      r7,r6,#0x24
        0x00000358:    e009        ..      B        0x36e ; _printf_int_dec + 86
        0x0000035a:    fbb0fcf2    ....    UDIV     r12,r0,r2
        0x0000035e:    fbb0f3f2    ....    UDIV     r3,r0,r2
        0x00000362:    fb02001c    ....    MLS      r0,r2,r12,r0
        0x00000366:    3030        00      ADDS     r0,r0,#0x30
        0x00000368:    5478        xT      STRB     r0,[r7,r1]
        0x0000036a:    4618        .F      MOV      r0,r3
        0x0000036c:    1c49        I.      ADDS     r1,r1,#1
        0x0000036e:    2800        .(      CMP      r0,#0
        0x00000370:    d1f3        ..      BNE      0x35a ; _printf_int_dec + 66
        0x00000372:    4623        #F      MOV      r3,r4
        0x00000374:    462a        *F      MOV      r2,r5
        0x00000376:    4630        0F      MOV      r0,r6
        0x00000378:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x0000037c:    f000b83e    ..>.    B.W      _printf_int_common ; 0x3fc
    $d
        0x00000380:    00000000    ....    DCD    0
        0x00000384:    0000002d    -...    DCD    45
        0x00000388:    0000002b    +...    DCD    43
        0x0000038c:    00000020     ...    DCD    32
    $t
    .text
    abort
        0x00000390:    b510        ..      PUSH     {r4,lr}
        0x00000392:    2000        .       MOVS     r0,#0
        0x00000394:    f000f8b4    ....    BL       __rt_SIGABRT ; 0x500
        0x00000398:    f7ffff22    ..".    BL       __rt_lib_shutdown ; 0x1e0
        0x0000039c:    e8bd4010    ...@    POP      {r4,lr}
        0x000003a0:    2001        .       MOVS     r0,#1
        0x000003a2:    f000b825    ..%.    B.W      _sys_exit ; 0x3f0
    .text
    __aeabi_memclr
    __rt_memclr
        0x000003a6:    f04f0200    O...    MOV      r2,#0
    _memset
        0x000003aa:    2904        .)      CMP      r1,#4
        0x000003ac:    f0c08012    ....    BCC.W    0x3d4 ; _memset + 42
        0x000003b0:    f0100c03    ....    ANDS     r12,r0,#3
        0x000003b4:    f00080ad    ....    BEQ.W    _memset_w ; 0x512
        0x000003b8:    f1cc0c04    ....    RSB      r12,r12,#4
        0x000003bc:    f1bc0f02    ....    CMP      r12,#2
        0x000003c0:    bf18        ..      IT       NE
        0x000003c2:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x000003c6:    bfa8        ..      IT       GE
        0x000003c8:    f8202b02     ..+    STRHGE   r2,[r0],#2
        0x000003cc:    eba1010c    ....    SUB      r1,r1,r12
        0x000003d0:    f000b89f    ....    B.W      _memset_w ; 0x512
        0x000003d4:    ea5f7cc1    _..|    LSLS     r12,r1,#31
        0x000003d8:    bf24        $.      ITT      CS
        0x000003da:    f8002b01    ...+    STRBCS   r2,[r0],#1
        0x000003de:    f8002b01    ...+    STRBCS   r2,[r0],#1
        0x000003e2:    bf48        H.      IT       MI
        0x000003e4:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000003e8:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x000003ea:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x000003ec:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x000003ee:    4770        pG      BX       lr
    .text
    _sys_exit
        0x000003f0:    4901        .I      LDR      r1,[pc,#4] ; [0x3f8] = 0x20026
        0x000003f2:    2018        .       MOVS     r0,#0x18
        0x000003f4:    beab        ..      BKPT     #0xab
        0x000003f6:    e7fe        ..      B        0x3f6 ; _sys_exit + 6
    $d
        0x000003f8:    00020026    &...    DCD    131110
    $t
    .text
    _printf_int_common
        0x000003fc:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000400:    460d        .F      MOV      r5,r1
        0x00000402:    4699        .F      MOV      r9,r3
        0x00000404:    4692        .F      MOV      r10,r2
        0x00000406:    4604        .F      MOV      r4,r0
        0x00000408:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x0000040c:    6801        .h      LDR      r1,[r0,#0]
        0x0000040e:    0688        ..      LSLS     r0,r1,#26
        0x00000410:    d504        ..      BPL      0x41c ; _printf_int_common + 32
        0x00000412:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x00000414:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000418:    6021        !`      STR      r1,[r4,#0]
        0x0000041a:    e000        ..      B        0x41e ; _printf_int_common + 34
        0x0000041c:    2001        .       MOVS     r0,#1
        0x0000041e:    42a8        .B      CMP      r0,r5
        0x00000420:    dd01        ..      BLE      0x426 ; _printf_int_common + 42
        0x00000422:    1b47        G.      SUBS     r7,r0,r5
        0x00000424:    e000        ..      B        0x428 ; _printf_int_common + 44
        0x00000426:    2700        .'      MOVS     r7,#0
        0x00000428:    69a1        .i      LDR      r1,[r4,#0x18]
        0x0000042a:    197a        z.      ADDS     r2,r7,r5
        0x0000042c:    eb020009    ....    ADD      r0,r2,r9
        0x00000430:    1a08        ..      SUBS     r0,r1,r0
        0x00000432:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000434:    7820         x      LDRB     r0,[r4,#0]
        0x00000436:    06c0        ..      LSLS     r0,r0,#27
        0x00000438:    d402        ..      BMI      0x440 ; _printf_int_common + 68
        0x0000043a:    4620         F      MOV      r0,r4
        0x0000043c:    f3af8000    ....    NOP.W    
        0x00000440:    2600        .&      MOVS     r6,#0
        0x00000442:    e008        ..      B        0x456 ; _printf_int_common + 90
        0x00000444:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000448:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x0000044c:    4790        .G      BLX      r2
        0x0000044e:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000450:    1c40        @.      ADDS     r0,r0,#1
        0x00000452:    1c76        v.      ADDS     r6,r6,#1
        0x00000454:    6220         b      STR      r0,[r4,#0x20]
        0x00000456:    454e        NE      CMP      r6,r9
        0x00000458:    dbf4        ..      BLT      0x444 ; _printf_int_common + 72
        0x0000045a:    7820         x      LDRB     r0,[r4,#0]
        0x0000045c:    06c0        ..      LSLS     r0,r0,#27
        0x0000045e:    d50a        ..      BPL      0x476 ; _printf_int_common + 122
        0x00000460:    4620         F      MOV      r0,r4
        0x00000462:    f3af8000    ....    NOP.W    
        0x00000466:    e006        ..      B        0x476 ; _printf_int_common + 122
        0x00000468:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x0000046c:    2030        0       MOVS     r0,#0x30
        0x0000046e:    4790        .G      BLX      r2
        0x00000470:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000472:    1c40        @.      ADDS     r0,r0,#1
        0x00000474:    6220         b      STR      r0,[r4,#0x20]
        0x00000476:    1e38        8.      SUBS     r0,r7,#0
        0x00000478:    f1a70701    ....    SUB      r7,r7,#1
        0x0000047c:    dcf4        ..      BGT      0x468 ; _printf_int_common + 108
        0x0000047e:    e007        ..      B        0x490 ; _printf_int_common + 148
        0x00000480:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000484:    f8180005    ....    LDRB     r0,[r8,r5]
        0x00000488:    4790        .G      BLX      r2
        0x0000048a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000048c:    1c40        @.      ADDS     r0,r0,#1
        0x0000048e:    6220         b      STR      r0,[r4,#0x20]
        0x00000490:    1e28        (.      SUBS     r0,r5,#0
        0x00000492:    f1a50501    ....    SUB      r5,r5,#1
        0x00000496:    dcf3        ..      BGT      0x480 ; _printf_int_common + 132
        0x00000498:    4620         F      MOV      r0,r4
        0x0000049a:    f3af8000    ....    NOP.W    
        0x0000049e:    7820         x      LDRB     r0,[r4,#0]
        0x000004a0:    0600        ..      LSLS     r0,r0,#24
        0x000004a2:    d502        ..      BPL      0x4aa ; _printf_int_common + 174
        0x000004a4:    2002        .       MOVS     r0,#2
        0x000004a6:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000004aa:    2001        .       MOVS     r0,#1
        0x000004ac:    e7fb        ..      B        0x4a6 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x000004ae:    b510        ..      PUSH     {r4,lr}
        0x000004b0:    6943        Ci      LDR      r3,[r0,#0x14]
        0x000004b2:    b113        ..      CBZ      r3,0x4ba ; _printf_cs_common + 12
        0x000004b4:    f3af8000    ....    NOP.W    
        0x000004b8:    e001        ..      B        0x4be ; _printf_cs_common + 16
        0x000004ba:    f7ffff03    ....    BL       _printf_str ; 0x2c4
        0x000004be:    2001        .       MOVS     r0,#1
        0x000004c0:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x000004c2:    7812        .x      LDRB     r2,[r2,#0]
        0x000004c4:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x000004c8:    700a        .p      STRB     r2,[r1,#0]
        0x000004ca:    2200        ."      MOVS     r2,#0
        0x000004cc:    704a        Jp      STRB     r2,[r1,#1]
        0x000004ce:    2201        ."      MOVS     r2,#1
        0x000004d0:    e7ed        ..      B        _printf_cs_common ; 0x4ae
    _printf_string
        0x000004d2:    6811        .h      LDR      r1,[r2,#0]
        0x000004d4:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x000004d8:    e7e9        ..      B        _printf_cs_common ; 0x4ae
        0x000004da:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x000004dc:    4b07        .K      LDR      r3,[pc,#28] ; [0x4fc] = 0x2887
        0x000004de:    b570        p.      PUSH     {r4-r6,lr}
        0x000004e0:    460d        .F      MOV      r5,r1
        0x000004e2:    447b        {D      ADD      r3,r3,pc
        0x000004e4:    f000f841    ..A.    BL       _printf_char_common ; 0x56a
        0x000004e8:    4604        .F      MOV      r4,r0
        0x000004ea:    4628        (F      MOV      r0,r5
        0x000004ec:    f000f850    ..P.    BL       ferror ; 0x590
        0x000004f0:    b110        ..      CBZ      r0,0x4f8 ; _printf_char_file + 28
        0x000004f2:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000004f6:    bd70        p.      POP      {r4-r6,pc}
        0x000004f8:    4620         F      MOV      r0,r4
        0x000004fa:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000004fc:    00002887    .(..    DCD    10375
    $t
    .text
    __rt_SIGABRT
        0x00000500:    b510        ..      PUSH     {r4,lr}
        0x00000502:    f000f84f    ..O.    BL       __rt_SIGABRT_inner ; 0x5a4
        0x00000506:    e8bd4010    ...@    POP      {r4,lr}
        0x0000050a:    f000b845    ..E.    B.W      __sig_exit ; 0x598
    .text
    __aeabi_memclr4
    __aeabi_memclr8
    __rt_memclr_w
        0x0000050e:    f04f0200    O...    MOV      r2,#0
    _memset_w
        0x00000512:    b500        ..      PUSH     {lr}
        0x00000514:    4613        .F      MOV      r3,r2
        0x00000516:    4694        .F      MOV      r12,r2
        0x00000518:    4696        .F      MOV      lr,r2
        0x0000051a:    3920         9      SUBS     r1,r1,#0x20
        0x0000051c:    bf22        ".      ITTT     CS
        0x0000051e:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x00000522:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x00000526:    f1b10120    .. .    SUBSCS   r1,r1,#0x20
        0x0000052a:    f4bfaff7    ....    BCS.W    0x51c ; _memset_w + 10
        0x0000052e:    0709        ..      LSLS     r1,r1,#28
        0x00000530:    bf28        (.      IT       CS
        0x00000532:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x00000536:    bf48        H.      IT       MI
        0x00000538:    c00c        ..      STMMI    r0!,{r2,r3}
        0x0000053a:    f85deb04    ]...    POP      {lr}
        0x0000053e:    0089        ..      LSLS     r1,r1,#2
        0x00000540:    bf28        (.      IT       CS
        0x00000542:    f8402b04    @..+    STRCS    r2,[r0],#4
        0x00000546:    bf08        ..      IT       EQ
        0x00000548:    4770        pG      BXEQ     lr
        0x0000054a:    bf48        H.      IT       MI
        0x0000054c:    f8202b02     ..+    STRHMI   r2,[r0],#2
        0x00000550:    f0114f80    ...O    TST      r1,#0x40000000
        0x00000554:    bf18        ..      IT       NE
        0x00000556:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x0000055a:    4770        pG      BX       lr
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x0000055c:    4770        pG      BX       lr
    .text
    __semihosting_library_function
        0x0000055e:    0000        ..      MOVS     r0,r0
    .text
    _printf_input_char
        0x00000560:    6901        .i      LDR      r1,[r0,#0x10]
        0x00000562:    1c4a        J.      ADDS     r2,r1,#1
        0x00000564:    6102        .a      STR      r2,[r0,#0x10]
        0x00000566:    7808        .x      LDRB     r0,[r1,#0]
        0x00000568:    4770        pG      BX       lr
    _printf_char_common
        0x0000056a:    b500        ..      PUSH     {lr}
        0x0000056c:    b08f        ..      SUB      sp,sp,#0x3c
        0x0000056e:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x00000572:    2100        .!      MOVS     r1,#0
        0x00000574:    9105        ..      STR      r1,[sp,#0x14]
        0x00000576:    4905        .I      LDR      r1,[pc,#20] ; [0x58c] = 0xffffffe5
        0x00000578:    4479        yD      ADD      r1,r1,pc
        0x0000057a:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x0000057e:    4611        .F      MOV      r1,r2
        0x00000580:    4668        hF      MOV      r0,sp
        0x00000582:    f7fffe6b    ..k.    BL       __printf ; 0x25c
        0x00000586:    b00f        ..      ADD      sp,sp,#0x3c
        0x00000588:    bd00        ..      POP      {pc}
    $d
        0x0000058a:    0000        ..      DCW    0
        0x0000058c:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x00000590:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x00000592:    f0000080    ....    AND      r0,r0,#0x80
        0x00000596:    4770        pG      BX       lr
    .text
    __sig_exit
        0x00000598:    2800        .(      CMP      r0,#0
        0x0000059a:    d001        ..      BEQ      0x5a0 ; __sig_exit + 8
        0x0000059c:    f7ffbf28    ..(.    B.W      _sys_exit ; 0x3f0
        0x000005a0:    4770        pG      BX       lr
        0x000005a2:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGABRT_inner
        0x000005a4:    b510        ..      PUSH     {r4,lr}
        0x000005a6:    2100        .!      MOVS     r1,#0
        0x000005a8:    a002        ..      ADR      r0,{pc}+0xc ; 0x5b4
        0x000005aa:    f000f841    ..A.    BL       __default_signal_display ; 0x630
        0x000005ae:    2001        .       MOVS     r0,#1
        0x000005b0:    bd10        ..      POP      {r4,pc}
    $d
        0x000005b2:    0000        ..      DCW    0
        0x000005b4:    41474953    SIGA    DCD    1095190867
        0x000005b8:    3a545242    BRT:    DCD    978604610
        0x000005bc:    6e624120     Abn    DCD    1851932960
        0x000005c0:    616d726f    orma    DCD    1634562671
        0x000005c4:    6574206c    l te    DCD    1702109292
        0x000005c8:    6e696d72    rmin    DCD    1852403058
        0x000005cc:    6f697461    atio    DCD    1869182049
        0x000005d0:    0000006e    n...    DCD    110
    $t
    .text
    __user_setup_stackheap
        0x000005d4:    4675        uF      MOV      r5,lr
        0x000005d6:    f000f84b    ..K.    BL       __user_libspace ; 0x670
        0x000005da:    46ae        .F      MOV      lr,r5
        0x000005dc:    0005        ..      MOVS     r5,r0
        0x000005de:    4669        iF      MOV      r1,sp
        0x000005e0:    4653        SF      MOV      r3,r10
        0x000005e2:    f0200007     ...    BIC      r0,r0,#7
        0x000005e6:    4685        .F      MOV      sp,r0
        0x000005e8:    b018        ..      ADD      sp,sp,#0x60
        0x000005ea:    b520         .      PUSH     {r5,lr}
        0x000005ec:    f7fffe18    ....    BL       __user_initial_stackheap ; 0x220
        0x000005f0:    e8bd4020    .. @    POP      {r5,lr}
        0x000005f4:    f04f0600    O...    MOV      r6,#0
        0x000005f8:    f04f0700    O...    MOV      r7,#0
        0x000005fc:    f04f0800    O...    MOV      r8,#0
        0x00000600:    f04f0b00    O...    MOV      r11,#0
        0x00000604:    f0210107    !...    BIC      r1,r1,#7
        0x00000608:    46ac        .F      MOV      r12,r5
        0x0000060a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000060e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000612:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000616:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000061a:    468d        .F      MOV      sp,r1
        0x0000061c:    4770        pG      BX       lr
    .text
    exit
        0x0000061e:    b510        ..      PUSH     {r4,lr}
        0x00000620:    4604        .F      MOV      r4,r0
        0x00000622:    f3af8000    ....    NOP.W    
        0x00000626:    4620         F      MOV      r0,r4
        0x00000628:    e8bd4010    ...@    POP      {r4,lr}
        0x0000062c:    f7ffbde3    ....    B.W      __rt_exit ; 0x1f6
    .text
    __default_signal_display
        0x00000630:    b570        p.      PUSH     {r4-r6,lr}
        0x00000632:    4605        .F      MOV      r5,r0
        0x00000634:    460c        .F      MOV      r4,r1
        0x00000636:    200a        .       MOVS     r0,#0xa
        0x00000638:    e000        ..      B        0x63c ; __default_signal_display + 12
        0x0000063a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000063c:    f000f811    ....    BL       _ttywrch ; 0x662
        0x00000640:    b135        5.      CBZ      r5,0x650 ; __default_signal_display + 32
        0x00000642:    7828        (x      LDRB     r0,[r5,#0]
        0x00000644:    2800        .(      CMP      r0,#0
        0x00000646:    d1f8        ..      BNE      0x63a ; __default_signal_display + 10
        0x00000648:    e002        ..      B        0x650 ; __default_signal_display + 32
        0x0000064a:    1c64        d.      ADDS     r4,r4,#1
        0x0000064c:    f000f809    ....    BL       _ttywrch ; 0x662
        0x00000650:    b114        ..      CBZ      r4,0x658 ; __default_signal_display + 40
        0x00000652:    7820         x      LDRB     r0,[r4,#0]
        0x00000654:    2800        .(      CMP      r0,#0
        0x00000656:    d1f8        ..      BNE      0x64a ; __default_signal_display + 26
        0x00000658:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x0000065c:    200a        .       MOVS     r0,#0xa
        0x0000065e:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x00000662:    b508        ..      PUSH     {r3,lr}
        0x00000664:    4669        iF      MOV      r1,sp
        0x00000666:    f88d0000    ....    STRB     r0,[sp,#0]
        0x0000066a:    2003        .       MOVS     r0,#3
        0x0000066c:    beab        ..      BKPT     #0xab
        0x0000066e:    bd08        ..      POP      {r3,pc}
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000670:    4800        .H      LDR      r0,[pc,#0] ; [0x674] = 0x200004b0
        0x00000672:    4770        pG      BX       lr
    $d
        0x00000674:    200004b0    ...     DCD    536872112
    $t
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x00000678:    4905        .I      LDR      r1,[pc,#20] ; [0x690] = 0x88
        0x0000067a:    b510        ..      PUSH     {r4,lr}
        0x0000067c:    3128        (1      ADDS     r1,r1,#0x28
        0x0000067e:    d004        ..      BEQ      0x68a ; ADCC0_IRQHandler + 18
        0x00000680:    6848        Hh      LDR      r0,[r1,#4]
        0x00000682:    6809        .h      LDR      r1,[r1,#0]
        0x00000684:    e8bd4010    ...@    POP      {r4,lr}
        0x00000688:    4708        .G      BX       r1
        0x0000068a:    f7fffe81    ....    BL       abort ; 0x390
    $d
        0x0000068e:    0000        ..      DCW    0
        0x00000690:    00000088    ....    DCD    136
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x00000694:    4905        .I      LDR      r1,[pc,#20] ; [0x6ac] = 0x88
        0x00000696:    b510        ..      PUSH     {r4,lr}
        0x00000698:    3130        01      ADDS     r1,r1,#0x30
        0x0000069a:    d004        ..      BEQ      0x6a6 ; ADCC1_IRQHandler + 18
        0x0000069c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000069e:    6809        .h      LDR      r1,[r1,#0]
        0x000006a0:    e8bd4010    ...@    POP      {r4,lr}
        0x000006a4:    4708        .G      BX       r1
        0x000006a6:    f7fffe73    ..s.    BL       abort ; 0x390
    $d
        0x000006aa:    0000        ..      DCW    0
        0x000006ac:    00000088    ....    DCD    136
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x000006b0:    4905        .I      LDR      r1,[pc,#20] ; [0x6c8] = 0x88
        0x000006b2:    b510        ..      PUSH     {r4,lr}
        0x000006b4:    3138        81      ADDS     r1,r1,#0x38
        0x000006b6:    d004        ..      BEQ      0x6c2 ; ADCC2_IRQHandler + 18
        0x000006b8:    6848        Hh      LDR      r0,[r1,#4]
        0x000006ba:    6809        .h      LDR      r1,[r1,#0]
        0x000006bc:    e8bd4010    ...@    POP      {r4,lr}
        0x000006c0:    4708        .G      BX       r1
        0x000006c2:    f7fffe65    ..e.    BL       abort ; 0x390
    $d
        0x000006c6:    0000        ..      DCW    0
        0x000006c8:    00000088    ....    DCD    136
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x000006cc:    4905        .I      LDR      r1,[pc,#20] ; [0x6e4] = 0x88
        0x000006ce:    b510        ..      PUSH     {r4,lr}
        0x000006d0:    3140        @1      ADDS     r1,r1,#0x40
        0x000006d2:    d004        ..      BEQ      0x6de ; ADCC3_IRQHandler + 18
        0x000006d4:    6848        Hh      LDR      r0,[r1,#4]
        0x000006d6:    6809        .h      LDR      r1,[r1,#0]
        0x000006d8:    e8bd4010    ...@    POP      {r4,lr}
        0x000006dc:    4708        .G      BX       r1
        0x000006de:    f7fffe57    ..W.    BL       abort ; 0x390
    $d
        0x000006e2:    0000        ..      DCW    0
        0x000006e4:    00000088    ....    DCD    136
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x000006e8:    4905        .I      LDR      r1,[pc,#20] ; [0x700] = 0x88
        0x000006ea:    b510        ..      PUSH     {r4,lr}
        0x000006ec:    3148        H1      ADDS     r1,r1,#0x48
        0x000006ee:    d004        ..      BEQ      0x6fa ; ADCC4_IRQHandler + 18
        0x000006f0:    6848        Hh      LDR      r0,[r1,#4]
        0x000006f2:    6809        .h      LDR      r1,[r1,#0]
        0x000006f4:    e8bd4010    ...@    POP      {r4,lr}
        0x000006f8:    4708        .G      BX       r1
        0x000006fa:    f7fffe49    ..I.    BL       abort ; 0x390
    $d
        0x000006fe:    0000        ..      DCW    0
        0x00000700:    00000088    ....    DCD    136
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x00000704:    4905        .I      LDR      r1,[pc,#20] ; [0x71c] = 0x88
        0x00000706:    b510        ..      PUSH     {r4,lr}
        0x00000708:    3150        P1      ADDS     r1,r1,#0x50
        0x0000070a:    d004        ..      BEQ      0x716 ; ADCC5_IRQHandler + 18
        0x0000070c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000070e:    6809        .h      LDR      r1,[r1,#0]
        0x00000710:    e8bd4010    ...@    POP      {r4,lr}
        0x00000714:    4708        .G      BX       r1
        0x00000716:    f7fffe3b    ..;.    BL       abort ; 0x390
    $d
        0x0000071a:    0000        ..      DCW    0
        0x0000071c:    00000088    ....    DCD    136
    $t
    i.CH0_Deploy
    CH0_Deploy
        0x00000720:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00000722:    4c17        .L      LDR      r4,[pc,#92] ; [0x780] = 0x2000039c
        0x00000724:    2500        .%      MOVS     r5,#0
        0x00000726:    4e17        .N      LDR      r6,[pc,#92] ; [0x784] = 0x2000035c
        0x00000728:    61a5        .a      STR      r5,[r4,#0x18]
        0x0000072a:    f1b27f80    ....    CMP      r2,#0x1000000
        0x0000072e:    6035        5`      STR      r5,[r6,#0]
        0x00000730:    d301        ..      BCC      0x736 ; CH0_Deploy + 22
        0x00000732:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00000736:    1a09        ..      SUBS     r1,r1,r0
        0x00000738:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x0000073c:    65a2        .e      STR      r2,[r4,#0x58]
        0x0000073e:    f2402271    @.q"    MOV      r2,#0x271
        0x00000742:    4356        VC      MULS     r6,r2,r6
        0x00000744:    0117        ..      LSLS     r7,r2,#4
        0x00000746:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x0000074a:    0052        R.      LSLS     r2,r2,#1
        0x0000074c:    4b0e        .K      LDR      r3,[pc,#56] ; [0x788] = 0x200002d4
        0x0000074e:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00000752:    d204        ..      BCS      0x75e ; CH0_Deploy + 62
        0x00000754:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00000758:    7025        %p      STRB     r5,[r4,#0]
        0x0000075a:    0049        I.      LSLS     r1,r1,#1
        0x0000075c:    e003        ..      B        0x766 ; CH0_Deploy + 70
        0x0000075e:    2501        .%      MOVS     r5,#1
        0x00000760:    7025        %p      STRB     r5,[r4,#0]
        0x00000762:    4d0a        .M      LDR      r5,[pc,#40] ; [0x78c] = 0x186a0
        0x00000764:    4369        iC      MULS     r1,r5,r1
        0x00000766:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x0000076a:    6019        .`      STR      r1,[r3,#0]
        0x0000076c:    4908        .I      LDR      r1,[pc,#32] ; [0x790] = 0x5f5e100
        0x0000076e:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000772:    4908        .I      LDR      r1,[pc,#32] ; [0x794] = 0x2000a000
        0x00000774:    6208        .b      STR      r0,[r1,#0x20]
        0x00000776:    4908        .I      LDR      r1,[pc,#32] ; [0x798] = 0x2000e000
        0x00000778:    6da0        .m      LDR      r0,[r4,#0x58]
        0x0000077a:    6208        .b      STR      r0,[r1,#0x20]
        0x0000077c:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x0000077e:    0000        ..      DCW    0
        0x00000780:    2000039c    ...     DCD    536871836
        0x00000784:    2000035c    \..     DCD    536871772
        0x00000788:    200002d4    ...     DCD    536871636
        0x0000078c:    000186a0    ....    DCD    100000
        0x00000790:    05f5e100    ....    DCD    100000000
        0x00000794:    2000a000    ...     DCD    536911872
        0x00000798:    2000e000    ...     DCD    536928256
    $t
    i.CH0_OPREA
    CH0_OPREA
        0x0000079c:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x000007a0:    4938        8I      LDR      r1,[pc,#224] ; [0x884] = 0x20008000
        0x000007a2:    6848        Hh      LDR      r0,[r1,#4]
        0x000007a4:    4838        8H      LDR      r0,[pc,#224] ; [0x888] = 0x200003b4
        0x000007a6:    684c        Lh      LDR      r4,[r1,#4]
        0x000007a8:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0x890] = 0x20000350
        0x000007ac:    6004        .`      STR      r4,[r0,#0]
        0x000007ae:    4837        7H      LDR      r0,[pc,#220] ; [0x88c] = 0x200003f4
        0x000007b0:    4a38        8J      LDR      r2,[pc,#224] ; [0x894] = 0x2000039c
        0x000007b2:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x000007b6:    6801        .h      LDR      r1,[r0,#0]
        0x000007b8:    f6404735    @.5G    MOV      r7,#0xc35
        0x000007bc:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x000007c0:    6001        .`      STR      r1,[r0,#0]
        0x000007c2:    4689        .F      MOV      r9,r1
        0x000007c4:    4934        4I      LDR      r1,[pc,#208] ; [0x898] = 0x20000048
        0x000007c6:    4832        2H      LDR      r0,[pc,#200] ; [0x890] = 0x20000350
        0x000007c8:    7816        .x      LDRB     r6,[r2,#0]
        0x000007ca:    8809        ..      LDRH     r1,[r1,#0]
        0x000007cc:    68c0        .h      LDR      r0,[r0,#0xc]
        0x000007ce:    fb01f507    ....    MUL      r5,r1,r7
        0x000007d2:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x000007d6:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0x89c] = 0x3b9aca00
        0x000007da:    4b31        1K      LDR      r3,[pc,#196] ; [0x8a0] = 0x2000a000
        0x000007dc:    f8da2004    ...     LDR      r2,[r10,#4]
        0x000007e0:    f8da104c    ..L.    LDR      r1,[r10,#0x4c]
        0x000007e4:    4284        .B      CMP      r4,r0
        0x000007e6:    d218        ..      BCS      0x81a ; CH0_OPREA + 126
        0x000007e8:    4650        PF      MOV      r0,r10
        0x000007ea:    b109        ..      CBZ      r1,0x7f0 ; CH0_OPREA + 84
        0x000007ec:    1e49        I.      SUBS     r1,r1,#1
        0x000007ee:    64c1        .d      STR      r1,[r0,#0x4c]
        0x000007f0:    f8da004c    ..L.    LDR      r0,[r10,#0x4c]
        0x000007f4:    2e01        ..      CMP      r6,#1
        0x000007f6:    fb00f002    ....    MUL      r0,r0,r2
        0x000007fa:    d006        ..      BEQ      0x80a ; CH0_OPREA + 110
        0x000007fc:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x00000800:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00000804:    6218        .b      STR      r0,[r3,#0x20]
        0x00000806:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x0000080a:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x0000080e:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00000812:    f2427110    B..q    MOV      r1,#0x2710
        0x00000816:    4348        HC      MULS     r0,r1,r0
        0x00000818:    e7f4        ..      B        0x804 ; CH0_OPREA + 104
        0x0000081a:    4822        "H      LDR      r0,[pc,#136] ; [0x8a4] = 0x20000068
        0x0000081c:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0x8a8] = 0x20000000
        0x00000820:    8800        ..      LDRH     r0,[r0,#0]
        0x00000822:    f8dec000    ....    LDR      r12,[lr,#0]
        0x00000826:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x0000082a:    f10c0001    ....    ADD      r0,r12,#1
        0x0000082e:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x00000832:    d21a        ..      BCS      0x86a ; CH0_OPREA + 206
        0x00000834:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000838:    2e01        ..      CMP      r6,#1
        0x0000083a:    d00d        ..      BEQ      0x858 ; CH0_OPREA + 188
        0x0000083c:    fb00f102    ....    MUL      r1,r0,r2
        0x00000840:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x00000844:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x00000848:    6219        .b      STR      r1,[r3,#0x20]
        0x0000084a:    4911        .I      LDR      r1,[pc,#68] ; [0x890] = 0x20000350
        0x0000084c:    eba90204    ....    SUB      r2,r9,r4
        0x00000850:    60ca        .`      STR      r2,[r1,#0xc]
        0x00000852:    f8ca004c    ..L.    STR      r0,[r10,#0x4c]
        0x00000856:    e7d6        ..      B        0x806 ; CH0_OPREA + 106
        0x00000858:    4351        QC      MULS     r1,r2,r1
        0x0000085a:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x0000085e:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x00000862:    f2427210    B..r    MOV      r2,#0x2710
        0x00000866:    4351        QC      MULS     r1,r2,r1
        0x00000868:    e7ee        ..      B        0x848 ; CH0_OPREA + 172
        0x0000086a:    d1cc        ..      BNE      0x806 ; CH0_OPREA + 106
        0x0000086c:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000870:    4807        .H      LDR      r0,[pc,#28] ; [0x890] = 0x20000350
        0x00000872:    eba90104    ....    SUB      r1,r9,r4
        0x00000876:    60c1        .`      STR      r1,[r0,#0xc]
        0x00000878:    480c        .H      LDR      r0,[pc,#48] ; [0x8ac] = 0x20000088
        0x0000087a:    490d        .I      LDR      r1,[pc,#52] ; [0x8b0] = 0x5f5e100
        0x0000087c:    6800        .h      LDR      r0,[r0,#0]
        0x0000087e:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000882:    e7bf        ..      B        0x804 ; CH0_OPREA + 104
    $d
        0x00000884:    20008000    ...     DCD    536903680
        0x00000888:    200003b4    ...     DCD    536871860
        0x0000088c:    200003f4    ...     DCD    536871924
        0x00000890:    20000350    P..     DCD    536871760
        0x00000894:    2000039c    ...     DCD    536871836
        0x00000898:    20000048    H..     DCD    536870984
        0x0000089c:    3b9aca00    ...;    DCD    1000000000
        0x000008a0:    2000a000    ...     DCD    536911872
        0x000008a4:    20000068    h..     DCD    536871016
        0x000008a8:    20000000    ...     DCD    536870912
        0x000008ac:    20000088    ...     DCD    536871048
        0x000008b0:    05f5e100    ....    DCD    100000000
    $t
    i.CH1_Deploy
    CH1_Deploy
        0x000008b4:    b5f0        ..      PUSH     {r4-r7,lr}
        0x000008b6:    4c17        .L      LDR      r4,[pc,#92] ; [0x914] = 0x2000039c
        0x000008b8:    2500        .%      MOVS     r5,#0
        0x000008ba:    4e17        .N      LDR      r6,[pc,#92] ; [0x918] = 0x20000360
        0x000008bc:    61e5        .a      STR      r5,[r4,#0x1c]
        0x000008be:    f1b27f80    ....    CMP      r2,#0x1000000
        0x000008c2:    6035        5`      STR      r5,[r6,#0]
        0x000008c4:    d301        ..      BCC      0x8ca ; CH1_Deploy + 22
        0x000008c6:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x000008ca:    1a09        ..      SUBS     r1,r1,r0
        0x000008cc:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x000008d0:    65e2        .e      STR      r2,[r4,#0x5c]
        0x000008d2:    f2402271    @.q"    MOV      r2,#0x271
        0x000008d6:    4356        VC      MULS     r6,r2,r6
        0x000008d8:    0117        ..      LSLS     r7,r2,#4
        0x000008da:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x000008de:    0052        R.      LSLS     r2,r2,#1
        0x000008e0:    4b0e        .K      LDR      r3,[pc,#56] ; [0x91c] = 0x200002d8
        0x000008e2:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x000008e6:    d204        ..      BCS      0x8f2 ; CH1_Deploy + 62
        0x000008e8:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x000008ec:    7065        ep      STRB     r5,[r4,#1]
        0x000008ee:    0049        I.      LSLS     r1,r1,#1
        0x000008f0:    e003        ..      B        0x8fa ; CH1_Deploy + 70
        0x000008f2:    2501        .%      MOVS     r5,#1
        0x000008f4:    7065        ep      STRB     r5,[r4,#1]
        0x000008f6:    4d0a        .M      LDR      r5,[pc,#40] ; [0x920] = 0x186a0
        0x000008f8:    4369        iC      MULS     r1,r5,r1
        0x000008fa:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x000008fe:    6019        .`      STR      r1,[r3,#0]
        0x00000900:    4908        .I      LDR      r1,[pc,#32] ; [0x924] = 0x5f5e100
        0x00000902:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000906:    4908        .I      LDR      r1,[pc,#32] ; [0x928] = 0x2000a000
        0x00000908:    6408        .d      STR      r0,[r1,#0x40]
        0x0000090a:    4908        .I      LDR      r1,[pc,#32] ; [0x92c] = 0x2000e000
        0x0000090c:    6de0        .m      LDR      r0,[r4,#0x5c]
        0x0000090e:    6408        .d      STR      r0,[r1,#0x40]
        0x00000910:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00000912:    0000        ..      DCW    0
        0x00000914:    2000039c    ...     DCD    536871836
        0x00000918:    20000360    `..     DCD    536871776
        0x0000091c:    200002d8    ...     DCD    536871640
        0x00000920:    000186a0    ....    DCD    100000
        0x00000924:    05f5e100    ....    DCD    100000000
        0x00000928:    2000a000    ...     DCD    536911872
        0x0000092c:    2000e000    ...     DCD    536928256
    $t
    i.CH1_OPREA
    CH1_OPREA
        0x00000930:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00000934:    4938        8I      LDR      r1,[pc,#224] ; [0xa18] = 0x20008000
        0x00000936:    6888        .h      LDR      r0,[r1,#8]
        0x00000938:    4838        8H      LDR      r0,[pc,#224] ; [0xa1c] = 0x200003b8
        0x0000093a:    688c        .h      LDR      r4,[r1,#8]
        0x0000093c:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0xa24] = 0x20000350
        0x00000940:    6004        .`      STR      r4,[r0,#0]
        0x00000942:    4837        7H      LDR      r0,[pc,#220] ; [0xa20] = 0x200003f8
        0x00000944:    4a38        8J      LDR      r2,[pc,#224] ; [0xa28] = 0x2000039d
        0x00000946:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x0000094a:    6801        .h      LDR      r1,[r0,#0]
        0x0000094c:    f6404735    @.5G    MOV      r7,#0xc35
        0x00000950:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x00000954:    6001        .`      STR      r1,[r0,#0]
        0x00000956:    4689        .F      MOV      r9,r1
        0x00000958:    4934        4I      LDR      r1,[pc,#208] ; [0xa2c] = 0x2000004a
        0x0000095a:    4832        2H      LDR      r0,[pc,#200] ; [0xa24] = 0x20000350
        0x0000095c:    7816        .x      LDRB     r6,[r2,#0]
        0x0000095e:    8809        ..      LDRH     r1,[r1,#0]
        0x00000960:    6900        .i      LDR      r0,[r0,#0x10]
        0x00000962:    fb01f507    ....    MUL      r5,r1,r7
        0x00000966:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x0000096a:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0xa30] = 0x3b9aca00
        0x0000096e:    4b31        1K      LDR      r3,[pc,#196] ; [0xa34] = 0x2000a000
        0x00000970:    f8da2008    ...     LDR      r2,[r10,#8]
        0x00000974:    f8da1050    ..P.    LDR      r1,[r10,#0x50]
        0x00000978:    4284        .B      CMP      r4,r0
        0x0000097a:    d218        ..      BCS      0x9ae ; CH1_OPREA + 126
        0x0000097c:    4650        PF      MOV      r0,r10
        0x0000097e:    b109        ..      CBZ      r1,0x984 ; CH1_OPREA + 84
        0x00000980:    1e49        I.      SUBS     r1,r1,#1
        0x00000982:    6501        .e      STR      r1,[r0,#0x50]
        0x00000984:    f8da0050    ..P.    LDR      r0,[r10,#0x50]
        0x00000988:    2e01        ..      CMP      r6,#1
        0x0000098a:    fb00f002    ....    MUL      r0,r0,r2
        0x0000098e:    d006        ..      BEQ      0x99e ; CH1_OPREA + 110
        0x00000990:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x00000994:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00000998:    6418        .d      STR      r0,[r3,#0x40]
        0x0000099a:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x0000099e:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x000009a2:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x000009a6:    f2427110    B..q    MOV      r1,#0x2710
        0x000009aa:    4348        HC      MULS     r0,r1,r0
        0x000009ac:    e7f4        ..      B        0x998 ; CH1_OPREA + 104
        0x000009ae:    4822        "H      LDR      r0,[pc,#136] ; [0xa38] = 0x2000006a
        0x000009b0:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0xa3c] = 0x20000004
        0x000009b4:    8800        ..      LDRH     r0,[r0,#0]
        0x000009b6:    f8dec000    ....    LDR      r12,[lr,#0]
        0x000009ba:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x000009be:    f10c0001    ....    ADD      r0,r12,#1
        0x000009c2:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x000009c6:    d21a        ..      BCS      0x9fe ; CH1_OPREA + 206
        0x000009c8:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000009cc:    2e01        ..      CMP      r6,#1
        0x000009ce:    d00d        ..      BEQ      0x9ec ; CH1_OPREA + 188
        0x000009d0:    fb00f102    ....    MUL      r1,r0,r2
        0x000009d4:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x000009d8:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x000009dc:    6419        .d      STR      r1,[r3,#0x40]
        0x000009de:    4911        .I      LDR      r1,[pc,#68] ; [0xa24] = 0x20000350
        0x000009e0:    eba90204    ....    SUB      r2,r9,r4
        0x000009e4:    610a        .a      STR      r2,[r1,#0x10]
        0x000009e6:    f8ca0050    ..P.    STR      r0,[r10,#0x50]
        0x000009ea:    e7d6        ..      B        0x99a ; CH1_OPREA + 106
        0x000009ec:    4351        QC      MULS     r1,r2,r1
        0x000009ee:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x000009f2:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x000009f6:    f2427210    B..r    MOV      r2,#0x2710
        0x000009fa:    4351        QC      MULS     r1,r2,r1
        0x000009fc:    e7ee        ..      B        0x9dc ; CH1_OPREA + 172
        0x000009fe:    d1cc        ..      BNE      0x99a ; CH1_OPREA + 106
        0x00000a00:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000a04:    4807        .H      LDR      r0,[pc,#28] ; [0xa24] = 0x20000350
        0x00000a06:    eba90104    ....    SUB      r1,r9,r4
        0x00000a0a:    6101        .a      STR      r1,[r0,#0x10]
        0x00000a0c:    480c        .H      LDR      r0,[pc,#48] ; [0xa40] = 0x2000008c
        0x00000a0e:    490d        .I      LDR      r1,[pc,#52] ; [0xa44] = 0x5f5e100
        0x00000a10:    6800        .h      LDR      r0,[r0,#0]
        0x00000a12:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000a16:    e7bf        ..      B        0x998 ; CH1_OPREA + 104
    $d
        0x00000a18:    20008000    ...     DCD    536903680
        0x00000a1c:    200003b8    ...     DCD    536871864
        0x00000a20:    200003f8    ...     DCD    536871928
        0x00000a24:    20000350    P..     DCD    536871760
        0x00000a28:    2000039d    ...     DCD    536871837
        0x00000a2c:    2000004a    J..     DCD    536870986
        0x00000a30:    3b9aca00    ...;    DCD    1000000000
        0x00000a34:    2000a000    ...     DCD    536911872
        0x00000a38:    2000006a    j..     DCD    536871018
        0x00000a3c:    20000004    ...     DCD    536870916
        0x00000a40:    2000008c    ...     DCD    536871052
        0x00000a44:    05f5e100    ....    DCD    100000000
    $t
    i.CH2_Deploy
    CH2_Deploy
        0x00000a48:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00000a4a:    4c17        .L      LDR      r4,[pc,#92] ; [0xaa8] = 0x2000039c
        0x00000a4c:    2500        .%      MOVS     r5,#0
        0x00000a4e:    4e17        .N      LDR      r6,[pc,#92] ; [0xaac] = 0x20000364
        0x00000a50:    6225        %b      STR      r5,[r4,#0x20]
        0x00000a52:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00000a56:    6035        5`      STR      r5,[r6,#0]
        0x00000a58:    d301        ..      BCC      0xa5e ; CH2_Deploy + 22
        0x00000a5a:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00000a5e:    1a09        ..      SUBS     r1,r1,r0
        0x00000a60:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x00000a64:    6622        "f      STR      r2,[r4,#0x60]
        0x00000a66:    f2402271    @.q"    MOV      r2,#0x271
        0x00000a6a:    4356        VC      MULS     r6,r2,r6
        0x00000a6c:    0117        ..      LSLS     r7,r2,#4
        0x00000a6e:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00000a72:    0052        R.      LSLS     r2,r2,#1
        0x00000a74:    4b0e        .K      LDR      r3,[pc,#56] ; [0xab0] = 0x200002dc
        0x00000a76:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00000a7a:    d204        ..      BCS      0xa86 ; CH2_Deploy + 62
        0x00000a7c:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00000a80:    70a5        .p      STRB     r5,[r4,#2]
        0x00000a82:    0049        I.      LSLS     r1,r1,#1
        0x00000a84:    e003        ..      B        0xa8e ; CH2_Deploy + 70
        0x00000a86:    2501        .%      MOVS     r5,#1
        0x00000a88:    70a5        .p      STRB     r5,[r4,#2]
        0x00000a8a:    4d0a        .M      LDR      r5,[pc,#40] ; [0xab4] = 0x186a0
        0x00000a8c:    4369        iC      MULS     r1,r5,r1
        0x00000a8e:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00000a92:    6019        .`      STR      r1,[r3,#0]
        0x00000a94:    4908        .I      LDR      r1,[pc,#32] ; [0xab8] = 0x5f5e100
        0x00000a96:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000a9a:    4908        .I      LDR      r1,[pc,#32] ; [0xabc] = 0x20008000
        0x00000a9c:    6048        H`      STR      r0,[r1,#4]
        0x00000a9e:    4908        .I      LDR      r1,[pc,#32] ; [0xac0] = 0x2000c000
        0x00000aa0:    6e20         n      LDR      r0,[r4,#0x60]
        0x00000aa2:    6048        H`      STR      r0,[r1,#4]
        0x00000aa4:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00000aa6:    0000        ..      DCW    0
        0x00000aa8:    2000039c    ...     DCD    536871836
        0x00000aac:    20000364    d..     DCD    536871780
        0x00000ab0:    200002dc    ...     DCD    536871644
        0x00000ab4:    000186a0    ....    DCD    100000
        0x00000ab8:    05f5e100    ....    DCD    100000000
        0x00000abc:    20008000    ...     DCD    536903680
        0x00000ac0:    2000c000    ...     DCD    536920064
    $t
    i.CH2_OPREA
    CH2_OPREA
        0x00000ac4:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00000ac8:    4938        8I      LDR      r1,[pc,#224] ; [0xbac] = 0x20008000
        0x00000aca:    6908        .i      LDR      r0,[r1,#0x10]
        0x00000acc:    4838        8H      LDR      r0,[pc,#224] ; [0xbb0] = 0x200003bc
        0x00000ace:    690c        .i      LDR      r4,[r1,#0x10]
        0x00000ad0:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0xbb8] = 0x20000350
        0x00000ad4:    6004        .`      STR      r4,[r0,#0]
        0x00000ad6:    4837        7H      LDR      r0,[pc,#220] ; [0xbb4] = 0x200003fc
        0x00000ad8:    4b38        8K      LDR      r3,[pc,#224] ; [0xbbc] = 0x2000039e
        0x00000ada:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00000ade:    6802        .h      LDR      r2,[r0,#0]
        0x00000ae0:    f6404735    @.5G    MOV      r7,#0xc35
        0x00000ae4:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00000ae8:    6002        .`      STR      r2,[r0,#0]
        0x00000aea:    4691        .F      MOV      r9,r2
        0x00000aec:    4a34        4J      LDR      r2,[pc,#208] ; [0xbc0] = 0x2000004c
        0x00000aee:    4832        2H      LDR      r0,[pc,#200] ; [0xbb8] = 0x20000350
        0x00000af0:    781e        .x      LDRB     r6,[r3,#0]
        0x00000af2:    8812        ..      LDRH     r2,[r2,#0]
        0x00000af4:    6940        @i      LDR      r0,[r0,#0x14]
        0x00000af6:    fb02f507    ....    MUL      r5,r2,r7
        0x00000afa:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x00000afe:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0xbc4] = 0x3b9aca00
        0x00000b02:    f8da300c    ...0    LDR      r3,[r10,#0xc]
        0x00000b06:    f8da2054    ..T     LDR      r2,[r10,#0x54]
        0x00000b0a:    4284        .B      CMP      r4,r0
        0x00000b0c:    d218        ..      BCS      0xb40 ; CH2_OPREA + 124
        0x00000b0e:    4650        PF      MOV      r0,r10
        0x00000b10:    b10a        ..      CBZ      r2,0xb16 ; CH2_OPREA + 82
        0x00000b12:    1e52        R.      SUBS     r2,r2,#1
        0x00000b14:    6542        Be      STR      r2,[r0,#0x54]
        0x00000b16:    f8da0054    ..T.    LDR      r0,[r10,#0x54]
        0x00000b1a:    2e01        ..      CMP      r6,#1
        0x00000b1c:    fb00f003    ....    MUL      r0,r0,r3
        0x00000b20:    d006        ..      BEQ      0xb30 ; CH2_OPREA + 108
        0x00000b22:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00000b26:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000b2a:    6048        H`      STR      r0,[r1,#4]
        0x00000b2c:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00000b30:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00000b34:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000b38:    f2427210    B..r    MOV      r2,#0x2710
        0x00000b3c:    4350        PC      MULS     r0,r2,r0
        0x00000b3e:    e7f4        ..      B        0xb2a ; CH2_OPREA + 102
        0x00000b40:    4821        !H      LDR      r0,[pc,#132] ; [0xbc8] = 0x2000006c
        0x00000b42:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0xbcc] = 0x20000008
        0x00000b46:    8800        ..      LDRH     r0,[r0,#0]
        0x00000b48:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00000b4c:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00000b50:    f1080001    ....    ADD      r0,r8,#1
        0x00000b54:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x00000b58:    d21a        ..      BCS      0xb90 ; CH2_OPREA + 204
        0x00000b5a:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000b5e:    2e01        ..      CMP      r6,#1
        0x00000b60:    d00d        ..      BEQ      0xb7e ; CH2_OPREA + 186
        0x00000b62:    fb00f203    ....    MUL      r2,r0,r3
        0x00000b66:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x00000b6a:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00000b6e:    604a        J`      STR      r2,[r1,#4]
        0x00000b70:    4911        .I      LDR      r1,[pc,#68] ; [0xbb8] = 0x20000350
        0x00000b72:    eba90204    ....    SUB      r2,r9,r4
        0x00000b76:    614a        Ja      STR      r2,[r1,#0x14]
        0x00000b78:    f8ca0054    ..T.    STR      r0,[r10,#0x54]
        0x00000b7c:    e7d6        ..      B        0xb2c ; CH2_OPREA + 104
        0x00000b7e:    435a        ZC      MULS     r2,r3,r2
        0x00000b80:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x00000b84:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00000b88:    f2427310    B..s    MOV      r3,#0x2710
        0x00000b8c:    435a        ZC      MULS     r2,r3,r2
        0x00000b8e:    e7ee        ..      B        0xb6e ; CH2_OPREA + 170
        0x00000b90:    d1cc        ..      BNE      0xb2c ; CH2_OPREA + 104
        0x00000b92:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000b96:    4808        .H      LDR      r0,[pc,#32] ; [0xbb8] = 0x20000350
        0x00000b98:    eba90204    ....    SUB      r2,r9,r4
        0x00000b9c:    6142        Ba      STR      r2,[r0,#0x14]
        0x00000b9e:    480c        .H      LDR      r0,[pc,#48] ; [0xbd0] = 0x20000090
        0x00000ba0:    4a0c        .J      LDR      r2,[pc,#48] ; [0xbd4] = 0x5f5e100
        0x00000ba2:    6800        .h      LDR      r0,[r0,#0]
        0x00000ba4:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00000ba8:    e7bf        ..      B        0xb2a ; CH2_OPREA + 102
    $d
        0x00000baa:    0000        ..      DCW    0
        0x00000bac:    20008000    ...     DCD    536903680
        0x00000bb0:    200003bc    ...     DCD    536871868
        0x00000bb4:    200003fc    ...     DCD    536871932
        0x00000bb8:    20000350    P..     DCD    536871760
        0x00000bbc:    2000039e    ...     DCD    536871838
        0x00000bc0:    2000004c    L..     DCD    536870988
        0x00000bc4:    3b9aca00    ...;    DCD    1000000000
        0x00000bc8:    2000006c    l..     DCD    536871020
        0x00000bcc:    20000008    ...     DCD    536870920
        0x00000bd0:    20000090    ...     DCD    536871056
        0x00000bd4:    05f5e100    ....    DCD    100000000
    $t
    i.CH3_Deploy
    CH3_Deploy
        0x00000bd8:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00000bda:    4c17        .L      LDR      r4,[pc,#92] ; [0xc38] = 0x2000039c
        0x00000bdc:    2500        .%      MOVS     r5,#0
        0x00000bde:    4e17        .N      LDR      r6,[pc,#92] ; [0xc3c] = 0x20000368
        0x00000be0:    6265        eb      STR      r5,[r4,#0x24]
        0x00000be2:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00000be6:    6035        5`      STR      r5,[r6,#0]
        0x00000be8:    d301        ..      BCC      0xbee ; CH3_Deploy + 22
        0x00000bea:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00000bee:    1a09        ..      SUBS     r1,r1,r0
        0x00000bf0:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x00000bf4:    6662        bf      STR      r2,[r4,#0x64]
        0x00000bf6:    f2402271    @.q"    MOV      r2,#0x271
        0x00000bfa:    4356        VC      MULS     r6,r2,r6
        0x00000bfc:    0117        ..      LSLS     r7,r2,#4
        0x00000bfe:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00000c02:    0052        R.      LSLS     r2,r2,#1
        0x00000c04:    4b0e        .K      LDR      r3,[pc,#56] ; [0xc40] = 0x200002e0
        0x00000c06:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00000c0a:    d204        ..      BCS      0xc16 ; CH3_Deploy + 62
        0x00000c0c:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00000c10:    70e5        .p      STRB     r5,[r4,#3]
        0x00000c12:    0049        I.      LSLS     r1,r1,#1
        0x00000c14:    e003        ..      B        0xc1e ; CH3_Deploy + 70
        0x00000c16:    2501        .%      MOVS     r5,#1
        0x00000c18:    70e5        .p      STRB     r5,[r4,#3]
        0x00000c1a:    4d0a        .M      LDR      r5,[pc,#40] ; [0xc44] = 0x186a0
        0x00000c1c:    4369        iC      MULS     r1,r5,r1
        0x00000c1e:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00000c22:    6019        .`      STR      r1,[r3,#0]
        0x00000c24:    4908        .I      LDR      r1,[pc,#32] ; [0xc48] = 0x5f5e100
        0x00000c26:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000c2a:    4908        .I      LDR      r1,[pc,#32] ; [0xc4c] = 0x20008000
        0x00000c2c:    6088        .`      STR      r0,[r1,#8]
        0x00000c2e:    4908        .I      LDR      r1,[pc,#32] ; [0xc50] = 0x2000c000
        0x00000c30:    6e60        `n      LDR      r0,[r4,#0x64]
        0x00000c32:    6088        .`      STR      r0,[r1,#8]
        0x00000c34:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00000c36:    0000        ..      DCW    0
        0x00000c38:    2000039c    ...     DCD    536871836
        0x00000c3c:    20000368    h..     DCD    536871784
        0x00000c40:    200002e0    ...     DCD    536871648
        0x00000c44:    000186a0    ....    DCD    100000
        0x00000c48:    05f5e100    ....    DCD    100000000
        0x00000c4c:    20008000    ...     DCD    536903680
        0x00000c50:    2000c000    ...     DCD    536920064
    $t
    i.CH3_OPREA
    CH3_OPREA
        0x00000c54:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00000c58:    4938        8I      LDR      r1,[pc,#224] ; [0xd3c] = 0x20008000
        0x00000c5a:    6a08        .j      LDR      r0,[r1,#0x20]
        0x00000c5c:    4838        8H      LDR      r0,[pc,#224] ; [0xd40] = 0x200003c0
        0x00000c5e:    6a0c        .j      LDR      r4,[r1,#0x20]
        0x00000c60:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0xd48] = 0x20000350
        0x00000c64:    6004        .`      STR      r4,[r0,#0]
        0x00000c66:    4837        7H      LDR      r0,[pc,#220] ; [0xd44] = 0x20000400
        0x00000c68:    4b38        8K      LDR      r3,[pc,#224] ; [0xd4c] = 0x2000039f
        0x00000c6a:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00000c6e:    6802        .h      LDR      r2,[r0,#0]
        0x00000c70:    f6404735    @.5G    MOV      r7,#0xc35
        0x00000c74:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00000c78:    6002        .`      STR      r2,[r0,#0]
        0x00000c7a:    4691        .F      MOV      r9,r2
        0x00000c7c:    4a34        4J      LDR      r2,[pc,#208] ; [0xd50] = 0x2000004e
        0x00000c7e:    4832        2H      LDR      r0,[pc,#200] ; [0xd48] = 0x20000350
        0x00000c80:    781e        .x      LDRB     r6,[r3,#0]
        0x00000c82:    8812        ..      LDRH     r2,[r2,#0]
        0x00000c84:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000c86:    fb02f507    ....    MUL      r5,r2,r7
        0x00000c8a:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x00000c8e:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0xd54] = 0x3b9aca00
        0x00000c92:    f8da3010    ...0    LDR      r3,[r10,#0x10]
        0x00000c96:    f8da2058    ..X     LDR      r2,[r10,#0x58]
        0x00000c9a:    4284        .B      CMP      r4,r0
        0x00000c9c:    d218        ..      BCS      0xcd0 ; CH3_OPREA + 124
        0x00000c9e:    4650        PF      MOV      r0,r10
        0x00000ca0:    b10a        ..      CBZ      r2,0xca6 ; CH3_OPREA + 82
        0x00000ca2:    1e52        R.      SUBS     r2,r2,#1
        0x00000ca4:    6582        .e      STR      r2,[r0,#0x58]
        0x00000ca6:    f8da0058    ..X.    LDR      r0,[r10,#0x58]
        0x00000caa:    2e01        ..      CMP      r6,#1
        0x00000cac:    fb00f003    ....    MUL      r0,r0,r3
        0x00000cb0:    d006        ..      BEQ      0xcc0 ; CH3_OPREA + 108
        0x00000cb2:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00000cb6:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000cba:    6088        .`      STR      r0,[r1,#8]
        0x00000cbc:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00000cc0:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00000cc4:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000cc8:    f2427210    B..r    MOV      r2,#0x2710
        0x00000ccc:    4350        PC      MULS     r0,r2,r0
        0x00000cce:    e7f4        ..      B        0xcba ; CH3_OPREA + 102
        0x00000cd0:    4821        !H      LDR      r0,[pc,#132] ; [0xd58] = 0x2000006e
        0x00000cd2:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0xd5c] = 0x2000000c
        0x00000cd6:    8800        ..      LDRH     r0,[r0,#0]
        0x00000cd8:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00000cdc:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00000ce0:    f1080001    ....    ADD      r0,r8,#1
        0x00000ce4:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x00000ce8:    d21a        ..      BCS      0xd20 ; CH3_OPREA + 204
        0x00000cea:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000cee:    2e01        ..      CMP      r6,#1
        0x00000cf0:    d00d        ..      BEQ      0xd0e ; CH3_OPREA + 186
        0x00000cf2:    fb00f203    ....    MUL      r2,r0,r3
        0x00000cf6:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x00000cfa:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00000cfe:    608a        .`      STR      r2,[r1,#8]
        0x00000d00:    4911        .I      LDR      r1,[pc,#68] ; [0xd48] = 0x20000350
        0x00000d02:    eba90204    ....    SUB      r2,r9,r4
        0x00000d06:    618a        .a      STR      r2,[r1,#0x18]
        0x00000d08:    f8ca0058    ..X.    STR      r0,[r10,#0x58]
        0x00000d0c:    e7d6        ..      B        0xcbc ; CH3_OPREA + 104
        0x00000d0e:    435a        ZC      MULS     r2,r3,r2
        0x00000d10:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x00000d14:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00000d18:    f2427310    B..s    MOV      r3,#0x2710
        0x00000d1c:    435a        ZC      MULS     r2,r3,r2
        0x00000d1e:    e7ee        ..      B        0xcfe ; CH3_OPREA + 170
        0x00000d20:    d1cc        ..      BNE      0xcbc ; CH3_OPREA + 104
        0x00000d22:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000d26:    4808        .H      LDR      r0,[pc,#32] ; [0xd48] = 0x20000350
        0x00000d28:    eba90204    ....    SUB      r2,r9,r4
        0x00000d2c:    6182        .a      STR      r2,[r0,#0x18]
        0x00000d2e:    480c        .H      LDR      r0,[pc,#48] ; [0xd60] = 0x20000094
        0x00000d30:    4a0c        .J      LDR      r2,[pc,#48] ; [0xd64] = 0x5f5e100
        0x00000d32:    6800        .h      LDR      r0,[r0,#0]
        0x00000d34:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00000d38:    e7bf        ..      B        0xcba ; CH3_OPREA + 102
    $d
        0x00000d3a:    0000        ..      DCW    0
        0x00000d3c:    20008000    ...     DCD    536903680
        0x00000d40:    200003c0    ...     DCD    536871872
        0x00000d44:    20000400    ...     DCD    536871936
        0x00000d48:    20000350    P..     DCD    536871760
        0x00000d4c:    2000039f    ...     DCD    536871839
        0x00000d50:    2000004e    N..     DCD    536870990
        0x00000d54:    3b9aca00    ...;    DCD    1000000000
        0x00000d58:    2000006e    n..     DCD    536871022
        0x00000d5c:    2000000c    ...     DCD    536870924
        0x00000d60:    20000094    ...     DCD    536871060
        0x00000d64:    05f5e100    ....    DCD    100000000
    $t
    i.CH4_Deploy
    CH4_Deploy
        0x00000d68:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00000d6a:    4c17        .L      LDR      r4,[pc,#92] ; [0xdc8] = 0x2000039c
        0x00000d6c:    2500        .%      MOVS     r5,#0
        0x00000d6e:    4e17        .N      LDR      r6,[pc,#92] ; [0xdcc] = 0x2000036c
        0x00000d70:    62a5        .b      STR      r5,[r4,#0x28]
        0x00000d72:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00000d76:    6035        5`      STR      r5,[r6,#0]
        0x00000d78:    d301        ..      BCC      0xd7e ; CH4_Deploy + 22
        0x00000d7a:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00000d7e:    1a09        ..      SUBS     r1,r1,r0
        0x00000d80:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x00000d84:    66a2        .f      STR      r2,[r4,#0x68]
        0x00000d86:    f2402271    @.q"    MOV      r2,#0x271
        0x00000d8a:    4356        VC      MULS     r6,r2,r6
        0x00000d8c:    0117        ..      LSLS     r7,r2,#4
        0x00000d8e:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00000d92:    0052        R.      LSLS     r2,r2,#1
        0x00000d94:    4b0e        .K      LDR      r3,[pc,#56] ; [0xdd0] = 0x200002e4
        0x00000d96:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00000d9a:    d204        ..      BCS      0xda6 ; CH4_Deploy + 62
        0x00000d9c:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00000da0:    7125        %q      STRB     r5,[r4,#4]
        0x00000da2:    0049        I.      LSLS     r1,r1,#1
        0x00000da4:    e003        ..      B        0xdae ; CH4_Deploy + 70
        0x00000da6:    2501        .%      MOVS     r5,#1
        0x00000da8:    7125        %q      STRB     r5,[r4,#4]
        0x00000daa:    4d0a        .M      LDR      r5,[pc,#40] ; [0xdd4] = 0x186a0
        0x00000dac:    4369        iC      MULS     r1,r5,r1
        0x00000dae:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00000db2:    6019        .`      STR      r1,[r3,#0]
        0x00000db4:    4908        .I      LDR      r1,[pc,#32] ; [0xdd8] = 0x5f5e100
        0x00000db6:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000dba:    4908        .I      LDR      r1,[pc,#32] ; [0xddc] = 0x20008000
        0x00000dbc:    6108        .a      STR      r0,[r1,#0x10]
        0x00000dbe:    4908        .I      LDR      r1,[pc,#32] ; [0xde0] = 0x2000c000
        0x00000dc0:    6ea0        .n      LDR      r0,[r4,#0x68]
        0x00000dc2:    6108        .a      STR      r0,[r1,#0x10]
        0x00000dc4:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00000dc6:    0000        ..      DCW    0
        0x00000dc8:    2000039c    ...     DCD    536871836
        0x00000dcc:    2000036c    l..     DCD    536871788
        0x00000dd0:    200002e4    ...     DCD    536871652
        0x00000dd4:    000186a0    ....    DCD    100000
        0x00000dd8:    05f5e100    ....    DCD    100000000
        0x00000ddc:    20008000    ...     DCD    536903680
        0x00000de0:    2000c000    ...     DCD    536920064
    $t
    i.CH4_OPREA
    CH4_OPREA
        0x00000de4:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00000de8:    4938        8I      LDR      r1,[pc,#224] ; [0xecc] = 0x20008000
        0x00000dea:    6c08        .l      LDR      r0,[r1,#0x40]
        0x00000dec:    4838        8H      LDR      r0,[pc,#224] ; [0xed0] = 0x200003c4
        0x00000dee:    6c0c        .l      LDR      r4,[r1,#0x40]
        0x00000df0:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0xed8] = 0x20000350
        0x00000df4:    6004        .`      STR      r4,[r0,#0]
        0x00000df6:    4837        7H      LDR      r0,[pc,#220] ; [0xed4] = 0x20000404
        0x00000df8:    4b38        8K      LDR      r3,[pc,#224] ; [0xedc] = 0x200003a0
        0x00000dfa:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00000dfe:    6802        .h      LDR      r2,[r0,#0]
        0x00000e00:    f6404735    @.5G    MOV      r7,#0xc35
        0x00000e04:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00000e08:    6002        .`      STR      r2,[r0,#0]
        0x00000e0a:    4691        .F      MOV      r9,r2
        0x00000e0c:    4a34        4J      LDR      r2,[pc,#208] ; [0xee0] = 0x20000050
        0x00000e0e:    4832        2H      LDR      r0,[pc,#200] ; [0xed8] = 0x20000350
        0x00000e10:    781e        .x      LDRB     r6,[r3,#0]
        0x00000e12:    8812        ..      LDRH     r2,[r2,#0]
        0x00000e14:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000e16:    fb02f507    ....    MUL      r5,r2,r7
        0x00000e1a:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x00000e1e:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0xee4] = 0x3b9aca00
        0x00000e22:    f8da3014    ...0    LDR      r3,[r10,#0x14]
        0x00000e26:    f8da205c    ..\     LDR      r2,[r10,#0x5c]
        0x00000e2a:    4284        .B      CMP      r4,r0
        0x00000e2c:    d218        ..      BCS      0xe60 ; CH4_OPREA + 124
        0x00000e2e:    4650        PF      MOV      r0,r10
        0x00000e30:    b10a        ..      CBZ      r2,0xe36 ; CH4_OPREA + 82
        0x00000e32:    1e52        R.      SUBS     r2,r2,#1
        0x00000e34:    65c2        .e      STR      r2,[r0,#0x5c]
        0x00000e36:    f8da005c    ..\.    LDR      r0,[r10,#0x5c]
        0x00000e3a:    2e01        ..      CMP      r6,#1
        0x00000e3c:    fb00f003    ....    MUL      r0,r0,r3
        0x00000e40:    d006        ..      BEQ      0xe50 ; CH4_OPREA + 108
        0x00000e42:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00000e46:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000e4a:    6108        .a      STR      r0,[r1,#0x10]
        0x00000e4c:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00000e50:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00000e54:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000e58:    f2427210    B..r    MOV      r2,#0x2710
        0x00000e5c:    4350        PC      MULS     r0,r2,r0
        0x00000e5e:    e7f4        ..      B        0xe4a ; CH4_OPREA + 102
        0x00000e60:    4821        !H      LDR      r0,[pc,#132] ; [0xee8] = 0x20000070
        0x00000e62:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0xeec] = 0x20000010
        0x00000e66:    8800        ..      LDRH     r0,[r0,#0]
        0x00000e68:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00000e6c:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00000e70:    f1080001    ....    ADD      r0,r8,#1
        0x00000e74:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x00000e78:    d21a        ..      BCS      0xeb0 ; CH4_OPREA + 204
        0x00000e7a:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000e7e:    2e01        ..      CMP      r6,#1
        0x00000e80:    d00d        ..      BEQ      0xe9e ; CH4_OPREA + 186
        0x00000e82:    fb00f203    ....    MUL      r2,r0,r3
        0x00000e86:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x00000e8a:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00000e8e:    610a        .a      STR      r2,[r1,#0x10]
        0x00000e90:    4911        .I      LDR      r1,[pc,#68] ; [0xed8] = 0x20000350
        0x00000e92:    eba90204    ....    SUB      r2,r9,r4
        0x00000e96:    61ca        .a      STR      r2,[r1,#0x1c]
        0x00000e98:    f8ca005c    ..\.    STR      r0,[r10,#0x5c]
        0x00000e9c:    e7d6        ..      B        0xe4c ; CH4_OPREA + 104
        0x00000e9e:    435a        ZC      MULS     r2,r3,r2
        0x00000ea0:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x00000ea4:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00000ea8:    f2427310    B..s    MOV      r3,#0x2710
        0x00000eac:    435a        ZC      MULS     r2,r3,r2
        0x00000eae:    e7ee        ..      B        0xe8e ; CH4_OPREA + 170
        0x00000eb0:    d1cc        ..      BNE      0xe4c ; CH4_OPREA + 104
        0x00000eb2:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00000eb6:    4808        .H      LDR      r0,[pc,#32] ; [0xed8] = 0x20000350
        0x00000eb8:    eba90204    ....    SUB      r2,r9,r4
        0x00000ebc:    61c2        .a      STR      r2,[r0,#0x1c]
        0x00000ebe:    480c        .H      LDR      r0,[pc,#48] ; [0xef0] = 0x20000098
        0x00000ec0:    4a0c        .J      LDR      r2,[pc,#48] ; [0xef4] = 0x5f5e100
        0x00000ec2:    6800        .h      LDR      r0,[r0,#0]
        0x00000ec4:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00000ec8:    e7bf        ..      B        0xe4a ; CH4_OPREA + 102
    $d
        0x00000eca:    0000        ..      DCW    0
        0x00000ecc:    20008000    ...     DCD    536903680
        0x00000ed0:    200003c4    ...     DCD    536871876
        0x00000ed4:    20000404    ...     DCD    536871940
        0x00000ed8:    20000350    P..     DCD    536871760
        0x00000edc:    200003a0    ...     DCD    536871840
        0x00000ee0:    20000050    P..     DCD    536870992
        0x00000ee4:    3b9aca00    ...;    DCD    1000000000
        0x00000ee8:    20000070    p..     DCD    536871024
        0x00000eec:    20000010    ...     DCD    536870928
        0x00000ef0:    20000098    ...     DCD    536871064
        0x00000ef4:    05f5e100    ....    DCD    100000000
    $t
    i.CH5_Deploy
    CH5_Deploy
        0x00000ef8:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00000efa:    4c17        .L      LDR      r4,[pc,#92] ; [0xf58] = 0x2000039c
        0x00000efc:    2500        .%      MOVS     r5,#0
        0x00000efe:    4e17        .N      LDR      r6,[pc,#92] ; [0xf5c] = 0x20000370
        0x00000f00:    62e5        .b      STR      r5,[r4,#0x2c]
        0x00000f02:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00000f06:    6035        5`      STR      r5,[r6,#0]
        0x00000f08:    d301        ..      BCC      0xf0e ; CH5_Deploy + 22
        0x00000f0a:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00000f0e:    1a09        ..      SUBS     r1,r1,r0
        0x00000f10:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x00000f14:    66e2        .f      STR      r2,[r4,#0x6c]
        0x00000f16:    f2402271    @.q"    MOV      r2,#0x271
        0x00000f1a:    4356        VC      MULS     r6,r2,r6
        0x00000f1c:    0117        ..      LSLS     r7,r2,#4
        0x00000f1e:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00000f22:    0052        R.      LSLS     r2,r2,#1
        0x00000f24:    4b0e        .K      LDR      r3,[pc,#56] ; [0xf60] = 0x200002e8
        0x00000f26:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00000f2a:    d204        ..      BCS      0xf36 ; CH5_Deploy + 62
        0x00000f2c:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00000f30:    7165        eq      STRB     r5,[r4,#5]
        0x00000f32:    0049        I.      LSLS     r1,r1,#1
        0x00000f34:    e003        ..      B        0xf3e ; CH5_Deploy + 70
        0x00000f36:    2501        .%      MOVS     r5,#1
        0x00000f38:    7165        eq      STRB     r5,[r4,#5]
        0x00000f3a:    4d0a        .M      LDR      r5,[pc,#40] ; [0xf64] = 0x186a0
        0x00000f3c:    4369        iC      MULS     r1,r5,r1
        0x00000f3e:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00000f42:    6019        .`      STR      r1,[r3,#0]
        0x00000f44:    4908        .I      LDR      r1,[pc,#32] ; [0xf68] = 0x5f5e100
        0x00000f46:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00000f4a:    4908        .I      LDR      r1,[pc,#32] ; [0xf6c] = 0x20008000
        0x00000f4c:    6208        .b      STR      r0,[r1,#0x20]
        0x00000f4e:    4908        .I      LDR      r1,[pc,#32] ; [0xf70] = 0x2000c000
        0x00000f50:    6ee0        .n      LDR      r0,[r4,#0x6c]
        0x00000f52:    6208        .b      STR      r0,[r1,#0x20]
        0x00000f54:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00000f56:    0000        ..      DCW    0
        0x00000f58:    2000039c    ...     DCD    536871836
        0x00000f5c:    20000370    p..     DCD    536871792
        0x00000f60:    200002e8    ...     DCD    536871656
        0x00000f64:    000186a0    ....    DCD    100000
        0x00000f68:    05f5e100    ....    DCD    100000000
        0x00000f6c:    20008000    ...     DCD    536903680
        0x00000f70:    2000c000    ...     DCD    536920064
    $t
    i.CH5_OPREA
    CH5_OPREA
        0x00000f74:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00000f78:    4939        9I      LDR      r1,[pc,#228] ; [0x1060] = 0x20008000
        0x00000f7a:    f8d10080    ....    LDR      r0,[r1,#0x80]
        0x00000f7e:    4839        9H      LDR      r0,[pc,#228] ; [0x1064] = 0x200003c8
        0x00000f80:    f8d14080    ...@    LDR      r4,[r1,#0x80]
        0x00000f84:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0x106c] = 0x20000350
        0x00000f88:    6004        .`      STR      r4,[r0,#0]
        0x00000f8a:    4837        7H      LDR      r0,[pc,#220] ; [0x1068] = 0x20000408
        0x00000f8c:    4b38        8K      LDR      r3,[pc,#224] ; [0x1070] = 0x200003a1
        0x00000f8e:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00000f92:    6802        .h      LDR      r2,[r0,#0]
        0x00000f94:    f6404735    @.5G    MOV      r7,#0xc35
        0x00000f98:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00000f9c:    6002        .`      STR      r2,[r0,#0]
        0x00000f9e:    4691        .F      MOV      r9,r2
        0x00000fa0:    4a34        4J      LDR      r2,[pc,#208] ; [0x1074] = 0x20000052
        0x00000fa2:    4832        2H      LDR      r0,[pc,#200] ; [0x106c] = 0x20000350
        0x00000fa4:    781e        .x      LDRB     r6,[r3,#0]
        0x00000fa6:    8812        ..      LDRH     r2,[r2,#0]
        0x00000fa8:    6a00        .j      LDR      r0,[r0,#0x20]
        0x00000faa:    fb02f507    ....    MUL      r5,r2,r7
        0x00000fae:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x00000fb2:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0x1078] = 0x3b9aca00
        0x00000fb6:    f8da3018    ...0    LDR      r3,[r10,#0x18]
        0x00000fba:    f8da2060    ..`     LDR      r2,[r10,#0x60]
        0x00000fbe:    4284        .B      CMP      r4,r0
        0x00000fc0:    d218        ..      BCS      0xff4 ; CH5_OPREA + 128
        0x00000fc2:    4650        PF      MOV      r0,r10
        0x00000fc4:    b10a        ..      CBZ      r2,0xfca ; CH5_OPREA + 86
        0x00000fc6:    1e52        R.      SUBS     r2,r2,#1
        0x00000fc8:    6602        .f      STR      r2,[r0,#0x60]
        0x00000fca:    f8da0060    ..`.    LDR      r0,[r10,#0x60]
        0x00000fce:    2e01        ..      CMP      r6,#1
        0x00000fd0:    fb00f003    ....    MUL      r0,r0,r3
        0x00000fd4:    d006        ..      BEQ      0xfe4 ; CH5_OPREA + 112
        0x00000fd6:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00000fda:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000fde:    6208        .b      STR      r0,[r1,#0x20]
        0x00000fe0:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00000fe4:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00000fe8:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00000fec:    f2427210    B..r    MOV      r2,#0x2710
        0x00000ff0:    4350        PC      MULS     r0,r2,r0
        0x00000ff2:    e7f4        ..      B        0xfde ; CH5_OPREA + 106
        0x00000ff4:    4821        !H      LDR      r0,[pc,#132] ; [0x107c] = 0x20000072
        0x00000ff6:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0x1080] = 0x20000014
        0x00000ffa:    8800        ..      LDRH     r0,[r0,#0]
        0x00000ffc:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00001000:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00001004:    f1080001    ....    ADD      r0,r8,#1
        0x00001008:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x0000100c:    d21a        ..      BCS      0x1044 ; CH5_OPREA + 208
        0x0000100e:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001012:    2e01        ..      CMP      r6,#1
        0x00001014:    d00d        ..      BEQ      0x1032 ; CH5_OPREA + 190
        0x00001016:    fb00f203    ....    MUL      r2,r0,r3
        0x0000101a:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x0000101e:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00001022:    620a        .b      STR      r2,[r1,#0x20]
        0x00001024:    4911        .I      LDR      r1,[pc,#68] ; [0x106c] = 0x20000350
        0x00001026:    eba90204    ....    SUB      r2,r9,r4
        0x0000102a:    620a        .b      STR      r2,[r1,#0x20]
        0x0000102c:    f8ca0060    ..`.    STR      r0,[r10,#0x60]
        0x00001030:    e7d6        ..      B        0xfe0 ; CH5_OPREA + 108
        0x00001032:    435a        ZC      MULS     r2,r3,r2
        0x00001034:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x00001038:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x0000103c:    f2427310    B..s    MOV      r3,#0x2710
        0x00001040:    435a        ZC      MULS     r2,r3,r2
        0x00001042:    e7ee        ..      B        0x1022 ; CH5_OPREA + 174
        0x00001044:    d1cc        ..      BNE      0xfe0 ; CH5_OPREA + 108
        0x00001046:    f8ce0000    ....    STR      r0,[lr,#0]
        0x0000104a:    4808        .H      LDR      r0,[pc,#32] ; [0x106c] = 0x20000350
        0x0000104c:    eba90204    ....    SUB      r2,r9,r4
        0x00001050:    6202        .b      STR      r2,[r0,#0x20]
        0x00001052:    480c        .H      LDR      r0,[pc,#48] ; [0x1084] = 0x2000009c
        0x00001054:    4a0c        .J      LDR      r2,[pc,#48] ; [0x1088] = 0x5f5e100
        0x00001056:    6800        .h      LDR      r0,[r0,#0]
        0x00001058:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x0000105c:    e7bf        ..      B        0xfde ; CH5_OPREA + 106
    $d
        0x0000105e:    0000        ..      DCW    0
        0x00001060:    20008000    ...     DCD    536903680
        0x00001064:    200003c8    ...     DCD    536871880
        0x00001068:    20000408    ...     DCD    536871944
        0x0000106c:    20000350    P..     DCD    536871760
        0x00001070:    200003a1    ...     DCD    536871841
        0x00001074:    20000052    R..     DCD    536870994
        0x00001078:    3b9aca00    ...;    DCD    1000000000
        0x0000107c:    20000072    r..     DCD    536871026
        0x00001080:    20000014    ...     DCD    536870932
        0x00001084:    2000009c    ...     DCD    536871068
        0x00001088:    05f5e100    ....    DCD    100000000
    $t
    i.CH6_Deploy
    CH6_Deploy
        0x0000108c:    b5f0        ..      PUSH     {r4-r7,lr}
        0x0000108e:    4c17        .L      LDR      r4,[pc,#92] ; [0x10ec] = 0x2000039c
        0x00001090:    2500        .%      MOVS     r5,#0
        0x00001092:    4e17        .N      LDR      r6,[pc,#92] ; [0x10f0] = 0x20000374
        0x00001094:    6325        %c      STR      r5,[r4,#0x30]
        0x00001096:    f1b27f80    ....    CMP      r2,#0x1000000
        0x0000109a:    6035        5`      STR      r5,[r6,#0]
        0x0000109c:    d301        ..      BCC      0x10a2 ; CH6_Deploy + 22
        0x0000109e:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x000010a2:    1a09        ..      SUBS     r1,r1,r0
        0x000010a4:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x000010a8:    6722        "g      STR      r2,[r4,#0x70]
        0x000010aa:    f2402271    @.q"    MOV      r2,#0x271
        0x000010ae:    4356        VC      MULS     r6,r2,r6
        0x000010b0:    0117        ..      LSLS     r7,r2,#4
        0x000010b2:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x000010b6:    0052        R.      LSLS     r2,r2,#1
        0x000010b8:    4b0e        .K      LDR      r3,[pc,#56] ; [0x10f4] = 0x200002ec
        0x000010ba:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x000010be:    d204        ..      BCS      0x10ca ; CH6_Deploy + 62
        0x000010c0:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x000010c4:    71a5        .q      STRB     r5,[r4,#6]
        0x000010c6:    0049        I.      LSLS     r1,r1,#1
        0x000010c8:    e003        ..      B        0x10d2 ; CH6_Deploy + 70
        0x000010ca:    2501        .%      MOVS     r5,#1
        0x000010cc:    71a5        .q      STRB     r5,[r4,#6]
        0x000010ce:    4d0a        .M      LDR      r5,[pc,#40] ; [0x10f8] = 0x186a0
        0x000010d0:    4369        iC      MULS     r1,r5,r1
        0x000010d2:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x000010d6:    6019        .`      STR      r1,[r3,#0]
        0x000010d8:    4908        .I      LDR      r1,[pc,#32] ; [0x10fc] = 0x5f5e100
        0x000010da:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x000010de:    4908        .I      LDR      r1,[pc,#32] ; [0x1100] = 0x20008000
        0x000010e0:    6408        .d      STR      r0,[r1,#0x40]
        0x000010e2:    4908        .I      LDR      r1,[pc,#32] ; [0x1104] = 0x2000c000
        0x000010e4:    6f20         o      LDR      r0,[r4,#0x70]
        0x000010e6:    6408        .d      STR      r0,[r1,#0x40]
        0x000010e8:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x000010ea:    0000        ..      DCW    0
        0x000010ec:    2000039c    ...     DCD    536871836
        0x000010f0:    20000374    t..     DCD    536871796
        0x000010f4:    200002ec    ...     DCD    536871660
        0x000010f8:    000186a0    ....    DCD    100000
        0x000010fc:    05f5e100    ....    DCD    100000000
        0x00001100:    20008000    ...     DCD    536903680
        0x00001104:    2000c000    ...     DCD    536920064
    $t
    i.CH6_OPREA
    CH6_OPREA
        0x00001108:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x0000110c:    4939        9I      LDR      r1,[pc,#228] ; [0x11f4] = 0x20008000
        0x0000110e:    f8d10100    ....    LDR      r0,[r1,#0x100]
        0x00001112:    4839        9H      LDR      r0,[pc,#228] ; [0x11f8] = 0x200003cc
        0x00001114:    f8d14100    ...A    LDR      r4,[r1,#0x100]
        0x00001118:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0x1200] = 0x20000350
        0x0000111c:    6004        .`      STR      r4,[r0,#0]
        0x0000111e:    4837        7H      LDR      r0,[pc,#220] ; [0x11fc] = 0x2000040c
        0x00001120:    4b38        8K      LDR      r3,[pc,#224] ; [0x1204] = 0x200003a2
        0x00001122:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00001126:    6802        .h      LDR      r2,[r0,#0]
        0x00001128:    f6404735    @.5G    MOV      r7,#0xc35
        0x0000112c:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00001130:    6002        .`      STR      r2,[r0,#0]
        0x00001132:    4691        .F      MOV      r9,r2
        0x00001134:    4a34        4J      LDR      r2,[pc,#208] ; [0x1208] = 0x20000054
        0x00001136:    4832        2H      LDR      r0,[pc,#200] ; [0x1200] = 0x20000350
        0x00001138:    781e        .x      LDRB     r6,[r3,#0]
        0x0000113a:    8812        ..      LDRH     r2,[r2,#0]
        0x0000113c:    6a40        @j      LDR      r0,[r0,#0x24]
        0x0000113e:    fb02f507    ....    MUL      r5,r2,r7
        0x00001142:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x00001146:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0x120c] = 0x3b9aca00
        0x0000114a:    f8da301c    ...0    LDR      r3,[r10,#0x1c]
        0x0000114e:    f8da2064    ..d     LDR      r2,[r10,#0x64]
        0x00001152:    4284        .B      CMP      r4,r0
        0x00001154:    d218        ..      BCS      0x1188 ; CH6_OPREA + 128
        0x00001156:    4650        PF      MOV      r0,r10
        0x00001158:    b10a        ..      CBZ      r2,0x115e ; CH6_OPREA + 86
        0x0000115a:    1e52        R.      SUBS     r2,r2,#1
        0x0000115c:    6642        Bf      STR      r2,[r0,#0x64]
        0x0000115e:    f8da0064    ..d.    LDR      r0,[r10,#0x64]
        0x00001162:    2e01        ..      CMP      r6,#1
        0x00001164:    fb00f003    ....    MUL      r0,r0,r3
        0x00001168:    d006        ..      BEQ      0x1178 ; CH6_OPREA + 112
        0x0000116a:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x0000116e:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00001172:    6408        .d      STR      r0,[r1,#0x40]
        0x00001174:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001178:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x0000117c:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00001180:    f2427210    B..r    MOV      r2,#0x2710
        0x00001184:    4350        PC      MULS     r0,r2,r0
        0x00001186:    e7f4        ..      B        0x1172 ; CH6_OPREA + 106
        0x00001188:    4821        !H      LDR      r0,[pc,#132] ; [0x1210] = 0x20000074
        0x0000118a:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0x1214] = 0x20000018
        0x0000118e:    8800        ..      LDRH     r0,[r0,#0]
        0x00001190:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00001194:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00001198:    f1080001    ....    ADD      r0,r8,#1
        0x0000119c:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x000011a0:    d21a        ..      BCS      0x11d8 ; CH6_OPREA + 208
        0x000011a2:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000011a6:    2e01        ..      CMP      r6,#1
        0x000011a8:    d00d        ..      BEQ      0x11c6 ; CH6_OPREA + 190
        0x000011aa:    fb00f203    ....    MUL      r2,r0,r3
        0x000011ae:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x000011b2:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x000011b6:    640a        .d      STR      r2,[r1,#0x40]
        0x000011b8:    4911        .I      LDR      r1,[pc,#68] ; [0x1200] = 0x20000350
        0x000011ba:    eba90204    ....    SUB      r2,r9,r4
        0x000011be:    624a        Jb      STR      r2,[r1,#0x24]
        0x000011c0:    f8ca0064    ..d.    STR      r0,[r10,#0x64]
        0x000011c4:    e7d6        ..      B        0x1174 ; CH6_OPREA + 108
        0x000011c6:    435a        ZC      MULS     r2,r3,r2
        0x000011c8:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x000011cc:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x000011d0:    f2427310    B..s    MOV      r3,#0x2710
        0x000011d4:    435a        ZC      MULS     r2,r3,r2
        0x000011d6:    e7ee        ..      B        0x11b6 ; CH6_OPREA + 174
        0x000011d8:    d1cc        ..      BNE      0x1174 ; CH6_OPREA + 108
        0x000011da:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000011de:    4808        .H      LDR      r0,[pc,#32] ; [0x1200] = 0x20000350
        0x000011e0:    eba90204    ....    SUB      r2,r9,r4
        0x000011e4:    6242        Bb      STR      r2,[r0,#0x24]
        0x000011e6:    480c        .H      LDR      r0,[pc,#48] ; [0x1218] = 0x200000a0
        0x000011e8:    4a0c        .J      LDR      r2,[pc,#48] ; [0x121c] = 0x5f5e100
        0x000011ea:    6800        .h      LDR      r0,[r0,#0]
        0x000011ec:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x000011f0:    e7bf        ..      B        0x1172 ; CH6_OPREA + 106
    $d
        0x000011f2:    0000        ..      DCW    0
        0x000011f4:    20008000    ...     DCD    536903680
        0x000011f8:    200003cc    ...     DCD    536871884
        0x000011fc:    2000040c    ...     DCD    536871948
        0x00001200:    20000350    P..     DCD    536871760
        0x00001204:    200003a2    ...     DCD    536871842
        0x00001208:    20000054    T..     DCD    536870996
        0x0000120c:    3b9aca00    ...;    DCD    1000000000
        0x00001210:    20000074    t..     DCD    536871028
        0x00001214:    20000018    ...     DCD    536870936
        0x00001218:    200000a0    ...     DCD    536871072
        0x0000121c:    05f5e100    ....    DCD    100000000
    $t
    i.CH7_Deploy
    CH7_Deploy
        0x00001220:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001222:    4c18        .L      LDR      r4,[pc,#96] ; [0x1284] = 0x2000039c
        0x00001224:    2500        .%      MOVS     r5,#0
        0x00001226:    4e18        .N      LDR      r6,[pc,#96] ; [0x1288] = 0x20000378
        0x00001228:    6365        ec      STR      r5,[r4,#0x34]
        0x0000122a:    f1b27f80    ....    CMP      r2,#0x1000000
        0x0000122e:    6035        5`      STR      r5,[r6,#0]
        0x00001230:    d301        ..      BCC      0x1236 ; CH7_Deploy + 22
        0x00001232:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00001236:    1a09        ..      SUBS     r1,r1,r0
        0x00001238:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x0000123c:    6762        bg      STR      r2,[r4,#0x74]
        0x0000123e:    f2402271    @.q"    MOV      r2,#0x271
        0x00001242:    4356        VC      MULS     r6,r2,r6
        0x00001244:    0117        ..      LSLS     r7,r2,#4
        0x00001246:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x0000124a:    0052        R.      LSLS     r2,r2,#1
        0x0000124c:    4b0f        .K      LDR      r3,[pc,#60] ; [0x128c] = 0x200002f0
        0x0000124e:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00001252:    d204        ..      BCS      0x125e ; CH7_Deploy + 62
        0x00001254:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001258:    71e5        .q      STRB     r5,[r4,#7]
        0x0000125a:    0049        I.      LSLS     r1,r1,#1
        0x0000125c:    e003        ..      B        0x1266 ; CH7_Deploy + 70
        0x0000125e:    2501        .%      MOVS     r5,#1
        0x00001260:    71e5        .q      STRB     r5,[r4,#7]
        0x00001262:    4d0b        .M      LDR      r5,[pc,#44] ; [0x1290] = 0x186a0
        0x00001264:    4369        iC      MULS     r1,r5,r1
        0x00001266:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x0000126a:    6019        .`      STR      r1,[r3,#0]
        0x0000126c:    4909        .I      LDR      r1,[pc,#36] ; [0x1294] = 0x5f5e100
        0x0000126e:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001272:    4909        .I      LDR      r1,[pc,#36] ; [0x1298] = 0x20008000
        0x00001274:    f8c10080    ....    STR      r0,[r1,#0x80]
        0x00001278:    4908        .I      LDR      r1,[pc,#32] ; [0x129c] = 0x2000c000
        0x0000127a:    6f60        `o      LDR      r0,[r4,#0x74]
        0x0000127c:    f8c10080    ....    STR      r0,[r1,#0x80]
        0x00001280:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001282:    0000        ..      DCW    0
        0x00001284:    2000039c    ...     DCD    536871836
        0x00001288:    20000378    x..     DCD    536871800
        0x0000128c:    200002f0    ...     DCD    536871664
        0x00001290:    000186a0    ....    DCD    100000
        0x00001294:    05f5e100    ....    DCD    100000000
        0x00001298:    20008000    ...     DCD    536903680
        0x0000129c:    2000c000    ...     DCD    536920064
    $t
    i.CH7_OPREA
    CH7_OPREA
        0x000012a0:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x000012a4:    493b        ;I      LDR      r1,[pc,#236] ; [0x1394] = 0x20008000
        0x000012a6:    f8d10200    ....    LDR      r0,[r1,#0x200]
        0x000012aa:    483b        ;H      LDR      r0,[pc,#236] ; [0x1398] = 0x200003d0
        0x000012ac:    f8d14200    ...B    LDR      r4,[r1,#0x200]
        0x000012b0:    f8dfa0ec    ....    LDR      r10,[pc,#236] ; [0x13a0] = 0x20000350
        0x000012b4:    6004        .`      STR      r4,[r0,#0]
        0x000012b6:    4839        9H      LDR      r0,[pc,#228] ; [0x139c] = 0x20000410
        0x000012b8:    4b3a        :K      LDR      r3,[pc,#232] ; [0x13a4] = 0x200003a3
        0x000012ba:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x000012be:    6802        .h      LDR      r2,[r0,#0]
        0x000012c0:    f6404735    @.5G    MOV      r7,#0xc35
        0x000012c4:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x000012c8:    6002        .`      STR      r2,[r0,#0]
        0x000012ca:    4691        .F      MOV      r9,r2
        0x000012cc:    4a36        6J      LDR      r2,[pc,#216] ; [0x13a8] = 0x20000056
        0x000012ce:    4834        4H      LDR      r0,[pc,#208] ; [0x13a0] = 0x20000350
        0x000012d0:    781e        .x      LDRB     r6,[r3,#0]
        0x000012d2:    8812        ..      LDRH     r2,[r2,#0]
        0x000012d4:    6a80        .j      LDR      r0,[r0,#0x28]
        0x000012d6:    fb02f507    ....    MUL      r5,r2,r7
        0x000012da:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x000012de:    f8dfb0cc    ....    LDR      r11,[pc,#204] ; [0x13ac] = 0x3b9aca00
        0x000012e2:    f8da3020    .. 0    LDR      r3,[r10,#0x20]
        0x000012e6:    f8da2068    ..h     LDR      r2,[r10,#0x68]
        0x000012ea:    4284        .B      CMP      r4,r0
        0x000012ec:    d21a        ..      BCS      0x1324 ; CH7_OPREA + 132
        0x000012ee:    4650        PF      MOV      r0,r10
        0x000012f0:    b10a        ..      CBZ      r2,0x12f6 ; CH7_OPREA + 86
        0x000012f2:    1e52        R.      SUBS     r2,r2,#1
        0x000012f4:    6682        .f      STR      r2,[r0,#0x68]
        0x000012f6:    f8da0068    ..h.    LDR      r0,[r10,#0x68]
        0x000012fa:    2e01        ..      CMP      r6,#1
        0x000012fc:    fb00f003    ....    MUL      r0,r0,r3
        0x00001300:    d008        ..      BEQ      0x1314 ; CH7_OPREA + 116
        0x00001302:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00001306:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x0000130a:    bf00        ..      NOP      
        0x0000130c:    f8c10080    ....    STR      r0,[r1,#0x80]
        0x00001310:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001314:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00001318:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x0000131c:    f2427210    B..r    MOV      r2,#0x2710
        0x00001320:    4350        PC      MULS     r0,r2,r0
        0x00001322:    e7f3        ..      B        0x130c ; CH7_OPREA + 108
        0x00001324:    4822        "H      LDR      r0,[pc,#136] ; [0x13b0] = 0x20000076
        0x00001326:    f8dfe08c    ....    LDR      lr,[pc,#140] ; [0x13b4] = 0x2000001c
        0x0000132a:    8800        ..      LDRH     r0,[r0,#0]
        0x0000132c:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00001330:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00001334:    f1080001    ....    ADD      r0,r8,#1
        0x00001338:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x0000133c:    d21c        ..      BCS      0x1378 ; CH7_OPREA + 216
        0x0000133e:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001342:    2e01        ..      CMP      r6,#1
        0x00001344:    d00f        ..      BEQ      0x1366 ; CH7_OPREA + 198
        0x00001346:    fb00f203    ....    MUL      r2,r0,r3
        0x0000134a:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x0000134e:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00001352:    bf00        ..      NOP      
        0x00001354:    f8c12080    ...     STR      r2,[r1,#0x80]
        0x00001358:    4911        .I      LDR      r1,[pc,#68] ; [0x13a0] = 0x20000350
        0x0000135a:    eba90204    ....    SUB      r2,r9,r4
        0x0000135e:    628a        .b      STR      r2,[r1,#0x28]
        0x00001360:    f8ca0068    ..h.    STR      r0,[r10,#0x68]
        0x00001364:    e7d4        ..      B        0x1310 ; CH7_OPREA + 112
        0x00001366:    435a        ZC      MULS     r2,r3,r2
        0x00001368:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x0000136c:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00001370:    f2427310    B..s    MOV      r3,#0x2710
        0x00001374:    435a        ZC      MULS     r2,r3,r2
        0x00001376:    e7ed        ..      B        0x1354 ; CH7_OPREA + 180
        0x00001378:    d1ca        ..      BNE      0x1310 ; CH7_OPREA + 112
        0x0000137a:    f8ce0000    ....    STR      r0,[lr,#0]
        0x0000137e:    4808        .H      LDR      r0,[pc,#32] ; [0x13a0] = 0x20000350
        0x00001380:    eba90204    ....    SUB      r2,r9,r4
        0x00001384:    6202        .b      STR      r2,[r0,#0x20]
        0x00001386:    480c        .H      LDR      r0,[pc,#48] ; [0x13b8] = 0x200000a4
        0x00001388:    4a0c        .J      LDR      r2,[pc,#48] ; [0x13bc] = 0x5f5e100
        0x0000138a:    6800        .h      LDR      r0,[r0,#0]
        0x0000138c:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00001390:    e7bc        ..      B        0x130c ; CH7_OPREA + 108
    $d
        0x00001392:    0000        ..      DCW    0
        0x00001394:    20008000    ...     DCD    536903680
        0x00001398:    200003d0    ...     DCD    536871888
        0x0000139c:    20000410    ...     DCD    536871952
        0x000013a0:    20000350    P..     DCD    536871760
        0x000013a4:    200003a3    ...     DCD    536871843
        0x000013a8:    20000056    V..     DCD    536870998
        0x000013ac:    3b9aca00    ...;    DCD    1000000000
        0x000013b0:    20000076    v..     DCD    536871030
        0x000013b4:    2000001c    ...     DCD    536870940
        0x000013b8:    200000a4    ...     DCD    536871076
        0x000013bc:    05f5e100    ....    DCD    100000000
    $t
    i.CH8_Deploy
    CH8_Deploy
        0x000013c0:    b5f0        ..      PUSH     {r4-r7,lr}
        0x000013c2:    4c18        .L      LDR      r4,[pc,#96] ; [0x1424] = 0x2000039c
        0x000013c4:    2500        .%      MOVS     r5,#0
        0x000013c6:    4e18        .N      LDR      r6,[pc,#96] ; [0x1428] = 0x2000037c
        0x000013c8:    63a5        .c      STR      r5,[r4,#0x38]
        0x000013ca:    f1b27f80    ....    CMP      r2,#0x1000000
        0x000013ce:    6035        5`      STR      r5,[r6,#0]
        0x000013d0:    d301        ..      BCC      0x13d6 ; CH8_Deploy + 22
        0x000013d2:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x000013d6:    1a09        ..      SUBS     r1,r1,r0
        0x000013d8:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x000013dc:    67a2        .g      STR      r2,[r4,#0x78]
        0x000013de:    f2402271    @.q"    MOV      r2,#0x271
        0x000013e2:    4356        VC      MULS     r6,r2,r6
        0x000013e4:    0117        ..      LSLS     r7,r2,#4
        0x000013e6:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x000013ea:    0052        R.      LSLS     r2,r2,#1
        0x000013ec:    4b0f        .K      LDR      r3,[pc,#60] ; [0x142c] = 0x200002f4
        0x000013ee:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x000013f2:    d204        ..      BCS      0x13fe ; CH8_Deploy + 62
        0x000013f4:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x000013f8:    7225        %r      STRB     r5,[r4,#8]
        0x000013fa:    0049        I.      LSLS     r1,r1,#1
        0x000013fc:    e003        ..      B        0x1406 ; CH8_Deploy + 70
        0x000013fe:    2501        .%      MOVS     r5,#1
        0x00001400:    7225        %r      STRB     r5,[r4,#8]
        0x00001402:    4d0b        .M      LDR      r5,[pc,#44] ; [0x1430] = 0x186a0
        0x00001404:    4369        iC      MULS     r1,r5,r1
        0x00001406:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x0000140a:    6019        .`      STR      r1,[r3,#0]
        0x0000140c:    4909        .I      LDR      r1,[pc,#36] ; [0x1434] = 0x5f5e100
        0x0000140e:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001412:    4909        .I      LDR      r1,[pc,#36] ; [0x1438] = 0x20008000
        0x00001414:    f8c10100    ....    STR      r0,[r1,#0x100]
        0x00001418:    4908        .I      LDR      r1,[pc,#32] ; [0x143c] = 0x2000c000
        0x0000141a:    6fa0        .o      LDR      r0,[r4,#0x78]
        0x0000141c:    f8c10100    ....    STR      r0,[r1,#0x100]
        0x00001420:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001422:    0000        ..      DCW    0
        0x00001424:    2000039c    ...     DCD    536871836
        0x00001428:    2000037c    |..     DCD    536871804
        0x0000142c:    200002f4    ...     DCD    536871668
        0x00001430:    000186a0    ....    DCD    100000
        0x00001434:    05f5e100    ....    DCD    100000000
        0x00001438:    20008000    ...     DCD    536903680
        0x0000143c:    2000c000    ...     DCD    536920064
    $t
    i.CH8_OPREA
    CH8_OPREA
        0x00001440:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001444:    493a        :I      LDR      r1,[pc,#232] ; [0x1530] = 0x20008400
        0x00001446:    6808        .h      LDR      r0,[r1,#0]
        0x00001448:    483a        :H      LDR      r0,[pc,#232] ; [0x1534] = 0x200003d4
        0x0000144a:    680c        .h      LDR      r4,[r1,#0]
        0x0000144c:    f8dfa0ec    ....    LDR      r10,[pc,#236] ; [0x153c] = 0x20000350
        0x00001450:    6004        .`      STR      r4,[r0,#0]
        0x00001452:    4839        9H      LDR      r0,[pc,#228] ; [0x1538] = 0x20000414
        0x00001454:    4a3a        :J      LDR      r2,[pc,#232] ; [0x1540] = 0x200003a4
        0x00001456:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x0000145a:    6801        .h      LDR      r1,[r0,#0]
        0x0000145c:    f6404735    @.5G    MOV      r7,#0xc35
        0x00001460:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x00001464:    6001        .`      STR      r1,[r0,#0]
        0x00001466:    4689        .F      MOV      r9,r1
        0x00001468:    4936        6I      LDR      r1,[pc,#216] ; [0x1544] = 0x20000058
        0x0000146a:    4834        4H      LDR      r0,[pc,#208] ; [0x153c] = 0x20000350
        0x0000146c:    7816        .x      LDRB     r6,[r2,#0]
        0x0000146e:    8809        ..      LDRH     r1,[r1,#0]
        0x00001470:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x00001472:    fb01f507    ....    MUL      r5,r1,r7
        0x00001476:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x0000147a:    f8dfb0cc    ....    LDR      r11,[pc,#204] ; [0x1548] = 0x3b9aca00
        0x0000147e:    4b33        3K      LDR      r3,[pc,#204] ; [0x154c] = 0x20008000
        0x00001480:    f8da2024    ..$     LDR      r2,[r10,#0x24]
        0x00001484:    f8da106c    ..l.    LDR      r1,[r10,#0x6c]
        0x00001488:    4284        .B      CMP      r4,r0
        0x0000148a:    d219        ..      BCS      0x14c0 ; CH8_OPREA + 128
        0x0000148c:    4650        PF      MOV      r0,r10
        0x0000148e:    b109        ..      CBZ      r1,0x1494 ; CH8_OPREA + 84
        0x00001490:    1e49        I.      SUBS     r1,r1,#1
        0x00001492:    66c1        .f      STR      r1,[r0,#0x6c]
        0x00001494:    f8da006c    ..l.    LDR      r0,[r10,#0x6c]
        0x00001498:    2e01        ..      CMP      r6,#1
        0x0000149a:    fb00f002    ....    MUL      r0,r0,r2
        0x0000149e:    d007        ..      BEQ      0x14b0 ; CH8_OPREA + 112
        0x000014a0:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x000014a4:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x000014a8:    f8c30100    ....    STR      r0,[r3,#0x100]
        0x000014ac:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x000014b0:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x000014b4:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x000014b8:    f2427110    B..q    MOV      r1,#0x2710
        0x000014bc:    4348        HC      MULS     r0,r1,r0
        0x000014be:    e7f3        ..      B        0x14a8 ; CH8_OPREA + 104
        0x000014c0:    4823        #H      LDR      r0,[pc,#140] ; [0x1550] = 0x20000078
        0x000014c2:    f8dfe090    ....    LDR      lr,[pc,#144] ; [0x1554] = 0x20000020
        0x000014c6:    8800        ..      LDRH     r0,[r0,#0]
        0x000014c8:    f8dec000    ....    LDR      r12,[lr,#0]
        0x000014cc:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x000014d0:    f10c0001    ....    ADD      r0,r12,#1
        0x000014d4:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x000014d8:    d21c        ..      BCS      0x1514 ; CH8_OPREA + 212
        0x000014da:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000014de:    2e01        ..      CMP      r6,#1
        0x000014e0:    d00f        ..      BEQ      0x1502 ; CH8_OPREA + 194
        0x000014e2:    fb00f102    ....    MUL      r1,r0,r2
        0x000014e6:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x000014ea:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x000014ee:    bf00        ..      NOP      
        0x000014f0:    f8c31100    ....    STR      r1,[r3,#0x100]
        0x000014f4:    4911        .I      LDR      r1,[pc,#68] ; [0x153c] = 0x20000350
        0x000014f6:    eba90204    ....    SUB      r2,r9,r4
        0x000014fa:    62ca        .b      STR      r2,[r1,#0x2c]
        0x000014fc:    f8ca006c    ..l.    STR      r0,[r10,#0x6c]
        0x00001500:    e7d4        ..      B        0x14ac ; CH8_OPREA + 108
        0x00001502:    4351        QC      MULS     r1,r2,r1
        0x00001504:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x00001508:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x0000150c:    f2427210    B..r    MOV      r2,#0x2710
        0x00001510:    4351        QC      MULS     r1,r2,r1
        0x00001512:    e7ed        ..      B        0x14f0 ; CH8_OPREA + 176
        0x00001514:    d1ca        ..      BNE      0x14ac ; CH8_OPREA + 108
        0x00001516:    f8ce0000    ....    STR      r0,[lr,#0]
        0x0000151a:    4808        .H      LDR      r0,[pc,#32] ; [0x153c] = 0x20000350
        0x0000151c:    eba90104    ....    SUB      r1,r9,r4
        0x00001520:    62c1        .b      STR      r1,[r0,#0x2c]
        0x00001522:    480d        .H      LDR      r0,[pc,#52] ; [0x1558] = 0x200000a8
        0x00001524:    490d        .I      LDR      r1,[pc,#52] ; [0x155c] = 0x5f5e100
        0x00001526:    6800        .h      LDR      r0,[r0,#0]
        0x00001528:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x0000152c:    e7bc        ..      B        0x14a8 ; CH8_OPREA + 104
    $d
        0x0000152e:    0000        ..      DCW    0
        0x00001530:    20008400    ...     DCD    536904704
        0x00001534:    200003d4    ...     DCD    536871892
        0x00001538:    20000414    ...     DCD    536871956
        0x0000153c:    20000350    P..     DCD    536871760
        0x00001540:    200003a4    ...     DCD    536871844
        0x00001544:    20000058    X..     DCD    536871000
        0x00001548:    3b9aca00    ...;    DCD    1000000000
        0x0000154c:    20008000    ...     DCD    536903680
        0x00001550:    20000078    x..     DCD    536871032
        0x00001554:    20000020     ..     DCD    536870944
        0x00001558:    200000a8    ...     DCD    536871080
        0x0000155c:    05f5e100    ....    DCD    100000000
    $t
    i.CH9_Deploy
    CH9_Deploy
        0x00001560:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001562:    4c18        .L      LDR      r4,[pc,#96] ; [0x15c4] = 0x2000039c
        0x00001564:    2500        .%      MOVS     r5,#0
        0x00001566:    4e18        .N      LDR      r6,[pc,#96] ; [0x15c8] = 0x20000380
        0x00001568:    63e5        .c      STR      r5,[r4,#0x3c]
        0x0000156a:    f1b27f80    ....    CMP      r2,#0x1000000
        0x0000156e:    6035        5`      STR      r5,[r6,#0]
        0x00001570:    d301        ..      BCC      0x1576 ; CH9_Deploy + 22
        0x00001572:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00001576:    1a09        ..      SUBS     r1,r1,r0
        0x00001578:    fbb1f6f3    ....    UDIV     r6,r1,r3
        0x0000157c:    67e2        .g      STR      r2,[r4,#0x7c]
        0x0000157e:    f2402271    @.q"    MOV      r2,#0x271
        0x00001582:    4356        VC      MULS     r6,r2,r6
        0x00001584:    0117        ..      LSLS     r7,r2,#4
        0x00001586:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x0000158a:    0052        R.      LSLS     r2,r2,#1
        0x0000158c:    4b0f        .K      LDR      r3,[pc,#60] ; [0x15cc] = 0x200002f8
        0x0000158e:    ebb71f06    ....    CMP      r7,r6,LSL #4
        0x00001592:    d204        ..      BCS      0x159e ; CH9_Deploy + 62
        0x00001594:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001598:    7265        er      STRB     r5,[r4,#9]
        0x0000159a:    0049        I.      LSLS     r1,r1,#1
        0x0000159c:    e003        ..      B        0x15a6 ; CH9_Deploy + 70
        0x0000159e:    2501        .%      MOVS     r5,#1
        0x000015a0:    7265        er      STRB     r5,[r4,#9]
        0x000015a2:    4d0b        .M      LDR      r5,[pc,#44] ; [0x15d0] = 0x186a0
        0x000015a4:    4369        iC      MULS     r1,r5,r1
        0x000015a6:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x000015aa:    6019        .`      STR      r1,[r3,#0]
        0x000015ac:    4909        .I      LDR      r1,[pc,#36] ; [0x15d4] = 0x5f5e100
        0x000015ae:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x000015b2:    4909        .I      LDR      r1,[pc,#36] ; [0x15d8] = 0x20008000
        0x000015b4:    f8c10200    ....    STR      r0,[r1,#0x200]
        0x000015b8:    4908        .I      LDR      r1,[pc,#32] ; [0x15dc] = 0x2000c000
        0x000015ba:    6fe0        .o      LDR      r0,[r4,#0x7c]
        0x000015bc:    f8c10200    ....    STR      r0,[r1,#0x200]
        0x000015c0:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x000015c2:    0000        ..      DCW    0
        0x000015c4:    2000039c    ...     DCD    536871836
        0x000015c8:    20000380    ...     DCD    536871808
        0x000015cc:    200002f8    ...     DCD    536871672
        0x000015d0:    000186a0    ....    DCD    100000
        0x000015d4:    05f5e100    ....    DCD    100000000
        0x000015d8:    20008000    ...     DCD    536903680
        0x000015dc:    2000c000    ...     DCD    536920064
    $t
    i.CH9_OPREA
    CH9_OPREA
        0x000015e0:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x000015e4:    493a        :I      LDR      r1,[pc,#232] ; [0x16d0] = 0x20008800
        0x000015e6:    6808        .h      LDR      r0,[r1,#0]
        0x000015e8:    483a        :H      LDR      r0,[pc,#232] ; [0x16d4] = 0x200003d8
        0x000015ea:    680c        .h      LDR      r4,[r1,#0]
        0x000015ec:    f8dfa0ec    ....    LDR      r10,[pc,#236] ; [0x16dc] = 0x20000350
        0x000015f0:    6004        .`      STR      r4,[r0,#0]
        0x000015f2:    4839        9H      LDR      r0,[pc,#228] ; [0x16d8] = 0x20000418
        0x000015f4:    4a3a        :J      LDR      r2,[pc,#232] ; [0x16e0] = 0x200003a5
        0x000015f6:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x000015fa:    6801        .h      LDR      r1,[r0,#0]
        0x000015fc:    f6404735    @.5G    MOV      r7,#0xc35
        0x00001600:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x00001604:    6001        .`      STR      r1,[r0,#0]
        0x00001606:    4689        .F      MOV      r9,r1
        0x00001608:    4936        6I      LDR      r1,[pc,#216] ; [0x16e4] = 0x2000005a
        0x0000160a:    4834        4H      LDR      r0,[pc,#208] ; [0x16dc] = 0x20000350
        0x0000160c:    7816        .x      LDRB     r6,[r2,#0]
        0x0000160e:    8809        ..      LDRH     r1,[r1,#0]
        0x00001610:    6b00        .k      LDR      r0,[r0,#0x30]
        0x00001612:    fb01f507    ....    MUL      r5,r1,r7
        0x00001616:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x0000161a:    f8dfb0cc    ....    LDR      r11,[pc,#204] ; [0x16e8] = 0x3b9aca00
        0x0000161e:    4b33        3K      LDR      r3,[pc,#204] ; [0x16ec] = 0x20008000
        0x00001620:    f8da2028    ..(     LDR      r2,[r10,#0x28]
        0x00001624:    f8da1070    ..p.    LDR      r1,[r10,#0x70]
        0x00001628:    4284        .B      CMP      r4,r0
        0x0000162a:    d219        ..      BCS      0x1660 ; CH9_OPREA + 128
        0x0000162c:    4650        PF      MOV      r0,r10
        0x0000162e:    b109        ..      CBZ      r1,0x1634 ; CH9_OPREA + 84
        0x00001630:    1e49        I.      SUBS     r1,r1,#1
        0x00001632:    6701        .g      STR      r1,[r0,#0x70]
        0x00001634:    f8da0070    ..p.    LDR      r0,[r10,#0x70]
        0x00001638:    2e01        ..      CMP      r6,#1
        0x0000163a:    fb00f002    ....    MUL      r0,r0,r2
        0x0000163e:    d007        ..      BEQ      0x1650 ; CH9_OPREA + 112
        0x00001640:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x00001644:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00001648:    f8c30200    ....    STR      r0,[r3,#0x200]
        0x0000164c:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001650:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x00001654:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00001658:    f2427110    B..q    MOV      r1,#0x2710
        0x0000165c:    4348        HC      MULS     r0,r1,r0
        0x0000165e:    e7f3        ..      B        0x1648 ; CH9_OPREA + 104
        0x00001660:    4823        #H      LDR      r0,[pc,#140] ; [0x16f0] = 0x2000007a
        0x00001662:    f8dfe090    ....    LDR      lr,[pc,#144] ; [0x16f4] = 0x20000024
        0x00001666:    8800        ..      LDRH     r0,[r0,#0]
        0x00001668:    f8dec000    ....    LDR      r12,[lr,#0]
        0x0000166c:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x00001670:    f10c0001    ....    ADD      r0,r12,#1
        0x00001674:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x00001678:    d21c        ..      BCS      0x16b4 ; CH9_OPREA + 212
        0x0000167a:    f8ce0000    ....    STR      r0,[lr,#0]
        0x0000167e:    2e01        ..      CMP      r6,#1
        0x00001680:    d00f        ..      BEQ      0x16a2 ; CH9_OPREA + 194
        0x00001682:    fb00f102    ....    MUL      r1,r0,r2
        0x00001686:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x0000168a:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x0000168e:    bf00        ..      NOP      
        0x00001690:    f8c31200    ....    STR      r1,[r3,#0x200]
        0x00001694:    4911        .I      LDR      r1,[pc,#68] ; [0x16dc] = 0x20000350
        0x00001696:    eba90204    ....    SUB      r2,r9,r4
        0x0000169a:    630a        .c      STR      r2,[r1,#0x30]
        0x0000169c:    f8ca0070    ..p.    STR      r0,[r10,#0x70]
        0x000016a0:    e7d4        ..      B        0x164c ; CH9_OPREA + 108
        0x000016a2:    4351        QC      MULS     r1,r2,r1
        0x000016a4:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x000016a8:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x000016ac:    f2427210    B..r    MOV      r2,#0x2710
        0x000016b0:    4351        QC      MULS     r1,r2,r1
        0x000016b2:    e7ed        ..      B        0x1690 ; CH9_OPREA + 176
        0x000016b4:    d1ca        ..      BNE      0x164c ; CH9_OPREA + 108
        0x000016b6:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000016ba:    4808        .H      LDR      r0,[pc,#32] ; [0x16dc] = 0x20000350
        0x000016bc:    eba90104    ....    SUB      r1,r9,r4
        0x000016c0:    6301        .c      STR      r1,[r0,#0x30]
        0x000016c2:    480d        .H      LDR      r0,[pc,#52] ; [0x16f8] = 0x200000ac
        0x000016c4:    490d        .I      LDR      r1,[pc,#52] ; [0x16fc] = 0x5f5e100
        0x000016c6:    6800        .h      LDR      r0,[r0,#0]
        0x000016c8:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x000016cc:    e7bc        ..      B        0x1648 ; CH9_OPREA + 104
    $d
        0x000016ce:    0000        ..      DCW    0
        0x000016d0:    20008800    ...     DCD    536905728
        0x000016d4:    200003d8    ...     DCD    536871896
        0x000016d8:    20000418    ...     DCD    536871960
        0x000016dc:    20000350    P..     DCD    536871760
        0x000016e0:    200003a5    ...     DCD    536871845
        0x000016e4:    2000005a    Z..     DCD    536871002
        0x000016e8:    3b9aca00    ...;    DCD    1000000000
        0x000016ec:    20008000    ...     DCD    536903680
        0x000016f0:    2000007a    z..     DCD    536871034
        0x000016f4:    20000024    $..     DCD    536870948
        0x000016f8:    200000ac    ...     DCD    536871084
        0x000016fc:    05f5e100    ....    DCD    100000000
    $t
    i.CHA_Deploy
    CHA_Deploy
        0x00001700:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001702:    4c18        .L      LDR      r4,[pc,#96] ; [0x1764] = 0x2000039c
        0x00001704:    2600        .&      MOVS     r6,#0
        0x00001706:    4d18        .M      LDR      r5,[pc,#96] ; [0x1768] = 0x20000384
        0x00001708:    6426        &d      STR      r6,[r4,#0x40]
        0x0000170a:    f1b27f80    ....    CMP      r2,#0x1000000
        0x0000170e:    602e        .`      STR      r6,[r5,#0]
        0x00001710:    f1040580    ....    ADD      r5,r4,#0x80
        0x00001714:    d301        ..      BCC      0x171a ; CHA_Deploy + 26
        0x00001716:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x0000171a:    1a09        ..      SUBS     r1,r1,r0
        0x0000171c:    fbb1f7f3    ....    UDIV     r7,r1,r3
        0x00001720:    602a        *`      STR      r2,[r5,#0]
        0x00001722:    f2402271    @.q"    MOV      r2,#0x271
        0x00001726:    4357        WC      MULS     r7,r2,r7
        0x00001728:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x0000172c:    f2427c10    B..|    MOV      r12,#0x2710
        0x00001730:    0052        R.      LSLS     r2,r2,#1
        0x00001732:    4b0e        .K      LDR      r3,[pc,#56] ; [0x176c] = 0x200002fc
        0x00001734:    ebbc1f07    ....    CMP      r12,r7,LSL #4
        0x00001738:    d204        ..      BCS      0x1744 ; CHA_Deploy + 68
        0x0000173a:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x0000173e:    72a6        .r      STRB     r6,[r4,#0xa]
        0x00001740:    0049        I.      LSLS     r1,r1,#1
        0x00001742:    e003        ..      B        0x174c ; CHA_Deploy + 76
        0x00001744:    2601        .&      MOVS     r6,#1
        0x00001746:    72a6        .r      STRB     r6,[r4,#0xa]
        0x00001748:    4c09        .L      LDR      r4,[pc,#36] ; [0x1770] = 0x186a0
        0x0000174a:    4361        aC      MULS     r1,r4,r1
        0x0000174c:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00001750:    6019        .`      STR      r1,[r3,#0]
        0x00001752:    4908        .I      LDR      r1,[pc,#32] ; [0x1774] = 0x5f5e100
        0x00001754:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001758:    4907        .I      LDR      r1,[pc,#28] ; [0x1778] = 0x20008400
        0x0000175a:    6008        .`      STR      r0,[r1,#0]
        0x0000175c:    4907        .I      LDR      r1,[pc,#28] ; [0x177c] = 0x2000c400
        0x0000175e:    6828        (h      LDR      r0,[r5,#0]
        0x00001760:    6008        .`      STR      r0,[r1,#0]
        0x00001762:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001764:    2000039c    ...     DCD    536871836
        0x00001768:    20000384    ...     DCD    536871812
        0x0000176c:    200002fc    ...     DCD    536871676
        0x00001770:    000186a0    ....    DCD    100000
        0x00001774:    05f5e100    ....    DCD    100000000
        0x00001778:    20008400    ...     DCD    536904704
        0x0000177c:    2000c400    ...     DCD    536921088
    $t
    i.CHA_OPREA
    CHA_OPREA
        0x00001780:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001784:    4938        8I      LDR      r1,[pc,#224] ; [0x1868] = 0x20009000
        0x00001786:    6808        .h      LDR      r0,[r1,#0]
        0x00001788:    4838        8H      LDR      r0,[pc,#224] ; [0x186c] = 0x200003dc
        0x0000178a:    680c        .h      LDR      r4,[r1,#0]
        0x0000178c:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0x1874] = 0x20000350
        0x00001790:    6004        .`      STR      r4,[r0,#0]
        0x00001792:    4837        7H      LDR      r0,[pc,#220] ; [0x1870] = 0x2000041c
        0x00001794:    4a38        8J      LDR      r2,[pc,#224] ; [0x1878] = 0x200003a6
        0x00001796:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x0000179a:    6801        .h      LDR      r1,[r0,#0]
        0x0000179c:    f6404735    @.5G    MOV      r7,#0xc35
        0x000017a0:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x000017a4:    6001        .`      STR      r1,[r0,#0]
        0x000017a6:    4689        .F      MOV      r9,r1
        0x000017a8:    4934        4I      LDR      r1,[pc,#208] ; [0x187c] = 0x2000005c
        0x000017aa:    4832        2H      LDR      r0,[pc,#200] ; [0x1874] = 0x20000350
        0x000017ac:    7816        .x      LDRB     r6,[r2,#0]
        0x000017ae:    8809        ..      LDRH     r1,[r1,#0]
        0x000017b0:    6b40        @k      LDR      r0,[r0,#0x34]
        0x000017b2:    fb01f507    ....    MUL      r5,r1,r7
        0x000017b6:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x000017ba:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0x1880] = 0x3b9aca00
        0x000017be:    4b31        1K      LDR      r3,[pc,#196] ; [0x1884] = 0x20008400
        0x000017c0:    f8da202c    ..,     LDR      r2,[r10,#0x2c]
        0x000017c4:    f8da1074    ..t.    LDR      r1,[r10,#0x74]
        0x000017c8:    4284        .B      CMP      r4,r0
        0x000017ca:    d218        ..      BCS      0x17fe ; CHA_OPREA + 126
        0x000017cc:    4650        PF      MOV      r0,r10
        0x000017ce:    b109        ..      CBZ      r1,0x17d4 ; CHA_OPREA + 84
        0x000017d0:    1e49        I.      SUBS     r1,r1,#1
        0x000017d2:    6741        Ag      STR      r1,[r0,#0x74]
        0x000017d4:    f8da0074    ..t.    LDR      r0,[r10,#0x74]
        0x000017d8:    2e01        ..      CMP      r6,#1
        0x000017da:    fb00f002    ....    MUL      r0,r0,r2
        0x000017de:    d006        ..      BEQ      0x17ee ; CHA_OPREA + 110
        0x000017e0:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x000017e4:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x000017e8:    6018        .`      STR      r0,[r3,#0]
        0x000017ea:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x000017ee:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x000017f2:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x000017f6:    f2427110    B..q    MOV      r1,#0x2710
        0x000017fa:    4348        HC      MULS     r0,r1,r0
        0x000017fc:    e7f4        ..      B        0x17e8 ; CHA_OPREA + 104
        0x000017fe:    4822        "H      LDR      r0,[pc,#136] ; [0x1888] = 0x2000007c
        0x00001800:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0x188c] = 0x20000028
        0x00001804:    8800        ..      LDRH     r0,[r0,#0]
        0x00001806:    f8dec000    ....    LDR      r12,[lr,#0]
        0x0000180a:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x0000180e:    f10c0001    ....    ADD      r0,r12,#1
        0x00001812:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x00001816:    d21a        ..      BCS      0x184e ; CHA_OPREA + 206
        0x00001818:    f8ce0000    ....    STR      r0,[lr,#0]
        0x0000181c:    2e01        ..      CMP      r6,#1
        0x0000181e:    d00d        ..      BEQ      0x183c ; CHA_OPREA + 188
        0x00001820:    fb00f102    ....    MUL      r1,r0,r2
        0x00001824:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x00001828:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x0000182c:    6019        .`      STR      r1,[r3,#0]
        0x0000182e:    4911        .I      LDR      r1,[pc,#68] ; [0x1874] = 0x20000350
        0x00001830:    eba90204    ....    SUB      r2,r9,r4
        0x00001834:    634a        Jc      STR      r2,[r1,#0x34]
        0x00001836:    f8ca0074    ..t.    STR      r0,[r10,#0x74]
        0x0000183a:    e7d6        ..      B        0x17ea ; CHA_OPREA + 106
        0x0000183c:    4351        QC      MULS     r1,r2,r1
        0x0000183e:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x00001842:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x00001846:    f2427210    B..r    MOV      r2,#0x2710
        0x0000184a:    4351        QC      MULS     r1,r2,r1
        0x0000184c:    e7ee        ..      B        0x182c ; CHA_OPREA + 172
        0x0000184e:    d1cc        ..      BNE      0x17ea ; CHA_OPREA + 106
        0x00001850:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001854:    4807        .H      LDR      r0,[pc,#28] ; [0x1874] = 0x20000350
        0x00001856:    eba90104    ....    SUB      r1,r9,r4
        0x0000185a:    6341        Ac      STR      r1,[r0,#0x34]
        0x0000185c:    480c        .H      LDR      r0,[pc,#48] ; [0x1890] = 0x200000b0
        0x0000185e:    490d        .I      LDR      r1,[pc,#52] ; [0x1894] = 0x5f5e100
        0x00001860:    6800        .h      LDR      r0,[r0,#0]
        0x00001862:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001866:    e7bf        ..      B        0x17e8 ; CHA_OPREA + 104
    $d
        0x00001868:    20009000    ...     DCD    536907776
        0x0000186c:    200003dc    ...     DCD    536871900
        0x00001870:    2000041c    ...     DCD    536871964
        0x00001874:    20000350    P..     DCD    536871760
        0x00001878:    200003a6    ...     DCD    536871846
        0x0000187c:    2000005c    \..     DCD    536871004
        0x00001880:    3b9aca00    ...;    DCD    1000000000
        0x00001884:    20008400    ...     DCD    536904704
        0x00001888:    2000007c    |..     DCD    536871036
        0x0000188c:    20000028    (..     DCD    536870952
        0x00001890:    200000b0    ...     DCD    536871088
        0x00001894:    05f5e100    ....    DCD    100000000
    $t
    i.CHB_Deploy
    CHB_Deploy
        0x00001898:    b5f0        ..      PUSH     {r4-r7,lr}
        0x0000189a:    4c18        .L      LDR      r4,[pc,#96] ; [0x18fc] = 0x2000039c
        0x0000189c:    2600        .&      MOVS     r6,#0
        0x0000189e:    4d18        .M      LDR      r5,[pc,#96] ; [0x1900] = 0x20000388
        0x000018a0:    6466        fd      STR      r6,[r4,#0x44]
        0x000018a2:    f1b27f80    ....    CMP      r2,#0x1000000
        0x000018a6:    602e        .`      STR      r6,[r5,#0]
        0x000018a8:    f1040580    ....    ADD      r5,r4,#0x80
        0x000018ac:    d301        ..      BCC      0x18b2 ; CHB_Deploy + 26
        0x000018ae:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x000018b2:    1a09        ..      SUBS     r1,r1,r0
        0x000018b4:    fbb1f7f3    ....    UDIV     r7,r1,r3
        0x000018b8:    606a        j`      STR      r2,[r5,#4]
        0x000018ba:    f2402271    @.q"    MOV      r2,#0x271
        0x000018be:    4357        WC      MULS     r7,r2,r7
        0x000018c0:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x000018c4:    f2427c10    B..|    MOV      r12,#0x2710
        0x000018c8:    0052        R.      LSLS     r2,r2,#1
        0x000018ca:    4b0e        .K      LDR      r3,[pc,#56] ; [0x1904] = 0x20000300
        0x000018cc:    ebbc1f07    ....    CMP      r12,r7,LSL #4
        0x000018d0:    d204        ..      BCS      0x18dc ; CHB_Deploy + 68
        0x000018d2:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x000018d6:    72e6        .r      STRB     r6,[r4,#0xb]
        0x000018d8:    0049        I.      LSLS     r1,r1,#1
        0x000018da:    e003        ..      B        0x18e4 ; CHB_Deploy + 76
        0x000018dc:    2601        .&      MOVS     r6,#1
        0x000018de:    72e6        .r      STRB     r6,[r4,#0xb]
        0x000018e0:    4c09        .L      LDR      r4,[pc,#36] ; [0x1908] = 0x186a0
        0x000018e2:    4361        aC      MULS     r1,r4,r1
        0x000018e4:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x000018e8:    6019        .`      STR      r1,[r3,#0]
        0x000018ea:    4908        .I      LDR      r1,[pc,#32] ; [0x190c] = 0x5f5e100
        0x000018ec:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x000018f0:    4907        .I      LDR      r1,[pc,#28] ; [0x1910] = 0x20008800
        0x000018f2:    6008        .`      STR      r0,[r1,#0]
        0x000018f4:    4907        .I      LDR      r1,[pc,#28] ; [0x1914] = 0x2000c800
        0x000018f6:    6868        hh      LDR      r0,[r5,#4]
        0x000018f8:    6008        .`      STR      r0,[r1,#0]
        0x000018fa:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x000018fc:    2000039c    ...     DCD    536871836
        0x00001900:    20000388    ...     DCD    536871816
        0x00001904:    20000300    ...     DCD    536871680
        0x00001908:    000186a0    ....    DCD    100000
        0x0000190c:    05f5e100    ....    DCD    100000000
        0x00001910:    20008800    ...     DCD    536905728
        0x00001914:    2000c800    ...     DCD    536922112
    $t
    i.CHB_OPREA
    CHB_OPREA
        0x00001918:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x0000191c:    4938        8I      LDR      r1,[pc,#224] ; [0x1a00] = 0x2000a000
        0x0000191e:    6848        Hh      LDR      r0,[r1,#4]
        0x00001920:    4838        8H      LDR      r0,[pc,#224] ; [0x1a04] = 0x200003e0
        0x00001922:    684c        Lh      LDR      r4,[r1,#4]
        0x00001924:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0x1a0c] = 0x20000350
        0x00001928:    6004        .`      STR      r4,[r0,#0]
        0x0000192a:    4837        7H      LDR      r0,[pc,#220] ; [0x1a08] = 0x20000420
        0x0000192c:    4a38        8J      LDR      r2,[pc,#224] ; [0x1a10] = 0x200003a7
        0x0000192e:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00001932:    6801        .h      LDR      r1,[r0,#0]
        0x00001934:    f6404735    @.5G    MOV      r7,#0xc35
        0x00001938:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x0000193c:    6001        .`      STR      r1,[r0,#0]
        0x0000193e:    4689        .F      MOV      r9,r1
        0x00001940:    4934        4I      LDR      r1,[pc,#208] ; [0x1a14] = 0x2000005e
        0x00001942:    4832        2H      LDR      r0,[pc,#200] ; [0x1a0c] = 0x20000350
        0x00001944:    7816        .x      LDRB     r6,[r2,#0]
        0x00001946:    8809        ..      LDRH     r1,[r1,#0]
        0x00001948:    6b80        .k      LDR      r0,[r0,#0x38]
        0x0000194a:    fb01f507    ....    MUL      r5,r1,r7
        0x0000194e:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x00001952:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0x1a18] = 0x3b9aca00
        0x00001956:    4b31        1K      LDR      r3,[pc,#196] ; [0x1a1c] = 0x20008800
        0x00001958:    f8da2030    ..0     LDR      r2,[r10,#0x30]
        0x0000195c:    f8da1078    ..x.    LDR      r1,[r10,#0x78]
        0x00001960:    4284        .B      CMP      r4,r0
        0x00001962:    d218        ..      BCS      0x1996 ; CHB_OPREA + 126
        0x00001964:    4650        PF      MOV      r0,r10
        0x00001966:    b109        ..      CBZ      r1,0x196c ; CHB_OPREA + 84
        0x00001968:    1e49        I.      SUBS     r1,r1,#1
        0x0000196a:    6781        .g      STR      r1,[r0,#0x78]
        0x0000196c:    f8da0078    ..x.    LDR      r0,[r10,#0x78]
        0x00001970:    2e01        ..      CMP      r6,#1
        0x00001972:    fb00f002    ....    MUL      r0,r0,r2
        0x00001976:    d006        ..      BEQ      0x1986 ; CHB_OPREA + 110
        0x00001978:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x0000197c:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00001980:    6018        .`      STR      r0,[r3,#0]
        0x00001982:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001986:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x0000198a:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x0000198e:    f2427110    B..q    MOV      r1,#0x2710
        0x00001992:    4348        HC      MULS     r0,r1,r0
        0x00001994:    e7f4        ..      B        0x1980 ; CHB_OPREA + 104
        0x00001996:    4822        "H      LDR      r0,[pc,#136] ; [0x1a20] = 0x2000007e
        0x00001998:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0x1a24] = 0x2000002c
        0x0000199c:    8800        ..      LDRH     r0,[r0,#0]
        0x0000199e:    f8dec000    ....    LDR      r12,[lr,#0]
        0x000019a2:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x000019a6:    f10c0001    ....    ADD      r0,r12,#1
        0x000019aa:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x000019ae:    d21a        ..      BCS      0x19e6 ; CHB_OPREA + 206
        0x000019b0:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000019b4:    2e01        ..      CMP      r6,#1
        0x000019b6:    d00d        ..      BEQ      0x19d4 ; CHB_OPREA + 188
        0x000019b8:    fb00f102    ....    MUL      r1,r0,r2
        0x000019bc:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x000019c0:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x000019c4:    6019        .`      STR      r1,[r3,#0]
        0x000019c6:    4911        .I      LDR      r1,[pc,#68] ; [0x1a0c] = 0x20000350
        0x000019c8:    eba90204    ....    SUB      r2,r9,r4
        0x000019cc:    638a        .c      STR      r2,[r1,#0x38]
        0x000019ce:    f8ca0078    ..x.    STR      r0,[r10,#0x78]
        0x000019d2:    e7d6        ..      B        0x1982 ; CHB_OPREA + 106
        0x000019d4:    4351        QC      MULS     r1,r2,r1
        0x000019d6:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x000019da:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x000019de:    f2427210    B..r    MOV      r2,#0x2710
        0x000019e2:    4351        QC      MULS     r1,r2,r1
        0x000019e4:    e7ee        ..      B        0x19c4 ; CHB_OPREA + 172
        0x000019e6:    d1cc        ..      BNE      0x1982 ; CHB_OPREA + 106
        0x000019e8:    f8ce0000    ....    STR      r0,[lr,#0]
        0x000019ec:    4807        .H      LDR      r0,[pc,#28] ; [0x1a0c] = 0x20000350
        0x000019ee:    eba90104    ....    SUB      r1,r9,r4
        0x000019f2:    6381        .c      STR      r1,[r0,#0x38]
        0x000019f4:    480c        .H      LDR      r0,[pc,#48] ; [0x1a28] = 0x200000b4
        0x000019f6:    490d        .I      LDR      r1,[pc,#52] ; [0x1a2c] = 0x5f5e100
        0x000019f8:    6800        .h      LDR      r0,[r0,#0]
        0x000019fa:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x000019fe:    e7bf        ..      B        0x1980 ; CHB_OPREA + 104
    $d
        0x00001a00:    2000a000    ...     DCD    536911872
        0x00001a04:    200003e0    ...     DCD    536871904
        0x00001a08:    20000420     ..     DCD    536871968
        0x00001a0c:    20000350    P..     DCD    536871760
        0x00001a10:    200003a7    ...     DCD    536871847
        0x00001a14:    2000005e    ^..     DCD    536871006
        0x00001a18:    3b9aca00    ...;    DCD    1000000000
        0x00001a1c:    20008800    ...     DCD    536905728
        0x00001a20:    2000007e    ~..     DCD    536871038
        0x00001a24:    2000002c    ,..     DCD    536870956
        0x00001a28:    200000b4    ...     DCD    536871092
        0x00001a2c:    05f5e100    ....    DCD    100000000
    $t
    i.CHC_Deploy
    CHC_Deploy
        0x00001a30:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001a32:    4c18        .L      LDR      r4,[pc,#96] ; [0x1a94] = 0x2000039c
        0x00001a34:    2600        .&      MOVS     r6,#0
        0x00001a36:    4d18        .M      LDR      r5,[pc,#96] ; [0x1a98] = 0x2000038c
        0x00001a38:    64a6        .d      STR      r6,[r4,#0x48]
        0x00001a3a:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00001a3e:    602e        .`      STR      r6,[r5,#0]
        0x00001a40:    f1040580    ....    ADD      r5,r4,#0x80
        0x00001a44:    d301        ..      BCC      0x1a4a ; CHC_Deploy + 26
        0x00001a46:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00001a4a:    1a09        ..      SUBS     r1,r1,r0
        0x00001a4c:    fbb1f7f3    ....    UDIV     r7,r1,r3
        0x00001a50:    60aa        .`      STR      r2,[r5,#8]
        0x00001a52:    f2402271    @.q"    MOV      r2,#0x271
        0x00001a56:    4357        WC      MULS     r7,r2,r7
        0x00001a58:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00001a5c:    f2427c10    B..|    MOV      r12,#0x2710
        0x00001a60:    0052        R.      LSLS     r2,r2,#1
        0x00001a62:    4b0e        .K      LDR      r3,[pc,#56] ; [0x1a9c] = 0x20000304
        0x00001a64:    ebbc1f07    ....    CMP      r12,r7,LSL #4
        0x00001a68:    d204        ..      BCS      0x1a74 ; CHC_Deploy + 68
        0x00001a6a:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001a6e:    7326        &s      STRB     r6,[r4,#0xc]
        0x00001a70:    0049        I.      LSLS     r1,r1,#1
        0x00001a72:    e003        ..      B        0x1a7c ; CHC_Deploy + 76
        0x00001a74:    2601        .&      MOVS     r6,#1
        0x00001a76:    7326        &s      STRB     r6,[r4,#0xc]
        0x00001a78:    4c09        .L      LDR      r4,[pc,#36] ; [0x1aa0] = 0x186a0
        0x00001a7a:    4361        aC      MULS     r1,r4,r1
        0x00001a7c:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00001a80:    6019        .`      STR      r1,[r3,#0]
        0x00001a82:    4908        .I      LDR      r1,[pc,#32] ; [0x1aa4] = 0x5f5e100
        0x00001a84:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001a88:    4907        .I      LDR      r1,[pc,#28] ; [0x1aa8] = 0x20009000
        0x00001a8a:    6008        .`      STR      r0,[r1,#0]
        0x00001a8c:    4907        .I      LDR      r1,[pc,#28] ; [0x1aac] = 0x2000d000
        0x00001a8e:    68a8        .h      LDR      r0,[r5,#8]
        0x00001a90:    6008        .`      STR      r0,[r1,#0]
        0x00001a92:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001a94:    2000039c    ...     DCD    536871836
        0x00001a98:    2000038c    ...     DCD    536871820
        0x00001a9c:    20000304    ...     DCD    536871684
        0x00001aa0:    000186a0    ....    DCD    100000
        0x00001aa4:    05f5e100    ....    DCD    100000000
        0x00001aa8:    20009000    ...     DCD    536907776
        0x00001aac:    2000d000    ...     DCD    536924160
    $t
    i.CHC_OPREA
    CHC_OPREA
        0x00001ab0:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001ab4:    4938        8I      LDR      r1,[pc,#224] ; [0x1b98] = 0x2000a000
        0x00001ab6:    6888        .h      LDR      r0,[r1,#8]
        0x00001ab8:    4838        8H      LDR      r0,[pc,#224] ; [0x1b9c] = 0x200003e4
        0x00001aba:    688c        .h      LDR      r4,[r1,#8]
        0x00001abc:    f8dfa0e4    ....    LDR      r10,[pc,#228] ; [0x1ba4] = 0x20000350
        0x00001ac0:    6004        .`      STR      r4,[r0,#0]
        0x00001ac2:    4837        7H      LDR      r0,[pc,#220] ; [0x1ba0] = 0x20000424
        0x00001ac4:    4a38        8J      LDR      r2,[pc,#224] ; [0x1ba8] = 0x200003a8
        0x00001ac6:    f1aa0a80    ....    SUB      r10,r10,#0x80
        0x00001aca:    6801        .h      LDR      r1,[r0,#0]
        0x00001acc:    f6404735    @.5G    MOV      r7,#0xc35
        0x00001ad0:    f021417f    !..A    BIC      r1,r1,#0xff000000
        0x00001ad4:    6001        .`      STR      r1,[r0,#0]
        0x00001ad6:    4689        .F      MOV      r9,r1
        0x00001ad8:    4934        4I      LDR      r1,[pc,#208] ; [0x1bac] = 0x20000060
        0x00001ada:    4832        2H      LDR      r0,[pc,#200] ; [0x1ba4] = 0x20000350
        0x00001adc:    7816        .x      LDRB     r6,[r2,#0]
        0x00001ade:    8809        ..      LDRH     r1,[r1,#0]
        0x00001ae0:    6bc0        .k      LDR      r0,[r0,#0x3c]
        0x00001ae2:    fb01f507    ....    MUL      r5,r1,r7
        0x00001ae6:    eb010781    ....    ADD      r7,r1,r1,LSL #2
        0x00001aea:    f8dfb0c4    ....    LDR      r11,[pc,#196] ; [0x1bb0] = 0x3b9aca00
        0x00001aee:    4b31        1K      LDR      r3,[pc,#196] ; [0x1bb4] = 0x20009000
        0x00001af0:    f8da2034    ..4     LDR      r2,[r10,#0x34]
        0x00001af4:    f8da107c    ..|.    LDR      r1,[r10,#0x7c]
        0x00001af8:    4284        .B      CMP      r4,r0
        0x00001afa:    d218        ..      BCS      0x1b2e ; CHC_OPREA + 126
        0x00001afc:    4650        PF      MOV      r0,r10
        0x00001afe:    b109        ..      CBZ      r1,0x1b04 ; CHC_OPREA + 84
        0x00001b00:    1e49        I.      SUBS     r1,r1,#1
        0x00001b02:    67c1        .g      STR      r1,[r0,#0x7c]
        0x00001b04:    f8da007c    ..|.    LDR      r0,[r10,#0x7c]
        0x00001b08:    2e01        ..      CMP      r6,#1
        0x00001b0a:    fb00f002    ....    MUL      r0,r0,r2
        0x00001b0e:    d006        ..      BEQ      0x1b1e ; CHC_OPREA + 110
        0x00001b10:    eb000147    ..G.    ADD      r1,r0,r7,LSL #1
        0x00001b14:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00001b18:    6018        .`      STR      r0,[r3,#0]
        0x00001b1a:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001b1e:    eb001145    ..E.    ADD      r1,r0,r5,LSL #5
        0x00001b22:    fbbbf0f1    ....    UDIV     r0,r11,r1
        0x00001b26:    f2427110    B..q    MOV      r1,#0x2710
        0x00001b2a:    4348        HC      MULS     r0,r1,r0
        0x00001b2c:    e7f4        ..      B        0x1b18 ; CHC_OPREA + 104
        0x00001b2e:    4822        "H      LDR      r0,[pc,#136] ; [0x1bb8] = 0x20000080
        0x00001b30:    f8dfe088    ....    LDR      lr,[pc,#136] ; [0x1bbc] = 0x20000030
        0x00001b34:    8800        ..      LDRH     r0,[r0,#0]
        0x00001b36:    f8dec000    ....    LDR      r12,[lr,#0]
        0x00001b3a:    eb000880    ....    ADD      r8,r0,r0,LSL #2
        0x00001b3e:    f10c0001    ....    ADD      r0,r12,#1
        0x00001b42:    ebbc0f48    ..H.    CMP      r12,r8,LSL #1
        0x00001b46:    d21a        ..      BCS      0x1b7e ; CHC_OPREA + 206
        0x00001b48:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001b4c:    2e01        ..      CMP      r6,#1
        0x00001b4e:    d00d        ..      BEQ      0x1b6c ; CHC_OPREA + 188
        0x00001b50:    fb00f102    ....    MUL      r1,r0,r2
        0x00001b54:    eb010247    ..G.    ADD      r2,r1,r7,LSL #1
        0x00001b58:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x00001b5c:    6019        .`      STR      r1,[r3,#0]
        0x00001b5e:    4911        .I      LDR      r1,[pc,#68] ; [0x1ba4] = 0x20000350
        0x00001b60:    eba90204    ....    SUB      r2,r9,r4
        0x00001b64:    63ca        .c      STR      r2,[r1,#0x3c]
        0x00001b66:    f8ca007c    ..|.    STR      r0,[r10,#0x7c]
        0x00001b6a:    e7d6        ..      B        0x1b1a ; CHC_OPREA + 106
        0x00001b6c:    4351        QC      MULS     r1,r2,r1
        0x00001b6e:    eb011245    ..E.    ADD      r2,r1,r5,LSL #5
        0x00001b72:    fbbbf1f2    ....    UDIV     r1,r11,r2
        0x00001b76:    f2427210    B..r    MOV      r2,#0x2710
        0x00001b7a:    4351        QC      MULS     r1,r2,r1
        0x00001b7c:    e7ee        ..      B        0x1b5c ; CHC_OPREA + 172
        0x00001b7e:    d1cc        ..      BNE      0x1b1a ; CHC_OPREA + 106
        0x00001b80:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001b84:    4807        .H      LDR      r0,[pc,#28] ; [0x1ba4] = 0x20000350
        0x00001b86:    eba90104    ....    SUB      r1,r9,r4
        0x00001b8a:    63c1        .c      STR      r1,[r0,#0x3c]
        0x00001b8c:    480c        .H      LDR      r0,[pc,#48] ; [0x1bc0] = 0x200000b8
        0x00001b8e:    490d        .I      LDR      r1,[pc,#52] ; [0x1bc4] = 0x5f5e100
        0x00001b90:    6800        .h      LDR      r0,[r0,#0]
        0x00001b92:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001b96:    e7bf        ..      B        0x1b18 ; CHC_OPREA + 104
    $d
        0x00001b98:    2000a000    ...     DCD    536911872
        0x00001b9c:    200003e4    ...     DCD    536871908
        0x00001ba0:    20000424    $..     DCD    536871972
        0x00001ba4:    20000350    P..     DCD    536871760
        0x00001ba8:    200003a8    ...     DCD    536871848
        0x00001bac:    20000060    `..     DCD    536871008
        0x00001bb0:    3b9aca00    ...;    DCD    1000000000
        0x00001bb4:    20009000    ...     DCD    536907776
        0x00001bb8:    20000080    ...     DCD    536871040
        0x00001bbc:    20000030    0..     DCD    536870960
        0x00001bc0:    200000b8    ...     DCD    536871096
        0x00001bc4:    05f5e100    ....    DCD    100000000
    $t
    i.CHD_Deploy
    CHD_Deploy
        0x00001bc8:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001bca:    4c18        .L      LDR      r4,[pc,#96] ; [0x1c2c] = 0x2000039c
        0x00001bcc:    2600        .&      MOVS     r6,#0
        0x00001bce:    4d18        .M      LDR      r5,[pc,#96] ; [0x1c30] = 0x20000390
        0x00001bd0:    64e6        .d      STR      r6,[r4,#0x4c]
        0x00001bd2:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00001bd6:    602e        .`      STR      r6,[r5,#0]
        0x00001bd8:    f1040580    ....    ADD      r5,r4,#0x80
        0x00001bdc:    d301        ..      BCC      0x1be2 ; CHD_Deploy + 26
        0x00001bde:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00001be2:    1a09        ..      SUBS     r1,r1,r0
        0x00001be4:    fbb1f7f3    ....    UDIV     r7,r1,r3
        0x00001be8:    60ea        .`      STR      r2,[r5,#0xc]
        0x00001bea:    f2402271    @.q"    MOV      r2,#0x271
        0x00001bee:    4357        WC      MULS     r7,r2,r7
        0x00001bf0:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00001bf4:    f2427c10    B..|    MOV      r12,#0x2710
        0x00001bf8:    0052        R.      LSLS     r2,r2,#1
        0x00001bfa:    4b0e        .K      LDR      r3,[pc,#56] ; [0x1c34] = 0x20000308
        0x00001bfc:    ebbc1f07    ....    CMP      r12,r7,LSL #4
        0x00001c00:    d204        ..      BCS      0x1c0c ; CHD_Deploy + 68
        0x00001c02:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001c06:    7366        fs      STRB     r6,[r4,#0xd]
        0x00001c08:    0049        I.      LSLS     r1,r1,#1
        0x00001c0a:    e003        ..      B        0x1c14 ; CHD_Deploy + 76
        0x00001c0c:    2601        .&      MOVS     r6,#1
        0x00001c0e:    7366        fs      STRB     r6,[r4,#0xd]
        0x00001c10:    4c09        .L      LDR      r4,[pc,#36] ; [0x1c38] = 0x186a0
        0x00001c12:    4361        aC      MULS     r1,r4,r1
        0x00001c14:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00001c18:    6019        .`      STR      r1,[r3,#0]
        0x00001c1a:    4908        .I      LDR      r1,[pc,#32] ; [0x1c3c] = 0x5f5e100
        0x00001c1c:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001c20:    4907        .I      LDR      r1,[pc,#28] ; [0x1c40] = 0x2000a000
        0x00001c22:    6048        H`      STR      r0,[r1,#4]
        0x00001c24:    4907        .I      LDR      r1,[pc,#28] ; [0x1c44] = 0x2000e000
        0x00001c26:    68e8        .h      LDR      r0,[r5,#0xc]
        0x00001c28:    6048        H`      STR      r0,[r1,#4]
        0x00001c2a:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001c2c:    2000039c    ...     DCD    536871836
        0x00001c30:    20000390    ...     DCD    536871824
        0x00001c34:    20000308    ...     DCD    536871688
        0x00001c38:    000186a0    ....    DCD    100000
        0x00001c3c:    05f5e100    ....    DCD    100000000
        0x00001c40:    2000a000    ...     DCD    536911872
        0x00001c44:    2000e000    ...     DCD    536928256
    $t
    i.CHD_OPREA
    CHD_OPREA
        0x00001c48:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001c4c:    4937        7I      LDR      r1,[pc,#220] ; [0x1d2c] = 0x2000a000
        0x00001c4e:    6908        .i      LDR      r0,[r1,#0x10]
        0x00001c50:    4837        7H      LDR      r0,[pc,#220] ; [0x1d30] = 0x200003e8
        0x00001c52:    690c        .i      LDR      r4,[r1,#0x10]
        0x00001c54:    f8dfa0e0    ....    LDR      r10,[pc,#224] ; [0x1d38] = 0x20000350
        0x00001c58:    6004        .`      STR      r4,[r0,#0]
        0x00001c5a:    4836        6H      LDR      r0,[pc,#216] ; [0x1d34] = 0x20000428
        0x00001c5c:    4b37        7K      LDR      r3,[pc,#220] ; [0x1d3c] = 0x200003a9
        0x00001c5e:    4d38        8M      LDR      r5,[pc,#224] ; [0x1d40] = 0x20000062
        0x00001c60:    6802        .h      LDR      r2,[r0,#0]
        0x00001c62:    f6404735    @.5G    MOV      r7,#0xc35
        0x00001c66:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00001c6a:    4691        .F      MOV      r9,r2
        0x00001c6c:    6002        .`      STR      r2,[r0,#0]
        0x00001c6e:    f1aa0280    ....    SUB      r2,r10,#0x80
        0x00001c72:    781e        .x      LDRB     r6,[r3,#0]
        0x00001c74:    6b93        .k      LDR      r3,[r2,#0x38]
        0x00001c76:    882a        *.      LDRH     r2,[r5,#0]
        0x00001c78:    f8da002c    ..,.    LDR      r0,[r10,#0x2c]
        0x00001c7c:    fb02f507    ....    MUL      r5,r2,r7
        0x00001c80:    eb020782    ....    ADD      r7,r2,r2,LSL #2
        0x00001c84:    4652        RF      MOV      r2,r10
        0x00001c86:    f8dfb0bc    ....    LDR      r11,[pc,#188] ; [0x1d44] = 0x3b9aca00
        0x00001c8a:    6812        .h      LDR      r2,[r2,#0]
        0x00001c8c:    4284        .B      CMP      r4,r0
        0x00001c8e:    d218        ..      BCS      0x1cc2 ; CHD_OPREA + 122
        0x00001c90:    4650        PF      MOV      r0,r10
        0x00001c92:    b10a        ..      CBZ      r2,0x1c98 ; CHD_OPREA + 80
        0x00001c94:    1e52        R.      SUBS     r2,r2,#1
        0x00001c96:    6002        .`      STR      r2,[r0,#0]
        0x00001c98:    f8da0000    ....    LDR      r0,[r10,#0]
        0x00001c9c:    2e01        ..      CMP      r6,#1
        0x00001c9e:    fb00f003    ....    MUL      r0,r0,r3
        0x00001ca2:    d006        ..      BEQ      0x1cb2 ; CHD_OPREA + 106
        0x00001ca4:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00001ca8:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00001cac:    6048        H`      STR      r0,[r1,#4]
        0x00001cae:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001cb2:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00001cb6:    fbbbf0f2    ....    UDIV     r0,r11,r2
        0x00001cba:    f2427210    B..r    MOV      r2,#0x2710
        0x00001cbe:    4350        PC      MULS     r0,r2,r0
        0x00001cc0:    e7f4        ..      B        0x1cac ; CHD_OPREA + 100
        0x00001cc2:    4821        !H      LDR      r0,[pc,#132] ; [0x1d48] = 0x20000082
        0x00001cc4:    f8dfe084    ....    LDR      lr,[pc,#132] ; [0x1d4c] = 0x20000034
        0x00001cc8:    8800        ..      LDRH     r0,[r0,#0]
        0x00001cca:    f8de8000    ....    LDR      r8,[lr,#0]
        0x00001cce:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00001cd2:    f1080001    ....    ADD      r0,r8,#1
        0x00001cd6:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x00001cda:    d21a        ..      BCS      0x1d12 ; CHD_OPREA + 202
        0x00001cdc:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001ce0:    2e01        ..      CMP      r6,#1
        0x00001ce2:    d00d        ..      BEQ      0x1d00 ; CHD_OPREA + 184
        0x00001ce4:    fb00f203    ....    MUL      r2,r0,r3
        0x00001ce8:    eb020347    ..G.    ADD      r3,r2,r7,LSL #1
        0x00001cec:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00001cf0:    604a        J`      STR      r2,[r1,#4]
        0x00001cf2:    eba90204    ....    SUB      r2,r9,r4
        0x00001cf6:    f8ca2040    ..@     STR      r2,[r10,#0x40]
        0x00001cfa:    f8ca0000    ....    STR      r0,[r10,#0]
        0x00001cfe:    e7d6        ..      B        0x1cae ; CHD_OPREA + 102
        0x00001d00:    435a        ZC      MULS     r2,r3,r2
        0x00001d02:    eb021345    ..E.    ADD      r3,r2,r5,LSL #5
        0x00001d06:    fbbbf2f3    ....    UDIV     r2,r11,r3
        0x00001d0a:    f2427310    B..s    MOV      r3,#0x2710
        0x00001d0e:    435a        ZC      MULS     r2,r3,r2
        0x00001d10:    e7ee        ..      B        0x1cf0 ; CHD_OPREA + 168
        0x00001d12:    d1cc        ..      BNE      0x1cae ; CHD_OPREA + 102
        0x00001d14:    f8ce0000    ....    STR      r0,[lr,#0]
        0x00001d18:    eba90204    ....    SUB      r2,r9,r4
        0x00001d1c:    480c        .H      LDR      r0,[pc,#48] ; [0x1d50] = 0x200000bc
        0x00001d1e:    f8ca2040    ..@     STR      r2,[r10,#0x40]
        0x00001d22:    4a0c        .J      LDR      r2,[pc,#48] ; [0x1d54] = 0x5f5e100
        0x00001d24:    6800        .h      LDR      r0,[r0,#0]
        0x00001d26:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00001d2a:    e7bf        ..      B        0x1cac ; CHD_OPREA + 100
    $d
        0x00001d2c:    2000a000    ...     DCD    536911872
        0x00001d30:    200003e8    ...     DCD    536871912
        0x00001d34:    20000428    (..     DCD    536871976
        0x00001d38:    20000350    P..     DCD    536871760
        0x00001d3c:    200003a9    ...     DCD    536871849
        0x00001d40:    20000062    b..     DCD    536871010
        0x00001d44:    3b9aca00    ...;    DCD    1000000000
        0x00001d48:    20000082    ...     DCD    536871042
        0x00001d4c:    20000034    4..     DCD    536870964
        0x00001d50:    200000bc    ...     DCD    536871100
        0x00001d54:    05f5e100    ....    DCD    100000000
    $t
    i.CHE_Deploy
    CHE_Deploy
        0x00001d58:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001d5a:    4c18        .L      LDR      r4,[pc,#96] ; [0x1dbc] = 0x2000039c
        0x00001d5c:    2600        .&      MOVS     r6,#0
        0x00001d5e:    4d18        .M      LDR      r5,[pc,#96] ; [0x1dc0] = 0x20000394
        0x00001d60:    6526        &e      STR      r6,[r4,#0x50]
        0x00001d62:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00001d66:    602e        .`      STR      r6,[r5,#0]
        0x00001d68:    f1040580    ....    ADD      r5,r4,#0x80
        0x00001d6c:    d301        ..      BCC      0x1d72 ; CHE_Deploy + 26
        0x00001d6e:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00001d72:    1a09        ..      SUBS     r1,r1,r0
        0x00001d74:    fbb1f7f3    ....    UDIV     r7,r1,r3
        0x00001d78:    612a        *a      STR      r2,[r5,#0x10]
        0x00001d7a:    f2402271    @.q"    MOV      r2,#0x271
        0x00001d7e:    4357        WC      MULS     r7,r2,r7
        0x00001d80:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00001d84:    f2427c10    B..|    MOV      r12,#0x2710
        0x00001d88:    0052        R.      LSLS     r2,r2,#1
        0x00001d8a:    4b0e        .K      LDR      r3,[pc,#56] ; [0x1dc4] = 0x2000030c
        0x00001d8c:    ebbc1f07    ....    CMP      r12,r7,LSL #4
        0x00001d90:    d204        ..      BCS      0x1d9c ; CHE_Deploy + 68
        0x00001d92:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001d96:    73a6        .s      STRB     r6,[r4,#0xe]
        0x00001d98:    0049        I.      LSLS     r1,r1,#1
        0x00001d9a:    e003        ..      B        0x1da4 ; CHE_Deploy + 76
        0x00001d9c:    2601        .&      MOVS     r6,#1
        0x00001d9e:    73a6        .s      STRB     r6,[r4,#0xe]
        0x00001da0:    4c09        .L      LDR      r4,[pc,#36] ; [0x1dc8] = 0x186a0
        0x00001da2:    4361        aC      MULS     r1,r4,r1
        0x00001da4:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00001da8:    6019        .`      STR      r1,[r3,#0]
        0x00001daa:    4908        .I      LDR      r1,[pc,#32] ; [0x1dcc] = 0x5f5e100
        0x00001dac:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001db0:    4907        .I      LDR      r1,[pc,#28] ; [0x1dd0] = 0x2000a000
        0x00001db2:    6088        .`      STR      r0,[r1,#8]
        0x00001db4:    4907        .I      LDR      r1,[pc,#28] ; [0x1dd4] = 0x2000e000
        0x00001db6:    6928        (i      LDR      r0,[r5,#0x10]
        0x00001db8:    6088        .`      STR      r0,[r1,#8]
        0x00001dba:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001dbc:    2000039c    ...     DCD    536871836
        0x00001dc0:    20000394    ...     DCD    536871828
        0x00001dc4:    2000030c    ...     DCD    536871692
        0x00001dc8:    000186a0    ....    DCD    100000
        0x00001dcc:    05f5e100    ....    DCD    100000000
        0x00001dd0:    2000a000    ...     DCD    536911872
        0x00001dd4:    2000e000    ...     DCD    536928256
    $t
    i.CHE_OPREA
    CHE_OPREA
        0x00001dd8:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001ddc:    4933        3I      LDR      r1,[pc,#204] ; [0x1eac] = 0x2000a000
        0x00001dde:    6a08        .j      LDR      r0,[r1,#0x20]
        0x00001de0:    4833        3H      LDR      r0,[pc,#204] ; [0x1eb0] = 0x200003ec
        0x00001de2:    6a0c        .j      LDR      r4,[r1,#0x20]
        0x00001de4:    4d36        6M      LDR      r5,[pc,#216] ; [0x1ec0] = 0x20000064
        0x00001de6:    6004        .`      STR      r4,[r0,#0]
        0x00001de8:    4832        2H      LDR      r0,[pc,#200] ; [0x1eb4] = 0x2000042c
        0x00001dea:    4e34        4N      LDR      r6,[pc,#208] ; [0x1ebc] = 0x200003aa
        0x00001dec:    f6404c35    @.5L    MOV      r12,#0xc35
        0x00001df0:    6802        .h      LDR      r2,[r0,#0]
        0x00001df2:    f8dfa0d0    ....    LDR      r10,[pc,#208] ; [0x1ec4] = 0x3b9aca00
        0x00001df6:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00001dfa:    6002        .`      STR      r2,[r0,#0]
        0x00001dfc:    4691        .F      MOV      r9,r2
        0x00001dfe:    4a2e        .J      LDR      r2,[pc,#184] ; [0x1eb8] = 0x20000350
        0x00001e00:    882f        /.      LDRH     r7,[r5,#0]
        0x00001e02:    f1a20380    ....    SUB      r3,r2,#0x80
        0x00001e06:    6ad0        .j      LDR      r0,[r2,#0x2c]
        0x00001e08:    7836        6x      LDRB     r6,[r6,#0]
        0x00001e0a:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00001e0c:    fb07f50c    ....    MUL      r5,r7,r12
        0x00001e10:    eb070787    ....    ADD      r7,r7,r7,LSL #2
        0x00001e14:    4284        .B      CMP      r4,r0
        0x00001e16:    d216        ..      BCS      0x1e46 ; CHE_OPREA + 110
        0x00001e18:    6850        Ph      LDR      r0,[r2,#4]
        0x00001e1a:    b108        ..      CBZ      r0,0x1e20 ; CHE_OPREA + 72
        0x00001e1c:    1e40        @.      SUBS     r0,r0,#1
        0x00001e1e:    6050        P`      STR      r0,[r2,#4]
        0x00001e20:    2e01        ..      CMP      r6,#1
        0x00001e22:    fb00f003    ....    MUL      r0,r0,r3
        0x00001e26:    d006        ..      BEQ      0x1e36 ; CHE_OPREA + 94
        0x00001e28:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00001e2c:    fbbaf0f2    ....    UDIV     r0,r10,r2
        0x00001e30:    6088        .`      STR      r0,[r1,#8]
        0x00001e32:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001e36:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00001e3a:    fbbaf0f2    ....    UDIV     r0,r10,r2
        0x00001e3e:    f2427210    B..r    MOV      r2,#0x2710
        0x00001e42:    4350        PC      MULS     r0,r2,r0
        0x00001e44:    e7f4        ..      B        0x1e30 ; CHE_OPREA + 88
        0x00001e46:    4820         H      LDR      r0,[pc,#128] ; [0x1ec8] = 0x20000084
        0x00001e48:    f8dfb080    ....    LDR      r11,[pc,#128] ; [0x1ecc] = 0x20000038
        0x00001e4c:    8800        ..      LDRH     r0,[r0,#0]
        0x00001e4e:    f8db8000    ....    LDR      r8,[r11,#0]
        0x00001e52:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00001e56:    f1080001    ....    ADD      r0,r8,#1
        0x00001e5a:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x00001e5e:    d218        ..      BCS      0x1e92 ; CHE_OPREA + 186
        0x00001e60:    f8cb0000    ....    STR      r0,[r11,#0]
        0x00001e64:    2e01        ..      CMP      r6,#1
        0x00001e66:    d00a        ..      BEQ      0x1e7e ; CHE_OPREA + 166
        0x00001e68:    4343        CC      MULS     r3,r0,r3
        0x00001e6a:    eb030547    ..G.    ADD      r5,r3,r7,LSL #1
        0x00001e6e:    fbbaf3f5    ....    UDIV     r3,r10,r5
        0x00001e72:    608b        .`      STR      r3,[r1,#8]
        0x00001e74:    eba90104    ....    SUB      r1,r9,r4
        0x00001e78:    6451        Qd      STR      r1,[r2,#0x44]
        0x00001e7a:    6050        P`      STR      r0,[r2,#4]
        0x00001e7c:    e7d9        ..      B        0x1e32 ; CHE_OPREA + 90
        0x00001e7e:    6856        Vh      LDR      r6,[r2,#4]
        0x00001e80:    435e        ^C      MULS     r6,r3,r6
        0x00001e82:    eb061545    ..E.    ADD      r5,r6,r5,LSL #5
        0x00001e86:    fbbaf3f5    ....    UDIV     r3,r10,r5
        0x00001e8a:    f2427510    B..u    MOV      r5,#0x2710
        0x00001e8e:    436b        kC      MULS     r3,r5,r3
        0x00001e90:    e7ef        ..      B        0x1e72 ; CHE_OPREA + 154
        0x00001e92:    d1ce        ..      BNE      0x1e32 ; CHE_OPREA + 90
        0x00001e94:    f8cb0000    ....    STR      r0,[r11,#0]
        0x00001e98:    eba90004    ....    SUB      r0,r9,r4
        0x00001e9c:    6450        Pd      STR      r0,[r2,#0x44]
        0x00001e9e:    480c        .H      LDR      r0,[pc,#48] ; [0x1ed0] = 0x200000c0
        0x00001ea0:    4a0c        .J      LDR      r2,[pc,#48] ; [0x1ed4] = 0x5f5e100
        0x00001ea2:    6800        .h      LDR      r0,[r0,#0]
        0x00001ea4:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00001ea8:    e7c2        ..      B        0x1e30 ; CHE_OPREA + 88
    $d
        0x00001eaa:    0000        ..      DCW    0
        0x00001eac:    2000a000    ...     DCD    536911872
        0x00001eb0:    200003ec    ...     DCD    536871916
        0x00001eb4:    2000042c    ,..     DCD    536871980
        0x00001eb8:    20000350    P..     DCD    536871760
        0x00001ebc:    200003aa    ...     DCD    536871850
        0x00001ec0:    20000064    d..     DCD    536871012
        0x00001ec4:    3b9aca00    ...;    DCD    1000000000
        0x00001ec8:    20000084    ...     DCD    536871044
        0x00001ecc:    20000038    8..     DCD    536870968
        0x00001ed0:    200000c0    ...     DCD    536871104
        0x00001ed4:    05f5e100    ....    DCD    100000000
    $t
    i.CHF_Deploy
    CHF_Deploy
        0x00001ed8:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001eda:    4c18        .L      LDR      r4,[pc,#96] ; [0x1f3c] = 0x2000039c
        0x00001edc:    2600        .&      MOVS     r6,#0
        0x00001ede:    4d18        .M      LDR      r5,[pc,#96] ; [0x1f40] = 0x20000398
        0x00001ee0:    6566        fe      STR      r6,[r4,#0x54]
        0x00001ee2:    f1b27f80    ....    CMP      r2,#0x1000000
        0x00001ee6:    602e        .`      STR      r6,[r5,#0]
        0x00001ee8:    f1040580    ....    ADD      r5,r4,#0x80
        0x00001eec:    d301        ..      BCC      0x1ef2 ; CHF_Deploy + 26
        0x00001eee:    f1c24200    ...B    RSB      r2,r2,#0x80000000
        0x00001ef2:    1a09        ..      SUBS     r1,r1,r0
        0x00001ef4:    fbb1f7f3    ....    UDIV     r7,r1,r3
        0x00001ef8:    616a        ja      STR      r2,[r5,#0x14]
        0x00001efa:    f2402271    @.q"    MOV      r2,#0x271
        0x00001efe:    4357        WC      MULS     r7,r2,r7
        0x00001f00:    eb030283    ....    ADD      r2,r3,r3,LSL #2
        0x00001f04:    f2427c10    B..|    MOV      r12,#0x2710
        0x00001f08:    0052        R.      LSLS     r2,r2,#1
        0x00001f0a:    4b0e        .K      LDR      r3,[pc,#56] ; [0x1f44] = 0x20000310
        0x00001f0c:    ebbc1f07    ....    CMP      r12,r7,LSL #4
        0x00001f10:    d204        ..      BCS      0x1f1c ; CHF_Deploy + 68
        0x00001f12:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001f16:    73e6        .s      STRB     r6,[r4,#0xf]
        0x00001f18:    0049        I.      LSLS     r1,r1,#1
        0x00001f1a:    e003        ..      B        0x1f24 ; CHF_Deploy + 76
        0x00001f1c:    2601        .&      MOVS     r6,#1
        0x00001f1e:    73e6        .s      STRB     r6,[r4,#0xf]
        0x00001f20:    4c09        .L      LDR      r4,[pc,#36] ; [0x1f48] = 0x186a0
        0x00001f22:    4361        aC      MULS     r1,r4,r1
        0x00001f24:    fbb1f1f2    ....    UDIV     r1,r1,r2
        0x00001f28:    6019        .`      STR      r1,[r3,#0]
        0x00001f2a:    4908        .I      LDR      r1,[pc,#32] ; [0x1f4c] = 0x5f5e100
        0x00001f2c:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x00001f30:    4907        .I      LDR      r1,[pc,#28] ; [0x1f50] = 0x2000a000
        0x00001f32:    6108        .a      STR      r0,[r1,#0x10]
        0x00001f34:    4907        .I      LDR      r1,[pc,#28] ; [0x1f54] = 0x2000e000
        0x00001f36:    6968        hi      LDR      r0,[r5,#0x14]
        0x00001f38:    6108        .a      STR      r0,[r1,#0x10]
        0x00001f3a:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001f3c:    2000039c    ...     DCD    536871836
        0x00001f40:    20000398    ...     DCD    536871832
        0x00001f44:    20000310    ...     DCD    536871696
        0x00001f48:    000186a0    ....    DCD    100000
        0x00001f4c:    05f5e100    ....    DCD    100000000
        0x00001f50:    2000a000    ...     DCD    536911872
        0x00001f54:    2000e000    ...     DCD    536928256
    $t
    i.CHF_OPREA
    CHF_OPREA
        0x00001f58:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001f5c:    4933        3I      LDR      r1,[pc,#204] ; [0x202c] = 0x2000a000
        0x00001f5e:    6c08        .l      LDR      r0,[r1,#0x40]
        0x00001f60:    4833        3H      LDR      r0,[pc,#204] ; [0x2030] = 0x200003f0
        0x00001f62:    6c0c        .l      LDR      r4,[r1,#0x40]
        0x00001f64:    4d36        6M      LDR      r5,[pc,#216] ; [0x2040] = 0x20000066
        0x00001f66:    6004        .`      STR      r4,[r0,#0]
        0x00001f68:    4832        2H      LDR      r0,[pc,#200] ; [0x2034] = 0x20000430
        0x00001f6a:    4e34        4N      LDR      r6,[pc,#208] ; [0x203c] = 0x200003ab
        0x00001f6c:    f6404c35    @.5L    MOV      r12,#0xc35
        0x00001f70:    6802        .h      LDR      r2,[r0,#0]
        0x00001f72:    f8dfa0d0    ....    LDR      r10,[pc,#208] ; [0x2044] = 0x3b9aca00
        0x00001f76:    f022427f    "..B    BIC      r2,r2,#0xff000000
        0x00001f7a:    6002        .`      STR      r2,[r0,#0]
        0x00001f7c:    4691        .F      MOV      r9,r2
        0x00001f7e:    4a2e        .J      LDR      r2,[pc,#184] ; [0x2038] = 0x20000350
        0x00001f80:    882f        /.      LDRH     r7,[r5,#0]
        0x00001f82:    f1a20380    ....    SUB      r3,r2,#0x80
        0x00001f86:    6ad0        .j      LDR      r0,[r2,#0x2c]
        0x00001f88:    7836        6x      LDRB     r6,[r6,#0]
        0x00001f8a:    6c1b        .l      LDR      r3,[r3,#0x40]
        0x00001f8c:    fb07f50c    ....    MUL      r5,r7,r12
        0x00001f90:    eb070787    ....    ADD      r7,r7,r7,LSL #2
        0x00001f94:    4284        .B      CMP      r4,r0
        0x00001f96:    d216        ..      BCS      0x1fc6 ; CHF_OPREA + 110
        0x00001f98:    6890        .h      LDR      r0,[r2,#8]
        0x00001f9a:    b108        ..      CBZ      r0,0x1fa0 ; CHF_OPREA + 72
        0x00001f9c:    1e40        @.      SUBS     r0,r0,#1
        0x00001f9e:    6090        .`      STR      r0,[r2,#8]
        0x00001fa0:    2e01        ..      CMP      r6,#1
        0x00001fa2:    fb00f003    ....    MUL      r0,r0,r3
        0x00001fa6:    d006        ..      BEQ      0x1fb6 ; CHF_OPREA + 94
        0x00001fa8:    eb000247    ..G.    ADD      r2,r0,r7,LSL #1
        0x00001fac:    fbbaf0f2    ....    UDIV     r0,r10,r2
        0x00001fb0:    6108        .a      STR      r0,[r1,#0x10]
        0x00001fb2:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x00001fb6:    eb001245    ..E.    ADD      r2,r0,r5,LSL #5
        0x00001fba:    fbbaf0f2    ....    UDIV     r0,r10,r2
        0x00001fbe:    f2427210    B..r    MOV      r2,#0x2710
        0x00001fc2:    4350        PC      MULS     r0,r2,r0
        0x00001fc4:    e7f4        ..      B        0x1fb0 ; CHF_OPREA + 88
        0x00001fc6:    4820         H      LDR      r0,[pc,#128] ; [0x2048] = 0x20000086
        0x00001fc8:    f8dfb080    ....    LDR      r11,[pc,#128] ; [0x204c] = 0x2000003c
        0x00001fcc:    8800        ..      LDRH     r0,[r0,#0]
        0x00001fce:    f8db8000    ....    LDR      r8,[r11,#0]
        0x00001fd2:    eb000c80    ....    ADD      r12,r0,r0,LSL #2
        0x00001fd6:    f1080001    ....    ADD      r0,r8,#1
        0x00001fda:    ebb80f4c    ..L.    CMP      r8,r12,LSL #1
        0x00001fde:    d218        ..      BCS      0x2012 ; CHF_OPREA + 186
        0x00001fe0:    f8cb0000    ....    STR      r0,[r11,#0]
        0x00001fe4:    2e01        ..      CMP      r6,#1
        0x00001fe6:    d00a        ..      BEQ      0x1ffe ; CHF_OPREA + 166
        0x00001fe8:    4343        CC      MULS     r3,r0,r3
        0x00001fea:    eb030547    ..G.    ADD      r5,r3,r7,LSL #1
        0x00001fee:    fbbaf3f5    ....    UDIV     r3,r10,r5
        0x00001ff2:    610b        .a      STR      r3,[r1,#0x10]
        0x00001ff4:    eba90104    ....    SUB      r1,r9,r4
        0x00001ff8:    6491        .d      STR      r1,[r2,#0x48]
        0x00001ffa:    6090        .`      STR      r0,[r2,#8]
        0x00001ffc:    e7d9        ..      B        0x1fb2 ; CHF_OPREA + 90
        0x00001ffe:    6896        .h      LDR      r6,[r2,#8]
        0x00002000:    435e        ^C      MULS     r6,r3,r6
        0x00002002:    eb061545    ..E.    ADD      r5,r6,r5,LSL #5
        0x00002006:    fbbaf3f5    ....    UDIV     r3,r10,r5
        0x0000200a:    f2427510    B..u    MOV      r5,#0x2710
        0x0000200e:    436b        kC      MULS     r3,r5,r3
        0x00002010:    e7ef        ..      B        0x1ff2 ; CHF_OPREA + 154
        0x00002012:    d1ce        ..      BNE      0x1fb2 ; CHF_OPREA + 90
        0x00002014:    f8cb0000    ....    STR      r0,[r11,#0]
        0x00002018:    eba90004    ....    SUB      r0,r9,r4
        0x0000201c:    6490        .d      STR      r0,[r2,#0x48]
        0x0000201e:    480c        .H      LDR      r0,[pc,#48] ; [0x2050] = 0x200000c4
        0x00002020:    4a0c        .J      LDR      r2,[pc,#48] ; [0x2054] = 0x5f5e100
        0x00002022:    6800        .h      LDR      r0,[r0,#0]
        0x00002024:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x00002028:    e7c2        ..      B        0x1fb0 ; CHF_OPREA + 88
    $d
        0x0000202a:    0000        ..      DCW    0
        0x0000202c:    2000a000    ...     DCD    536911872
        0x00002030:    200003f0    ...     DCD    536871920
        0x00002034:    20000430    0..     DCD    536871984
        0x00002038:    20000350    P..     DCD    536871760
        0x0000203c:    200003ab    ...     DCD    536871851
        0x00002040:    20000066    f..     DCD    536871014
        0x00002044:    3b9aca00    ...;    DCD    1000000000
        0x00002048:    20000086    ...     DCD    536871046
        0x0000204c:    2000003c    <..     DCD    536870972
        0x00002050:    200000c4    ...     DCD    536871108
        0x00002054:    05f5e100    ....    DCD    100000000
    $t
    i.CHn_Message_Send
    CHn_Message_Send
        0x00002058:    480b        .H      LDR      r0,[pc,#44] ; [0x2088] = 0x20000434
        0x0000205a:    21cd        .!      MOVS     r1,#0xcd
        0x0000205c:    7001        .p      STRB     r1,[r0,#0]
        0x0000205e:    21eb        .!      MOVS     r1,#0xeb
        0x00002060:    7041        Ap      STRB     r1,[r0,#1]
        0x00002062:    f1a00198    ....    SUB      r1,r0,#0x98
        0x00002066:    6949        Ii      LDR      r1,[r1,#0x14]
        0x00002068:    0e0a        ..      LSRS     r2,r1,#24
        0x0000206a:    7082        .p      STRB     r2,[r0,#2]
        0x0000206c:    0c09        ..      LSRS     r1,r1,#16
        0x0000206e:    70c1        .p      STRB     r1,[r0,#3]
        0x00002070:    4906        .I      LDR      r1,[pc,#24] ; [0x208c] = 0x20000318
        0x00002072:    6809        .h      LDR      r1,[r1,#0]
        0x00002074:    0e0a        ..      LSRS     r2,r1,#24
        0x00002076:    7102        .q      STRB     r2,[r0,#4]
        0x00002078:    0c0a        ..      LSRS     r2,r1,#16
        0x0000207a:    7142        Bq      STRB     r2,[r0,#5]
        0x0000207c:    0a0a        ..      LSRS     r2,r1,#8
        0x0000207e:    7182        .q      STRB     r2,[r0,#6]
        0x00002080:    71c1        .q      STRB     r1,[r0,#7]
        0x00002082:    2108        .!      MOVS     r1,#8
        0x00002084:    f000bd3f    ..?.    B.W      HAL_UART_Write_Polling ; 0x2b06
    $d
        0x00002088:    20000434    4..     DCD    536871988
        0x0000208c:    20000318    ...     DCD    536871704
    $t
    i.CHn_ORDER_SEND
    CHn_ORDER_SEND
        0x00002090:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00002094:    4605        .F      MOV      r5,r0
        0x00002096:    460c        .F      MOV      r4,r1
        0x00002098:    07c8        ..      LSLS     r0,r1,#31
        0x0000209a:    d009        ..      BEQ      0x20b0 ; CHn_ORDER_SEND + 32
        0x0000209c:    486e        nH      LDR      r0,[pc,#440] ; [0x2258] = 0x20000068
        0x0000209e:    8803        ..      LDRH     r3,[r0,#0]
        0x000020a0:    486e        nH      LDR      r0,[pc,#440] ; [0x225c] = 0x200000c8
        0x000020a2:    6802        .h      LDR      r2,[r0,#0]
        0x000020a4:    486e        nH      LDR      r0,[pc,#440] ; [0x2260] = 0x20000088
        0x000020a6:    6801        .h      LDR      r1,[r0,#0]
        0x000020a8:    486e        nH      LDR      r0,[pc,#440] ; [0x2264] = 0x20000048
        0x000020aa:    8800        ..      LDRH     r0,[r0,#0]
        0x000020ac:    f7fefb38    ..8.    BL       CH0_Deploy ; 0x720
        0x000020b0:    07a0        ..      LSLS     r0,r4,#30
        0x000020b2:    d509        ..      BPL      0x20c8 ; CHn_ORDER_SEND + 56
        0x000020b4:    486c        lH      LDR      r0,[pc,#432] ; [0x2268] = 0x2000006a
        0x000020b6:    8803        ..      LDRH     r3,[r0,#0]
        0x000020b8:    486c        lH      LDR      r0,[pc,#432] ; [0x226c] = 0x200000cc
        0x000020ba:    6802        .h      LDR      r2,[r0,#0]
        0x000020bc:    486c        lH      LDR      r0,[pc,#432] ; [0x2270] = 0x2000008c
        0x000020be:    6801        .h      LDR      r1,[r0,#0]
        0x000020c0:    486c        lH      LDR      r0,[pc,#432] ; [0x2274] = 0x2000004a
        0x000020c2:    8800        ..      LDRH     r0,[r0,#0]
        0x000020c4:    f7fefbf6    ....    BL       CH1_Deploy ; 0x8b4
        0x000020c8:    0760        `.      LSLS     r0,r4,#29
        0x000020ca:    d509        ..      BPL      0x20e0 ; CHn_ORDER_SEND + 80
        0x000020cc:    486a        jH      LDR      r0,[pc,#424] ; [0x2278] = 0x2000006c
        0x000020ce:    8803        ..      LDRH     r3,[r0,#0]
        0x000020d0:    486a        jH      LDR      r0,[pc,#424] ; [0x227c] = 0x200000d0
        0x000020d2:    6802        .h      LDR      r2,[r0,#0]
        0x000020d4:    486a        jH      LDR      r0,[pc,#424] ; [0x2280] = 0x20000090
        0x000020d6:    6801        .h      LDR      r1,[r0,#0]
        0x000020d8:    486a        jH      LDR      r0,[pc,#424] ; [0x2284] = 0x2000004c
        0x000020da:    8800        ..      LDRH     r0,[r0,#0]
        0x000020dc:    f7fefcb4    ....    BL       CH2_Deploy ; 0xa48
        0x000020e0:    0720         .      LSLS     r0,r4,#28
        0x000020e2:    d509        ..      BPL      0x20f8 ; CHn_ORDER_SEND + 104
        0x000020e4:    4868        hH      LDR      r0,[pc,#416] ; [0x2288] = 0x2000006e
        0x000020e6:    8803        ..      LDRH     r3,[r0,#0]
        0x000020e8:    4868        hH      LDR      r0,[pc,#416] ; [0x228c] = 0x200000d4
        0x000020ea:    6802        .h      LDR      r2,[r0,#0]
        0x000020ec:    4868        hH      LDR      r0,[pc,#416] ; [0x2290] = 0x20000094
        0x000020ee:    6801        .h      LDR      r1,[r0,#0]
        0x000020f0:    4868        hH      LDR      r0,[pc,#416] ; [0x2294] = 0x2000004e
        0x000020f2:    8800        ..      LDRH     r0,[r0,#0]
        0x000020f4:    f7fefd70    ..p.    BL       CH3_Deploy ; 0xbd8
        0x000020f8:    06e0        ..      LSLS     r0,r4,#27
        0x000020fa:    d509        ..      BPL      0x2110 ; CHn_ORDER_SEND + 128
        0x000020fc:    4866        fH      LDR      r0,[pc,#408] ; [0x2298] = 0x20000070
        0x000020fe:    8803        ..      LDRH     r3,[r0,#0]
        0x00002100:    4866        fH      LDR      r0,[pc,#408] ; [0x229c] = 0x200000d8
        0x00002102:    6802        .h      LDR      r2,[r0,#0]
        0x00002104:    4866        fH      LDR      r0,[pc,#408] ; [0x22a0] = 0x20000098
        0x00002106:    6801        .h      LDR      r1,[r0,#0]
        0x00002108:    4866        fH      LDR      r0,[pc,#408] ; [0x22a4] = 0x20000050
        0x0000210a:    8800        ..      LDRH     r0,[r0,#0]
        0x0000210c:    f7fefe2c    ..,.    BL       CH4_Deploy ; 0xd68
        0x00002110:    06a0        ..      LSLS     r0,r4,#26
        0x00002112:    d509        ..      BPL      0x2128 ; CHn_ORDER_SEND + 152
        0x00002114:    4864        dH      LDR      r0,[pc,#400] ; [0x22a8] = 0x20000072
        0x00002116:    8803        ..      LDRH     r3,[r0,#0]
        0x00002118:    4864        dH      LDR      r0,[pc,#400] ; [0x22ac] = 0x200000dc
        0x0000211a:    6802        .h      LDR      r2,[r0,#0]
        0x0000211c:    4864        dH      LDR      r0,[pc,#400] ; [0x22b0] = 0x2000009c
        0x0000211e:    6801        .h      LDR      r1,[r0,#0]
        0x00002120:    4864        dH      LDR      r0,[pc,#400] ; [0x22b4] = 0x20000052
        0x00002122:    8800        ..      LDRH     r0,[r0,#0]
        0x00002124:    f7fefee8    ....    BL       CH5_Deploy ; 0xef8
        0x00002128:    0660        `.      LSLS     r0,r4,#25
        0x0000212a:    d509        ..      BPL      0x2140 ; CHn_ORDER_SEND + 176
        0x0000212c:    4862        bH      LDR      r0,[pc,#392] ; [0x22b8] = 0x20000074
        0x0000212e:    8803        ..      LDRH     r3,[r0,#0]
        0x00002130:    4862        bH      LDR      r0,[pc,#392] ; [0x22bc] = 0x200000e0
        0x00002132:    6802        .h      LDR      r2,[r0,#0]
        0x00002134:    4862        bH      LDR      r0,[pc,#392] ; [0x22c0] = 0x200000a0
        0x00002136:    6801        .h      LDR      r1,[r0,#0]
        0x00002138:    4862        bH      LDR      r0,[pc,#392] ; [0x22c4] = 0x20000054
        0x0000213a:    8800        ..      LDRH     r0,[r0,#0]
        0x0000213c:    f7feffa6    ....    BL       CH6_Deploy ; 0x108c
        0x00002140:    0620         .      LSLS     r0,r4,#24
        0x00002142:    d509        ..      BPL      0x2158 ; CHn_ORDER_SEND + 200
        0x00002144:    4860        `H      LDR      r0,[pc,#384] ; [0x22c8] = 0x20000076
        0x00002146:    8803        ..      LDRH     r3,[r0,#0]
        0x00002148:    4860        `H      LDR      r0,[pc,#384] ; [0x22cc] = 0x200000e4
        0x0000214a:    6802        .h      LDR      r2,[r0,#0]
        0x0000214c:    4860        `H      LDR      r0,[pc,#384] ; [0x22d0] = 0x200000a4
        0x0000214e:    6801        .h      LDR      r1,[r0,#0]
        0x00002150:    4860        `H      LDR      r0,[pc,#384] ; [0x22d4] = 0x20000056
        0x00002152:    8800        ..      LDRH     r0,[r0,#0]
        0x00002154:    f7fff864    ..d.    BL       CH7_Deploy ; 0x1220
        0x00002158:    07e8        ..      LSLS     r0,r5,#31
        0x0000215a:    d009        ..      BEQ      0x2170 ; CHn_ORDER_SEND + 224
        0x0000215c:    485e        ^H      LDR      r0,[pc,#376] ; [0x22d8] = 0x20000078
        0x0000215e:    8803        ..      LDRH     r3,[r0,#0]
        0x00002160:    485e        ^H      LDR      r0,[pc,#376] ; [0x22dc] = 0x200000e8
        0x00002162:    6802        .h      LDR      r2,[r0,#0]
        0x00002164:    485e        ^H      LDR      r0,[pc,#376] ; [0x22e0] = 0x200000a8
        0x00002166:    6801        .h      LDR      r1,[r0,#0]
        0x00002168:    485e        ^H      LDR      r0,[pc,#376] ; [0x22e4] = 0x20000058
        0x0000216a:    8800        ..      LDRH     r0,[r0,#0]
        0x0000216c:    f7fff928    ..(.    BL       CH8_Deploy ; 0x13c0
        0x00002170:    07a8        ..      LSLS     r0,r5,#30
        0x00002172:    d509        ..      BPL      0x2188 ; CHn_ORDER_SEND + 248
        0x00002174:    485c        \H      LDR      r0,[pc,#368] ; [0x22e8] = 0x2000007a
        0x00002176:    8803        ..      LDRH     r3,[r0,#0]
        0x00002178:    485c        \H      LDR      r0,[pc,#368] ; [0x22ec] = 0x200000ec
        0x0000217a:    6802        .h      LDR      r2,[r0,#0]
        0x0000217c:    485c        \H      LDR      r0,[pc,#368] ; [0x22f0] = 0x200000ac
        0x0000217e:    6801        .h      LDR      r1,[r0,#0]
        0x00002180:    485c        \H      LDR      r0,[pc,#368] ; [0x22f4] = 0x2000005a
        0x00002182:    8800        ..      LDRH     r0,[r0,#0]
        0x00002184:    f7fff9ec    ....    BL       CH9_Deploy ; 0x1560
        0x00002188:    0768        h.      LSLS     r0,r5,#29
        0x0000218a:    d509        ..      BPL      0x21a0 ; CHn_ORDER_SEND + 272
        0x0000218c:    485a        ZH      LDR      r0,[pc,#360] ; [0x22f8] = 0x2000007c
        0x0000218e:    8803        ..      LDRH     r3,[r0,#0]
        0x00002190:    485a        ZH      LDR      r0,[pc,#360] ; [0x22fc] = 0x200000f0
        0x00002192:    6802        .h      LDR      r2,[r0,#0]
        0x00002194:    485a        ZH      LDR      r0,[pc,#360] ; [0x2300] = 0x200000b0
        0x00002196:    6801        .h      LDR      r1,[r0,#0]
        0x00002198:    485a        ZH      LDR      r0,[pc,#360] ; [0x2304] = 0x2000005c
        0x0000219a:    8800        ..      LDRH     r0,[r0,#0]
        0x0000219c:    f7fffab0    ....    BL       CHA_Deploy ; 0x1700
        0x000021a0:    0728        (.      LSLS     r0,r5,#28
        0x000021a2:    d509        ..      BPL      0x21b8 ; CHn_ORDER_SEND + 296
        0x000021a4:    4858        XH      LDR      r0,[pc,#352] ; [0x2308] = 0x2000007e
        0x000021a6:    8803        ..      LDRH     r3,[r0,#0]
        0x000021a8:    4858        XH      LDR      r0,[pc,#352] ; [0x230c] = 0x200000f4
        0x000021aa:    6802        .h      LDR      r2,[r0,#0]
        0x000021ac:    4858        XH      LDR      r0,[pc,#352] ; [0x2310] = 0x200000b4
        0x000021ae:    6801        .h      LDR      r1,[r0,#0]
        0x000021b0:    4858        XH      LDR      r0,[pc,#352] ; [0x2314] = 0x2000005e
        0x000021b2:    8800        ..      LDRH     r0,[r0,#0]
        0x000021b4:    f7fffb70    ..p.    BL       CHB_Deploy ; 0x1898
        0x000021b8:    06e8        ..      LSLS     r0,r5,#27
        0x000021ba:    d509        ..      BPL      0x21d0 ; CHn_ORDER_SEND + 320
        0x000021bc:    4856        VH      LDR      r0,[pc,#344] ; [0x2318] = 0x20000080
        0x000021be:    8803        ..      LDRH     r3,[r0,#0]
        0x000021c0:    4856        VH      LDR      r0,[pc,#344] ; [0x231c] = 0x200000f8
        0x000021c2:    6802        .h      LDR      r2,[r0,#0]
        0x000021c4:    4856        VH      LDR      r0,[pc,#344] ; [0x2320] = 0x200000b8
        0x000021c6:    6801        .h      LDR      r1,[r0,#0]
        0x000021c8:    4856        VH      LDR      r0,[pc,#344] ; [0x2324] = 0x20000060
        0x000021ca:    8800        ..      LDRH     r0,[r0,#0]
        0x000021cc:    f7fffc30    ..0.    BL       CHC_Deploy ; 0x1a30
        0x000021d0:    06a8        ..      LSLS     r0,r5,#26
        0x000021d2:    d509        ..      BPL      0x21e8 ; CHn_ORDER_SEND + 344
        0x000021d4:    4854        TH      LDR      r0,[pc,#336] ; [0x2328] = 0x20000082
        0x000021d6:    8803        ..      LDRH     r3,[r0,#0]
        0x000021d8:    4854        TH      LDR      r0,[pc,#336] ; [0x232c] = 0x200000fc
        0x000021da:    6802        .h      LDR      r2,[r0,#0]
        0x000021dc:    4854        TH      LDR      r0,[pc,#336] ; [0x2330] = 0x200000bc
        0x000021de:    6801        .h      LDR      r1,[r0,#0]
        0x000021e0:    4854        TH      LDR      r0,[pc,#336] ; [0x2334] = 0x20000062
        0x000021e2:    8800        ..      LDRH     r0,[r0,#0]
        0x000021e4:    f7fffcf0    ....    BL       CHD_Deploy ; 0x1bc8
        0x000021e8:    0668        h.      LSLS     r0,r5,#25
        0x000021ea:    d509        ..      BPL      0x2200 ; CHn_ORDER_SEND + 368
        0x000021ec:    4852        RH      LDR      r0,[pc,#328] ; [0x2338] = 0x20000084
        0x000021ee:    8803        ..      LDRH     r3,[r0,#0]
        0x000021f0:    4852        RH      LDR      r0,[pc,#328] ; [0x233c] = 0x20000100
        0x000021f2:    6802        .h      LDR      r2,[r0,#0]
        0x000021f4:    4852        RH      LDR      r0,[pc,#328] ; [0x2340] = 0x200000c0
        0x000021f6:    6801        .h      LDR      r1,[r0,#0]
        0x000021f8:    4852        RH      LDR      r0,[pc,#328] ; [0x2344] = 0x20000064
        0x000021fa:    8800        ..      LDRH     r0,[r0,#0]
        0x000021fc:    f7fffdac    ....    BL       CHE_Deploy ; 0x1d58
        0x00002200:    0628        (.      LSLS     r0,r5,#24
        0x00002202:    d509        ..      BPL      0x2218 ; CHn_ORDER_SEND + 392
        0x00002204:    4850        PH      LDR      r0,[pc,#320] ; [0x2348] = 0x20000086
        0x00002206:    8803        ..      LDRH     r3,[r0,#0]
        0x00002208:    4850        PH      LDR      r0,[pc,#320] ; [0x234c] = 0x20000104
        0x0000220a:    6802        .h      LDR      r2,[r0,#0]
        0x0000220c:    4850        PH      LDR      r0,[pc,#320] ; [0x2350] = 0x200000c4
        0x0000220e:    6801        .h      LDR      r1,[r0,#0]
        0x00002210:    4850        PH      LDR      r0,[pc,#320] ; [0x2354] = 0x20000066
        0x00002212:    8800        ..      LDRH     r0,[r0,#0]
        0x00002214:    f7fffe60    ..`.    BL       CHF_Deploy ; 0x1ed8
        0x00002218:    494f        OI      LDR      r1,[pc,#316] ; [0x2358] = 0x2000e000
        0x0000221a:    eb042005    ...     ADD      r0,r4,r5,LSL #8
        0x0000221e:    0400        ..      LSLS     r0,r0,#16
        0x00002220:    f8c10080    ....    STR      r0,[r1,#0x80]
        0x00002224:    484d        MH      LDR      r0,[pc,#308] ; [0x235c] = 0x20000042
        0x00002226:    2600        .&      MOVS     r6,#0
        0x00002228:    7006        .p      STRB     r6,[r0,#0]
        0x0000222a:    484d        MH      LDR      r0,[pc,#308] ; [0x2360] = 0x2000a000
        0x0000222c:    f8501f80    P...    LDR      r1,[r0,#0x80]!
        0x00002230:    4c4c        LL      LDR      r4,[pc,#304] ; [0x2364] = 0x2000039c
        0x00002232:    6121        !a      STR      r1,[r4,#0x10]
        0x00002234:    6800        .h      LDR      r0,[r0,#0]
        0x00002236:    4d4c        LM      LDR      r5,[pc,#304] ; [0x2368] = 0x20000314
        0x00002238:    f44f777a    O.zw    MOV      r7,#0x3e8
        0x0000223c:    6160        `a      STR      r0,[r4,#0x14]
        0x0000223e:    e005        ..      B        0x224c ; CHn_ORDER_SEND + 444
        0x00002240:    6828        (h      LDR      r0,[r5,#0]
        0x00002242:    42b8        .B      CMP      r0,r7
        0x00002244:    d102        ..      BNE      0x224c ; CHn_ORDER_SEND + 444
        0x00002246:    602e        .`      STR      r6,[r5,#0]
        0x00002248:    f7ffff06    ....    BL       CHn_Message_Send ; 0x2058
        0x0000224c:    6960        `i      LDR      r0,[r4,#0x14]
        0x0000224e:    2800        .(      CMP      r0,#0
        0x00002250:    d1f6        ..      BNE      0x2240 ; CHn_ORDER_SEND + 432
        0x00002252:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00002256:    0000        ..      DCW    0
        0x00002258:    20000068    h..     DCD    536871016
        0x0000225c:    200000c8    ...     DCD    536871112
        0x00002260:    20000088    ...     DCD    536871048
        0x00002264:    20000048    H..     DCD    536870984
        0x00002268:    2000006a    j..     DCD    536871018
        0x0000226c:    200000cc    ...     DCD    536871116
        0x00002270:    2000008c    ...     DCD    536871052
        0x00002274:    2000004a    J..     DCD    536870986
        0x00002278:    2000006c    l..     DCD    536871020
        0x0000227c:    200000d0    ...     DCD    536871120
        0x00002280:    20000090    ...     DCD    536871056
        0x00002284:    2000004c    L..     DCD    536870988
        0x00002288:    2000006e    n..     DCD    536871022
        0x0000228c:    200000d4    ...     DCD    536871124
        0x00002290:    20000094    ...     DCD    536871060
        0x00002294:    2000004e    N..     DCD    536870990
        0x00002298:    20000070    p..     DCD    536871024
        0x0000229c:    200000d8    ...     DCD    536871128
        0x000022a0:    20000098    ...     DCD    536871064
        0x000022a4:    20000050    P..     DCD    536870992
        0x000022a8:    20000072    r..     DCD    536871026
        0x000022ac:    200000dc    ...     DCD    536871132
        0x000022b0:    2000009c    ...     DCD    536871068
        0x000022b4:    20000052    R..     DCD    536870994
        0x000022b8:    20000074    t..     DCD    536871028
        0x000022bc:    200000e0    ...     DCD    536871136
        0x000022c0:    200000a0    ...     DCD    536871072
        0x000022c4:    20000054    T..     DCD    536870996
        0x000022c8:    20000076    v..     DCD    536871030
        0x000022cc:    200000e4    ...     DCD    536871140
        0x000022d0:    200000a4    ...     DCD    536871076
        0x000022d4:    20000056    V..     DCD    536870998
        0x000022d8:    20000078    x..     DCD    536871032
        0x000022dc:    200000e8    ...     DCD    536871144
        0x000022e0:    200000a8    ...     DCD    536871080
        0x000022e4:    20000058    X..     DCD    536871000
        0x000022e8:    2000007a    z..     DCD    536871034
        0x000022ec:    200000ec    ...     DCD    536871148
        0x000022f0:    200000ac    ...     DCD    536871084
        0x000022f4:    2000005a    Z..     DCD    536871002
        0x000022f8:    2000007c    |..     DCD    536871036
        0x000022fc:    200000f0    ...     DCD    536871152
        0x00002300:    200000b0    ...     DCD    536871088
        0x00002304:    2000005c    \..     DCD    536871004
        0x00002308:    2000007e    ~..     DCD    536871038
        0x0000230c:    200000f4    ...     DCD    536871156
        0x00002310:    200000b4    ...     DCD    536871092
        0x00002314:    2000005e    ^..     DCD    536871006
        0x00002318:    20000080    ...     DCD    536871040
        0x0000231c:    200000f8    ...     DCD    536871160
        0x00002320:    200000b8    ...     DCD    536871096
        0x00002324:    20000060    `..     DCD    536871008
        0x00002328:    20000082    ...     DCD    536871042
        0x0000232c:    200000fc    ...     DCD    536871164
        0x00002330:    200000bc    ...     DCD    536871100
        0x00002334:    20000062    b..     DCD    536871010
        0x00002338:    20000084    ...     DCD    536871044
        0x0000233c:    20000100    ...     DCD    536871168
        0x00002340:    200000c0    ...     DCD    536871104
        0x00002344:    20000064    d..     DCD    536871012
        0x00002348:    20000086    ...     DCD    536871046
        0x0000234c:    20000104    ...     DCD    536871172
        0x00002350:    200000c4    ...     DCD    536871108
        0x00002354:    20000066    f..     DCD    536871014
        0x00002358:    2000e000    ...     DCD    536928256
        0x0000235c:    20000042    B..     DCD    536870978
        0x00002360:    2000a000    ...     DCD    536911872
        0x00002364:    2000039c    ...     DCD    536871836
        0x00002368:    20000314    ...     DCD    536871700
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x0000236c:    4905        .I      LDR      r1,[pc,#20] ; [0x2384] = 0x88
        0x0000236e:    b510        ..      PUSH     {r4,lr}
        0x00002370:    3118        .1      ADDS     r1,r1,#0x18
        0x00002372:    d004        ..      BEQ      0x237e ; DMAC_IRQHandler + 18
        0x00002374:    6848        Hh      LDR      r0,[r1,#4]
        0x00002376:    6809        .h      LDR      r1,[r1,#0]
        0x00002378:    e8bd4010    ...@    POP      {r4,lr}
        0x0000237c:    4708        .G      BX       r1
        0x0000237e:    f7fef807    ....    BL       abort ; 0x390
    $d
        0x00002382:    0000        ..      DCW    0
        0x00002384:    00000088    ....    DCD    136
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x00002388:    4905        .I      LDR      r1,[pc,#20] ; [0x23a0] = 0x88
        0x0000238a:    b510        ..      PUSH     {r4,lr}
        0x0000238c:    3108        .1      ADDS     r1,r1,#8
        0x0000238e:    d004        ..      BEQ      0x239a ; EXT_IRQHandler + 18
        0x00002390:    6848        Hh      LDR      r0,[r1,#4]
        0x00002392:    6809        .h      LDR      r1,[r1,#0]
        0x00002394:    e8bd4010    ...@    POP      {r4,lr}
        0x00002398:    4708        .G      BX       r1
        0x0000239a:    f7fdfff9    ....    BL       abort ; 0x390
    $d
        0x0000239e:    0000        ..      DCW    0
        0x000023a0:    00000088    ....    DCD    136
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000023a4:    4905        .I      LDR      r1,[pc,#20] ; [0x23bc] = 0x88
        0x000023a6:    b510        ..      PUSH     {r4,lr}
        0x000023a8:    3180        .1      ADDS     r1,r1,#0x80
        0x000023aa:    d004        ..      BEQ      0x23b6 ; GPIO_IRQHandler + 18
        0x000023ac:    6848        Hh      LDR      r0,[r1,#4]
        0x000023ae:    6809        .h      LDR      r1,[r1,#0]
        0x000023b0:    e8bd4010    ...@    POP      {r4,lr}
        0x000023b4:    4708        .G      BX       r1
        0x000023b6:    f7fdffeb    ....    BL       abort ; 0x390
    $d
        0x000023ba:    0000        ..      DCW    0
        0x000023bc:    00000088    ....    DCD    136
    $t
    i.HAL_SYSCON_Function_IO_Set
    HAL_SYSCON_Function_IO_Set
        0x000023c0:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000023c4:    4604        .F      MOV      r4,r0
        0x000023c6:    460d        .F      MOV      r5,r1
        0x000023c8:    4617        .F      MOV      r7,r2
        0x000023ca:    bf00        ..      NOP      
        0x000023cc:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000023d0:    6940        @i      LDR      r0,[r0,#0x14]
        0x000023d2:    4606        .F      MOV      r6,r0
        0x000023d4:    b93f        ?.      CBNZ     r7,0x23e6 ; HAL_SYSCON_Function_IO_Set + 38
        0x000023d6:    2001        .       MOVS     r0,#1
        0x000023d8:    40a8        .@      LSLS     r0,r0,r5
        0x000023da:    4386        .C      BICS     r6,r6,r0
        0x000023dc:    4630        0F      MOV      r0,r6
        0x000023de:    f000fd62    ..b.    BL       sysc_cpu_func_en_set ; 0x2ea6
        0x000023e2:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x000023e6:    2d10        .-      CMP      r5,#0x10
        0x000023e8:    d277        w.      BCS      0x24da ; HAL_SYSCON_Function_IO_Set + 282
        0x000023ea:    e8dff005    ....    TBB      [pc,r5]
    $d
        0x000023ee:    1308        ..      DCW    4872
        0x000023f0:    3f34291e    .)4?    DCD    1060383006
        0x000023f4:    6b60554a    JU`k    DCD    1801475402
        0x000023f8:    988d8277    w...    DCD    2559410807
        0x000023fc:    aea3        ..      DCW    44707
    $t
        0x000023fe:    bf00        ..      NOP      
        0x00002400:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002404:    6980        .i      LDR      r0,[r0,#0x18]
        0x00002406:    f3640003    d...    BFI      r0,r4,#0,#4
        0x0000240a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x0000240e:    6188        .a      STR      r0,[r1,#0x18]
        0x00002410:    bf00        ..      NOP      
        0x00002412:    e0a6        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002414:    bf00        ..      NOP      
        0x00002416:    f04f4080    O..@    MOV      r0,#0x40000000
        0x0000241a:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000241c:    f3641007    d...    BFI      r0,r4,#4,#4
        0x00002420:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002424:    6188        .a      STR      r0,[r1,#0x18]
        0x00002426:    bf00        ..      NOP      
        0x00002428:    e09b        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x0000242a:    bf00        ..      NOP      
        0x0000242c:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002430:    6980        .i      LDR      r0,[r0,#0x18]
        0x00002432:    f364200b    d..     BFI      r0,r4,#8,#4
        0x00002436:    f04f4180    O..A    MOV      r1,#0x40000000
        0x0000243a:    6188        .a      STR      r0,[r1,#0x18]
        0x0000243c:    bf00        ..      NOP      
        0x0000243e:    e090        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002440:    bf00        ..      NOP      
        0x00002442:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002446:    6980        .i      LDR      r0,[r0,#0x18]
        0x00002448:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x0000244c:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002450:    6188        .a      STR      r0,[r1,#0x18]
        0x00002452:    bf00        ..      NOP      
        0x00002454:    e085        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002456:    bf00        ..      NOP      
        0x00002458:    f04f4080    O..@    MOV      r0,#0x40000000
        0x0000245c:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000245e:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00002462:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002466:    6188        .a      STR      r0,[r1,#0x18]
        0x00002468:    bf00        ..      NOP      
        0x0000246a:    e07a        z.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x0000246c:    bf00        ..      NOP      
        0x0000246e:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002472:    6980        .i      LDR      r0,[r0,#0x18]
        0x00002474:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00002478:    f04f4180    O..A    MOV      r1,#0x40000000
        0x0000247c:    6188        .a      STR      r0,[r1,#0x18]
        0x0000247e:    bf00        ..      NOP      
        0x00002480:    e06f        o.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002482:    bf00        ..      NOP      
        0x00002484:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002488:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000248a:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x0000248e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002492:    6188        .a      STR      r0,[r1,#0x18]
        0x00002494:    bf00        ..      NOP      
        0x00002496:    e064        d.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002498:    bf00        ..      NOP      
        0x0000249a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x0000249e:    6980        .i      LDR      r0,[r0,#0x18]
        0x000024a0:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x000024a4:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000024a8:    6188        .a      STR      r0,[r1,#0x18]
        0x000024aa:    bf00        ..      NOP      
        0x000024ac:    e059        Y.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x000024ae:    bf00        ..      NOP      
        0x000024b0:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000024b4:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x000024b6:    f3640003    d...    BFI      r0,r4,#0,#4
        0x000024ba:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000024be:    61c8        .a      STR      r0,[r1,#0x1c]
        0x000024c0:    bf00        ..      NOP      
        0x000024c2:    e04e        N.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x000024c4:    bf00        ..      NOP      
        0x000024c6:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000024ca:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x000024cc:    f3641007    d...    BFI      r0,r4,#4,#4
        0x000024d0:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000024d4:    61c8        .a      STR      r0,[r1,#0x1c]
        0x000024d6:    bf00        ..      NOP      
        0x000024d8:    e043        C.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x000024da:    e041        A.      B        0x2560 ; HAL_SYSCON_Function_IO_Set + 416
        0x000024dc:    bf00        ..      NOP      
        0x000024de:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000024e2:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x000024e4:    f364200b    d..     BFI      r0,r4,#8,#4
        0x000024e8:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000024ec:    61c8        .a      STR      r0,[r1,#0x1c]
        0x000024ee:    bf00        ..      NOP      
        0x000024f0:    e037        7.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x000024f2:    bf00        ..      NOP      
        0x000024f4:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000024f8:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x000024fa:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x000024fe:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002502:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00002504:    bf00        ..      NOP      
        0x00002506:    e02c        ,.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002508:    bf00        ..      NOP      
        0x0000250a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x0000250e:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00002510:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00002514:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002518:    61c8        .a      STR      r0,[r1,#0x1c]
        0x0000251a:    bf00        ..      NOP      
        0x0000251c:    e021        !.      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x0000251e:    bf00        ..      NOP      
        0x00002520:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002524:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00002526:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x0000252a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x0000252e:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00002530:    bf00        ..      NOP      
        0x00002532:    e016        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002534:    bf00        ..      NOP      
        0x00002536:    f04f4080    O..@    MOV      r0,#0x40000000
        0x0000253a:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x0000253c:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00002540:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002544:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00002546:    bf00        ..      NOP      
        0x00002548:    e00b        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x0000254a:    bf00        ..      NOP      
        0x0000254c:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00002550:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00002552:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00002556:    f04f4180    O..A    MOV      r1,#0x40000000
        0x0000255a:    61c8        .a      STR      r0,[r1,#0x1c]
        0x0000255c:    bf00        ..      NOP      
        0x0000255e:    e000        ..      B        0x2562 ; HAL_SYSCON_Function_IO_Set + 418
        0x00002560:    bf00        ..      NOP      
        0x00002562:    bf00        ..      NOP      
        0x00002564:    2001        .       MOVS     r0,#1
        0x00002566:    40a8        .@      LSLS     r0,r0,r5
        0x00002568:    4306        .C      ORRS     r6,r6,r0
        0x0000256a:    4630        0F      MOV      r0,r6
        0x0000256c:    f000fc9b    ....    BL       sysc_cpu_func_en_set ; 0x2ea6
        0x00002570:    bf00        ..      NOP      
        0x00002572:    e736        6.      B        0x23e2 ; HAL_SYSCON_Function_IO_Set + 34
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00002574:    bf00        ..      NOP      
        0x00002576:    4904        .I      LDR      r1,[pc,#16] ; [0x2588] = 0x40020000
        0x00002578:    6909        .i      LDR      r1,[r1,#0x10]
        0x0000257a:    f3600103    `...    BFI      r1,r0,#0,#4
        0x0000257e:    4a02        .J      LDR      r2,[pc,#8] ; [0x2588] = 0x40020000
        0x00002580:    6111        .a      STR      r1,[r2,#0x10]
        0x00002582:    bf00        ..      NOP      
        0x00002584:    4770        pG      BX       lr
    $d
        0x00002586:    0000        ..      DCW    0
        0x00002588:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x0000258c:    b510        ..      PUSH     {r4,lr}
        0x0000258e:    4604        .F      MOV      r4,r0
        0x00002590:    1e60        `.      SUBS     r0,r4,#1
        0x00002592:    280f        .(      CMP      r0,#0xf
        0x00002594:    dc00        ..      BGT      0x2598 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00002596:    e004        ..      B        0x25a2 ; HAL_SYSCON_Set_HClk_Div + 22
        0x00002598:    2225        %"      MOVS     r2,#0x25
        0x0000259a:    a108        ..      ADR      r1,{pc}+0x22 ; 0x25bc
        0x0000259c:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x25dc
        0x0000259e:    f000fbcb    ....    BL       __aeabi_assert ; 0x2d38
        0x000025a2:    1e61        a.      SUBS     r1,r4,#1
        0x000025a4:    b2c8        ..      UXTB     r0,r1
        0x000025a6:    4913        .I      LDR      r1,[pc,#76] ; [0x25f4] = 0x40020000
        0x000025a8:    6849        Ih      LDR      r1,[r1,#4]
        0x000025aa:    f3600103    `...    BFI      r1,r0,#0,#4
        0x000025ae:    4a11        .J      LDR      r2,[pc,#68] ; [0x25f4] = 0x40020000
        0x000025b0:    6051        Q`      STR      r1,[r2,#4]
        0x000025b2:    bf00        ..      NOP      
        0x000025b4:    2001        .       MOVS     r0,#1
        0x000025b6:    f000fc5d    ..].    BL       sysc_awo_div_update_set ; 0x2e74
        0x000025ba:    bd10        ..      POP      {r4,pc}
    $d
        0x000025bc:    735c2e2e    ..\s    DCD    1935420974
        0x000025c0:    735c6b64    dk\s    DCD    1935436644
        0x000025c4:    735c6372    rc\s    DCD    1935434610
        0x000025c8:    645c636f    oc\d    DCD    1683776367
        0x000025cc:    65766972    rive    DCD    1702259058
        0x000025d0:    79735c72    r\sy    DCD    2037603442
        0x000025d4:    6e6f6373    scon    DCD    1852793715
        0x000025d8:    0000632e    .c..    DCD    25390
        0x000025dc:    62686128    (ahb    DCD    1651007784
        0x000025e0:    7669645f    _div    DCD    1986618463
        0x000025e4:    72656469    ider    DCD    1919247465
        0x000025e8:    3c29312d    -1)<    DCD    1009332525
        0x000025ec:    6678303d    =0xf    DCD    1719152701
        0x000025f0:    00000000    ....    DCD    0
        0x000025f4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x000025f8:    b510        ..      PUSH     {r4,lr}
        0x000025fa:    4604        .F      MOV      r4,r0
        0x000025fc:    1e60        `.      SUBS     r0,r4,#1
        0x000025fe:    280f        .(      CMP      r0,#0xf
        0x00002600:    dc00        ..      BGT      0x2604 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00002602:    e004        ..      B        0x260e ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00002604:    222c        ,"      MOVS     r2,#0x2c
        0x00002606:    a10a        ..      ADR      r1,{pc}+0x2a ; 0x2630
        0x00002608:    a011        ..      ADR      r0,{pc}+0x48 ; 0x2650
        0x0000260a:    f000fb95    ....    BL       __aeabi_assert ; 0x2d38
        0x0000260e:    1e61        a.      SUBS     r1,r4,#1
        0x00002610:    b2c8        ..      UXTB     r0,r1
        0x00002612:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002616:    6849        Ih      LDR      r1,[r1,#4]
        0x00002618:    f3600103    `...    BFI      r1,r0,#0,#4
        0x0000261c:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00002620:    6051        Q`      STR      r1,[r2,#4]
        0x00002622:    bf00        ..      NOP      
        0x00002624:    2001        .       MOVS     r0,#1
        0x00002626:    0781        ..      LSLS     r1,r0,#30
        0x00002628:    6008        .`      STR      r0,[r1,#0]
        0x0000262a:    bf00        ..      NOP      
        0x0000262c:    bd10        ..      POP      {r4,pc}
    $d
        0x0000262e:    0000        ..      DCW    0
        0x00002630:    735c2e2e    ..\s    DCD    1935420974
        0x00002634:    735c6b64    dk\s    DCD    1935436644
        0x00002638:    735c6372    rc\s    DCD    1935434610
        0x0000263c:    645c636f    oc\d    DCD    1683776367
        0x00002640:    65766972    rive    DCD    1702259058
        0x00002644:    79735c72    r\sy    DCD    2037603442
        0x00002648:    6e6f6373    scon    DCD    1852793715
        0x0000264c:    0000632e    .c..    DCD    25390
        0x00002650:    62706128    (apb    DCD    1651532072
        0x00002654:    69645f30    0_di    DCD    1768185648
        0x00002658:    65646976    vide    DCD    1701079414
        0x0000265c:    29312d72    r-1)    DCD    691088754
        0x00002660:    78303d3c    <=0x    DCD    2016427324
        0x00002664:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00002668:    b510        ..      PUSH     {r4,lr}
        0x0000266a:    4604        .F      MOV      r4,r0
        0x0000266c:    1e60        `.      SUBS     r0,r4,#1
        0x0000266e:    280f        .(      CMP      r0,#0xf
        0x00002670:    dc00        ..      BGT      0x2674 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00002672:    e004        ..      B        0x267e ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00002674:    2234        4"      MOVS     r2,#0x34
        0x00002676:    a108        ..      ADR      r1,{pc}+0x22 ; 0x2698
        0x00002678:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x26b8
        0x0000267a:    f000fb5d    ..].    BL       __aeabi_assert ; 0x2d38
        0x0000267e:    1e61        a.      SUBS     r1,r4,#1
        0x00002680:    b2c8        ..      UXTB     r0,r1
        0x00002682:    4913        .I      LDR      r1,[pc,#76] ; [0x26d0] = 0x40020000
        0x00002684:    6849        Ih      LDR      r1,[r1,#4]
        0x00002686:    f3601107    `...    BFI      r1,r0,#4,#4
        0x0000268a:    4a11        .J      LDR      r2,[pc,#68] ; [0x26d0] = 0x40020000
        0x0000268c:    6051        Q`      STR      r1,[r2,#4]
        0x0000268e:    bf00        ..      NOP      
        0x00002690:    2002        .       MOVS     r0,#2
        0x00002692:    f000fbef    ....    BL       sysc_awo_div_update_set ; 0x2e74
        0x00002696:    bd10        ..      POP      {r4,pc}
    $d
        0x00002698:    735c2e2e    ..\s    DCD    1935420974
        0x0000269c:    735c6b64    dk\s    DCD    1935436644
        0x000026a0:    735c6372    rc\s    DCD    1935434610
        0x000026a4:    645c636f    oc\d    DCD    1683776367
        0x000026a8:    65766972    rive    DCD    1702259058
        0x000026ac:    79735c72    r\sy    DCD    2037603442
        0x000026b0:    6e6f6373    scon    DCD    1852793715
        0x000026b4:    0000632e    .c..    DCD    25390
        0x000026b8:    62706128    (apb    DCD    1651532072
        0x000026bc:    69645f31    1_di    DCD    1768185649
        0x000026c0:    65646976    vide    DCD    1701079414
        0x000026c4:    29312d72    r-1)    DCD    691088754
        0x000026c8:    78303d3c    <=0x    DCD    2016427324
        0x000026cc:    00000066    f...    DCD    102
        0x000026d0:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x000026d4:    b570        p.      PUSH     {r4-r6,lr}
        0x000026d6:    4605        .F      MOV      r5,r0
        0x000026d8:    460c        .F      MOV      r4,r1
        0x000026da:    1e60        `.      SUBS     r0,r4,#1
        0x000026dc:    f5b05f00    ..._    CMP      r0,#0x2000
        0x000026e0:    da00        ..      BGE      0x26e4 ; HAL_SYSCON_Set_RTC_Div + 16
        0x000026e2:    e004        ..      B        0x26ee ; HAL_SYSCON_Set_RTC_Div + 26
        0x000026e4:    223c        <"      MOVS     r2,#0x3c
        0x000026e6:    a112        ..      ADR      r1,{pc}+0x4a ; 0x2730
        0x000026e8:    a019        ..      ADR      r0,{pc}+0x68 ; 0x2750
        0x000026ea:    f000fb25    ..%.    BL       __aeabi_assert ; 0x2d38
        0x000026ee:    2d01        .-      CMP      r5,#1
        0x000026f0:    dc00        ..      BGT      0x26f4 ; HAL_SYSCON_Set_RTC_Div + 32
        0x000026f2:    e004        ..      B        0x26fe ; HAL_SYSCON_Set_RTC_Div + 42
        0x000026f4:    223d        ="      MOVS     r2,#0x3d
        0x000026f6:    a10e        ..      ADR      r1,{pc}+0x3a ; 0x2730
        0x000026f8:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x2768
        0x000026fa:    f000fb1d    ....    BL       __aeabi_assert ; 0x2d38
        0x000026fe:    b935        5.      CBNZ     r5,0x270e ; HAL_SYSCON_Set_RTC_Div + 58
        0x00002700:    2000        .       MOVS     r0,#0
        0x00002702:    f000fbbd    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x2e80
        0x00002706:    2004        .       MOVS     r0,#4
        0x00002708:    f000fbb4    ....    BL       sysc_awo_div_update_set ; 0x2e74
        0x0000270c:    e00e        ..      B        0x272c ; HAL_SYSCON_Set_RTC_Div + 88
        0x0000270e:    2c02        .,      CMP      r4,#2
        0x00002710:    db00        ..      BLT      0x2714 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00002712:    e004        ..      B        0x271e ; HAL_SYSCON_Set_RTC_Div + 74
        0x00002714:    2247        G"      MOVS     r2,#0x47
        0x00002716:    a106        ..      ADR      r1,{pc}+0x1a ; 0x2730
        0x00002718:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x2784
        0x0000271a:    f000fb0d    ....    BL       __aeabi_assert ; 0x2d38
        0x0000271e:    1e61        a.      SUBS     r1,r4,#1
        0x00002720:    b288        ..      UXTH     r0,r1
        0x00002722:    f000fbad    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x2e80
        0x00002726:    2004        .       MOVS     r0,#4
        0x00002728:    f000fba4    ....    BL       sysc_awo_div_update_set ; 0x2e74
        0x0000272c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000272e:    0000        ..      DCW    0
        0x00002730:    735c2e2e    ..\s    DCD    1935420974
        0x00002734:    735c6b64    dk\s    DCD    1935436644
        0x00002738:    735c6372    rc\s    DCD    1935434610
        0x0000273c:    645c636f    oc\d    DCD    1683776367
        0x00002740:    65766972    rive    DCD    1702259058
        0x00002744:    79735c72    r\sy    DCD    2037603442
        0x00002748:    6e6f6373    scon    DCD    1852793715
        0x0000274c:    0000632e    .c..    DCD    25390
        0x00002750:    63747228    (rtc    DCD    1668575784
        0x00002754:    7669645f    _div    DCD    1986618463
        0x00002758:    72656469    ider    DCD    1919247465
        0x0000275c:    3c29312d    -1)<    DCD    1009332525
        0x00002760:    3178303d    =0x1    DCD    829960253
        0x00002764:    00666666    fff.    DCD    6710886
        0x00002768:    5f637472    rtc_    DCD    1600353394
        0x0000276c:    3c637273    src<    DCD    1013150323
        0x00002770:    6374723d    =rtc    DCD    1668575805
        0x00002774:    5f6b6c63    clk_    DCD    1600875619
        0x00002778:    6d6f7266    from    DCD    1836020326
        0x0000277c:    6268615f    _ahb    DCD    1651007839
        0x00002780:    00000000    ....    DCD    0
        0x00002784:    5f637472    rtc_    DCD    1600353394
        0x00002788:    69766964    divi    DCD    1769367908
        0x0000278c:    3e726564    der>    DCD    1047684452
        0x00002790:    0000323d    =2..    DCD    12861
    $t
    i.HAL_TIMER_Enable
    HAL_TIMER_Enable
        0x00002794:    b110        ..      CBZ      r0,0x279c ; HAL_TIMER_Enable + 8
        0x00002796:    2801        .(      CMP      r0,#1
        0x00002798:    d112        ..      BNE      0x27c0 ; HAL_TIMER_Enable + 44
        0x0000279a:    e008        ..      B        0x27ae ; HAL_TIMER_Enable + 26
        0x0000279c:    bf00        ..      NOP      
        0x0000279e:    4a09        .J      LDR      r2,[pc,#36] ; [0x27c4] = 0x40001000
        0x000027a0:    6892        .h      LDR      r2,[r2,#8]
        0x000027a2:    f3610200    a...    BFI      r2,r1,#0,#1
        0x000027a6:    4b07        .K      LDR      r3,[pc,#28] ; [0x27c4] = 0x40001000
        0x000027a8:    609a        .`      STR      r2,[r3,#8]
        0x000027aa:    bf00        ..      NOP      
        0x000027ac:    e008        ..      B        0x27c0 ; HAL_TIMER_Enable + 44
        0x000027ae:    bf00        ..      NOP      
        0x000027b0:    4a04        .J      LDR      r2,[pc,#16] ; [0x27c4] = 0x40001000
        0x000027b2:    69d2        .i      LDR      r2,[r2,#0x1c]
        0x000027b4:    f3610200    a...    BFI      r2,r1,#0,#1
        0x000027b8:    4b02        .K      LDR      r3,[pc,#8] ; [0x27c4] = 0x40001000
        0x000027ba:    61da        .a      STR      r2,[r3,#0x1c]
        0x000027bc:    bf00        ..      NOP      
        0x000027be:    bf00        ..      NOP      
        0x000027c0:    bf00        ..      NOP      
        0x000027c2:    4770        pG      BX       lr
    $d
        0x000027c4:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_TIMER_Init
    HAL_TIMER_Init
        0x000027c8:    b537        7.      PUSH     {r0-r2,r4,r5,lr}
        0x000027ca:    4604        .F      MOV      r4,r0
        0x000027cc:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x000027d0:    2100        .!      MOVS     r1,#0
        0x000027d2:    f7ffffdf    ....    BL       HAL_TIMER_Enable ; 0x2794
        0x000027d6:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x000027da:    b110        ..      CBZ      r0,0x27e2 ; HAL_TIMER_Init + 26
        0x000027dc:    2801        .(      CMP      r0,#1
        0x000027de:    d146        F.      BNE      0x286e ; HAL_TIMER_Init + 166
        0x000027e0:    e022        ".      B        0x2828 ; HAL_TIMER_Init + 96
        0x000027e2:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x000027e6:    4923        #I      LDR      r1,[pc,#140] ; [0x2874] = 0x40001000
        0x000027e8:    6889        .h      LDR      r1,[r1,#8]
        0x000027ea:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x000027ee:    4a21        !J      LDR      r2,[pc,#132] ; [0x2874] = 0x40001000
        0x000027f0:    6091        .`      STR      r1,[r2,#8]
        0x000027f2:    bf00        ..      NOP      
        0x000027f4:    f89d0005    ....    LDRB     r0,[sp,#5]
        0x000027f8:    4611        .F      MOV      r1,r2
        0x000027fa:    6889        .h      LDR      r1,[r1,#8]
        0x000027fc:    f3600182    `...    BFI      r1,r0,#2,#1
        0x00002800:    6091        .`      STR      r1,[r2,#8]
        0x00002802:    bf00        ..      NOP      
        0x00002804:    9902        ..      LDR      r1,[sp,#8]
        0x00002806:    fbb4f1f1    ....    UDIV     r1,r4,r1
        0x0000280a:    1e49        I.      SUBS     r1,r1,#1
        0x0000280c:    b2c8        ..      UXTB     r0,r1
        0x0000280e:    0491        ..      LSLS     r1,r2,#18
        0x00002810:    6849        Ih      LDR      r1,[r1,#4]
        0x00002812:    f360210b    `..!    BFI      r1,r0,#8,#4
        0x00002816:    0492        ..      LSLS     r2,r2,#18
        0x00002818:    6051        Q`      STR      r1,[r2,#4]
        0x0000281a:    bf00        ..      NOP      
        0x0000281c:    2200        ."      MOVS     r2,#0
        0x0000281e:    2101        .!      MOVS     r1,#1
        0x00002820:    4610        .F      MOV      r0,r2
        0x00002822:    f000fb37    ..7.    BL       sysc_cpu_div_update_pack ; 0x2e94
        0x00002826:    e023        #.      B        0x2870 ; HAL_TIMER_Init + 168
        0x00002828:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x0000282c:    4911        .I      LDR      r1,[pc,#68] ; [0x2874] = 0x40001000
        0x0000282e:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x00002830:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x00002834:    4a0f        .J      LDR      r2,[pc,#60] ; [0x2874] = 0x40001000
        0x00002836:    61d1        .a      STR      r1,[r2,#0x1c]
        0x00002838:    bf00        ..      NOP      
        0x0000283a:    f89d0005    ....    LDRB     r0,[sp,#5]
        0x0000283e:    4611        .F      MOV      r1,r2
        0x00002840:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x00002842:    f3600182    `...    BFI      r1,r0,#2,#1
        0x00002846:    61d1        .a      STR      r1,[r2,#0x1c]
        0x00002848:    bf00        ..      NOP      
        0x0000284a:    9902        ..      LDR      r1,[sp,#8]
        0x0000284c:    fbb4f1f1    ....    UDIV     r1,r4,r1
        0x00002850:    1e49        I.      SUBS     r1,r1,#1
        0x00002852:    b2c8        ..      UXTB     r0,r1
        0x00002854:    0491        ..      LSLS     r1,r2,#18
        0x00002856:    6849        Ih      LDR      r1,[r1,#4]
        0x00002858:    f360310f    `..1    BFI      r1,r0,#12,#4
        0x0000285c:    0492        ..      LSLS     r2,r2,#18
        0x0000285e:    6051        Q`      STR      r1,[r2,#4]
        0x00002860:    bf00        ..      NOP      
        0x00002862:    2200        ."      MOVS     r2,#0
        0x00002864:    4611        .F      MOV      r1,r2
        0x00002866:    2001        .       MOVS     r0,#1
        0x00002868:    f000fb14    ....    BL       sysc_cpu_div_update_pack ; 0x2e94
        0x0000286c:    e000        ..      B        0x2870 ; HAL_TIMER_Init + 168
        0x0000286e:    bf00        ..      NOP      
        0x00002870:    bf00        ..      NOP      
        0x00002872:    bd3e        >.      POP      {r1-r5,pc}
    $d
        0x00002874:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_TIMER_Int_Clr
    HAL_TIMER_Int_Clr
        0x00002878:    b110        ..      CBZ      r0,0x2880 ; HAL_TIMER_Int_Clr + 8
        0x0000287a:    2801        .(      CMP      r0,#1
        0x0000287c:    d108        ..      BNE      0x2890 ; HAL_TIMER_Int_Clr + 24
        0x0000287e:    e003        ..      B        0x2888 ; HAL_TIMER_Int_Clr + 16
        0x00002880:    bf00        ..      NOP      
        0x00002882:    4904        .I      LDR      r1,[pc,#16] ; [0x2894] = 0x40001000
        0x00002884:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002886:    e003        ..      B        0x2890 ; HAL_TIMER_Int_Clr + 24
        0x00002888:    bf00        ..      NOP      
        0x0000288a:    4902        .I      LDR      r1,[pc,#8] ; [0x2894] = 0x40001000
        0x0000288c:    6a09        .j      LDR      r1,[r1,#0x20]
        0x0000288e:    bf00        ..      NOP      
        0x00002890:    bf00        ..      NOP      
        0x00002892:    4770        pG      BX       lr
    $d
        0x00002894:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_TIMER_Set_LoadCount
    HAL_TIMER_Set_LoadCount
        0x00002898:    b110        ..      CBZ      r0,0x28a0 ; HAL_TIMER_Set_LoadCount + 8
        0x0000289a:    2801        .(      CMP      r0,#1
        0x0000289c:    d112        ..      BNE      0x28c4 ; HAL_TIMER_Set_LoadCount + 44
        0x0000289e:    e008        ..      B        0x28b2 ; HAL_TIMER_Set_LoadCount + 26
        0x000028a0:    bf00        ..      NOP      
        0x000028a2:    4a09        .J      LDR      r2,[pc,#36] ; [0x28c8] = 0x40001000
        0x000028a4:    6812        .h      LDR      r2,[r2,#0]
        0x000028a6:    f3610217    a...    BFI      r2,r1,#0,#24
        0x000028aa:    4b07        .K      LDR      r3,[pc,#28] ; [0x28c8] = 0x40001000
        0x000028ac:    601a        .`      STR      r2,[r3,#0]
        0x000028ae:    bf00        ..      NOP      
        0x000028b0:    e008        ..      B        0x28c4 ; HAL_TIMER_Set_LoadCount + 44
        0x000028b2:    bf00        ..      NOP      
        0x000028b4:    4a04        .J      LDR      r2,[pc,#16] ; [0x28c8] = 0x40001000
        0x000028b6:    6952        Ri      LDR      r2,[r2,#0x14]
        0x000028b8:    f3610217    a...    BFI      r2,r1,#0,#24
        0x000028bc:    4b02        .K      LDR      r3,[pc,#8] ; [0x28c8] = 0x40001000
        0x000028be:    615a        Za      STR      r2,[r3,#0x14]
        0x000028c0:    bf00        ..      NOP      
        0x000028c2:    bf00        ..      NOP      
        0x000028c4:    bf00        ..      NOP      
        0x000028c6:    4770        pG      BX       lr
    $d
        0x000028c8:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_UART_FIFO_Control
    HAL_UART_FIFO_Control
        0x000028cc:    b5f0        ..      PUSH     {r4-r7,lr}
        0x000028ce:    2201        ."      MOVS     r2,#1
        0x000028d0:    2300        .#      MOVS     r3,#0
        0x000028d2:    461c        .F      MOV      r4,r3
        0x000028d4:    4615        .F      MOV      r5,r2
        0x000028d6:    018e        ..      LSLS     r6,r1,#6
        0x000028d8:    ea461600    F...    ORR      r6,r6,r0,LSL #4
        0x000028dc:    ea4606c2    F...    ORR      r6,r6,r2,LSL #3
        0x000028e0:    ea460683    F...    ORR      r6,r6,r3,LSL #2
        0x000028e4:    ea460644    F.D.    ORR      r6,r6,r4,LSL #1
        0x000028e8:    432e        .C      ORRS     r6,r6,r5
        0x000028ea:    4f02        .O      LDR      r7,[pc,#8] ; [0x28f4] = 0x40003000
        0x000028ec:    60be        .`      STR      r6,[r7,#8]
        0x000028ee:    bf00        ..      NOP      
        0x000028f0:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x000028f2:    0000        ..      DCW    0
        0x000028f4:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_Init
    HAL_UART_Init
        0x000028f8:    b537        7.      PUSH     {r0-r2,r4,r5,lr}
        0x000028fa:    4604        .F      MOV      r4,r0
        0x000028fc:    4620         F      MOV      r0,r4
        0x000028fe:    9901        ..      LDR      r1,[sp,#4]
        0x00002900:    f000f8ae    ....    BL       HAL_UART_Set_BaudRate ; 0x2a60
        0x00002904:    f89d000a    ....    LDRB     r0,[sp,#0xa]
        0x00002908:    b918        ..      CBNZ     r0,0x2912 ; HAL_UART_Init + 26
        0x0000290a:    2000        .       MOVS     r0,#0
        0x0000290c:    f000fb78    ..x.    BL       uart_pen_setf ; 0x3000
        0x00002910:    e00d        ..      B        0x292e ; HAL_UART_Init + 54
        0x00002912:    2001        .       MOVS     r0,#1
        0x00002914:    f000fb74    ..t.    BL       uart_pen_setf ; 0x3000
        0x00002918:    f89d000a    ....    LDRB     r0,[sp,#0xa]
        0x0000291c:    2802        .(      CMP      r0,#2
        0x0000291e:    d103        ..      BNE      0x2928 ; HAL_UART_Init + 48
        0x00002920:    2001        .       MOVS     r0,#1
        0x00002922:    f000fb4f    ..O.    BL       uart_eps_setf ; 0x2fc4
        0x00002926:    e002        ..      B        0x292e ; HAL_UART_Init + 54
        0x00002928:    2000        .       MOVS     r0,#0
        0x0000292a:    f000fb4b    ..K.    BL       uart_eps_setf ; 0x2fc4
        0x0000292e:    f89d0009    ....    LDRB     r0,[sp,#9]
        0x00002932:    490d        .I      LDR      r1,[pc,#52] ; [0x2968] = 0x40003000
        0x00002934:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002936:    f3600182    `...    BFI      r1,r0,#2,#1
        0x0000293a:    4a0b        .J      LDR      r2,[pc,#44] ; [0x2968] = 0x40003000
        0x0000293c:    60d1        .`      STR      r1,[r2,#0xc]
        0x0000293e:    bf00        ..      NOP      
        0x00002940:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00002944:    4611        .F      MOV      r1,r2
        0x00002946:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002948:    f3600101    `...    BFI      r1,r0,#0,#2
        0x0000294c:    60d1        .`      STR      r1,[r2,#0xc]
        0x0000294e:    bf00        ..      NOP      
        0x00002950:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x00002954:    2801        .(      CMP      r0,#1
        0x00002956:    d102        ..      BNE      0x295e ; HAL_UART_Init + 102
        0x00002958:    f000fb20    .. .    BL       uart_afce_setf ; 0x2f9c
        0x0000295c:    e002        ..      B        0x2964 ; HAL_UART_Init + 108
        0x0000295e:    2000        .       MOVS     r0,#0
        0x00002960:    f000fb1c    ....    BL       uart_afce_setf ; 0x2f9c
        0x00002964:    bd3e        >.      POP      {r1-r5,pc}
    $d
        0x00002966:    0000        ..      DCW    0
        0x00002968:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_Isr
    HAL_UART_Isr
        0x0000296c:    b510        ..      PUSH     {r4,lr}
        0x0000296e:    e01f        ..      B        0x29b0 ; HAL_UART_Isr + 68
        0x00002970:    bf00        ..      NOP      
        0x00002972:    4811        .H      LDR      r0,[pc,#68] ; [0x29b8] = 0x40003000
        0x00002974:    6880        .h      LDR      r0,[r0,#8]
        0x00002976:    f000040f    ....    AND      r4,r0,#0xf
        0x0000297a:    bf00        ..      NOP      
        0x0000297c:    2c01        .,      CMP      r4,#1
        0x0000297e:    d100        ..      BNE      0x2982 ; HAL_UART_Isr + 22
        0x00002980:    e017        ..      B        0x29b2 ; HAL_UART_Isr + 70
        0x00002982:    2c02        .,      CMP      r4,#2
        0x00002984:    d00c        ..      BEQ      0x29a0 ; HAL_UART_Isr + 52
        0x00002986:    2c04        .,      CMP      r4,#4
        0x00002988:    d007        ..      BEQ      0x299a ; HAL_UART_Isr + 46
        0x0000298a:    2c06        .,      CMP      r4,#6
        0x0000298c:    d002        ..      BEQ      0x2994 ; HAL_UART_Isr + 40
        0x0000298e:    2c0c        .,      CMP      r4,#0xc
        0x00002990:    d10c        ..      BNE      0x29ac ; HAL_UART_Isr + 64
        0x00002992:    e008        ..      B        0x29a6 ; HAL_UART_Isr + 58
        0x00002994:    f000fbe2    ....    BL       uart_rec_error_isr ; 0x315c
        0x00002998:    e009        ..      B        0x29ae ; HAL_UART_Isr + 66
        0x0000299a:    f000fb41    ..A.    BL       uart_rec_data_avail_isr ; 0x3020
        0x0000299e:    e006        ..      B        0x29ae ; HAL_UART_Isr + 66
        0x000029a0:    f000fcc0    ....    BL       uart_thr_empty_isr ; 0x3324
        0x000029a4:    e003        ..      B        0x29ae ; HAL_UART_Isr + 66
        0x000029a6:    f000fb3b    ..;.    BL       uart_rec_data_avail_isr ; 0x3020
        0x000029aa:    e000        ..      B        0x29ae ; HAL_UART_Isr + 66
        0x000029ac:    bf00        ..      NOP      
        0x000029ae:    bf00        ..      NOP      
        0x000029b0:    e7de        ..      B        0x2970 ; HAL_UART_Isr + 4
        0x000029b2:    bf00        ..      NOP      
        0x000029b4:    bd10        ..      POP      {r4,pc}
    $d
        0x000029b6:    0000        ..      DCW    0
        0x000029b8:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_Read
    HAL_UART_Read
        0x000029bc:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000029c0:    4604        .F      MOV      r4,r0
        0x000029c2:    460d        .F      MOV      r5,r1
        0x000029c4:    4616        .F      MOV      r6,r2
        0x000029c6:    461f        .F      MOV      r7,r3
        0x000029c8:    b104        ..      CBZ      r4,0x29cc ; HAL_UART_Read + 16
        0x000029ca:    e005        ..      B        0x29d8 ; HAL_UART_Read + 28
        0x000029cc:    f44f729e    O..r    MOV      r2,#0x13c
        0x000029d0:    a110        ..      ADR      r1,{pc}+0x44 ; 0x2a14
        0x000029d2:    a018        ..      ADR      r0,{pc}+0x62 ; 0x2a34
        0x000029d4:    f000f9b0    ....    BL       __aeabi_assert ; 0x2d38
        0x000029d8:    b105        ..      CBZ      r5,0x29dc ; HAL_UART_Read + 32
        0x000029da:    e005        ..      B        0x29e8 ; HAL_UART_Read + 44
        0x000029dc:    f240123d    @.=.    MOV      r2,#0x13d
        0x000029e0:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x2a14
        0x000029e2:    a017        ..      ADR      r0,{pc}+0x5e ; 0x2a40
        0x000029e4:    f000f9a8    ....    BL       __aeabi_assert ; 0x2d38
        0x000029e8:    b106        ..      CBZ      r6,0x29ec ; HAL_UART_Read + 48
        0x000029ea:    e005        ..      B        0x29f8 ; HAL_UART_Read + 60
        0x000029ec:    f44f729f    O..r    MOV      r2,#0x13e
        0x000029f0:    a108        ..      ADR      r1,{pc}+0x24 ; 0x2a14
        0x000029f2:    a016        ..      ADR      r0,{pc}+0x5a ; 0x2a4c
        0x000029f4:    f000f9a0    ....    BL       __aeabi_assert ; 0x2d38
        0x000029f8:    4818        .H      LDR      r0,[pc,#96] ; [0x2a5c] = 0x20000484
        0x000029fa:    6145        Ea      STR      r5,[r0,#0x14]
        0x000029fc:    6184        .a      STR      r4,[r0,#0x18]
        0x000029fe:    6206        .b      STR      r6,[r0,#0x20]
        0x00002a00:    6247        Gb      STR      r7,[r0,#0x24]
        0x00002a02:    2000        .       MOVS     r0,#0
        0x00002a04:    4915        .I      LDR      r1,[pc,#84] ; [0x2a5c] = 0x20000484
        0x00002a06:    f881002a    ..*.    STRB     r0,[r1,#0x2a]
        0x00002a0a:    2001        .       MOVS     r0,#1
        0x00002a0c:    f000fae4    ....    BL       uart_erbfi_setf ; 0x2fd8
        0x00002a10:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00002a14:    735c2e2e    ..\s    DCD    1935420974
        0x00002a18:    735c6b64    dk\s    DCD    1935436644
        0x00002a1c:    735c6372    rc\s    DCD    1935434610
        0x00002a20:    645c636f    oc\d    DCD    1683776367
        0x00002a24:    65766972    rive    DCD    1702259058
        0x00002a28:    61755c72    r\ua    DCD    1635081330
        0x00002a2c:    632e7472    rt.c    DCD    1663988850
        0x00002a30:    00000000    ....    DCD    0
        0x00002a34:    70667562    bufp    DCD    1885762914
        0x00002a38:    21207274    tr !    DCD    555774580
        0x00002a3c:    0030203d    = 0.    DCD    3153981
        0x00002a40:    657a6973    size    DCD    1702521203
        0x00002a44:    203d2120     !=     DCD    540877088
        0x00002a48:    00000030    0...    DCD    48
        0x00002a4c:    6c6c6163    call    DCD    1819042147
        0x00002a50:    6b636162    back    DCD    1801675106
        0x00002a54:    203d2120     !=     DCD    540877088
        0x00002a58:    00000030    0...    DCD    48
        0x00002a5c:    20000484    ...     DCD    536872068
    $t
    i.HAL_UART_Set_BaudRate
    HAL_UART_Set_BaudRate
        0x00002a60:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x00002a64:    4605        .F      MOV      r5,r0
        0x00002a66:    460c        .F      MOV      r4,r1
        0x00002a68:    0928        (.      LSRS     r0,r5,#4
        0x00002a6a:    fbb0f0f4    ....    UDIV     r0,r0,r4
        0x00002a6e:    b286        ..      UXTH     r6,r0
        0x00002a70:    0928        (.      LSRS     r0,r5,#4
        0x00002a72:    fbb0fbf4    ....    UDIV     r11,r0,r4
        0x00002a76:    4658        XF      MOV      r0,r11
        0x00002a78:    f000fde0    ....    BL       __aeabi_ui2f ; 0x363c
        0x00002a7c:    4681        .F      MOV      r9,r0
        0x00002a7e:    4620         F      MOV      r0,r4
        0x00002a80:    f000fddc    ....    BL       __aeabi_ui2f ; 0x363c
        0x00002a84:    9001        ..      STR      r0,[sp,#4]
        0x00002a86:    4628        (F      MOV      r0,r5
        0x00002a88:    f000fdd8    ....    BL       __aeabi_ui2f ; 0x363c
        0x00002a8c:    f04f4183    O..A    MOV      r1,#0x41800000
        0x00002a90:    9000        ..      STR      r0,[sp,#0]
        0x00002a92:    f000fcf5    ....    BL       _fdiv1 ; 0x3480
        0x00002a96:    4683        .F      MOV      r11,r0
        0x00002a98:    9901        ..      LDR      r1,[sp,#4]
        0x00002a9a:    f000fcf1    ....    BL       _fdiv1 ; 0x3480
        0x00002a9e:    4682        .F      MOV      r10,r0
        0x00002aa0:    4649        IF      MOV      r1,r9
        0x00002aa2:    f000feab    ....    BL       __aeabi_fsub ; 0x37fc
        0x00002aa6:    f04f4184    O..A    MOV      r1,#0x42000000
        0x00002aaa:    9002        ..      STR      r0,[sp,#8]
        0x00002aac:    f000fdda    ....    BL       __aeabi_fmul ; 0x3664
        0x00002ab0:    f04f517c    O.|Q    MOV      r1,#0x3f000000
        0x00002ab4:    9003        ..      STR      r0,[sp,#0xc]
        0x00002ab6:    f000fc81    ....    BL       __aeabi_fadd ; 0x33bc
        0x00002aba:    4680        .F      MOV      r8,r0
        0x00002abc:    f000fda2    ....    BL       __aeabi_f2iz ; 0x3604
        0x00002ac0:    b2c7        ..      UXTB     r7,r0
        0x00002ac2:    2001        .       MOVS     r0,#1
        0x00002ac4:    f000fa74    ..t.    BL       uart_dlab_setf ; 0x2fb0
        0x00002ac8:    b2f0        ..      UXTB     r0,r6
        0x00002aca:    4908        .I      LDR      r1,[pc,#32] ; [0x2aec] = 0x40003000
        0x00002acc:    6008        .`      STR      r0,[r1,#0]
        0x00002ace:    bf00        ..      NOP      
        0x00002ad0:    1230        0.      ASRS     r0,r6,#8
        0x00002ad2:    6048        H`      STR      r0,[r1,#4]
        0x00002ad4:    bf00        ..      NOP      
        0x00002ad6:    4638        8F      MOV      r0,r7
        0x00002ad8:    4904        .I      LDR      r1,[pc,#16] ; [0x2aec] = 0x40003000
        0x00002ada:    31c0        .1      ADDS     r1,r1,#0xc0
        0x00002adc:    6008        .`      STR      r0,[r1,#0]
        0x00002ade:    bf00        ..      NOP      
        0x00002ae0:    2000        .       MOVS     r0,#0
        0x00002ae2:    f000fa65    ..e.    BL       uart_dlab_setf ; 0x2fb0
        0x00002ae6:    e8bd9fff    ....    POP      {r0-r12,pc}
    $d
        0x00002aea:    0000        ..      DCW    0
        0x00002aec:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_WriteChar_Polling
    HAL_UART_WriteChar_Polling
        0x00002af0:    b510        ..      PUSH     {r4,lr}
        0x00002af2:    4604        .F      MOV      r4,r0
        0x00002af4:    bf00        ..      NOP      
        0x00002af6:    f000fc0d    ....    BL       uart_tfnf_getf ; 0x3314
        0x00002afa:    2800        .(      CMP      r0,#0
        0x00002afc:    d0fb        ..      BEQ      0x2af6 ; HAL_UART_WriteChar_Polling + 6
        0x00002afe:    4620         F      MOV      r0,r4
        0x00002b00:    f000fc56    ..V.    BL       uart_thr_set ; 0x33b0
        0x00002b04:    bd10        ..      POP      {r4,pc}
    i.HAL_UART_Write_Polling
    HAL_UART_Write_Polling
        0x00002b06:    b570        p.      PUSH     {r4-r6,lr}
        0x00002b08:    4604        .F      MOV      r4,r0
        0x00002b0a:    460d        .F      MOV      r5,r1
        0x00002b0c:    2600        .&      MOVS     r6,#0
        0x00002b0e:    e004        ..      B        0x2b1a ; HAL_UART_Write_Polling + 20
        0x00002b10:    7820         x      LDRB     r0,[r4,#0]
        0x00002b12:    f7ffffed    ....    BL       HAL_UART_WriteChar_Polling ; 0x2af0
        0x00002b16:    1c64        d.      ADDS     r4,r4,#1
        0x00002b18:    1c76        v.      ADDS     r6,r6,#1
        0x00002b1a:    42ae        .B      CMP      r6,r5
        0x00002b1c:    d3f8        ..      BCC      0x2b10 ; HAL_UART_Write_Polling + 10
        0x00002b1e:    bd70        p.      POP      {r4-r6,pc}
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00002b20:    4905        .I      LDR      r1,[pc,#20] ; [0x2b38] = 0x88
        0x00002b22:    b510        ..      PUSH     {r4,lr}
        0x00002b24:    3160        `1      ADDS     r1,r1,#0x60
        0x00002b26:    d004        ..      BEQ      0x2b32 ; I2C0_IRQHandler + 18
        0x00002b28:    6848        Hh      LDR      r0,[r1,#4]
        0x00002b2a:    6809        .h      LDR      r1,[r1,#0]
        0x00002b2c:    e8bd4010    ...@    POP      {r4,lr}
        0x00002b30:    4708        .G      BX       r1
        0x00002b32:    f7fdfc2d    ..-.    BL       abort ; 0x390
    $d
        0x00002b36:    0000        ..      DCW    0
        0x00002b38:    00000088    ....    DCD    136
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00002b3c:    4905        .I      LDR      r1,[pc,#20] ; [0x2b54] = 0x88
        0x00002b3e:    b510        ..      PUSH     {r4,lr}
        0x00002b40:    3168        h1      ADDS     r1,r1,#0x68
        0x00002b42:    d004        ..      BEQ      0x2b4e ; I2C1_IRQHandler + 18
        0x00002b44:    6848        Hh      LDR      r0,[r1,#4]
        0x00002b46:    6809        .h      LDR      r1,[r1,#0]
        0x00002b48:    e8bd4010    ...@    POP      {r4,lr}
        0x00002b4c:    4708        .G      BX       r1
        0x00002b4e:    f7fdfc1f    ....    BL       abort ; 0x390
    $d
        0x00002b52:    0000        ..      DCW    0
        0x00002b54:    00000088    ....    DCD    136
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00002b58:    4905        .I      LDR      r1,[pc,#20] ; [0x2b70] = 0x88
        0x00002b5a:    b510        ..      PUSH     {r4,lr}
        0x00002b5c:    3188        .1      ADDS     r1,r1,#0x88
        0x00002b5e:    d004        ..      BEQ      0x2b6a ; I2S_IRQHandler + 18
        0x00002b60:    6848        Hh      LDR      r0,[r1,#4]
        0x00002b62:    6809        .h      LDR      r1,[r1,#0]
        0x00002b64:    e8bd4010    ...@    POP      {r4,lr}
        0x00002b68:    4708        .G      BX       r1
        0x00002b6a:    f7fdfc11    ....    BL       abort ; 0x390
    $d
        0x00002b6e:    0000        ..      DCW    0
        0x00002b70:    00000088    ....    DCD    136
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00002b74:    4905        .I      LDR      r1,[pc,#20] ; [0x2b8c] = 0x88
        0x00002b76:    b510        ..      PUSH     {r4,lr}
        0x00002b78:    3120         1      ADDS     r1,r1,#0x20
        0x00002b7a:    d004        ..      BEQ      0x2b86 ; QSPI_IRQHandler + 18
        0x00002b7c:    6848        Hh      LDR      r0,[r1,#4]
        0x00002b7e:    6809        .h      LDR      r1,[r1,#0]
        0x00002b80:    e8bd4010    ...@    POP      {r4,lr}
        0x00002b84:    4708        .G      BX       r1
        0x00002b86:    f7fdfc03    ....    BL       abort ; 0x390
    $d
        0x00002b8a:    0000        ..      DCW    0
        0x00002b8c:    00000088    ....    DCD    136
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00002b90:    4905        .I      LDR      r1,[pc,#20] ; [0x2ba8] = 0x88
        0x00002b92:    b510        ..      PUSH     {r4,lr}
        0x00002b94:    3110        .1      ADDS     r1,r1,#0x10
        0x00002b96:    d004        ..      BEQ      0x2ba2 ; RTC_IRQHandler + 18
        0x00002b98:    6848        Hh      LDR      r0,[r1,#4]
        0x00002b9a:    6809        .h      LDR      r1,[r1,#0]
        0x00002b9c:    e8bd4010    ...@    POP      {r4,lr}
        0x00002ba0:    4708        .G      BX       r1
        0x00002ba2:    f7fdfbf5    ....    BL       abort ; 0x390
    $d
        0x00002ba6:    0000        ..      DCW    0
        0x00002ba8:    00000088    ....    DCD    136
    $t
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00002bac:    4905        .I      LDR      r1,[pc,#20] ; [0x2bc4] = 0x88
        0x00002bae:    b510        ..      PUSH     {r4,lr}
        0x00002bb0:    3170        p1      ADDS     r1,r1,#0x70
        0x00002bb2:    d004        ..      BEQ      0x2bbe ; SPIM_IRQHandler + 18
        0x00002bb4:    6848        Hh      LDR      r0,[r1,#4]
        0x00002bb6:    6809        .h      LDR      r1,[r1,#0]
        0x00002bb8:    e8bd4010    ...@    POP      {r4,lr}
        0x00002bbc:    4708        .G      BX       r1
        0x00002bbe:    f7fdfbe7    ....    BL       abort ; 0x390
    $d
        0x00002bc2:    0000        ..      DCW    0
        0x00002bc4:    00000088    ....    DCD    136
    $t
    i.SystemInit
    SystemInit
        0x00002bc8:    b510        ..      PUSH     {r4,lr}
        0x00002bca:    4812        .H      LDR      r0,[pc,#72] ; [0x2c14] = 0x4000b000
        0x00002bcc:    6801        .h      LDR      r1,[r0,#0]
        0x00002bce:    0149        I.      LSLS     r1,r1,#5
        0x00002bd0:    d5fc        ..      BPL      0x2bcc ; SystemInit + 4
        0x00002bd2:    f64e2160    N.`!    MOV      r1,#0xea60
        0x00002bd6:    2000        .       MOVS     r0,#0
        0x00002bd8:    bf00        ..      NOP      
        0x00002bda:    bf00        ..      NOP      
        0x00002bdc:    bf00        ..      NOP      
        0x00002bde:    bf00        ..      NOP      
        0x00002be0:    bf00        ..      NOP      
        0x00002be2:    bf00        ..      NOP      
        0x00002be4:    1c40        @.      ADDS     r0,r0,#1
        0x00002be6:    4288        .B      CMP      r0,r1
        0x00002be8:    d3f6        ..      BCC      0x2bd8 ; SystemInit + 16
        0x00002bea:    490c        .I      LDR      r1,[pc,#48] ; [0x2c1c] = 0x2000043c
        0x00002bec:    480a        .H      LDR      r0,[pc,#40] ; [0x2c18] = 0x5f5e100
        0x00002bee:    6008        .`      STR      r0,[r1,#0]
        0x00002bf0:    2008        .       MOVS     r0,#8
        0x00002bf2:    f7fffcbf    ....    BL       HAL_SYSCON_HCLK_Src_Sel ; 0x2574
        0x00002bf6:    2002        .       MOVS     r0,#2
        0x00002bf8:    f7fffcc8    ....    BL       HAL_SYSCON_Set_HClk_Div ; 0x258c
        0x00002bfc:    2004        .       MOVS     r0,#4
        0x00002bfe:    f7fffcfb    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0x25f8
        0x00002c02:    2002        .       MOVS     r0,#2
        0x00002c04:    f7fffd30    ..0.    BL       HAL_SYSCON_Set_PClk1_Div ; 0x2668
        0x00002c08:    2164        d!      MOVS     r1,#0x64
        0x00002c0a:    e8bd4010    ...@    POP      {r4,lr}
        0x00002c0e:    2001        .       MOVS     r0,#1
        0x00002c10:    f7ffbd60    ..`.    B.W      HAL_SYSCON_Set_RTC_Div ; 0x26d4
    $d
        0x00002c14:    4000b000    ...@    DCD    1073786880
        0x00002c18:    05f5e100    ....    DCD    100000000
        0x00002c1c:    2000043c    <..     DCD    536871996
    $t
    i.TIMER_INIT
    TIMER_INIT
        0x00002c20:    b570        p.      PUSH     {r4-r6,lr}
        0x00002c22:    2000        .       MOVS     r0,#0
        0x00002c24:    f3600407    `...    BFI      r4,r0,#0,#8
        0x00002c28:    f360240f    `..$    BFI      r4,r0,#8,#8
        0x00002c2c:    2001        .       MOVS     r0,#1
        0x00002c2e:    f3604417    `..D    BFI      r4,r0,#16,#8
        0x00002c32:    4d0a        .M      LDR      r5,[pc,#40] ; [0x2c5c] = 0x2faf08
        0x00002c34:    490a        .I      LDR      r1,[pc,#40] ; [0x2c60] = 0x200002d0
        0x00002c36:    480b        .H      LDR      r0,[pc,#44] ; [0x2c64] = 0x2eb1
        0x00002c38:    f000f824    ..$.    BL       TIMER_Int_Register ; 0x2c84
        0x00002c3c:    462a        *F      MOV      r2,r5
        0x00002c3e:    4621        !F      MOV      r1,r4
        0x00002c40:    00e8        ..      LSLS     r0,r5,#3
        0x00002c42:    f7fffdc1    ....    BL       HAL_TIMER_Init ; 0x27c8
        0x00002c46:    f44f719c    O..q    MOV      r1,#0x138
        0x00002c4a:    2000        .       MOVS     r0,#0
        0x00002c4c:    f7fffe24    ..$.    BL       HAL_TIMER_Set_LoadCount ; 0x2898
        0x00002c50:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x00002c54:    2101        .!      MOVS     r1,#1
        0x00002c56:    2000        .       MOVS     r0,#0
        0x00002c58:    f7ffbd9c    ....    B.W      HAL_TIMER_Enable ; 0x2794
    $d
        0x00002c5c:    002faf08    ../.    DCD    3125000
        0x00002c60:    200002d0    ...     DCD    536871632
        0x00002c64:    00002eb1    ....    DCD    11953
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x00002c68:    4905        .I      LDR      r1,[pc,#20] ; [0x2c80] = 0x88
        0x00002c6a:    b510        ..      PUSH     {r4,lr}
        0x00002c6c:    3158        X1      ADDS     r1,r1,#0x58
        0x00002c6e:    d004        ..      BEQ      0x2c7a ; TIMER_IRQHandler + 18
        0x00002c70:    6848        Hh      LDR      r0,[r1,#4]
        0x00002c72:    6809        .h      LDR      r1,[r1,#0]
        0x00002c74:    e8bd4010    ...@    POP      {r4,lr}
        0x00002c78:    4708        .G      BX       r1
        0x00002c7a:    f7fdfb89    ....    BL       abort ; 0x390
    $d
        0x00002c7e:    0000        ..      DCW    0
        0x00002c80:    00000088    ....    DCD    136
    $t
    i.TIMER_Int_Register
    TIMER_Int_Register
        0x00002c84:    b510        ..      PUSH     {r4,lr}
        0x00002c86:    b130        0.      CBZ      r0,0x2c96 ; TIMER_Int_Register + 18
        0x00002c88:    460a        .F      MOV      r2,r1
        0x00002c8a:    4601        .F      MOV      r1,r0
        0x00002c8c:    e8bd4010    ...@    POP      {r4,lr}
        0x00002c90:    200b        .       MOVS     r0,#0xb
        0x00002c92:    f000b873    ..s.    B.W      int_callback_register ; 0x2d7c
        0x00002c96:    f7fdfb7b    ..{.    BL       abort ; 0x390
        0x00002c9a:    0000        ..      MOVS     r0,r0
    i.UART_INIT
    UART_INIT
        0x00002c9c:    b510        ..      PUSH     {r4,lr}
        0x00002c9e:    2201        ."      MOVS     r2,#1
        0x00002ca0:    2108        .!      MOVS     r1,#8
        0x00002ca2:    2000        .       MOVS     r0,#0
        0x00002ca4:    f7fffb8c    ....    BL       HAL_SYSCON_Function_IO_Set ; 0x23c0
        0x00002ca8:    2201        ."      MOVS     r2,#1
        0x00002caa:    2109        .!      MOVS     r1,#9
        0x00002cac:    4610        .F      MOV      r0,r2
        0x00002cae:    f7fffb87    ....    BL       HAL_SYSCON_Function_IO_Set ; 0x23c0
        0x00002cb2:    490e        .I      LDR      r1,[pc,#56] ; [0x2cec] = 0x20000458
        0x00002cb4:    480e        .H      LDR      r0,[pc,#56] ; [0x2cf0] = 0x296d
        0x00002cb6:    f000f82d    ..-.    BL       UART_Int_Register ; 0x2d14
        0x00002cba:    2003        .       MOVS     r0,#3
        0x00002cbc:    f3600407    `...    BFI      r4,r0,#0,#8
        0x00002cc0:    4622        "F      MOV      r2,r4
        0x00002cc2:    2000        .       MOVS     r0,#0
        0x00002cc4:    f3604217    `..B    BFI      r2,r0,#16,#8
        0x00002cc8:    f360220f    `.."    BFI      r2,r0,#8,#8
        0x00002ccc:    f44f31e1    O..1    MOV      r1,#0x1c200
        0x00002cd0:    4808        .H      LDR      r0,[pc,#32] ; [0x2cf4] = 0x17d7840
        0x00002cd2:    f7fffe11    ....    BL       HAL_UART_Init ; 0x28f8
        0x00002cd6:    2103        .!      MOVS     r1,#3
        0x00002cd8:    2000        .       MOVS     r0,#0
        0x00002cda:    f7fffdf7    ....    BL       HAL_UART_FIFO_Control ; 0x28cc
        0x00002cde:    f04f21e0    O..!    MOV      r1,#0xe000e000
        0x00002ce2:    f44f4000    O..@    MOV      r0,#0x8000
        0x00002ce6:    f8c10100    ....    STR      r0,[r1,#0x100]
        0x00002cea:    bd10        ..      POP      {r4,pc}
    $d
        0x00002cec:    20000458    X..     DCD    536872024
        0x00002cf0:    0000296d    m)..    DCD    10605
        0x00002cf4:    017d7840    @x}.    DCD    25000000
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x00002cf8:    4905        .I      LDR      r1,[pc,#20] ; [0x2d10] = 0x88
        0x00002cfa:    b510        ..      PUSH     {r4,lr}
        0x00002cfc:    3178        x1      ADDS     r1,r1,#0x78
        0x00002cfe:    d004        ..      BEQ      0x2d0a ; UART_IRQHandler + 18
        0x00002d00:    6848        Hh      LDR      r0,[r1,#4]
        0x00002d02:    6809        .h      LDR      r1,[r1,#0]
        0x00002d04:    e8bd4010    ...@    POP      {r4,lr}
        0x00002d08:    4708        .G      BX       r1
        0x00002d0a:    f7fdfb41    ..A.    BL       abort ; 0x390
    $d
        0x00002d0e:    0000        ..      DCW    0
        0x00002d10:    00000088    ....    DCD    136
    $t
    i.UART_Int_Register
    UART_Int_Register
        0x00002d14:    b510        ..      PUSH     {r4,lr}
        0x00002d16:    b138        8.      CBZ      r0,0x2d28 ; UART_Int_Register + 20
        0x00002d18:    b131        1.      CBZ      r1,0x2d28 ; UART_Int_Register + 20
        0x00002d1a:    460a        .F      MOV      r2,r1
        0x00002d1c:    4601        .F      MOV      r1,r0
        0x00002d1e:    e8bd4010    ...@    POP      {r4,lr}
        0x00002d22:    200f        .       MOVS     r0,#0xf
        0x00002d24:    f000b82a    ..*.    B.W      int_callback_register ; 0x2d7c
        0x00002d28:    f7fdfb32    ..2.    BL       abort ; 0x390
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x00002d2c:    4901        .I      LDR      r1,[pc,#4] ; [0x2d34] = 0x88
        0x00002d2e:    6848        Hh      LDR      r0,[r1,#4]
        0x00002d30:    6809        .h      LDR      r1,[r1,#0]
        0x00002d32:    4708        .G      BX       r1
    $d
        0x00002d34:    00000088    ....    DCD    136
    $t
    i.__aeabi_assert
    __aeabi_assert
        0x00002d38:    b672        r.      CPSID    i
        0x00002d3a:    4603        .F      MOV      r3,r0
        0x00002d3c:    a001        ..      ADR      r0,{pc}+8 ; 0x2d44
        0x00002d3e:    f7fdfa81    ....    BL       __2printf ; 0x244
        0x00002d42:    e7fe        ..      B        0x2d42 ; __aeabi_assert + 10
    $d
        0x00002d44:    65737341    Asse    DCD    1702064961
        0x00002d48:    6f697472    rtio    DCD    1869182066
        0x00002d4c:    6146206e    n Fa    DCD    1631985774
        0x00002d50:    64656c69    iled    DCD    1684368489
        0x00002d54:    6966203a    : fi    DCD    1768300602
        0x00002d58:    2520656c    le %    DCD    622880108
        0x00002d5c:    6c202c73    s, l    DCD    1814047859
        0x00002d60:    20656e69    ine     DCD    543518313
        0x00002d64:    202c6425    %d,     DCD    539780133
        0x00002d68:    000a7325    %s..    DCD    684837
    $t
    i.fputc
    fputc
        0x00002d6c:    b510        ..      PUSH     {r4,lr}
        0x00002d6e:    4604        .F      MOV      r4,r0
        0x00002d70:    b2c0        ..      UXTB     r0,r0
        0x00002d72:    f7fffebd    ....    BL       HAL_UART_WriteChar_Polling ; 0x2af0
        0x00002d76:    4620         F      MOV      r0,r4
        0x00002d78:    bd10        ..      POP      {r4,pc}
        0x00002d7a:    0000        ..      MOVS     r0,r0
    i.int_callback_register
    int_callback_register
        0x00002d7c:    b510        ..      PUSH     {r4,lr}
        0x00002d7e:    2812        .(      CMP      r0,#0x12
        0x00002d80:    d301        ..      BCC      0x2d86 ; int_callback_register + 10
        0x00002d82:    f7fdfb05    ....    BL       abort ; 0x390
        0x00002d86:    4b03        .K      LDR      r3,[pc,#12] ; [0x2d94] = 0x88
        0x00002d88:    f8431030    C.0.    STR      r1,[r3,r0,LSL #3]
        0x00002d8c:    eb0300c0    ....    ADD      r0,r3,r0,LSL #3
        0x00002d90:    6042        B`      STR      r2,[r0,#4]
        0x00002d92:    bd10        ..      POP      {r4,pc}
    $d
        0x00002d94:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x00002d98:    f7ffff80    ....    BL       UART_INIT ; 0x2c9c
        0x00002d9c:    f7ffff40    ..@.    BL       TIMER_INIT ; 0x2c20
        0x00002da0:    f8df90ac    ....    LDR      r9,[pc,#172] ; [0x2e50] = 0x2000a000
        0x00002da4:    f8dfa0ac    ....    LDR      r10,[pc,#172] ; [0x2e54] = 0x20000318
        0x00002da8:    4d2b        +M      LDR      r5,[pc,#172] ; [0x2e58] = 0x200003b0
        0x00002daa:    f8dfb0b0    ....    LDR      r11,[pc,#176] ; [0x2e5c] = 0x20000042
        0x00002dae:    f8df80b0    ....    LDR      r8,[pc,#176] ; [0x2e60] = 0x20000000
        0x00002db2:    2400        .$      MOVS     r4,#0
        0x00002db4:    f44f6600    O..f    MOV      r6,#0x800
        0x00002db8:    f04f27e0    O..'    MOV      r7,#0xe000e000
        0x00002dbc:    f8d91200    ....    LDR      r1,[r9,#0x200]
        0x00002dc0:    4648        HF      MOV      r0,r9
        0x00002dc2:    f8d92200    ..."    LDR      r2,[r9,#0x200]
        0x00002dc6:    f8ca2000    ...     STR      r2,[r10,#0]
        0x00002dca:    f8501f80    P...    LDR      r1,[r0,#0x80]!
        0x00002dce:    6800        .h      LDR      r0,[r0,#0]
        0x00002dd0:    6028        (`      STR      r0,[r5,#0]
        0x00002dd2:    f7fff941    ..A.    BL       CHn_Message_Send ; 0x2058
        0x00002dd6:    6828        (h      LDR      r0,[r5,#0]
        0x00002dd8:    b990        ..      CBNZ     r0,0x2e00 ; main + 104
        0x00002dda:    2300        .#      MOVS     r3,#0
        0x00002ddc:    4a21        !J      LDR      r2,[pc,#132] ; [0x2e64] = 0x31b1
        0x00002dde:    210d        .!      MOVS     r1,#0xd
        0x00002de0:    4821        !H      LDR      r0,[pc,#132] ; [0x2e68] = 0x20000444
        0x00002de2:    f7fffdeb    ....    BL       HAL_UART_Read ; 0x29bc
        0x00002de6:    f89b0000    ....    LDRB     r0,[r11,#0]
        0x00002dea:    2801        .(      CMP      r0,#1
        0x00002dec:    d108        ..      BNE      0x2e00 ; main + 104
        0x00002dee:    2201        ."      MOVS     r2,#1
        0x00002df0:    f8c76100    ...a    STR      r6,[r7,#0x100]
        0x00002df4:    481d        .H      LDR      r0,[pc,#116] ; [0x2e6c] = 0x20000041
        0x00002df6:    7801        .x      LDRB     r1,[r0,#0]
        0x00002df8:    481d        .H      LDR      r0,[pc,#116] ; [0x2e70] = 0x20000040
        0x00002dfa:    7800        .x      LDRB     r0,[r0,#0]
        0x00002dfc:    f7fff948    ..H.    BL       CHn_ORDER_SEND ; 0x2090
        0x00002e00:    f8c76180    ...a    STR      r6,[r7,#0x180]
        0x00002e04:    f3bf8f4f    ..O.    DSB      
        0x00002e08:    f3bf8f6f    ..o.    ISB      
        0x00002e0c:    f8c84000    ...@    STR      r4,[r8,#0]
        0x00002e10:    f8c84004    ...@    STR      r4,[r8,#4]
        0x00002e14:    f8c84008    ...@    STR      r4,[r8,#8]
        0x00002e18:    f8c8400c    ...@    STR      r4,[r8,#0xc]
        0x00002e1c:    f8c84010    ...@    STR      r4,[r8,#0x10]
        0x00002e20:    f8c84014    ...@    STR      r4,[r8,#0x14]
        0x00002e24:    f8c84018    ...@    STR      r4,[r8,#0x18]
        0x00002e28:    f8c8401c    ...@    STR      r4,[r8,#0x1c]
        0x00002e2c:    f8c84020    .. @    STR      r4,[r8,#0x20]
        0x00002e30:    f8c84024    ..$@    STR      r4,[r8,#0x24]
        0x00002e34:    f8c84028    ..(@    STR      r4,[r8,#0x28]
        0x00002e38:    f8c8402c    ..,@    STR      r4,[r8,#0x2c]
        0x00002e3c:    f8c84030    ..0@    STR      r4,[r8,#0x30]
        0x00002e40:    f8c84034    ..4@    STR      r4,[r8,#0x34]
        0x00002e44:    f8c84038    ..8@    STR      r4,[r8,#0x38]
        0x00002e48:    f8c8403c    ..<@    STR      r4,[r8,#0x3c]
        0x00002e4c:    e7b6        ..      B        0x2dbc ; main + 36
    $d
        0x00002e4e:    0000        ..      DCW    0
        0x00002e50:    2000a000    ...     DCD    536911872
        0x00002e54:    20000318    ...     DCD    536871704
        0x00002e58:    200003b0    ...     DCD    536871856
        0x00002e5c:    20000042    B..     DCD    536870978
        0x00002e60:    20000000    ...     DCD    536870912
        0x00002e64:    000031b1    .1..    DCD    12721
        0x00002e68:    20000444    D..     DCD    536872004
        0x00002e6c:    20000041    A..     DCD    536870977
        0x00002e70:    20000040    @..     DCD    536870976
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00002e74:    4901        .I      LDR      r1,[pc,#4] ; [0x2e7c] = 0x40020000
        0x00002e76:    6008        .`      STR      r0,[r1,#0]
        0x00002e78:    4770        pG      BX       lr
    $d
        0x00002e7a:    0000        ..      DCW    0
        0x00002e7c:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00002e80:    4903        .I      LDR      r1,[pc,#12] ; [0x2e90] = 0x40020000
        0x00002e82:    6849        Ih      LDR      r1,[r1,#4]
        0x00002e84:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00002e88:    4a01        .J      LDR      r2,[pc,#4] ; [0x2e90] = 0x40020000
        0x00002e8a:    6051        Q`      STR      r1,[r2,#4]
        0x00002e8c:    4770        pG      BX       lr
    $d
        0x00002e8e:    0000        ..      DCW    0
        0x00002e90:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_cpu_div_update_pack
    sysc_cpu_div_update_pack
        0x00002e94:    b510        ..      PUSH     {r4,lr}
        0x00002e96:    00c3        ..      LSLS     r3,r0,#3
        0x00002e98:    ea430381    C...    ORR      r3,r3,r1,LSL #2
        0x00002e9c:    4313        .C      ORRS     r3,r3,r2
        0x00002e9e:    f04f4480    O..D    MOV      r4,#0x40000000
        0x00002ea2:    6023        #`      STR      r3,[r4,#0]
        0x00002ea4:    bd10        ..      POP      {r4,pc}
    i.sysc_cpu_func_en_set
    sysc_cpu_func_en_set
        0x00002ea6:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002eaa:    6148        Ha      STR      r0,[r1,#0x14]
        0x00002eac:    4770        pG      BX       lr
        0x00002eae:    0000        ..      MOVS     r0,r0
    i.timer_isr
    timer_isr
        0x00002eb0:    4934        4I      LDR      r1,[pc,#208] ; [0x2f84] = 0x200002d0
        0x00002eb2:    b510        ..      PUSH     {r4,lr}
        0x00002eb4:    6c48        Hl      LDR      r0,[r1,#0x44]
        0x00002eb6:    1c40        @.      ADDS     r0,r0,#1
        0x00002eb8:    6448        Hd      STR      r0,[r1,#0x44]
        0x00002eba:    4833        3H      LDR      r0,[pc,#204] ; [0x2f88] = 0x2000a000
        0x00002ebc:    f8502f80    P../    LDR      r2,[r0,#0x80]!
        0x00002ec0:    4b32        2K      LDR      r3,[pc,#200] ; [0x2f8c] = 0x200003ac
        0x00002ec2:    601a        .`      STR      r2,[r3,#0]
        0x00002ec4:    6802        .h      LDR      r2,[r0,#0]
        0x00002ec6:    4b32        2K      LDR      r3,[pc,#200] ; [0x2f90] = 0x200003b0
        0x00002ec8:    601a        .`      STR      r2,[r3,#0]
        0x00002eca:    f8d02180    ...!    LDR      r2,[r0,#0x180]
        0x00002ece:    f8d00180    ....    LDR      r0,[r0,#0x180]
        0x00002ed2:    4c30        0L      LDR      r4,[pc,#192] ; [0x2f94] = 0x20000041
        0x00002ed4:    6488        .d      STR      r0,[r1,#0x48]
        0x00002ed6:    7820         x      LDRB     r0,[r4,#0]
        0x00002ed8:    07c0        ..      LSLS     r0,r0,#31
        0x00002eda:    d001        ..      BEQ      0x2ee0 ; timer_isr + 48
        0x00002edc:    f7fdfc5e    ..^.    BL       CH0_OPREA ; 0x79c
        0x00002ee0:    7820         x      LDRB     r0,[r4,#0]
        0x00002ee2:    0780        ..      LSLS     r0,r0,#30
        0x00002ee4:    d501        ..      BPL      0x2eea ; timer_isr + 58
        0x00002ee6:    f7fdfd23    ..#.    BL       CH1_OPREA ; 0x930
        0x00002eea:    7820         x      LDRB     r0,[r4,#0]
        0x00002eec:    0740        @.      LSLS     r0,r0,#29
        0x00002eee:    d501        ..      BPL      0x2ef4 ; timer_isr + 68
        0x00002ef0:    f7fdfde8    ....    BL       CH2_OPREA ; 0xac4
        0x00002ef4:    7820         x      LDRB     r0,[r4,#0]
        0x00002ef6:    0700        ..      LSLS     r0,r0,#28
        0x00002ef8:    d501        ..      BPL      0x2efe ; timer_isr + 78
        0x00002efa:    f7fdfeab    ....    BL       CH3_OPREA ; 0xc54
        0x00002efe:    7820         x      LDRB     r0,[r4,#0]
        0x00002f00:    06c0        ..      LSLS     r0,r0,#27
        0x00002f02:    d501        ..      BPL      0x2f08 ; timer_isr + 88
        0x00002f04:    f7fdff6e    ..n.    BL       CH4_OPREA ; 0xde4
        0x00002f08:    7820         x      LDRB     r0,[r4,#0]
        0x00002f0a:    0680        ..      LSLS     r0,r0,#26
        0x00002f0c:    d501        ..      BPL      0x2f12 ; timer_isr + 98
        0x00002f0e:    f7fef831    ..1.    BL       CH5_OPREA ; 0xf74
        0x00002f12:    7820         x      LDRB     r0,[r4,#0]
        0x00002f14:    0640        @.      LSLS     r0,r0,#25
        0x00002f16:    d501        ..      BPL      0x2f1c ; timer_isr + 108
        0x00002f18:    f7fef8f6    ....    BL       CH6_OPREA ; 0x1108
        0x00002f1c:    7820         x      LDRB     r0,[r4,#0]
        0x00002f1e:    0600        ..      LSLS     r0,r0,#24
        0x00002f20:    d501        ..      BPL      0x2f26 ; timer_isr + 118
        0x00002f22:    f7fef9bd    ....    BL       CH7_OPREA ; 0x12a0
        0x00002f26:    4c1c        .L      LDR      r4,[pc,#112] ; [0x2f98] = 0x20000040
        0x00002f28:    7820         x      LDRB     r0,[r4,#0]
        0x00002f2a:    07c0        ..      LSLS     r0,r0,#31
        0x00002f2c:    d001        ..      BEQ      0x2f32 ; timer_isr + 130
        0x00002f2e:    f7fefa87    ....    BL       CH8_OPREA ; 0x1440
        0x00002f32:    7820         x      LDRB     r0,[r4,#0]
        0x00002f34:    0780        ..      LSLS     r0,r0,#30
        0x00002f36:    d501        ..      BPL      0x2f3c ; timer_isr + 140
        0x00002f38:    f7fefb52    ..R.    BL       CH9_OPREA ; 0x15e0
        0x00002f3c:    7820         x      LDRB     r0,[r4,#0]
        0x00002f3e:    0740        @.      LSLS     r0,r0,#29
        0x00002f40:    d501        ..      BPL      0x2f46 ; timer_isr + 150
        0x00002f42:    f7fefc1d    ....    BL       CHA_OPREA ; 0x1780
        0x00002f46:    7820         x      LDRB     r0,[r4,#0]
        0x00002f48:    0700        ..      LSLS     r0,r0,#28
        0x00002f4a:    d501        ..      BPL      0x2f50 ; timer_isr + 160
        0x00002f4c:    f7fefce4    ....    BL       CHB_OPREA ; 0x1918
        0x00002f50:    7820         x      LDRB     r0,[r4,#0]
        0x00002f52:    06c0        ..      LSLS     r0,r0,#27
        0x00002f54:    d501        ..      BPL      0x2f5a ; timer_isr + 170
        0x00002f56:    f7fefdab    ....    BL       CHC_OPREA ; 0x1ab0
        0x00002f5a:    7820         x      LDRB     r0,[r4,#0]
        0x00002f5c:    0680        ..      LSLS     r0,r0,#26
        0x00002f5e:    d501        ..      BPL      0x2f64 ; timer_isr + 180
        0x00002f60:    f7fefe72    ..r.    BL       CHD_OPREA ; 0x1c48
        0x00002f64:    7820         x      LDRB     r0,[r4,#0]
        0x00002f66:    0640        @.      LSLS     r0,r0,#25
        0x00002f68:    d501        ..      BPL      0x2f6e ; timer_isr + 190
        0x00002f6a:    f7feff35    ..5.    BL       CHE_OPREA ; 0x1dd8
        0x00002f6e:    7820         x      LDRB     r0,[r4,#0]
        0x00002f70:    0600        ..      LSLS     r0,r0,#24
        0x00002f72:    d501        ..      BPL      0x2f78 ; timer_isr + 200
        0x00002f74:    f7fefff0    ....    BL       CHF_OPREA ; 0x1f58
        0x00002f78:    e8bd4010    ...@    POP      {r4,lr}
        0x00002f7c:    2000        .       MOVS     r0,#0
        0x00002f7e:    f7ffbc7b    ..{.    B.W      HAL_TIMER_Int_Clr ; 0x2878
    $d
        0x00002f82:    0000        ..      DCW    0
        0x00002f84:    200002d0    ...     DCD    536871632
        0x00002f88:    2000a000    ...     DCD    536911872
        0x00002f8c:    200003ac    ...     DCD    536871852
        0x00002f90:    200003b0    ...     DCD    536871856
        0x00002f94:    20000041    A..     DCD    536870977
        0x00002f98:    20000040    @..     DCD    536870976
    $t
    i.uart_afce_setf
    uart_afce_setf
        0x00002f9c:    4903        .I      LDR      r1,[pc,#12] ; [0x2fac] = 0x40003000
        0x00002f9e:    6909        .i      LDR      r1,[r1,#0x10]
        0x00002fa0:    f3601145    `.E.    BFI      r1,r0,#5,#1
        0x00002fa4:    4a01        .J      LDR      r2,[pc,#4] ; [0x2fac] = 0x40003000
        0x00002fa6:    6111        .a      STR      r1,[r2,#0x10]
        0x00002fa8:    4770        pG      BX       lr
    $d
        0x00002faa:    0000        ..      DCW    0
        0x00002fac:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_dlab_setf
    uart_dlab_setf
        0x00002fb0:    4903        .I      LDR      r1,[pc,#12] ; [0x2fc0] = 0x40003000
        0x00002fb2:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002fb4:    f36011c7    `...    BFI      r1,r0,#7,#1
        0x00002fb8:    4a01        .J      LDR      r2,[pc,#4] ; [0x2fc0] = 0x40003000
        0x00002fba:    60d1        .`      STR      r1,[r2,#0xc]
        0x00002fbc:    4770        pG      BX       lr
    $d
        0x00002fbe:    0000        ..      DCW    0
        0x00002fc0:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_eps_setf
    uart_eps_setf
        0x00002fc4:    4903        .I      LDR      r1,[pc,#12] ; [0x2fd4] = 0x40003000
        0x00002fc6:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002fc8:    f3601104    `...    BFI      r1,r0,#4,#1
        0x00002fcc:    4a01        .J      LDR      r2,[pc,#4] ; [0x2fd4] = 0x40003000
        0x00002fce:    60d1        .`      STR      r1,[r2,#0xc]
        0x00002fd0:    4770        pG      BX       lr
    $d
        0x00002fd2:    0000        ..      DCW    0
        0x00002fd4:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_erbfi_setf
    uart_erbfi_setf
        0x00002fd8:    4903        .I      LDR      r1,[pc,#12] ; [0x2fe8] = 0x40003000
        0x00002fda:    6849        Ih      LDR      r1,[r1,#4]
        0x00002fdc:    f3600100    `...    BFI      r1,r0,#0,#1
        0x00002fe0:    4a01        .J      LDR      r2,[pc,#4] ; [0x2fe8] = 0x40003000
        0x00002fe2:    6051        Q`      STR      r1,[r2,#4]
        0x00002fe4:    4770        pG      BX       lr
    $d
        0x00002fe6:    0000        ..      DCW    0
        0x00002fe8:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_etbei_setf
    uart_etbei_setf
        0x00002fec:    4903        .I      LDR      r1,[pc,#12] ; [0x2ffc] = 0x40003000
        0x00002fee:    6849        Ih      LDR      r1,[r1,#4]
        0x00002ff0:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x00002ff4:    4a01        .J      LDR      r2,[pc,#4] ; [0x2ffc] = 0x40003000
        0x00002ff6:    6051        Q`      STR      r1,[r2,#4]
        0x00002ff8:    4770        pG      BX       lr
    $d
        0x00002ffa:    0000        ..      DCW    0
        0x00002ffc:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_pen_setf
    uart_pen_setf
        0x00003000:    4903        .I      LDR      r1,[pc,#12] ; [0x3010] = 0x40003000
        0x00003002:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00003004:    f36001c3    `...    BFI      r1,r0,#3,#1
        0x00003008:    4a01        .J      LDR      r2,[pc,#4] ; [0x3010] = 0x40003000
        0x0000300a:    60d1        .`      STR      r1,[r2,#0xc]
        0x0000300c:    4770        pG      BX       lr
    $d
        0x0000300e:    0000        ..      DCW    0
        0x00003010:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_rbr_get
    uart_rbr_get
        0x00003014:    4801        .H      LDR      r0,[pc,#4] ; [0x301c] = 0x40003000
        0x00003016:    6800        .h      LDR      r0,[r0,#0]
        0x00003018:    4770        pG      BX       lr
    $d
        0x0000301a:    0000        ..      DCW    0
        0x0000301c:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_rec_data_avail_isr
    uart_rec_data_avail_isr
        0x00003020:    b570        p.      PUSH     {r4-r6,lr}
        0x00003022:    2400        .$      MOVS     r4,#0
        0x00003024:    2600        .&      MOVS     r6,#0
        0x00003026:    e078        x.      B        0x311a ; uart_rec_data_avail_isr + 250
        0x00003028:    4841        AH      LDR      r0,[pc,#260] ; [0x3130] = 0x20000484
        0x0000302a:    f890002a    ..*.    LDRB     r0,[r0,#0x2a]
        0x0000302e:    2800        .(      CMP      r0,#0
        0x00003030:    d133        3.      BNE      0x309a ; uart_rec_data_avail_isr + 122
        0x00003032:    f7ffffef    ....    BL       uart_rbr_get ; 0x3014
        0x00003036:    b2c1        ..      UXTB     r1,r0
        0x00003038:    483d        =H      LDR      r0,[pc,#244] ; [0x3130] = 0x20000484
        0x0000303a:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000303c:    7001        .p      STRB     r1,[r0,#0]
        0x0000303e:    483c        <H      LDR      r0,[pc,#240] ; [0x3130] = 0x20000484
        0x00003040:    6940        @i      LDR      r0,[r0,#0x14]
        0x00003042:    1e40        @.      SUBS     r0,r0,#1
        0x00003044:    493a        :I      LDR      r1,[pc,#232] ; [0x3130] = 0x20000484
        0x00003046:    6148        Ha      STR      r0,[r1,#0x14]
        0x00003048:    4608        .F      MOV      r0,r1
        0x0000304a:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000304c:    1c40        @.      ADDS     r0,r0,#1
        0x0000304e:    6188        .a      STR      r0,[r1,#0x18]
        0x00003050:    4608        .F      MOV      r0,r1
        0x00003052:    6940        @i      LDR      r0,[r0,#0x14]
        0x00003054:    2800        .(      CMP      r0,#0
        0x00003056:    d160        `.      BNE      0x311a ; uart_rec_data_avail_isr + 250
        0x00003058:    2100        .!      MOVS     r1,#0
        0x0000305a:    4835        5H      LDR      r0,[pc,#212] ; [0x3130] = 0x20000484
        0x0000305c:    6181        .a      STR      r1,[r0,#0x18]
        0x0000305e:    2000        .       MOVS     r0,#0
        0x00003060:    f7ffffba    ....    BL       uart_erbfi_setf ; 0x2fd8
        0x00003064:    4832        2H      LDR      r0,[pc,#200] ; [0x3130] = 0x20000484
        0x00003066:    6a04        .j      LDR      r4,[r0,#0x20]
        0x00003068:    6a46        Fj      LDR      r6,[r0,#0x24]
        0x0000306a:    b184        ..      CBZ      r4,0x308e ; uart_rec_data_avail_isr + 110
        0x0000306c:    2100        .!      MOVS     r1,#0
        0x0000306e:    6201        .b      STR      r1,[r0,#0x20]
        0x00003070:    6241        Ab      STR      r1,[r0,#0x24]
        0x00003072:    f8900028    ..(.    LDRB     r0,[r0,#0x28]
        0x00003076:    b910        ..      CBNZ     r0,0x307e ; uart_rec_data_avail_isr + 94
        0x00003078:    4630        0F      MOV      r0,r6
        0x0000307a:    47a0        .G      BLX      r4
        0x0000307c:    e00c        ..      B        0x3098 ; uart_rec_data_avail_isr + 120
        0x0000307e:    2000        .       MOVS     r0,#0
        0x00003080:    492b        +I      LDR      r1,[pc,#172] ; [0x3130] = 0x20000484
        0x00003082:    f8810028    ..(.    STRB     r0,[r1,#0x28]
        0x00003086:    2101        .!      MOVS     r1,#1
        0x00003088:    4630        0F      MOV      r0,r6
        0x0000308a:    47a0        .G      BLX      r4
        0x0000308c:    e004        ..      B        0x3098 ; uart_rec_data_avail_isr + 120
        0x0000308e:    2238        8"      MOVS     r2,#0x38
        0x00003090:    a128        (.      ADR      r1,{pc}+0xa4 ; 0x3134
        0x00003092:    a030        0.      ADR      r0,{pc}+0xc2 ; 0x3154
        0x00003094:    f7fffe50    ..P.    BL       __aeabi_assert ; 0x2d38
        0x00003098:    e047        G.      B        0x312a ; uart_rec_data_avail_isr + 266
        0x0000309a:    4825        %H      LDR      r0,[pc,#148] ; [0x3130] = 0x20000484
        0x0000309c:    f890002a    ..*.    LDRB     r0,[r0,#0x2a]
        0x000030a0:    2801        .(      CMP      r0,#1
        0x000030a2:    d13a        :.      BNE      0x311a ; uart_rec_data_avail_isr + 250
        0x000030a4:    f7ffffb6    ....    BL       uart_rbr_get ; 0x3014
        0x000030a8:    b2c5        ..      UXTB     r5,r0
        0x000030aa:    4821        !H      LDR      r0,[pc,#132] ; [0x3130] = 0x20000484
        0x000030ac:    f8900029    ..).    LDRB     r0,[r0,#0x29]
        0x000030b0:    2801        .(      CMP      r0,#1
        0x000030b2:    d107        ..      BNE      0x30c4 ; uart_rec_data_avail_isr + 164
        0x000030b4:    bf00        ..      NOP      
        0x000030b6:    f000f92d    ..-.    BL       uart_tfnf_getf ; 0x3314
        0x000030ba:    2800        .(      CMP      r0,#0
        0x000030bc:    d0fb        ..      BEQ      0x30b6 ; uart_rec_data_avail_isr + 150
        0x000030be:    4628        (F      MOV      r0,r5
        0x000030c0:    f000f976    ..v.    BL       uart_thr_set ; 0x33b0
        0x000030c4:    481a        .H      LDR      r0,[pc,#104] ; [0x3130] = 0x20000484
        0x000030c6:    6980        .i      LDR      r0,[r0,#0x18]
        0x000030c8:    7005        .p      STRB     r5,[r0,#0]
        0x000030ca:    4819        .H      LDR      r0,[pc,#100] ; [0x3130] = 0x20000484
        0x000030cc:    6980        .i      LDR      r0,[r0,#0x18]
        0x000030ce:    1c40        @.      ADDS     r0,r0,#1
        0x000030d0:    4917        .I      LDR      r1,[pc,#92] ; [0x3130] = 0x20000484
        0x000030d2:    6188        .a      STR      r0,[r1,#0x18]
        0x000030d4:    4608        .F      MOV      r0,r1
        0x000030d6:    f890002b    ..+.    LDRB     r0,[r0,#0x2b]
        0x000030da:    42a8        .B      CMP      r0,r5
        0x000030dc:    d11d        ..      BNE      0x311a ; uart_rec_data_avail_isr + 250
        0x000030de:    2000        .       MOVS     r0,#0
        0x000030e0:    f7ffff7a    ..z.    BL       uart_erbfi_setf ; 0x2fd8
        0x000030e4:    4812        .H      LDR      r0,[pc,#72] ; [0x3130] = 0x20000484
        0x000030e6:    6a04        .j      LDR      r4,[r0,#0x20]
        0x000030e8:    6a46        Fj      LDR      r6,[r0,#0x24]
        0x000030ea:    b184        ..      CBZ      r4,0x310e ; uart_rec_data_avail_isr + 238
        0x000030ec:    2100        .!      MOVS     r1,#0
        0x000030ee:    6201        .b      STR      r1,[r0,#0x20]
        0x000030f0:    6241        Ab      STR      r1,[r0,#0x24]
        0x000030f2:    f8900028    ..(.    LDRB     r0,[r0,#0x28]
        0x000030f6:    b910        ..      CBNZ     r0,0x30fe ; uart_rec_data_avail_isr + 222
        0x000030f8:    4630        0F      MOV      r0,r6
        0x000030fa:    47a0        .G      BLX      r4
        0x000030fc:    e00c        ..      B        0x3118 ; uart_rec_data_avail_isr + 248
        0x000030fe:    2000        .       MOVS     r0,#0
        0x00003100:    490b        .I      LDR      r1,[pc,#44] ; [0x3130] = 0x20000484
        0x00003102:    f8810028    ..(.    STRB     r0,[r1,#0x28]
        0x00003106:    2101        .!      MOVS     r1,#1
        0x00003108:    4630        0F      MOV      r0,r6
        0x0000310a:    47a0        .G      BLX      r4
        0x0000310c:    e004        ..      B        0x3118 ; uart_rec_data_avail_isr + 248
        0x0000310e:    2263        c"      MOVS     r2,#0x63
        0x00003110:    a108        ..      ADR      r1,{pc}+0x24 ; 0x3134
        0x00003112:    a010        ..      ADR      r0,{pc}+0x42 ; 0x3154
        0x00003114:    f7fffe10    ....    BL       __aeabi_assert ; 0x2d38
        0x00003118:    e007        ..      B        0x312a ; uart_rec_data_avail_isr + 266
        0x0000311a:    bf00        ..      NOP      
        0x0000311c:    480e        .H      LDR      r0,[pc,#56] ; [0x3158] = 0x40003000
        0x0000311e:    6940        @i      LDR      r0,[r0,#0x14]
        0x00003120:    f0000001    ....    AND      r0,r0,#1
        0x00003124:    2800        .(      CMP      r0,#0
        0x00003126:    f47faf7f    ....    BNE      0x3028 ; uart_rec_data_avail_isr + 8
        0x0000312a:    bf00        ..      NOP      
        0x0000312c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000312e:    0000        ..      DCW    0
        0x00003130:    20000484    ...     DCD    536872068
        0x00003134:    735c2e2e    ..\s    DCD    1935420974
        0x00003138:    735c6b64    dk\s    DCD    1935436644
        0x0000313c:    735c6372    rc\s    DCD    1935434610
        0x00003140:    645c636f    oc\d    DCD    1683776367
        0x00003144:    65766972    rive    DCD    1702259058
        0x00003148:    61755c72    r\ua    DCD    1635081330
        0x0000314c:    632e7472    rt.c    DCD    1663988850
        0x00003150:    00000000    ....    DCD    0
        0x00003154:    00000030    0...    DCD    48
        0x00003158:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_rec_error_isr
    uart_rec_error_isr
        0x0000315c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000315e:    2400        .$      MOVS     r4,#0
        0x00003160:    2600        .&      MOVS     r6,#0
        0x00003162:    bf00        ..      NOP      
        0x00003164:    4810        .H      LDR      r0,[pc,#64] ; [0x31a8] = 0x40003000
        0x00003166:    6940        @i      LDR      r0,[r0,#0x14]
        0x00003168:    b2c5        ..      UXTB     r5,r0
        0x0000316a:    f0050002    ....    AND      r0,r5,#2
        0x0000316e:    b198        ..      CBZ      r0,0x3198 ; uart_rec_error_isr + 60
        0x00003170:    e003        ..      B        0x317a ; uart_rec_error_isr + 30
        0x00003172:    bf00        ..      NOP      
        0x00003174:    480c        .H      LDR      r0,[pc,#48] ; [0x31a8] = 0x40003000
        0x00003176:    6800        .h      LDR      r0,[r0,#0]
        0x00003178:    bf00        ..      NOP      
        0x0000317a:    bf00        ..      NOP      
        0x0000317c:    480a        .H      LDR      r0,[pc,#40] ; [0x31a8] = 0x40003000
        0x0000317e:    6940        @i      LDR      r0,[r0,#0x14]
        0x00003180:    f0000001    ....    AND      r0,r0,#1
        0x00003184:    2800        .(      CMP      r0,#0
        0x00003186:    d1f4        ..      BNE      0x3172 ; uart_rec_error_isr + 22
        0x00003188:    b134        4.      CBZ      r4,0x3198 ; uart_rec_error_isr + 60
        0x0000318a:    2100        .!      MOVS     r1,#0
        0x0000318c:    4807        .H      LDR      r0,[pc,#28] ; [0x31ac] = 0x20000484
        0x0000318e:    6201        .b      STR      r1,[r0,#0x20]
        0x00003190:    6241        Ab      STR      r1,[r0,#0x24]
        0x00003192:    2101        .!      MOVS     r1,#1
        0x00003194:    4630        0F      MOV      r0,r6
        0x00003196:    47a0        .G      BLX      r4
        0x00003198:    f0050008    ....    AND      r0,r5,#8
        0x0000319c:    b118        ..      CBZ      r0,0x31a6 ; uart_rec_error_isr + 74
        0x0000319e:    2001        .       MOVS     r0,#1
        0x000031a0:    4902        .I      LDR      r1,[pc,#8] ; [0x31ac] = 0x20000484
        0x000031a2:    f8810028    ..(.    STRB     r0,[r1,#0x28]
        0x000031a6:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000031a8:    40003000    .0.@    DCD    1073754112
        0x000031ac:    20000484    ...     DCD    536872068
    $t
    i.uart_rx_finish
    uart_rx_finish
        0x000031b0:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000031b4:    b109        ..      CBZ      r1,0x31ba ; uart_rx_finish + 10
        0x000031b6:    f7fdf8eb    ....    BL       abort ; 0x390
        0x000031ba:    4854        TH      LDR      r0,[pc,#336] ; [0x330c] = 0x20000444
        0x000031bc:    4d54        TM      LDR      r5,[pc,#336] ; [0x3310] = 0x20000040
        0x000031be:    4b53        SK      LDR      r3,[pc,#332] ; [0x330c] = 0x20000444
        0x000031c0:    7802        .x      LDRB     r2,[r0,#0]
        0x000031c2:    712a        *q      STRB     r2,[r5,#4]
        0x000031c4:    7840        @x      LDRB     r0,[r0,#1]
        0x000031c6:    70e8        .p      STRB     r0,[r5,#3]
        0x000031c8:    78d9        .x      LDRB     r1,[r3,#3]
        0x000031ca:    789b        .x      LDRB     r3,[r3,#2]
        0x000031cc:    2acd        .*      CMP      r2,#0xcd
        0x000031ce:    d002        ..      BEQ      0x31d6 ; uart_rx_finish + 38
        0x000031d0:    2aeb        .*      CMP      r2,#0xeb
        0x000031d2:    d13d        =.      BNE      0x3250 ; uart_rx_finish + 160
        0x000031d4:    e091        ..      B        0x32fa ; uart_rx_finish + 330
        0x000031d6:    494d        MI      LDR      r1,[pc,#308] ; [0x330c] = 0x20000444
        0x000031d8:    4e4d        MN      LDR      r6,[pc,#308] ; [0x3310] = 0x20000040
        0x000031da:    788a        .x      LDRB     r2,[r1,#2]
        0x000031dc:    78cb        .x      LDRB     r3,[r1,#3]
        0x000031de:    7a8f        .z      LDRB     r7,[r1,#0xa]
        0x000031e0:    eb032202    ..."    ADD      r2,r3,r2,LSL #8
        0x000031e4:    b294        ..      UXTH     r4,r2
        0x000031e6:    790a        .y      LDRB     r2,[r1,#4]
        0x000031e8:    3680        .6      ADDS     r6,r6,#0x80
        0x000031ea:    0413        ..      LSLS     r3,r2,#16
        0x000031ec:    794a        Jy      LDRB     r2,[r1,#5]
        0x000031ee:    eb032202    ..."    ADD      r2,r3,r2,LSL #8
        0x000031f2:    798b        .y      LDRB     r3,[r1,#6]
        0x000031f4:    4413        .D      ADD      r3,r3,r2
        0x000031f6:    79ca        .y      LDRB     r2,[r1,#7]
        0x000031f8:    eb076c02    ...l    ADD      r12,r7,r2,LSL #24
        0x000031fc:    7a0a        .z      LDRB     r2,[r1,#8]
        0x000031fe:    0417        ..      LSLS     r7,r2,#16
        0x00003200:    7a4a        Jz      LDRB     r2,[r1,#9]
        0x00003202:    eb072202    ..."    ADD      r2,r7,r2,LSL #8
        0x00003206:    7b0f        .{      LDRB     r7,[r1,#0xc]
        0x00003208:    7ac9        .z      LDRB     r1,[r1,#0xb]
        0x0000320a:    4462        bD      ADD      r2,r2,r12
        0x0000320c:    eb072101    ...!    ADD      r1,r7,r1,LSL #8
        0x00003210:    b289        ..      UXTH     r1,r1
        0x00003212:    b1f0        ..      CBZ      r0,0x3252 ; uart_rx_finish + 162
        0x00003214:    2801        .(      CMP      r0,#1
        0x00003216:    d021        !.      BEQ      0x325c ; uart_rx_finish + 172
        0x00003218:    2802        .(      CMP      r0,#2
        0x0000321a:    d024        $.      BEQ      0x3266 ; uart_rx_finish + 182
        0x0000321c:    2803        .(      CMP      r0,#3
        0x0000321e:    d027        '.      BEQ      0x3270 ; uart_rx_finish + 192
        0x00003220:    2804        .(      CMP      r0,#4
        0x00003222:    d02a        *.      BEQ      0x327a ; uart_rx_finish + 202
        0x00003224:    2805        .(      CMP      r0,#5
        0x00003226:    d02d        -.      BEQ      0x3284 ; uart_rx_finish + 212
        0x00003228:    2806        .(      CMP      r0,#6
        0x0000322a:    d030        0.      BEQ      0x328e ; uart_rx_finish + 222
        0x0000322c:    2807        .(      CMP      r0,#7
        0x0000322e:    d033        3.      BEQ      0x3298 ; uart_rx_finish + 232
        0x00003230:    2808        .(      CMP      r0,#8
        0x00003232:    d036        6.      BEQ      0x32a2 ; uart_rx_finish + 242
        0x00003234:    2809        .(      CMP      r0,#9
        0x00003236:    d039        9.      BEQ      0x32ac ; uart_rx_finish + 252
        0x00003238:    280a        .(      CMP      r0,#0xa
        0x0000323a:    d03c        <.      BEQ      0x32b6 ; uart_rx_finish + 262
        0x0000323c:    280b        .(      CMP      r0,#0xb
        0x0000323e:    d03f        ?.      BEQ      0x32c0 ; uart_rx_finish + 272
        0x00003240:    280c        .(      CMP      r0,#0xc
        0x00003242:    d042        B.      BEQ      0x32ca ; uart_rx_finish + 282
        0x00003244:    280d        .(      CMP      r0,#0xd
        0x00003246:    d046        F.      BEQ      0x32d6 ; uart_rx_finish + 294
        0x00003248:    280e        .(      CMP      r0,#0xe
        0x0000324a:    d04a        J.      BEQ      0x32e2 ; uart_rx_finish + 306
        0x0000324c:    280f        .(      CMP      r0,#0xf
        0x0000324e:    d04e        N.      BEQ      0x32ee ; uart_rx_finish + 318
        0x00003250:    e056        V.      B        0x3300 ; uart_rx_finish + 336
        0x00003252:    812c        ,.      STRH     r4,[r5,#8]
        0x00003254:    64ab        .d      STR      r3,[r5,#0x48]
        0x00003256:    60b2        .`      STR      r2,[r6,#8]
        0x00003258:    8529        ).      STRH     r1,[r5,#0x28]
        0x0000325a:    e051        Q.      B        0x3300 ; uart_rx_finish + 336
        0x0000325c:    816c        l.      STRH     r4,[r5,#0xa]
        0x0000325e:    64eb        .d      STR      r3,[r5,#0x4c]
        0x00003260:    60f2        .`      STR      r2,[r6,#0xc]
        0x00003262:    8569        i.      STRH     r1,[r5,#0x2a]
        0x00003264:    e04c        L.      B        0x3300 ; uart_rx_finish + 336
        0x00003266:    81ac        ..      STRH     r4,[r5,#0xc]
        0x00003268:    652b        +e      STR      r3,[r5,#0x50]
        0x0000326a:    6132        2a      STR      r2,[r6,#0x10]
        0x0000326c:    85a9        ..      STRH     r1,[r5,#0x2c]
        0x0000326e:    e047        G.      B        0x3300 ; uart_rx_finish + 336
        0x00003270:    81ec        ..      STRH     r4,[r5,#0xe]
        0x00003272:    656b        ke      STR      r3,[r5,#0x54]
        0x00003274:    6172        ra      STR      r2,[r6,#0x14]
        0x00003276:    85e9        ..      STRH     r1,[r5,#0x2e]
        0x00003278:    e042        B.      B        0x3300 ; uart_rx_finish + 336
        0x0000327a:    822c        ,.      STRH     r4,[r5,#0x10]
        0x0000327c:    65ab        .e      STR      r3,[r5,#0x58]
        0x0000327e:    61b2        .a      STR      r2,[r6,#0x18]
        0x00003280:    8629        ).      STRH     r1,[r5,#0x30]
        0x00003282:    e03d        =.      B        0x3300 ; uart_rx_finish + 336
        0x00003284:    826c        l.      STRH     r4,[r5,#0x12]
        0x00003286:    65eb        .e      STR      r3,[r5,#0x5c]
        0x00003288:    61f2        .a      STR      r2,[r6,#0x1c]
        0x0000328a:    8669        i.      STRH     r1,[r5,#0x32]
        0x0000328c:    e038        8.      B        0x3300 ; uart_rx_finish + 336
        0x0000328e:    82ac        ..      STRH     r4,[r5,#0x14]
        0x00003290:    662b        +f      STR      r3,[r5,#0x60]
        0x00003292:    6232        2b      STR      r2,[r6,#0x20]
        0x00003294:    86a9        ..      STRH     r1,[r5,#0x34]
        0x00003296:    e033        3.      B        0x3300 ; uart_rx_finish + 336
        0x00003298:    82ec        ..      STRH     r4,[r5,#0x16]
        0x0000329a:    666b        kf      STR      r3,[r5,#0x64]
        0x0000329c:    6272        rb      STR      r2,[r6,#0x24]
        0x0000329e:    86e9        ..      STRH     r1,[r5,#0x36]
        0x000032a0:    e02e        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032a2:    832c        ,.      STRH     r4,[r5,#0x18]
        0x000032a4:    66ab        .f      STR      r3,[r5,#0x68]
        0x000032a6:    62b2        .b      STR      r2,[r6,#0x28]
        0x000032a8:    8729        ).      STRH     r1,[r5,#0x38]
        0x000032aa:    e029        ).      B        0x3300 ; uart_rx_finish + 336
        0x000032ac:    836c        l.      STRH     r4,[r5,#0x1a]
        0x000032ae:    66eb        .f      STR      r3,[r5,#0x6c]
        0x000032b0:    62f2        .b      STR      r2,[r6,#0x2c]
        0x000032b2:    8769        i.      STRH     r1,[r5,#0x3a]
        0x000032b4:    e024        $.      B        0x3300 ; uart_rx_finish + 336
        0x000032b6:    83ac        ..      STRH     r4,[r5,#0x1c]
        0x000032b8:    672b        +g      STR      r3,[r5,#0x70]
        0x000032ba:    6332        2c      STR      r2,[r6,#0x30]
        0x000032bc:    87a9        ..      STRH     r1,[r5,#0x3c]
        0x000032be:    e01f        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032c0:    83ec        ..      STRH     r4,[r5,#0x1e]
        0x000032c2:    676b        kg      STR      r3,[r5,#0x74]
        0x000032c4:    6372        rc      STR      r2,[r6,#0x34]
        0x000032c6:    87e9        ..      STRH     r1,[r5,#0x3e]
        0x000032c8:    e01a        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032ca:    842c        ,.      STRH     r4,[r5,#0x20]
        0x000032cc:    67ab        .g      STR      r3,[r5,#0x78]
        0x000032ce:    63b2        .c      STR      r2,[r6,#0x38]
        0x000032d0:    f8a51040    ..@.    STRH     r1,[r5,#0x40]
        0x000032d4:    e014        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032d6:    846c        l.      STRH     r4,[r5,#0x22]
        0x000032d8:    67eb        .g      STR      r3,[r5,#0x7c]
        0x000032da:    63f2        .c      STR      r2,[r6,#0x3c]
        0x000032dc:    f8a51042    ..B.    STRH     r1,[r5,#0x42]
        0x000032e0:    e00e        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032e2:    84ac        ..      STRH     r4,[r5,#0x24]
        0x000032e4:    6033        3`      STR      r3,[r6,#0]
        0x000032e6:    6432        2d      STR      r2,[r6,#0x40]
        0x000032e8:    f8a51044    ..D.    STRH     r1,[r5,#0x44]
        0x000032ec:    e008        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032ee:    84ec        ..      STRH     r4,[r5,#0x26]
        0x000032f0:    6073        s`      STR      r3,[r6,#4]
        0x000032f2:    6472        rd      STR      r2,[r6,#0x44]
        0x000032f4:    f8a51046    ..F.    STRH     r1,[r5,#0x46]
        0x000032f8:    e002        ..      B        0x3300 ; uart_rx_finish + 336
        0x000032fa:    7028        (p      STRB     r0,[r5,#0]
        0x000032fc:    706b        kp      STRB     r3,[r5,#1]
        0x000032fe:    70a9        .p      STRB     r1,[r5,#2]
        0x00003300:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x00003304:    210d        .!      MOVS     r1,#0xd
        0x00003306:    4801        .H      LDR      r0,[pc,#4] ; [0x330c] = 0x20000444
        0x00003308:    f7fdb84d    ..M.    B        __aeabi_memclr ; 0x3a6
    $d
        0x0000330c:    20000444    D..     DCD    536872004
        0x00003310:    20000040    @..     DCD    536870976
    $t
    i.uart_tfnf_getf
    uart_tfnf_getf
        0x00003314:    4802        .H      LDR      r0,[pc,#8] ; [0x3320] = 0x40003000
        0x00003316:    6fc0        .o      LDR      r0,[r0,#0x7c]
        0x00003318:    f3c00040    ..@.    UBFX     r0,r0,#1,#1
        0x0000331c:    4770        pG      BX       lr
    $d
        0x0000331e:    0000        ..      DCW    0
        0x00003320:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_thr_empty_isr
    uart_thr_empty_isr
        0x00003324:    b570        p.      PUSH     {r4-r6,lr}
        0x00003326:    2400        .$      MOVS     r4,#0
        0x00003328:    2500        .%      MOVS     r5,#0
        0x0000332a:    e026        &.      B        0x337a ; uart_thr_empty_isr + 86
        0x0000332c:    4916        .I      LDR      r1,[pc,#88] ; [0x3388] = 0x20000484
        0x0000332e:    6849        Ih      LDR      r1,[r1,#4]
        0x00003330:    7808        .x      LDRB     r0,[r1,#0]
        0x00003332:    f000f83d    ..=.    BL       uart_thr_set ; 0x33b0
        0x00003336:    4814        .H      LDR      r0,[pc,#80] ; [0x3388] = 0x20000484
        0x00003338:    6800        .h      LDR      r0,[r0,#0]
        0x0000333a:    1e40        @.      SUBS     r0,r0,#1
        0x0000333c:    4912        .I      LDR      r1,[pc,#72] ; [0x3388] = 0x20000484
        0x0000333e:    6008        .`      STR      r0,[r1,#0]
        0x00003340:    4608        .F      MOV      r0,r1
        0x00003342:    6840        @h      LDR      r0,[r0,#4]
        0x00003344:    1c40        @.      ADDS     r0,r0,#1
        0x00003346:    6048        H`      STR      r0,[r1,#4]
        0x00003348:    4608        .F      MOV      r0,r1
        0x0000334a:    6800        .h      LDR      r0,[r0,#0]
        0x0000334c:    b9a8        ..      CBNZ     r0,0x337a ; uart_thr_empty_isr + 86
        0x0000334e:    2000        .       MOVS     r0,#0
        0x00003350:    6048        H`      STR      r0,[r1,#4]
        0x00003352:    f7fffe4b    ..K.    BL       uart_etbei_setf ; 0x2fec
        0x00003356:    480c        .H      LDR      r0,[pc,#48] ; [0x3388] = 0x20000484
        0x00003358:    68c4        .h      LDR      r4,[r0,#0xc]
        0x0000335a:    6905        .i      LDR      r5,[r0,#0x10]
        0x0000335c:    b13c        <.      CBZ      r4,0x336e ; uart_thr_empty_isr + 74
        0x0000335e:    2000        .       MOVS     r0,#0
        0x00003360:    4909        .I      LDR      r1,[pc,#36] ; [0x3388] = 0x20000484
        0x00003362:    60c8        .`      STR      r0,[r1,#0xc]
        0x00003364:    6108        .a      STR      r0,[r1,#0x10]
        0x00003366:    2100        .!      MOVS     r1,#0
        0x00003368:    4628        (F      MOV      r0,r5
        0x0000336a:    47a0        .G      BLX      r4
        0x0000336c:    e004        ..      B        0x3378 ; uart_thr_empty_isr + 84
        0x0000336e:    22c4        ."      MOVS     r2,#0xc4
        0x00003370:    a106        ..      ADR      r1,{pc}+0x1c ; 0x338c
        0x00003372:    a00e        ..      ADR      r0,{pc}+0x3a ; 0x33ac
        0x00003374:    f7fffce0    ....    BL       __aeabi_assert ; 0x2d38
        0x00003378:    e003        ..      B        0x3382 ; uart_thr_empty_isr + 94
        0x0000337a:    f7ffffcb    ....    BL       uart_tfnf_getf ; 0x3314
        0x0000337e:    2801        .(      CMP      r0,#1
        0x00003380:    d0d4        ..      BEQ      0x332c ; uart_thr_empty_isr + 8
        0x00003382:    bf00        ..      NOP      
        0x00003384:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00003386:    0000        ..      DCW    0
        0x00003388:    20000484    ...     DCD    536872068
        0x0000338c:    735c2e2e    ..\s    DCD    1935420974
        0x00003390:    735c6b64    dk\s    DCD    1935436644
        0x00003394:    735c6372    rc\s    DCD    1935434610
        0x00003398:    645c636f    oc\d    DCD    1683776367
        0x0000339c:    65766972    rive    DCD    1702259058
        0x000033a0:    61755c72    r\ua    DCD    1635081330
        0x000033a4:    632e7472    rt.c    DCD    1663988850
        0x000033a8:    00000000    ....    DCD    0
        0x000033ac:    00000030    0...    DCD    48
    $t
    i.uart_thr_set
    uart_thr_set
        0x000033b0:    4901        .I      LDR      r1,[pc,#4] ; [0x33b8] = 0x40003000
        0x000033b2:    6008        .`      STR      r0,[r1,#0]
        0x000033b4:    4770        pG      BX       lr
    $d
        0x000033b6:    0000        ..      DCW    0
        0x000033b8:    40003000    .0.@    DCD    1073754112
    $t
    x$fpl$fadd
    __aeabi_fadd
    _fadd
        0x000033bc:    ea900f01    ....    TEQ      r0,r1
        0x000033c0:    bf48        H.      IT       MI
        0x000033c2:    f0814100    ...A    EORMI    r1,r1,#0x80000000
        0x000033c6:    f1008220    .. .    BMI.W    _fsub1 ; 0x380a
    _fadd1
        0x000033ca:    1a42        B.      SUBS     r2,r0,r1
        0x000033cc:    bf3c        <.      ITT      CC
        0x000033ce:    1a80        ..      SUBCC    r0,r0,r2
        0x000033d0:    1889        ..      ADDCC    r1,r1,r2
        0x000033d2:    ea4f52d0    O..R    LSR      r2,r0,#23
        0x000033d6:    f04f4c7f    O..L    MOV      r12,#0xff000000
        0x000033da:    ea1c0f41    ..A.    TST      r12,r1,LSL #1
        0x000033de:    eba253d1    ...S    SUB      r3,r2,r1,LSR #23
        0x000033e2:    bf18        ..      IT       NE
        0x000033e4:    ea9c6f02    ...o    TEQNE    r12,r2,LSL #24
        0x000033e8:    f000803b    ..;.    BEQ.W    0x3462 ; _fadd1 + 152
        0x000033ec:    f04f4c00    O..L    MOV      r12,#0x80000000
        0x000033f0:    ea4c2000    L..     ORR      r0,r12,r0,LSL #8
        0x000033f4:    ea4c2101    L..!    ORR      r1,r12,r1,LSL #8
        0x000033f8:    fa21fc03    !...    LSR      r12,r1,r3
        0x000033fc:    eb100c0c    ....    ADDS     r12,r0,r12
        0x00003400:    d21e        ..      BCS      0x3440 ; _fadd1 + 118
        0x00003402:    f10232ff    ...2    ADD      r2,r2,#0xffffffff
        0x00003406:    ea5f201c    _..     LSRS     r0,r12,#8
        0x0000340a:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x0000340e:    bf38        8.      IT       CC
        0x00003410:    4770        pG      BXCC     lr
        0x00003412:    f01c0f7f    ....    TST      r12,#0x7f
        0x00003416:    ea4f0c40    O.@.    LSL      r12,r0,#1
        0x0000341a:    bf18        ..      IT       NE
        0x0000341c:    f1bc4f7f    ...O    CMPNE    r12,#0xff000000
        0x00003420:    bf38        8.      IT       CC
        0x00003422:    4770        pG      BXCC     lr
        0x00003424:    f1c30320    .. .    RSB      r3,r3,#0x20
        0x00003428:    4099        .@      LSLS     r1,r1,r3
        0x0000342a:    bf08        ..      IT       EQ
        0x0000342c:    f0200001     ...    BICEQ    r0,r0,#1
        0x00003430:    f1bc4f7f    ...O    CMP      r12,#0xff000000
        0x00003434:    bf38        8.      IT       CC
        0x00003436:    4770        pG      BXCC     lr
        0x00003438:    f1a040c0    ...@    SUB      r0,r0,#0x60000000
        0x0000343c:    f000b9d9    ....    B.W      __fpl_fretinf ; 0x37f2
        0x00003440:    ea4f003c    O.<.    RRX      r0,r12
        0x00003444:    0a00        ..      LSRS     r0,r0,#8
        0x00003446:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x0000344a:    bf28        (.      IT       CS
        0x0000344c:    f01c0fff    ....    TSTCS    r12,#0xff
        0x00003450:    ea4f0c40    O.@.    LSL      r12,r0,#1
        0x00003454:    d0e6        ..      BEQ      0x3424 ; _fadd1 + 90
        0x00003456:    bf18        ..      IT       NE
        0x00003458:    f1bc4f7f    ...O    CMPNE    r12,#0xff000000
        0x0000345c:    bf38        8.      IT       CC
        0x0000345e:    4770        pG      BXCC     lr
        0x00003460:    e7ea        ..      B        0x3438 ; _fadd1 + 110
        0x00003462:    ea9c6f02    ...o    TEQ      r12,r2,LSL #24
        0x00003466:    d005        ..      BEQ      0x3474 ; _fadd1 + 170
        0x00003468:    ea100f5c    ..\.    TST      r0,r12,LSR #1
        0x0000346c:    bf08        ..      IT       EQ
        0x0000346e:    f0004000    ...@    ANDEQ    r0,r0,#0x80000000
        0x00003472:    4770        pG      BX       lr
        0x00003474:    b510        ..      PUSH     {r4,lr}
        0x00003476:    f000f976    ..v.    BL       __fpl_fnaninf ; 0x3766
        0x0000347a:    bf00        ..      NOP      
    $d
        0x0000347c:    3ebefb64    d..>    DCD    1052703588
    $t
    x$fpl$fdiv
    _fdiv1
    __aeabi_fdiv
    _fdiv
        0x00003480:    f44f0c7f    O...    MOV      r12,#0xff0000
        0x00003484:    ea1c12d0    ....    ANDS     r2,r12,r0,LSR #7
        0x00003488:    bf1e        ..      ITTT     NE
        0x0000348a:    ea1c13d1    ....    ANDSNE   r3,r12,r1,LSR #7
        0x0000348e:    ea920f0c    ....    TEQNE    r2,r12
        0x00003492:    ea930f0c    ....    TEQNE    r3,r12
        0x00003496:    f0008085    ....    BEQ.W    0x35a4 ; _fdiv1 + 292
        0x0000349a:    ea900f01    ....    TEQ      r0,r1
        0x0000349e:    bf48        H.      IT       MI
        0x000034a0:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x000034a4:    f4400c00    @...    ORR      r12,r0,#0x800000
        0x000034a8:    f4410000    A...    ORR      r0,r1,#0x800000
        0x000034ac:    f02c417f    ,..A    BIC      r1,r12,#0xff000000
        0x000034b0:    f020407f     ..@    BIC      r0,r0,#0xff000000
        0x000034b4:    b500        ..      PUSH     {lr}
        0x000034b6:    4281        .B      CMP      r1,r0
        0x000034b8:    eba20203    ....    SUB      r2,r2,r3
        0x000034bc:    f20f1c08    ....    ADR.W    r12,{pc}+0x10c ; 0x35c8
        0x000034c0:    ebac4e50    ..PN    SUB      lr,r12,r0,LSR #17
        0x000034c4:    f1c00000    ....    RSB      r0,r0,#0
        0x000034c8:    f89ee000    ....    LDRB     lr,[lr,#0]
        0x000034cc:    ea4f0e4e    O.N.    LSL      lr,lr,#1
        0x000034d0:    fb00fc0e    ....    MUL      r12,r0,lr
        0x000034d4:    bf38        8.      IT       CC
        0x000034d6:    0049        I.      LSLCC    r1,r1,#1
        0x000034d8:    ea4f1c2c    O.,.    ASR      r12,r12,#4
        0x000034dc:    f50202fa    ....    ADD      r2,r2,#0x7d0000
        0x000034e0:    fb0cf30e    ....    MUL      r3,r12,lr
        0x000034e4:    ea4f1ece    O...    LSL      lr,lr,#7
        0x000034e8:    ea4f2c11    O..,    LSR      r12,r1,#8
        0x000034ec:    ea4f21c1    O..!    LSL      r1,r1,#11
        0x000034f0:    eb0e5e63    ..c^    ADD      lr,lr,r3,ASR #21
        0x000034f4:    eb424222    B."B    ADC      r2,r2,r2,ASR #16
        0x000034f8:    fb0efc0c    ....    MUL      r12,lr,r12
        0x000034fc:    ea4f531c    O..S    LSR      r3,r12,#20
        0x00003500:    fb001103    ....    MLA      r1,r0,r3,r1
        0x00003504:    ea4f2c11    O..,    LSR      r12,r1,#8
        0x00003508:    ea4f3101    O..1    LSL      r1,r1,#12
        0x0000350c:    fb0efc0c    ....    MUL      r12,lr,r12
        0x00003510:    ea4f4cdc    O..L    LSR      r12,r12,#19
        0x00003514:    fb00110c    ....    MLA      r1,r0,r12,r1
        0x00003518:    42c1        .B      CMN      r1,r0
        0x0000351a:    bf28        (.      IT       CS
        0x0000351c:    1809        ..      ADDCS    r1,r1,r0
        0x0000351e:    eb4c3303    L..3    ADC      r3,r12,r3,LSL #12
        0x00003522:    f85deb04    ]...    POP      {lr}
        0x00003526:    eb100141    ..A.    ADDS     r1,r0,r1,LSL #1
        0x0000352a:    eb4350c2    C..P    ADC      r0,r3,r2,LSL #23
        0x0000352e:    f5b20f7c    ..|.    CMP      r2,#0xfc0000
        0x00003532:    bf38        8.      IT       CC
        0x00003534:    4770        pG      BXCC     lr
        0x00003536:    d529        ).      BPL      0x358c ; _fdiv1 + 268
        0x00003538:    f0120ff0    ....    TST      r2,#0xf0
        0x0000353c:    bf1c        ..      ITT      NE
        0x0000353e:    f10040c0    ...@    ADDNE    r0,r0,#0x60000000
        0x00003542:    f0004000    ...@    ANDNE    r0,r0,#0x80000000
        0x00003546:    4770        pG      BX       lr
    $d
        0x00003548:    83828100    ....    DCD    2206368000
        0x0000354c:    87868584    ....    DCD    2273740164
        0x00003550:    8c8b8988    ....    DCD    2357954952
        0x00003554:    918f8e8d    ....    DCD    2442104461
        0x00003558:    96959392    ....    DCD    2526385042
        0x0000355c:    9c9a9997    ....    DCD    2627377559
        0x00003560:    a2a09f9d    ....    DCD    2728435613
        0x00003564:    a8a7a5a3    ....    DCD    2829559203
        0x00003568:    b0aeacaa    ....    DCD    2964237482
        0x0000356c:    b7b5b3b2    ....    DCD    3082138546
        0x00003570:    c0bebcb9    ....    DCD    3233725625
        0x00003574:    c9c7c5c2    ....    DCD    3385312706
        0x00003578:    d4d1cecc    ....    DCD    3570519756
        0x0000357c:    dfdcd9d7    ....    DCD    3755792855
        0x00003580:    ece9e6e2    ....    DCD    3974751970
        0x00003584:    faf7f3f0    ....    DCD    4210553840
        0x00003588:    000000fe    ....    DCD    254
    $t
        0x0000358c:    ea4f0c40    O.@.    LSL      r12,r0,#1
        0x00003590:    f10c7c80    ...|    ADD      r12,r12,#0x1000000
        0x00003594:    f1bc4f7e    ..~O    CMP      r12,#0xfe000000
        0x00003598:    bf28        (.      IT       CS
        0x0000359a:    4770        pG      BXCS     lr
        0x0000359c:    f1b040c0    ...@    SUBS     r0,r0,#0x60000000
        0x000035a0:    f000b927    ..'.    B.W      __fpl_fretinf ; 0x37f2
        0x000035a4:    ea900f01    ....    TEQ      r0,r1
        0x000035a8:    ea0c13d1    ....    AND      r3,r12,r1,LSR #7
        0x000035ac:    bf48        H.      IT       MI
        0x000035ae:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x000035b2:    4562        bE      CMP      r2,r12
        0x000035b4:    bf38        8.      IT       CC
        0x000035b6:    4563        cE      CMPCC    r3,r12
        0x000035b8:    d207        ..      BCS      0x35ca ; _fdiv1 + 330
        0x000035ba:    f4130f7f    ....    TST      r3,#0xff0000
        0x000035be:    d016        ..      BEQ      0x35ee ; _fdiv1 + 366
        0x000035c0:    ea800001    ....    EOR      r0,r0,r1
        0x000035c4:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x000035c8:    4770        pG      BX       lr
        0x000035ca:    b510        ..      PUSH     {r4,lr}
        0x000035cc:    f000f8cb    ....    BL       __fpl_fnaninf ; 0x3766
    $d
        0x000035d0:    3efc7e09    .~.>    DCD    1056734729
    $t
        0x000035d4:    f000b805    ....    B.W      0x35e2 ; _fdiv1 + 354
        0x000035d8:    ea800001    ....    EOR      r0,r0,r1
        0x000035dc:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x000035e0:    4770        pG      BX       lr
        0x000035e2:    ea800001    ....    EOR      r0,r0,r1
        0x000035e6:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x000035ea:    f000b902    ....    B.W      __fpl_fretinf ; 0x37f2
        0x000035ee:    f4120f7f    ....    TST      r2,#0xff0000
        0x000035f2:    bf04        ..      ITT      EQ
        0x000035f4:    4802        .H      LDREQ    r0,[pc,#8] ; [0x3600] = 0x7fc00000
        0x000035f6:    4770        pG      BXEQ     lr
        0x000035f8:    ea800001    ....    EOR      r0,r0,r1
        0x000035fc:    f000b8f9    ....    B.W      __fpl_fretinf ; 0x37f2
    $d
        0x00003600:    7fc00000    ....    DCD    2143289344
    $t
    x$fpl$ffix
    __aeabi_f2iz
    _ffix
        0x00003604:    0041        A.      LSLS     r1,r0,#1
        0x00003606:    0e0b        ..      LSRS     r3,r1,#24
        0x00003608:    f1d3029e    ....    RSBS     r2,r3,#0x9e
        0x0000360c:    d908        ..      BLS      0x3620 ; __aeabi_f2iz + 28
        0x0000360e:    f4500300    P...    ORRS     r3,r0,#0x800000
        0x00003612:    ea4f2303    O..#    LSL      r3,r3,#8
        0x00003616:    fa23f002    #...    LSR      r0,r3,r2
        0x0000361a:    bf48        H.      IT       MI
        0x0000361c:    4240        @B      RSBMI    r0,r0,#0
        0x0000361e:    4770        pG      BX       lr
        0x00003620:    b510        ..      PUSH     {r4,lr}
        0x00003622:    f000f8a0    ....    BL       __fpl_fnaninf ; 0x3766
        0x00003626:    bf00        ..      NOP      
    $d
        0x00003628:    80249249    I.$.    DCD    2149880393
    $t
        0x0000362c:    2000        .       MOVS     r0,#0
        0x0000362e:    4770        pG      BX       lr
        0x00003630:    f06f4200    o..B    MVN      r2,#0x80000000
        0x00003634:    ea820020    .. .    EOR      r0,r2,r0,ASR #32
        0x00003638:    4770        pG      BX       lr
        0x0000363a:    0000        ..      MOVS     r0,r0
    x$fpl$ffltu
    __aeabi_ui2f
    _ffltu
        0x0000363c:    fab0f380    ....    CLZ      r3,r0
        0x00003640:    fa10f203    ....    LSLS     r2,r0,r3
        0x00003644:    f1c3039d    ....    RSB      r3,r3,#0x9d
        0x00003648:    d00a        ..      BEQ      0x3660 ; __aeabi_ui2f + 36
        0x0000364a:    05d9        ..      LSLS     r1,r3,#23
        0x0000364c:    eb012012    ...     ADD      r0,r1,r2,LSR #8
        0x00003650:    0653        S.      LSLS     r3,r2,#25
        0x00003652:    bf38        8.      IT       CC
        0x00003654:    4770        pG      BXCC     lr
        0x00003656:    f1000001    ....    ADD      r0,r0,#1
        0x0000365a:    bf08        ..      IT       EQ
        0x0000365c:    f0200001     ...    BICEQ    r0,r0,#1
        0x00003660:    4770        pG      BX       lr
        0x00003662:    0000        ..      MOVS     r0,r0
    x$fpl$fmul
    __aeabi_fmul
    _fmul
        0x00003664:    f44f0c7f    O...    MOV      r12,#0xff0000
        0x00003668:    ea1c12d0    ....    ANDS     r2,r12,r0,LSR #7
        0x0000366c:    bf1e        ..      ITTT     NE
        0x0000366e:    ea1c13d1    ....    ANDSNE   r3,r12,r1,LSR #7
        0x00003672:    ea920f0c    ....    TEQNE    r2,r12
        0x00003676:    ea930f0c    ....    TEQNE    r3,r12
        0x0000367a:    f0008047    ..G.    BEQ.W    0x370c ; __aeabi_fmul + 168
        0x0000367e:    ea900f01    ....    TEQ      r0,r1
        0x00003682:    bf48        H.      IT       MI
        0x00003684:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x00003688:    f04f4c00    O..L    MOV      r12,#0x80000000
        0x0000368c:    ea4c2000    L..     ORR      r0,r12,r0,LSL #8
        0x00003690:    ea4c2101    L..!    ORR      r1,r12,r1,LSL #8
        0x00003694:    eb020203    ....    ADD.W    r2,r2,r3
        0x00003698:    fba01301    ....    UMULL    r1,r3,r0,r1
        0x0000369c:    f5a20200    ....    SUB      r2,r2,#0x800000
        0x000036a0:    2900        .)      CMP      r1,#0
        0x000036a2:    bf18        ..      IT       NE
        0x000036a4:    f0430301    C...    ORRNE    r3,r3,#1
        0x000036a8:    005b        [.      LSLS     r3,r3,#1
        0x000036aa:    bf28        (.      IT       CS
        0x000036ac:    ea4f0333    O.3.    RRXCS    r3,r3
        0x000036b0:    eb424222    B."B    ADC      r2,r2,r2,ASR #16
        0x000036b4:    ea5f2c13    _..,    LSRS     r12,r3,#8
        0x000036b8:    eb4c50c2    L..P    ADC      r0,r12,r2,LSL #23
        0x000036bc:    bf2e        ..      ITEE     CS
        0x000036be:    ebbc6f43    ..Co    CMPCS    r12,r3,LSL #25
        0x000036c2:    f5b20f7c    ..|.    CMPCC    r2,#0xfc0000
        0x000036c6:    4770        pG      BXCC     lr
        0x000036c8:    ea4f6c03    O..l    LSL      r12,r3,#24
        0x000036cc:    f1bc4f00    ...O    CMP      r12,#0x80000000
        0x000036d0:    bf08        ..      IT       EQ
        0x000036d2:    f0200001     ...    BICEQ    r0,r0,#1
        0x000036d6:    f5b20f7c    ..|.    CMP      r2,#0xfc0000
        0x000036da:    bf38        8.      IT       CC
        0x000036dc:    4770        pG      BXCC     lr
        0x000036de:    d50b        ..      BPL      0x36f8 ; __aeabi_fmul + 148
        0x000036e0:    f08202ff    ....    EOR      r2,r2,#0xff
        0x000036e4:    f5123f80    ...?    CMN      r2,#0x10000
        0x000036e8:    bfc8        ..      IT       GT
        0x000036ea:    4770        pG      BXGT     lr
        0x000036ec:    f10040c0    ...@    ADD      r0,r0,#0x60000000
        0x000036f0:    bfd8        ..      IT       LE
        0x000036f2:    f0004000    ...@    ANDLE    r0,r0,#0x80000000
        0x000036f6:    4770        pG      BX       lr
        0x000036f8:    f5000c00    ....    ADD      r12,r0,#0x800000
        0x000036fc:    ea5f0c4c    _.L.    LSLS     r12,r12,#1
        0x00003700:    bf48        H.      IT       MI
        0x00003702:    4770        pG      BXMI     lr
        0x00003704:    f1b040c0    ...@    SUBS     r0,r0,#0x60000000
        0x00003708:    f000b873    ..s.    B.W      __fpl_fretinf ; 0x37f2
        0x0000370c:    ea900f01    ....    TEQ      r0,r1
        0x00003710:    ea0c13d1    ....    AND      r3,r12,r1,LSR #7
        0x00003714:    bf48        H.      IT       MI
        0x00003716:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x0000371a:    4562        bE      CMP      r2,r12
        0x0000371c:    bf38        8.      IT       CC
        0x0000371e:    4563        cE      CMPCC    r3,r12
        0x00003720:    d204        ..      BCS      0x372c ; __aeabi_fmul + 200
        0x00003722:    ea800001    ....    EOR      r0,r0,r1
        0x00003726:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x0000372a:    4770        pG      BX       lr
        0x0000372c:    b510        ..      PUSH     {r4,lr}
        0x0000372e:    f000f81a    ....    BL       __fpl_fnaninf ; 0x3766
        0x00003732:    bf00        ..      NOP      
    $d
        0x00003734:    3e010089    ...>    DCD    1040253065
    $t
        0x00003738:    f000b807    ....    B.W      0x374a ; __aeabi_fmul + 230
        0x0000373c:    f000b809    ....    B.W      0x3752 ; __aeabi_fmul + 238
        0x00003740:    ea5f0c41    _.A.    LSLS     r12,r1,#1
        0x00003744:    ea5f6c1c    _..l    LSRS     r12,r12,#24
        0x00003748:    d008        ..      BEQ      0x375c ; __aeabi_fmul + 248
        0x0000374a:    ea800001    ....    EOR      r0,r0,r1
        0x0000374e:    f000b850    ..P.    B.W      __fpl_fretinf ; 0x37f2
        0x00003752:    ea5f0c40    _.@.    LSLS     r12,r0,#1
        0x00003756:    ea5f6c1c    _..l    LSRS     r12,r12,#24
        0x0000375a:    d1f6        ..      BNE      0x374a ; __aeabi_fmul + 230
        0x0000375c:    f04f4000    O..@    MOV      r0,#0x80000000
        0x00003760:    f5a00080    ....    SUB      r0,r0,#0x400000
        0x00003764:    4770        pG      BX       lr
    x$fpl$fnaninf
    __fpl_fnaninf
        0x00003766:    f10e0e02    ....    ADD      lr,lr,#2
        0x0000376a:    f02e0e03    ....    BIC      lr,lr,#3
        0x0000376e:    f85e4b04    ^..K    LDR      r4,[lr],#4
        0x00003772:    4224        $B      TST      r4,r4
        0x00003774:    d404        ..      BMI      0x3780 ; __fpl_fnaninf + 26
        0x00003776:    ea4f0241    O.A.    LSL      r2,r1,#1
        0x0000377a:    f1b24f7f    ...O    CMP      r2,#0xff000000
        0x0000377e:    d811        ..      BHI      0x37a4 ; __fpl_fnaninf + 62
        0x00003780:    ea4f0340    O.@.    LSL      r3,r0,#1
        0x00003784:    f1b34f7f    ...O    CMP      r3,#0xff000000
        0x00003788:    d80c        ..      BHI      0x37a4 ; __fpl_fnaninf + 62
        0x0000378a:    d10e        ..      BNE      0x37aa ; __fpl_fnaninf + 68
        0x0000378c:    ea4f7cd0    O..|    LSR      r12,r0,#31
        0x00003790:    f1b24f7f    ...O    CMP      r2,#0xff000000
        0x00003794:    eb0c0c4c    ..L.    ADD      r12,r12,r12,LSL #1
        0x00003798:    f10c0c02    ....    ADD      r12,r12,#2
        0x0000379c:    bf08        ..      IT       EQ
        0x0000379e:    eb4c7cd1    L..|    ADCEQ    r12,r12,r1,LSR #31
        0x000037a2:    e004        ..      B        0x37ae ; __fpl_fnaninf + 72
        0x000037a4:    f04f0c08    O...    MOV      r12,#8
        0x000037a8:    e001        ..      B        0x37ae ; __fpl_fnaninf + 72
        0x000037aa:    ea4f7cd1    O..|    LSR      r12,r1,#31
        0x000037ae:    eb0c034c    ..L.    ADD      r3,r12,r12,LSL #1
        0x000037b2:    fa24f403    $...    LSR      r4,r4,r3
        0x000037b6:    f0040407    ....    AND      r4,r4,#7
        0x000037ba:    f1b40c04    ....    SUBS     r12,r4,#4
        0x000037be:    d206        ..      BCS      0x37ce ; __fpl_fnaninf + 104
        0x000037c0:    eb0e0c84    ....    ADD      r12,lr,r4,LSL #2
        0x000037c4:    e8bd4010    ...@    POP      {r4,lr}
        0x000037c8:    f04c0c01    L...    ORR      r12,r12,#1
        0x000037cc:    4760        `G      BX       r12
        0x000037ce:    e8dff00c    ....    TBB      [pc,r12]
    $d
        0x000037d2:    0807        ..      DCW    2055
        0x000037d4:    0202        ..      DCW    514
    $t
        0x000037d6:    f04f4000    O..@    MOV      r0,#0x80000000
        0x000037da:    f5a00080    ....    SUB      r0,r0,#0x400000
        0x000037de:    bd10        ..      POP      {r4,pc}
        0x000037e0:    4608        .F      MOV      r0,r1
        0x000037e2:    0042        B.      LSLS     r2,r0,#1
        0x000037e4:    bf18        ..      IT       NE
        0x000037e6:    f1d27280    ...r    RSBSNE   r2,r2,#0x1000000
        0x000037ea:    bf88        ..      IT       HI
        0x000037ec:    f0004000    ...@    ANDHI    r0,r0,#0x80000000
        0x000037f0:    bd10        ..      POP      {r4,pc}
    x$fpl$fretinf
    __fpl_fretinf
        0x000037f2:    21ff        .!      MOVS     r1,#0xff
        0x000037f4:    ea4150d0    A..P    ORR      r0,r1,r0,LSR #23
        0x000037f8:    05c0        ..      LSLS     r0,r0,#23
        0x000037fa:    4770        pG      BX       lr
    x$fpl$fsub
    __aeabi_fsub
    _fsub
        0x000037fc:    ea900f01    ....    TEQ      r0,r1
        0x00003800:    bf48        H.      IT       MI
        0x00003802:    f0814100    ...A    EORMI    r1,r1,#0x80000000
        0x00003806:    f53fade0    ?...    BMI      _fadd1 ; 0x33ca
    _fsub1
        0x0000380a:    1a42        B.      SUBS     r2,r0,r1
        0x0000380c:    d804        ..      BHI      0x3818 ; _fsub1 + 14
        0x0000380e:    f0824200    ...B    EOR      r2,r2,#0x80000000
        0x00003812:    eba00002    ....    SUB      r0,r0,r2
        0x00003816:    4411        .D      ADD      r1,r1,r2
        0x00003818:    ea4f52d0    O..R    LSR      r2,r0,#23
        0x0000381c:    f04f4c7f    O..L    MOV      r12,#0xff000000
        0x00003820:    ea1c0f41    ..A.    TST      r12,r1,LSL #1
        0x00003824:    eba253d1    ...S    SUB      r3,r2,r1,LSR #23
        0x00003828:    bf18        ..      IT       NE
        0x0000382a:    ea9c6f02    ...o    TEQNE    r12,r2,LSL #24
        0x0000382e:    d04a        J.      BEQ      0x38c6 ; _fsub1 + 188
        0x00003830:    f04f4c00    O..L    MOV      r12,#0x80000000
        0x00003834:    ea4c2000    L..     ORR      r0,r12,r0,LSL #8
        0x00003838:    ea4c2101    L..!    ORR      r1,r12,r1,LSL #8
        0x0000383c:    fa21fc03    !...    LSR      r12,r1,r3
        0x00003840:    ebb00c0c    ....    SUBS     r12,r0,r12
        0x00003844:    d40f        ..      BMI      0x3866 ; _fsub1 + 92
        0x00003846:    f0120ffe    ....    TST      r2,#0xfe
        0x0000384a:    d036        6.      BEQ      0x38ba ; _fsub1 + 176
        0x0000384c:    ea5f004c    _.L.    LSLS     r0,r12,#1
        0x00003850:    d51d        ..      BPL      0x388e ; _fsub1 + 132
        0x00003852:    1200        ..      ASRS     r0,r0,#8
        0x00003854:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x00003858:    bf38        8.      IT       CC
        0x0000385a:    4770        pG      BXCC     lr
        0x0000385c:    f01c0f3f    ..?.    TST      r12,#0x3f
        0x00003860:    bf18        ..      IT       NE
        0x00003862:    4770        pG      BXNE     lr
        0x00003864:    e00b        ..      B        0x387e ; _fsub1 + 116
        0x00003866:    f1a20201    ....    SUB      r2,r2,#1
        0x0000386a:    ea5f201c    _..     LSRS     r0,r12,#8
        0x0000386e:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x00003872:    bf38        8.      IT       CC
        0x00003874:    4770        pG      BXCC     lr
        0x00003876:    f01c0f7f    ....    TST      r12,#0x7f
        0x0000387a:    bf18        ..      IT       NE
        0x0000387c:    4770        pG      BXNE     lr
        0x0000387e:    f1c30320    .. .    RSB      r3,r3,#0x20
        0x00003882:    4099        .@      LSLS     r1,r1,r3
        0x00003884:    bf14        ..      ITE      NE
        0x00003886:    1e40        @.      SUBNE    r0,r0,#1
        0x00003888:    f0200001     ...    BICEQ    r0,r0,#1
        0x0000388c:    4770        pG      BX       lr
        0x0000388e:    0880        ..      LSRS     r0,r0,#2
        0x00003890:    ea4f2312    O..#    LSR      r3,r2,#8
        0x00003894:    bf08        ..      IT       EQ
        0x00003896:    4770        pG      BXEQ     lr
        0x00003898:    fab0fc80    ....    CLZ      r12,r0
        0x0000389c:    eba2020c    ....    SUB      r2,r2,r12
        0x000038a0:    f1cc0c28    ..(.    RSB      r12,r12,#0x28
        0x000038a4:    fa60f00c    `...    ROR      r0,r0,r12
        0x000038a8:    ea932f12    .../    TEQ      r3,r2,LSR #8
        0x000038ac:    bf04        ..      ITT      EQ
        0x000038ae:    eb0050c2    ...P    ADDEQ    r0,r0,r2,LSL #23
        0x000038b2:    4770        pG      BXEQ     lr
        0x000038b4:    ea4f70c3    O..p    LSL      r0,r3,#31
        0x000038b8:    4770        pG      BX       lr
        0x000038ba:    0a13        ..      LSRS     r3,r2,#8
        0x000038bc:    ea5f10dc    _...    LSRS     r0,r12,#7
        0x000038c0:    bf08        ..      IT       EQ
        0x000038c2:    4770        pG      BXEQ     lr
        0x000038c4:    e7f6        ..      B        0x38b4 ; _fsub1 + 170
        0x000038c6:    ea9c6f02    ...o    TEQ      r12,r2,LSL #24
        0x000038ca:    d004        ..      BEQ      0x38d6 ; _fsub1 + 204
        0x000038cc:    ea100f5c    ..\.    TST      r0,r12,LSR #1
        0x000038d0:    bf08        ..      IT       EQ
        0x000038d2:    2000        .       MOVEQ    r0,#0
        0x000038d4:    4770        pG      BX       lr
        0x000038d6:    b510        ..      PUSH     {r4,lr}
        0x000038d8:    f7ffff45    ..E.    BL       __fpl_fnaninf ; 0x3766
    $d
        0x000038dc:    3ef6df40    @..>    DCD    1056366400
    $t
        0x000038e0:    f0814000    ...@    EOR      r0,r1,#0x80000000
        0x000038e4:    4770        pG      BX       lr
    x$fpl$usenofp
    __I$use$fp
        0x000038e6:    0000        ..      MOVS     r0,r0
    $d.realdata
    Region$$Table$$Base
        0x000038e8:    00003908    .9..    DCD    14600
        0x000038ec:    20000000    ...     DCD    536870912
        0x000038f0:    00000444    D...    DCD    1092
        0x000038f4:    00000154    T...    DCD    340
        0x000038f8:    00003a20     :..    DCD    14880
        0x000038fc:    20000444    D..     DCD    536872004
        0x00003900:    000005cc    ....    DCD    1484
        0x00003904:    000001b0    ....    DCD    432
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 14652 (0x393c)
    Size        : 280 bytes (0x118)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #5

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000444
    File Offset : 14932 (0x3a54)
    Size        : 1484 bytes (0x5cc)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 8
    Entry Size  : 0


====================================

** Section #6

    Name        : .debug_abbrev
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 14932 (0x3a54)
    Size        : 1476 bytes (0x5c4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #7

    Name        : .debug_frame
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 16408 (0x4018)
    Size        : 4432 bytes (0x1150)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #8

    Name        : .debug_info
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 20840 (0x5168)
    Size        : 112152 bytes (0x1b618)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #9

    Name        : .debug_line
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 132992 (0x20780)
    Size        : 21264 bytes (0x5310)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #10

    Name        : .debug_loc
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 154256 (0x25a90)
    Size        : 6608 bytes (0x19d0)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #11

    Name        : .debug_macinfo
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 160864 (0x27460)
    Size        : 51348 bytes (0xc894)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #12

    Name        : .debug_pubnames
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 212212 (0x33cf4)
    Size        : 5519 bytes (0x158f)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #13

    Name        : .symtab
    Type        : SHT_SYMTAB (0x00000002)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 217732 (0x35284)
    Size        : 15488 bytes (0x3c80)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 555
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 233220 (0x38f04)
    Size        : 10136 bytes (0x2798)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #15

    Name        : .note
    Type        : SHT_NOTE (0x00000007)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 243356 (0x3b69c)
    Size        : 36 bytes (0x24)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

        Section     Segment
    ====================================

              1           0
              2           0
              3           0
              4           0
              5           0

====================================

** Section #16

    Name        : .comment
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 243392 (0x3b6c0)
    Size        : 17560 bytes (0x4498)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0

    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    ArmLink --strict --callgraph --map --symbols --xref --diag_suppress=9931 --cpu=Cortex-M3 --list=.\Listings\Quick_Start.map --output=.\Objects\Quick_Start.axf --scatter=.\elf2_example.sct --keep=int_register.o(int_callback_area) --info=summarysizes,sizes,totals,unused,veneers

    E:\Keil5\ARM\ARMCC\Bin\..\lib\armlib\c_w.l
    E:\Keil5\ARM\ARMCC\Bin\..\lib\armlib\fz_ws.l
    E:\Keil5\ARM\ARMCC\Bin\..\lib\armlib\h_w.l
    E:\Keil5\ARM\ARMCC\Bin\..\lib\armlib\m_ws.l
    E:\Keil5\ARM\ARMCC\Bin\..\lib\armlib\vfpsupport.l
    Input Comments:
    
    main.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\main.o --vfemode=force

    Input Comments:
    
    p1de0-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    main.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    
    
    
    
    uart_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\uart_demo.o --vfemode=force

    Input Comments:
    
    p231c-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    uart_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\uart_demo.o --depend=.\objects\uart_demo.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\uart_demo.crf src\uart_demo.c
    
    
    
    int_register.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p237c-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    intc.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    
    timer_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\timer_demo.o --vfemode=force

    Input Comments:
    
    p2390-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    timer_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\timer_demo.o --depend=.\objects\timer_demo.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\timer_demo.crf src\timer_demo.c
    
    
    
    
    
    exti_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\exti_demo.o --vfemode=force

    Input Comments:
    
    p23cc-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    exti_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\exti_demo.o --depend=.\objects\exti_demo.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\exti_demo.crf src\exti_demo.c
    
    
    
    pulse_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\pulse_demo.o --vfemode=force

    Input Comments:
    
    p1f20-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    pulse_demo.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\pulse_demo.o --depend=.\objects\pulse_demo.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\pulse_demo.crf src\pulse_demo.c
    
    
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include --predefine="
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armlink [4d35d2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p2080-3
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: armasm [4d35cf]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    system_elf2.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    log.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O3 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_Quick_Start -IE:\Keil5\ARM\PACK\ARM\CMSIS\5.0.1\Device\ARM\ARMCM3\Include -IE:\Keil5\ARM\CMSIS\Include -D__UVISION_VERSION=523 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    timer.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\timer.o --vfemode=force

    Input Comments:
    
    p67e8-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p67e8-2
    
    
    
    timer.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\timer.o --depend=.\objects\timer.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\timer.crf ..\sdk\src\soc\driver\timer.c
    
    
    
    uart.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\uart.o --vfemode=force

    Input Comments:
    
    p2f34-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p2f34-2
    
    
    
    uart.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\uart.o --depend=.\objects\uart.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\uart.crf ..\sdk\src\soc\driver\uart.c
    
    
    
    
    
    exti.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\exti.o --vfemode=force

    Input Comments:
    
    p56e4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p56e4-2
    
    
    
    exti.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\exti.o --depend=.\objects\exti.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\exti.crf ..\sdk\src\soc\driver\exti.c
    
    
    
    
    
    syscon.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\syscon.o --vfemode=force

    Input Comments:
    
    p622c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p622c-2
    
    
    
    syscon.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\syscon.o --depend=.\objects\syscon.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\syscon.crf ..\sdk\src\soc\driver\syscon.c
    
    
    
    
    

====================================

** Section #17

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 260952 (0x3fb58)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x20000484  0x2c       uart_env                                 UART_Env_Tag
0x20000484  0x14       uart_env.tx                              uart_txrxchannel
0x20000484  0x4        uart_env.tx.size                         uint32_t
0x20000488  0x4        uart_env.tx.bufptr                       pointer to uint8_t
0x2000048c  0x4        uart_env.tx.bufbase                      pointer to uint8_t
0x20000490  0x4        uart_env.tx.callback                     pointer to function 
0x20000494  0x4        uart_env.tx.dummy                        pointer to unknown Type 
0x20000498  0x14       uart_env.rx                              uart_txrxchannel
0x20000498  0x4        uart_env.rx.size                         uint32_t
0x2000049c  0x4        uart_env.rx.bufptr                       pointer to uint8_t
0x200004a0  0x4        uart_env.rx.bufbase                      pointer to uint8_t
0x200004a4  0x4        uart_env.rx.callback                     pointer to function 
0x200004a8  0x4        uart_env.rx.dummy                        pointer to unknown Type 
0x200004ac  0x1        uart_env.errordetect                     _Bool
0x200004ad  0x1        uart_env.echo_enable                     uint8_t
0x200004ae  0x1        uart_env.read_mode                       UART_RecMode
0x200004af  0x1        uart_env.till_char                       uint8_t

address     size       variable name                            type
0x20000440  0x4        __stdout                                 FILE
0x20000440  0x4        __stdout.handle                          int

address     size       variable name                            type
0x2000043c  0x4        SystemCoreClock                          uint32_t

address     size       variable name                            type
0x20000434  0x8        CHn_state                                array[8] of uint8_t

address     size       variable name                            type
0x2000039c  0x1        M_0                                      uint8_t

address     size       variable name                            type
0x2000039d  0x1        M_1                                      uint8_t

address     size       variable name                            type
0x2000039e  0x1        M_2                                      uint8_t

address     size       variable name                            type
0x2000039f  0x1        M_3                                      uint8_t

address     size       variable name                            type
0x200003a0  0x1        M_4                                      uint8_t

address     size       variable name                            type
0x200003a1  0x1        M_5                                      uint8_t

address     size       variable name                            type
0x200003a2  0x1        M_6                                      uint8_t

address     size       variable name                            type
0x200003a3  0x1        M_7                                      uint8_t

address     size       variable name                            type
0x200003a4  0x1        M_8                                      uint8_t

address     size       variable name                            type
0x200003a5  0x1        M_9                                      uint8_t

address     size       variable name                            type
0x200003a6  0x1        M_A                                      uint8_t

address     size       variable name                            type
0x200003a7  0x1        M_B                                      uint8_t

address     size       variable name                            type
0x200003a8  0x1        M_C                                      uint8_t

address     size       variable name                            type
0x200003a9  0x1        M_D                                      uint8_t

address     size       variable name                            type
0x200003aa  0x1        M_E                                      uint8_t

address     size       variable name                            type
0x200003ab  0x1        M_F                                      uint8_t

address     size       variable name                            type
0x00000000  0x4        pnumcnt                                  uint32_t

address     size       variable name                            type
0x200003b4  0x4        pnumcnt_0                                uint32_t

address     size       variable name                            type
0x200003b8  0x4        pnumcnt_1                                uint32_t

address     size       variable name                            type
0x200003bc  0x4        pnumcnt_2                                uint32_t

address     size       variable name                            type
0x200003c0  0x4        pnumcnt_3                                uint32_t

address     size       variable name                            type
0x200003c4  0x4        pnumcnt_4                                uint32_t

address     size       variable name                            type
0x200003c8  0x4        pnumcnt_5                                uint32_t

address     size       variable name                            type
0x200003cc  0x4        pnumcnt_6                                uint32_t

address     size       variable name                            type
0x200003d0  0x4        pnumcnt_7                                uint32_t

address     size       variable name                            type
0x200003d4  0x4        pnumcnt_8                                uint32_t

address     size       variable name                            type
0x200003d8  0x4        pnumcnt_9                                uint32_t

address     size       variable name                            type
0x200003dc  0x4        pnumcnt_A                                uint32_t

address     size       variable name                            type
0x200003e0  0x4        pnumcnt_B                                uint32_t

address     size       variable name                            type
0x200003e4  0x4        pnumcnt_C                                uint32_t

address     size       variable name                            type
0x200003e8  0x4        pnumcnt_D                                uint32_t

address     size       variable name                            type
0x200003ec  0x4        pnumcnt_E                                uint32_t

address     size       variable name                            type
0x200003f0  0x4        pnumcnt_F                                uint32_t

address     size       variable name                            type
0x200003f4  0x4        pulsenub_0                               uint32_t

address     size       variable name                            type
0x200003f8  0x4        pulsenub_1                               uint32_t

address     size       variable name                            type
0x200003fc  0x4        pulsenub_2                               uint32_t

address     size       variable name                            type
0x20000400  0x4        pulsenub_3                               uint32_t

address     size       variable name                            type
0x20000404  0x4        pulsenub_4                               uint32_t

address     size       variable name                            type
0x20000408  0x4        pulsenub_5                               uint32_t

address     size       variable name                            type
0x2000040c  0x4        pulsenub_6                               uint32_t

address     size       variable name                            type
0x20000410  0x4        pulsenub_7                               uint32_t

address     size       variable name                            type
0x20000414  0x4        pulsenub_8                               uint32_t

address     size       variable name                            type
0x20000418  0x4        pulsenub_9                               uint32_t

address     size       variable name                            type
0x2000041c  0x4        pulsenub_A                               uint32_t

address     size       variable name                            type
0x20000420  0x4        pulsenub_B                               uint32_t

address     size       variable name                            type
0x20000424  0x4        pulsenub_C                               uint32_t

address     size       variable name                            type
0x20000428  0x4        pulsenub_D                               uint32_t

address     size       variable name                            type
0x2000042c  0x4        pulsenub_E                               uint32_t

address     size       variable name                            type
0x20000430  0x4        pulsenub_F                               uint32_t

address     size       variable name                            type
0x200003b0  0x4        rd_state                                 uint32_t

address     size       variable name                            type
0x200003ac  0x4        state                                    uint32_t

address     size       variable name                            type
0x2000035c  0x4        Npulse_send0                             uint32_t

address     size       variable name                            type
0x20000360  0x4        Npulse_send1                             uint32_t

address     size       variable name                            type
0x20000364  0x4        Npulse_send2                             uint32_t

address     size       variable name                            type
0x20000368  0x4        Npulse_send3                             uint32_t

address     size       variable name                            type
0x2000036c  0x4        Npulse_send4                             uint32_t

address     size       variable name                            type
0x20000370  0x4        Npulse_send5                             uint32_t

address     size       variable name                            type
0x20000374  0x4        Npulse_send6                             uint32_t

address     size       variable name                            type
0x20000378  0x4        Npulse_send7                             uint32_t

address     size       variable name                            type
0x2000037c  0x4        Npulse_send8                             uint32_t

address     size       variable name                            type
0x20000380  0x4        Npulse_send9                             uint32_t

address     size       variable name                            type
0x20000384  0x4        Npulse_sendA                             uint32_t

address     size       variable name                            type
0x20000388  0x4        Npulse_sendB                             uint32_t

address     size       variable name                            type
0x2000038c  0x4        Npulse_sendC                             uint32_t

address     size       variable name                            type
0x20000390  0x4        Npulse_sendD                             uint32_t

address     size       variable name                            type
0x20000394  0x4        Npulse_sendE                             uint32_t

address     size       variable name                            type
0x20000398  0x4        Npulse_sendF                             uint32_t

address     size       variable name                            type
0x20000318  0x4        limit                                    uint32_t

address     size       variable name                            type
0x200002d4  0x4        n_0                                      uint32_t

address     size       variable name                            type
0x200002d8  0x4        n_1                                      uint32_t

address     size       variable name                            type
0x200002dc  0x4        n_2                                      uint32_t

address     size       variable name                            type
0x200002e0  0x4        n_3                                      uint32_t

address     size       variable name                            type
0x200002e4  0x4        n_4                                      uint32_t

address     size       variable name                            type
0x200002e8  0x4        n_5                                      uint32_t

address     size       variable name                            type
0x200002ec  0x4        n_6                                      uint32_t

address     size       variable name                            type
0x200002f0  0x4        n_7                                      uint32_t

address     size       variable name                            type
0x200002f4  0x4        n_8                                      uint32_t

address     size       variable name                            type
0x200002f8  0x4        n_9                                      uint32_t

address     size       variable name                            type
0x200002fc  0x4        n_A                                      uint32_t

address     size       variable name                            type
0x20000300  0x4        n_B                                      uint32_t

address     size       variable name                            type
0x20000304  0x4        n_C                                      uint32_t

address     size       variable name                            type
0x20000308  0x4        n_D                                      uint32_t

address     size       variable name                            type
0x2000030c  0x4        n_E                                      uint32_t

address     size       variable name                            type
0x20000310  0x4        n_F                                      uint32_t

address     size       variable name                            type
0x200002d0  0x1        parameter                                uint8_t

address     size       variable name                            type
0x20000314  0x4        timer                                    uint32_t

address     size       variable name                            type
0x2000031c  0x4        u_0                                      uint32_t

address     size       variable name                            type
0x20000320  0x4        u_1                                      uint32_t

address     size       variable name                            type
0x20000324  0x4        u_2                                      uint32_t

address     size       variable name                            type
0x20000328  0x4        u_3                                      uint32_t

address     size       variable name                            type
0x2000032c  0x4        u_4                                      uint32_t

address     size       variable name                            type
0x20000330  0x4        u_5                                      uint32_t

address     size       variable name                            type
0x20000334  0x4        u_6                                      uint32_t

address     size       variable name                            type
0x20000338  0x4        u_7                                      uint32_t

address     size       variable name                            type
0x2000033c  0x4        u_8                                      uint32_t

address     size       variable name                            type
0x20000340  0x4        u_9                                      uint32_t

address     size       variable name                            type
0x20000344  0x4        u_A                                      uint32_t

address     size       variable name                            type
0x20000348  0x4        u_B                                      uint32_t

address     size       variable name                            type
0x2000034c  0x4        u_C                                      uint32_t

address     size       variable name                            type
0x20000350  0x4        u_D                                      uint32_t

address     size       variable name                            type
0x20000354  0x4        u_E                                      uint32_t

address     size       variable name                            type
0x20000358  0x4        u_F                                      uint32_t

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000043  0x1        CHn                                      uint8_t

address     size       variable name                            type
0x20000088  0x4        FO_0                                     uint32_t

address     size       variable name                            type
0x2000008c  0x4        FO_1                                     uint32_t

address     size       variable name                            type
0x20000090  0x4        FO_2                                     uint32_t

address     size       variable name                            type
0x20000094  0x4        FO_3                                     uint32_t

address     size       variable name                            type
0x20000098  0x4        FO_4                                     uint32_t

address     size       variable name                            type
0x2000009c  0x4        FO_5                                     uint32_t

address     size       variable name                            type
0x200000a0  0x4        FO_6                                     uint32_t

address     size       variable name                            type
0x200000a4  0x4        FO_7                                     uint32_t

address     size       variable name                            type
0x200000a8  0x4        FO_8                                     uint32_t

address     size       variable name                            type
0x200000ac  0x4        FO_9                                     uint32_t

address     size       variable name                            type
0x200000b0  0x4        FO_A                                     uint32_t

address     size       variable name                            type
0x200000b4  0x4        FO_B                                     uint32_t

address     size       variable name                            type
0x200000b8  0x4        FO_C                                     uint32_t

address     size       variable name                            type
0x200000bc  0x4        FO_D                                     uint32_t

address     size       variable name                            type
0x200000c0  0x4        FO_E                                     uint32_t

address     size       variable name                            type
0x200000c4  0x4        FO_F                                     uint32_t

address     size       variable name                            type
0x20000048  0x2        FS_0                                     uint16_t

address     size       variable name                            type
0x2000004a  0x2        FS_1                                     uint16_t

address     size       variable name                            type
0x2000004c  0x2        FS_2                                     uint16_t

address     size       variable name                            type
0x2000004e  0x2        FS_3                                     uint16_t

address     size       variable name                            type
0x20000050  0x2        FS_4                                     uint16_t

address     size       variable name                            type
0x20000052  0x2        FS_5                                     uint16_t

address     size       variable name                            type
0x20000054  0x2        FS_6                                     uint16_t

address     size       variable name                            type
0x20000056  0x2        FS_7                                     uint16_t

address     size       variable name                            type
0x20000058  0x2        FS_8                                     uint16_t

address     size       variable name                            type
0x2000005a  0x2        FS_9                                     uint16_t

address     size       variable name                            type
0x2000005c  0x2        FS_A                                     uint16_t

address     size       variable name                            type
0x2000005e  0x2        FS_B                                     uint16_t

address     size       variable name                            type
0x20000060  0x2        FS_C                                     uint16_t

address     size       variable name                            type
0x20000062  0x2        FS_D                                     uint16_t

address     size       variable name                            type
0x20000064  0x2        FS_E                                     uint16_t

address     size       variable name                            type
0x20000066  0x2        FS_F                                     uint16_t

address     size       variable name                            type
0x20000042  0x1        Go                                       uint8_t

address     size       variable name                            type
0x20000068  0x2        Ms_0                                     uint16_t

address     size       variable name                            type
0x2000006a  0x2        Ms_1                                     uint16_t

address     size       variable name                            type
0x2000006c  0x2        Ms_2                                     uint16_t

address     size       variable name                            type
0x2000006e  0x2        Ms_3                                     uint16_t

address     size       variable name                            type
0x20000070  0x2        Ms_4                                     uint16_t

address     size       variable name                            type
0x20000072  0x2        Ms_5                                     uint16_t

address     size       variable name                            type
0x20000074  0x2        Ms_6                                     uint16_t

address     size       variable name                            type
0x20000076  0x2        Ms_7                                     uint16_t

address     size       variable name                            type
0x20000078  0x2        Ms_8                                     uint16_t

address     size       variable name                            type
0x2000007a  0x2        Ms_9                                     uint16_t

address     size       variable name                            type
0x2000007c  0x2        Ms_A                                     uint16_t

address     size       variable name                            type
0x2000007e  0x2        Ms_B                                     uint16_t

address     size       variable name                            type
0x20000080  0x2        Ms_C                                     uint16_t

address     size       variable name                            type
0x20000082  0x2        Ms_D                                     uint16_t

address     size       variable name                            type
0x20000084  0x2        Ms_E                                     uint16_t

address     size       variable name                            type
0x20000086  0x2        Ms_F                                     uint16_t

address     size       variable name                            type
0x20000040  0x1        NH                                       uint8_t

address     size       variable name                            type
0x20000041  0x1        NL                                       uint8_t

address     size       variable name                            type
0x200000c8  0x4        Npulse_0                                 uint32_t

address     size       variable name                            type
0x200000cc  0x4        Npulse_1                                 uint32_t

address     size       variable name                            type
0x200000d0  0x4        Npulse_2                                 uint32_t

address     size       variable name                            type
0x200000d4  0x4        Npulse_3                                 uint32_t

address     size       variable name                            type
0x200000d8  0x4        Npulse_4                                 uint32_t

address     size       variable name                            type
0x200000dc  0x4        Npulse_5                                 uint32_t

address     size       variable name                            type
0x200000e0  0x4        Npulse_6                                 uint32_t

address     size       variable name                            type
0x200000e4  0x4        Npulse_7                                 uint32_t

address     size       variable name                            type
0x200000e8  0x4        Npulse_8                                 uint32_t

address     size       variable name                            type
0x200000ec  0x4        Npulse_9                                 uint32_t

address     size       variable name                            type
0x200000f0  0x4        Npulse_A                                 uint32_t

address     size       variable name                            type
0x200000f4  0x4        Npulse_B                                 uint32_t

address     size       variable name                            type
0x200000f8  0x4        Npulse_C                                 uint32_t

address     size       variable name                            type
0x200000fc  0x4        Npulse_D                                 uint32_t

address     size       variable name                            type
0x20000100  0x4        Npulse_E                                 uint32_t

address     size       variable name                            type
0x20000104  0x4        Npulse_F                                 uint32_t

address     size       variable name                            type
0x20000044  0x1        Order                                    uint8_t

address     size       variable name                            type
0x00000000  0x1f       anlogic0                                 array[31] of uint8_t

address     size       variable name                            type
0x2000011e  0x32       anlogic01                                array[50] of uint8_t

address     size       variable name                            type
0x20000150  0x30       anlogic02                                array[48] of uint8_t

address     size       variable name                            type
0x20000180  0x30       anlogic03                                array[48] of uint8_t

address     size       variable name                            type
0x200001b0  0x30       anlogic04                                array[48] of uint8_t

address     size       variable name                            type
0x200001e0  0x30       anlogic05                                array[48] of uint8_t

address     size       variable name                            type
0x20000210  0x30       anlogic06                                array[48] of uint8_t

address     size       variable name                            type
0x20000240  0xf        anlogic1                                 array[15] of uint8_t

address     size       variable name                            type
0x2000024f  0x10       anlogic2                                 array[16] of uint8_t

address     size       variable name                            type
0x2000025f  0xe        anlogic3                                 array[14] of uint8_t

address     size       variable name                            type
0x2000026d  0xe        anlogic4                                 array[14] of uint8_t

address     size       variable name                            type
0x2000027b  0xf        anlogic5                                 array[15] of uint8_t

address     size       variable name                            type
0x2000028a  0xe        anlogic6                                 array[14] of uint8_t

address     size       variable name                            type
0x20000298  0xe        anlogic7                                 array[14] of uint8_t

address     size       variable name                            type
0x200002a6  0xe        anlogic8                                 array[14] of uint8_t

address     size       variable name                            type
0x200002b4  0xe        anlogic9                                 array[14] of uint8_t

address     size       variable name                            type
0x200002c2  0xe        anlogicA                                 array[14] of uint8_t

address     size       variable name                            type
0x20000458  0x2c       env0                                     UART_Env_Tag
0x20000458  0x14       env0.tx                                  uart_txrxchannel
0x20000458  0x4        env0.tx.size                             uint32_t
0x2000045c  0x4        env0.tx.bufptr                           pointer to uint8_t
0x20000460  0x4        env0.tx.bufbase                          pointer to uint8_t
0x20000464  0x4        env0.tx.callback                         pointer to function 
0x20000468  0x4        env0.tx.dummy                            pointer to unknown Type 
0x2000046c  0x14       env0.rx                                  uart_txrxchannel
0x2000046c  0x4        env0.rx.size                             uint32_t
0x20000470  0x4        env0.rx.bufptr                           pointer to uint8_t
0x20000474  0x4        env0.rx.bufbase                          pointer to uint8_t
0x20000478  0x4        env0.rx.callback                         pointer to function 
0x2000047c  0x4        env0.rx.dummy                            pointer to unknown Type 
0x20000480  0x1        env0.errordetect                         _Bool
0x20000481  0x1        env0.echo_enable                         uint8_t
0x20000482  0x1        env0.read_mode                           UART_RecMode
0x20000483  0x1        env0.till_char                           uint8_t

address     size       variable name                            type
0x20000108  0x8        param                                    param_t
0x20000108  0x1      * param.p1                                 uint8_t
0x2000010c  0x4        param.p2                                 pointer to unknown Type 

address     size       variable name                            type
0x20000045  0x2        send_end                                 array[2] of uint8_t

address     size       variable name                            type
0x20000110  0xe        str                                      array[14] of uint8_t

address     size       variable name                            type
0x20000000  0x4        I_0                                      uint32_t

address     size       variable name                            type
0x20000004  0x4        I_1                                      uint32_t

address     size       variable name                            type
0x20000008  0x4        I_2                                      uint32_t

address     size       variable name                            type
0x2000000c  0x4        I_3                                      uint32_t

address     size       variable name                            type
0x20000010  0x4        I_4                                      uint32_t

address     size       variable name                            type
0x20000014  0x4        I_5                                      uint32_t

address     size       variable name                            type
0x20000018  0x4        I_6                                      uint32_t

address     size       variable name                            type
0x2000001c  0x4        I_7                                      uint32_t

address     size       variable name                            type
0x20000020  0x4        I_8                                      uint32_t

address     size       variable name                            type
0x20000024  0x4        I_9                                      uint32_t

address     size       variable name                            type
0x20000028  0x4        I_A                                      uint32_t

address     size       variable name                            type
0x2000002c  0x4        I_B                                      uint32_t

address     size       variable name                            type
0x20000030  0x4        I_C                                      uint32_t

address     size       variable name                            type
0x20000034  0x4        I_D                                      uint32_t

address     size       variable name                            type
0x20000038  0x4        I_E                                      uint32_t

address     size       variable name                            type
0x2000003c  0x4        I_F                                      uint32_t

address     size       variable name                            type
0x20000444  0x14       parameter_buf                            array[20] of uint8_t

address     size       variable name                            type
0x00000000  0x14       read_buf                                 array[20] of uint8_t

