section .data
    ; nasm 使用反引号来支持转义序列
    msg db      `hello, asm!\n`

section .text
    global _start
_start:
    mov     rax, 1		;系统调用: write
    mov     rdi, 1		;参数1, stdout
    mov     rsi, msg	;参数2, buf
    mov     rdx, 13		;参数3, len
    syscall

    mov    rax, 60		;系统调用: exit
    mov    rdi, 0		;参数1, status
    syscall
