# vim: set ts=4 sts=4 sw=4 expandtab :
# cmovtest.s - An example of the CMOV instructions
.section .data
output:
   .asciz "The largest value is %d\n"
values:
   .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
   nop
   movl values, %ebx
   movl $1, %edi
loop:
    movl values(, %edi, 4), %eax
    cmp %ebx, %eax
    cmova %eax, %ebx
    inc %edi
    cmp $10, %edi
    jne loop

    pushl %ebx                          # 参数2, 打印 %ebx 中的值
    pushl $output                       # 参数1, format
    call printf                         # 调用 printf 函数

    addl $8, %esp                       # 恢复 %esp 为调用 printf 之前的状态
    pushl $0                            # 参数1为0,
    call exit                           # 调用 exit 函数
