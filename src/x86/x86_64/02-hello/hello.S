# :vim: set ts=4 sts=4 sw=4 expandtab:
/* x86_64 系统调用
 * 系统调用号： /usr/include/asm/unistd.h
 * 传参寄存器:  rdi   rsi   rdx   r10   r8    r9    -
 **/
.section    .data
    .equ SYS_write,     1
    .equ SYS_exit,      60
    .equ STDOUT,        1
    .equ EXIT_SUCCESS,  0
.section    .data
msg:
    .ascii "hello, world!\n"
    len = . - msg                    # 字串长度

.section    .text
    .globl _start
_start:
    mov     $SYS_write, %rax  # 系统调用: write
    movq    $STDOUT, %rdi     # @fd=1, stdout
    movq    $msg, %rsi        # @buf, msg
    movq    $len, %rdx        # @count, len(msg)=14
    syscall

    movq     $SYS_exit,%rax     # 系统调用: exit
    movq     $EXIT_SUCCESS,%rdi # @status
    syscall
