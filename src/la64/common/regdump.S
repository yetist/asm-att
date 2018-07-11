	.text
	.section	.rodata
	.align	3
.LC0:
	.asciz	"\nra=%p\ttp=%p\tsp=%p\tfp=%p\n\n"
	.align	3
.LC1:
	.asciz	"a0=%p\ta1=%p\ta2=%p\ta3=%p\n"
	.align	3
.LC2:
	.asciz	"a4=%p\ta5=%p\ta6=%p\ta7=%p\n\n"
	.align	3
.LC3:
	.asciz	"t0=%p\tt1=%p\tt2=%p\tt3=%p\tt4=%p\n"
	.align	3
.LC4:
	.asciz	"t5=%p\tt6=%p\tt7=%p\tt8=%p\n\n"
	.align	3
.LC5:
	.asciz	"s0=%p\ts1=%p\ts2=%p\ts3=%p\ts4=%p\n"
	.align	3
.LC6:
	.asciz	"s5=%p\ts6=%p\ts7=%p\ts8=%p\n"
	.text
	.align	2
	.globl	regdump
	.type	regdump, @function
regdump:
	addi.d      $sp, $sp, -32
	st.d        $ra, $sp, 24
	st.d        $fp, $sp, 16
	addi.d      $fp, $sp, 32

#begin
    move        $a4, $fp
    move        $a3, $sp
    move        $a2, $tp
    move        $a1, $ra
	la.local    $a0, .LC0
	bl          %plt(printf)

	move        $a4, $a3
	move        $a3, $a2
	move        $a2, $a1
	move        $a1, $a0
	la.local    $a0, .LC1
	bl          %plt(printf)

	move        $a4, $a7
	move        $a3, $a6
	move        $a2, $a5
	move        $a1, $a4
	la.local    $a0, .LC2
	bl          %plt(printf)

	move        $a5, $t4
	move        $a4, $t3
	move        $a3, $t2
	move        $a2, $t1
	move        $a1, $t0
	la.local    $a0, .LC3
	bl          %plt(printf)

	move        $a4, $t8
	move        $a3, $t7
	move        $a2, $t6
	move        $a1, $t5
	la.local    $a0, .LC4
	bl          %plt(printf)

	move        $a5, $s4
	move        $a4, $s3
	move        $a3, $s2
	move        $a2, $s1
	move        $a1, $s0
	la.local    $a0, .LC5
	bl          %plt(printf)

	move        $a4, $s8
	move        $a3, $s7
	move        $a2, $s6
	move        $a1, $s5
	la.local    $a0, .LC6
	bl          %plt(printf)

	ld.d        $ra, $sp, 24
	ld.d        $fp, $sp, 16
	addi.d      $sp, $sp, 32
	jirl        $zero, $ra, 0
    .size	    regdump, .-regdump
