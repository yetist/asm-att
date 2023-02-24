# 最简单的汇编
.section .rodata
msg:
    .string "hello, world!\n"
    len = . - msg                    # 字串长度

.text
    .globl  _start
_start:
    li.w          $a2, 0xf            # bug here, li $a2, len
    la.local    $a1, msg
    li.w          $a0, 2              # stdout=1, stderr=2
    li.w          $a7, 64
    syscall     0x0

    li.w          $a0, 8
    li.w          $a7, 93
    syscall     0x0
