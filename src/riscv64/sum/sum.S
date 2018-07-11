# vim: set ts=4 sts=4 sw=4 expandtab:
.section .rodata
    .equ num1, 100
    .equ num2, 50
    .equ SYS_exit, 93
    .equ SYS_write, 64
    .equ STDOUT, 1
msg:
    .ascii "Sum is correct\n"

.section .text
    .globl _start
_start:
    li      t1, num1
    li      t2, num2
    addw    a1, t1, t2
    li      t1, 150
    bne     a1, t1, .exit
    j       .rightSum

.rightSum:
    lui     t1, %hi(msg)
    addi    a0,t1,%lo(msg)     # format
    call    printf
    mv      a1, zero

.exit:
    li      a0, SYS_exit    # __NR_exit
    call    syscall
