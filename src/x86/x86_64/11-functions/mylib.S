/*
vim: set ts=4 sts=4 sw=4 expandtab:

Function:
arg1 - arg6: %rdi, %rsi, %rdx, %rcx, %r8, %r9

Syscall:
Syscall number: %rax
arg1 - arg5: %rdi, %rsi, %rdx, %r10, %r8
*/

.section .text
# ------------------------
    .global exit
    .type   exit, @function
exit:
# Descript: void exit(int status); arg0 is %rdi.
# Return: void
# ------------------------
    movq    $60, %rax
    syscall
    .size	exit, .-exit

# ------------------------
    .global exit
    .type   exit, @function
exit:
# Descript: void exit(int status); arg0 is %rdi.
# Return: void
# ------------------------
    movq    $60, %rax
    syscall
    .size	exit, .-exit
