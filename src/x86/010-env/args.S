# vim: ts=4 sts=4 sw=4 expandtab
/*
   代码示范了如何在汇编代码中进行命令行参数的处理:
*/
# args.s
.text
.globl _start
_start:
    popl %ecx           # argc

vnext:
    popl %ecx           # argv
    test %ecx, %ecx     # 空指针表明结束
    jz   exit
    movl %ecx, %ebx     # ebx 作为临时寄存器，沿着 ecx 向前移动。*p = &ecx;
    xorl %edx, %edx     # edx = 0; 是write()第3个参数，用于表示count。

strlen:
    movb (%ebx), %al    # al = *p;
    inc  %edx           # edx++, count 加1.
    inc  %ebx           # p++;
    test %al, %al       # 非空指针则继续计算
    jnz  strlen
    movb $10, -1(%ebx)  # 将'\0' 换为 0xa 换行符。

    /*
       调用 write 系统调用输出 argv 数组。
       ssize_t write(int fd, const void *buf, size_t count);
     */

    movl $4, %eax       # 系统调用号(sys_write)
    movl $1, %ebx       # 文件描述符(stdout)
    int  $0x80
    jmp vnext
exit:
    movl $1,%eax        # 系统调用号(sys_exit)
    xorl %ebx, %ebx     # 退出代码
    int $0x80
    ret

# -------------------------------------
.type stringlen, @function
# size_t strlen(const char *s);
# -------------------------------------
stringlen:
    pushl %ebp
    movl %esp, %ebp

    pushl %edx
    pushl %ebx

    xorl %edx, %edx     # edx = 0
    movb 0x4(%ebp), %ebx
len:
    movb (%ebx), %al    # al = *p;
    inc  %edx           # edx++, count 加1.
    inc  %ebx           # p++;
    test %al, %al       # 非空指针则继续计算
    jnz  len

    popl %ebx
    popl %edx

    movl %ebp, %esp
    popl %ebp
    ret
