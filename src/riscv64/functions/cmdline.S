#####################################
# 打印argc和argv
#
# for (i=0; i < argc; i++) {
#     printf("%d, %s\n", i, argv[i]);
# }
# 转换为:
# i = 0;
#while ( i < argc) {
#    printf("%d, %s\n", i, argv[i]);
#    i += 1;
#}
#i = 0
#do {
#printf("%d, %s\n", i, argv[i]);
#} while ( i < argc)
#####################################
.section    .rodata
    .equ SYS_write, 64
    .equ SYS_exit, 93
    .equ STDOUT, 1
    .equ EXIT_SUCCESS, 0
    .align  3
format: .string "i=%d, argv=%s\n"

.section .text
    .globl main
main:
    li      t0, 0               # (t0) i = 0
    mv      t1, a1              # 保存a1的值, t1 = a1 = argc
    mv      t2, a2              # 保存a2的值, t2 = a2 = argv

.loop:
    bge     t0, t1, end

    lui     a0,%hi(format)      # a0: format
    addi    a0,a0,%lo(format)

    mv      a1, t0              # a1 = t0 = i

    add     t3, t2, a1          # t3 = (argv + i)
    ld      a2, 0(t3)           # a2: *(argv+i)
    #call    printf
    jal     ra, printf

skip:
    addi    t0, t0, 1
    j .loop

end:
#blt     t0, t1, loop

#    ld      a2,0(a2)            # a2 是argv 地址, a1 是argc，为参数个数
#    blt     t0, a1, .print
#
#    ld      a2,0(a2)            # a2 是argv 地址, a1 是argc，为参数个数
#    lui     a0,%hi(format)      # a0 加载format字符串地址
#    addi    a0,a0,%lo(format)
#    call    printf

    li      a0, SYS_exit        # __NR_exit
    li      a1, EXIT_SUCCESS    # status
    call    syscall
