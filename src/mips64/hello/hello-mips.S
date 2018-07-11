# :vim: set ts=4 sts=4 sw=4 expandtab:
/* mips64el
*/
.section .rodata
    .include "../common/define.inc"
msg:
    .string "hello, world!\n"
    len = . - msg                    # 字串长度

.section .text
    .globl _start
_start:
    li $v0, SYS_write       # ssize_t write(int fd, const void *buf, size_t count);
    li $a0, 1

    dla $a1, msg

    li $a2, len
    syscall

    li $v0, SYS_exit        # 退出
    li $a0, 3
    syscall
