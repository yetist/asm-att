# vim: set ts=4 sts=4 sw=4 expandtab :
# paramtest1.s - Listing command line parameters
.section .data
output1:
    .asciz "There are %d parameters:\n"
output2:
    .asciz "%s\n"
.section .text
.globl _start
_start:
    movl (%esp), %ecx   # 参数数目
    pushl %ecx          # 入栈
    pushl $output1
    call printf

    addl $4, %esp       # 从栈中丢掉 $output, 对应于 pushl %output
    popl %ecx           # %ecx 出栈，其中保存了参数数目
    movl %esp, %ebp     # 把 %esp 保存到 %ebp
    addl $4, %ebp       # %ebp 指向程序名称
loop1:
    pushl %ecx          # 参数数目入栈
    pushl (%ebp)        # 程序名称入栈
    pushl $output2      # 输出 format 入栈
    call printf         # 打印参数数目和程序名称

    addl $8, %esp       # 恢复2个栈
    popl %ecx           # 恢复 %ecx
    addl $4, %ebp       # %ebp 指向下一个参数
    loop loop1          # %ecx - 1, 循环
    pushl $0
    call exit
