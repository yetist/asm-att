; 汇编调用C函数 print 示例
global _start

extern print

section .text

_start:
	call	print

; 系统调用号60, NR_exit
	mov	rax, 60
; exit()参数0
	mov	rdi, 0
	syscall
