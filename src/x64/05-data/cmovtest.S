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
   movl values, %ebx                    # 把数组中第一个数 105 保存到 %ebx 中
   movl $1, %edi                        # %edi 初始化为 1
loop:
    movl values(, %edi, 4), %eax        # 把 valus+%edi*4 地址中的数，保存到 %eax
    cmp %ebx, %eax
    cmova %eax, %ebx                    # %ebx 保存较大的数
    inc %edi                            # %edi += 1
    cmp $10, %edi
    jne loop

    mov %ebx, %esi                      # 参数2, 数字
    movl $output, %edi                  # 参数1，输出格式化字符串
    call printf                         # 调用 C 库 printf 函数

    movl $0, %edi                       # 参数1为0,
    call exit                           # 调用 C 库 exit 函数
