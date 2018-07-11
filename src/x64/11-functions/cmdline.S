/*
   printf("%d, %s\n", argc, argv[0]);
   printf(%rdi, %rsi, %rdx);
 */
.section	.rodata
format:
    .string	"%d, %s\n"
.section .text
    .globl _start
_start:
    movq     8(%rsp), %rdx  # argv[0] -> %rdx
    movl     0(%rsp), %esi  # argc -> %esi
    leaq	 format, %rdi   # format -> %rdi
    call	 printf

    movq     $60, %rax
    movq     $0,  %rdi
    syscall
