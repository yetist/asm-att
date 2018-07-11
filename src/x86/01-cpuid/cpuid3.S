        .section .data
output:
        .asciz "The processor Vendor ID is '%s'\n"

        .section .bss
        .lcomm buffer, 12

        .section .text
        .globl _start
_start:
        movl $0, %eax
        cpuid
        movl $buffer, %edi
        movl %ebx, (%edi)
        movl %edx, 4(%edi)
        movl %ecx, 8(%edi)

        pushl $buffer
        pushl $output
        call printf

        addl $8, %esp

        movl $4, %eax
        movl $1, %ebx
        movl $output, %ecx
        movl $33, %edx
        int $0x80

        pushl $1
        call exit
