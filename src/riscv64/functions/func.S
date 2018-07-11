	.file	"fun.c"
	.option nopic

	.section	.rodata
	.align	3
.format:
	.string	"%d\n"

	.text
/*
void printInt(int x)
{
    print("%d\n", x);
}
*/
	.align	1
	.globl	printint
	.type	printint, @function
printint:
	addi	sp,sp,-32           # sp = sp - 32
	sd	    ra,24(sp)           # sp[24] = ra
	sd	    s0,16(sp)           # sp[16] = s0
	addi	s0,sp,32            # s0 = sp + 32
	mv	    a5,a0               # a5 = a0
	sw	    a5,-20(s0)          # s0[-20] = a5, sp[12] = a5
	lw	    a5,-20(s0)          # a5 = s0[-20], a5 = sp[12]
	mv	    a1,a5               # a1 = a5
	lui	    a5,%hi(.format)
	addi	a0,a5,%lo(.format)  # a0 = &.format
	call	printf              # printf(format, a5)
	nop
	ld	    ra,24(sp)
	ld	    s0,16(sp)
	addi	sp,sp,32
	jr	    ra
	.size	printint, .-printint

/*
int funa()
    int i = 3;
    return i;
}
*/
	.align	1
	.globl	funa
	.type	funa, @function
funa:
	addi	sp,sp,-32           # sp = sp - 32
	sd	    s0,24(sp)           # sp[24] = s0
	addi	s0,sp,32            # s0 = sp + 32

	li	    a5,3                # a5 = 3
	sw	    a5,-20(s0)          # sp[12] = s0[-20] = a5
	lw	    a5,-20(s0)          # a5 = sp[12] = s0[-20]
	mv	    a0,a5               # a0 = a5

	ld	    s0,24(sp)           # s0 = sp[24]
	addi	sp,sp,32            # sp = sp + 32
	jr	    ra
	.size	funa, .-funa

/*
int _start()
{
    x = funa();
    return 2;
}
*/
	.align	1
	.globl  main
	.type	main, @function
main:
	addi	sp,sp,-16           # sp = sp - 16
	sd	    ra,8(sp)            # sp[8] = ra
	sd	    s0,0(sp)            # sp[0] = s0
	addi	s0,sp,16            # s0 = sp + 16
	call	funa                # call funa()
	li	    a5,2                # a5 = 2
	mv	    a0,a5               # a0 = a5
	ld	    ra,8(sp)            # ra = sp[8]
	ld	    s0,0(sp)            # s0 = sp[0]
	addi	sp,sp,16            # sp = sp + 16
	jr	ra
	.size	main, .-main

	.ident	"GCC: (GNU) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
