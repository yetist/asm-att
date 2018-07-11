# :vim: set ts=4 sts=4 sw=4 expandtab:
/* x86_64 系统调用
 * 系统调用号： /usr/include/asm/unistd.h
 * 传参寄存器:  rdi   rsi   rdx   r10   r8    r9    -
 **/
.section    .rodata
    .equ SYS_write,     1
    .equ SYS_exit,      60
    .equ STDOUT,        1
    .equ EXIT_SUCCESS,  0
.section    .data
msg:
    .ascii "hello, world!\n"
    len = . - msg               # 字串长度

.section    .text
    .globl _start
_start:
    mov     $SYS_write, %rax    # rax = __NR_write
    movq    $STDOUT, %rdi       # rdi = 1, stdout
    movq    $msg, %rsi          # rsi = msg
    movq    $len, %rdx          # rdx = len(msg)
    syscall                     # call write(stdout, msg, len(msg))

    movq     $SYS_exit,%rax     # rax = __NR_exit
    movq     $EXIT_SUCCESS,%rdi # rdi = 0
    syscall                     # call exit(0)
