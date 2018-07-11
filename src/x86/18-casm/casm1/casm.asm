# 汇编调用C函数 print 示例
global _start

extern print

section .text

_start:
	call	print

	mov	rax, 60		# 系统调用号60, NR_exit
	mov	rdi, 0		# exit()参数0
	syscall
