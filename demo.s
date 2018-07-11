	.file	"demo.c"
	.text
	.globl	function1
	.type	function1, @function
function1:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$0, -8(%ebp)
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax
	addl	%eax, -4(%ebp)
	incl	-8(%ebp)
.L2:
	cmpl	$99999, -8(%ebp)
	jle	.L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	function1, .-function1
	.globl	function2
	.type	function2, @function
function2:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	call	function1
	movl	$0, -8(%ebp)
	jmp	.L5
.L6:
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	incl	-8(%ebp)
.L5:
	cmpl	$199999, -8(%ebp)
	jle	.L6
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	function2, .-function2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$0, -4(%ebp)
	jmp	.L8
.L9:
	call	function1
	incl	-4(%ebp)
.L8:
	cmpl	$99, -4(%ebp)
	jle	.L9
	movl	$0, -4(%ebp)
	jmp	.L10
.L11:
	call	function2
	incl	-4(%ebp)
.L10:
	cmpl	$49999, -4(%ebp)
	jle	.L11
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB3:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE3:
	.ident	"GCC: (GNU) 8.1.1 20180531"
	.section	.note.GNU-stack,"",@progbits
