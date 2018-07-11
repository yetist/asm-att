# vim: set ts=4 sts=4 sw=4 expandtab:
# cpuid.s Sample program to extract the processor Vendor ID
.section .data
output:
    .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
    len = . - output                    # 字串长度
.section .text
    .globl _start
_start:
    movl $0, %eax
    cpuid

#              arg0  arg1  arg2  arg3  arg4  arg5  arg6
#x86-64        rdi   rsi   rdx   r10   r8    r9    -


    movq $1, %rdi           # rdi = 1, __NR_write
    movq $1, %rax           # rax = 1, stdout
    movabs $output, %rsi    # rsi = &output
    movl %ebx, 28(%rsi)
    movl %edx, 32(%rsi)
    movl %ecx, 36(%rsi)
    movq $len, %rdx          # rdx = len(output)
    syscall                 # call write(1, output, len(output))

    movq    $60,%rax        # rax = 60, __NR_exit
    movq    $0x0,%rdi       # rdi = 0
    syscall                 # call exit(0)
