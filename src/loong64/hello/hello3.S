# 动态链接，使用C库的printf和exit函数
.section .rodata
msg:
    .string "hello, world!\n"

.text
    .globl main
main:
    la.local    $a0, msg
    bl          %plt(printf)

    li.w          $a0, 0              # exit(0)
    bl          %plt(exit)
