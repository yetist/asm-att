# 最简单的汇编
.section .rodata
    .equ SYS_exit, 93
    .equ SYS_write, 64
    .equ STDOUT, 1
    .equ EXIT_SUCCESS, 0
msg:
    .string "hello, world!\n"
    len = . - msg                    # 字串长度

.text
    .globl  _start
_start:
    li.w          $a2, len
    la.local      $a1, msg
    li.w          $a0, STDOUT
    li.w          $a7, SYS_write
    syscall       0x0

    li.w          $a0, EXIT_SUCCESS
    li.w          $a7, SYS_exit
    syscall       0x0
