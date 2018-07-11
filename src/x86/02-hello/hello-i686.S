# :vim: set ts=4 sts=4 sw=4 expandtab:
.section    .data
    .equ SYS_write, 4
    .equ SYS_exit,  1
    .equ STDOUT,    1
    .equ EXIT_SUCCESS, 0
msg:
    .ascii "hello, world!\n"
    len = . - msg                    # 字串长度

.section    .text
#ifdef X__GNUC__
    .globl main
main:
#else
    .globl _start
_start:
#endif

    movl     $SYS_write, %eax   # syscall: 4 ssize_t write(int fd, const void *buf, size_t count);
    movl     $STDOUT, %ebx      # @fd=1, stdout
    movl     $msg, %ecx         # @buf: msg
    movl     $len, %edx          # @count: 13
    int      $0x80              # call

    movl     $SYS_exit,%eax     # syscall: 1, void _exit(int status);
    movl     $EXIT_SUCCESS,%ebx # @status: 0
    int      $0x80
