# 最简单的汇编
.section .rodata
msg:
    .string "hello, world!\n"
    len = . - msg                    # 字串长度

.text
    .globl  _start
_start:
    li          $a2, 0xf            # bug here, li $a2, len
    la.local    $a1, msg
    li          $a0, 2              # stdout=1, stderr=2
    li          $a7, 64
    syscall     0x0

    li          $a0, 8
    li          $a7, 93
    syscall     0x0
