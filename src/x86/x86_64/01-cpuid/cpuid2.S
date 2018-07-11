# vim: set ts=4 sts=4 sw=4 expandtab
#cpuid2.s View CPUID Vendor ID string using C library calls
.section .data
output:
    .asciz "The processor Vendor ID is '%s'\n"
.section .bss
    .lcomm buffer, 12

.section .text
.globl _start
_start:
    movq $0, %rax
    cpuid
    movq $buffer, %rsi      # rsi = buffer
    movq %rbx, (%rsi)
    movq %rdx, 4(%rsi)
    movq %rcx, 8(%rsi)
    movq $output, %rdi      # rdi = output
    call printf             # call printf(output@rdi, buffer@rsi)

    addq $16, %rsp
    movq $0, %rdi           # rdi = 0
    call exit               # call exit(0)
