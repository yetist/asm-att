#cpuid2.s View CPUID Vendor ID string using C library calls
.section .data
output:
	.asciz "The proccessor Verdor ID is '%s'\n"
.section .bss
	.lcomm buffer, 12

.section .text
.globl main

main:
	movq $0, %rax
	cpuid
	movq $buffer, %rdi
	movq %rbx, (%rdi)
	movq %rdx, 4(%rdi)
	movq %rcx, 8(%rdi)
	pushq $buffer
	pushq $output
	call printf
	addq $16, %rsp
	pushq $0
	call exit
