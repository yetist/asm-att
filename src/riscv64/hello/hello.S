# :vim: set ts=4 sts=4 sw=4 expandtab:
.section    .rodata
    .include "../common/define.inc"
msg:
    .string "hello, world!\n"
    len = . - msg               # 字串长度

.section    .text
    .globl main
main:
    li      a0, SYS_write       # a0 = SYS_write
    li      a1, STDOUT          # a1 = stdout
    lui     a2, %hi(msg)
    addi    a2, a2, %lo(msg)    # a2 = msg
    li      a3, len             # a3 = len
    call    syscall             # write(stdout, msg, len(msg))

    li      a0, SYS_exit        # a0 = SYS_exit
    li      a1, EXIT_SUCCESS    # a1 = EXIT_SUCCESS
    call    syscall             # exit(0)
