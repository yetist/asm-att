# 常量数值
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
    li          $a2, len
    la.local    $a1, msg
    li          $a0, STDOUT
    li          $a7, SYS_write
    syscall     0x0

    li          $a0, EXIT_SUCCESS
    li          $a7, SYS_exit
    syscall     0x0
