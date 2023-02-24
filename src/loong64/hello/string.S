strlen:
    preld       	0x0, $a0, 0
    nor         	$t4, $zero, $zero
    lu12i.w     	$a2, 4112(0x1010)
    andi        	$t5, $a0, 0x7
    ori         	$t7, $zero, 0x7
    slli.d      	$t6, $t5, 0x3
    andn        	$t7, $a0, $t7
    ld.d        	$a1, $t7, 0
    sub.d       	$t7, $zero, $t6
    sll.d       	$t4, $t4, $t7
    maskeqz     	$t4, $t4, $t6
    srl.d       	$a1, $a1, $t6
    or          	$a1, $a1, $t4
    ori         	$a2, $a2, 0x101
    nor         	$t1, $a1, $zero
    ori         	$a4, $zero, 0x8
    preld       	0x0, $a0, 32(0x20)
    bstrins.d   	$a2, $a2, 0x3f, 0x20
    sub.d       	$a5, $a4, $t5
    move        	$t5, $a0
    sub.d       	$t0, $a1, $a2
    slli.d      	$a3, $a2, 0x7
    nor         	$a3, $zero, $a3
    nor         	$t1, $a1, $a3
    and         	$t0, $t0, $t1
    preld       	0x0, $a0, 64(0x40)
    bnez        	$t0, strlen_count1
    add.d       	$a0, $a0, $a5

strlen_loop:
    ld.d        	$a1, $a0, 0
    sub.d       	$t0, $a1, $a2
    nor         	$t1, $a1, $a3
    and         	$t0, $t0, $t1
    addi.d      	$a0, $a0, 8(0x8)
    beqz        	$t0, strlen_loop

strlen_count:
    addi.d      	$a0, $a0, -8(0xff8)

strlen_count1:
    ctz.d       	$t1, $t0
    sub.d       	$a0, $a0, $t5
    srli.w      	$t1, $t1, 0x3
    add.d       	$a0, $a0, $t1
    jirl        	$zero, $ra, 0
