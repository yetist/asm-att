a.out:     file format elf64-loongarch

test:0000000000000878 T area
test:0000000000000830 T circumf
test:0000000000000a50 T __libc_csu_fini
test:00000000000009b8 T __libc_csu_init
test:00000000000008c4 T main
test:00000000000006d0 T _start

Disassembly of section .plt:

0000000000000650 <.plt>:
 650:	1c00010e 	pcaddu12i   	$t2, 8(0x8)
 654:	0011bdad 	sub.d       	$t1, $t1, $t3
 658:	28e6c1cf 	ld.d        	$t3, $t2, -1616(0x9b0)
 65c:	02ff61ad 	addi.d      	$t1, $t1, -40(0xfd8)
 660:	02e6c1cc 	addi.d      	$t0, $t2, -1616(0x9b0)
 664:	004505ad 	srli.d      	$t1, $t1, 0x1
 668:	28c0218c 	ld.d        	$t0, $t0, 8(0x8)
 66c:	4c0001e0 	jirl        	$zero, $t3, 0

0000000000000670 <printf@plt>:
 670:	1c00010f 	pcaddu12i   	$t3, 8(0x8)             # t3 = PC(0x670) + 0x8000
 674:	28e681ef 	ld.d        	$t3, $t3, -1632(0x9a0)  # t3 <- t3 - 1632(0x9a0); = 4112(0x1010) + 0x8000
 678:	1c00000d 	pcaddu12i   	$t1, 0                  # t1 = PC(0x678)
 67c:	4c0001e0 	jirl        	$zero, $t3, 0           # goto t3

Disassembly of section .text:

0000000000000680 <_start>:
 680:	00150089 	move        	$a5, $a0                # a5 = a0
 684:	1c0000e4 	pcaddu12i   	$a0, 7(0x7)             # a0 = PC + b0111 0000 0000 0000(0x7000)
 688:	03a7100c 	ori         	$t0, $zero, 0x9c4       # t0 = 0x9c4
 68c:	1600000c 	lu32i.d     	$t0, 0
 690:	0300018c 	lu52i.d     	$t0, $t0, 0
 694:	380c3084 	ldx.d       	$a0, $a0, $t0           # a0 = M(a0 + t0)
 698:	28c00065 	ld.d        	$a1, $sp, 0             # a1 = sp
 69c:	02c02066 	addi.d      	$a2, $sp, 8(0x8)        # a2 = sp + 8
 6a0:	00451063 	srli.d      	$sp, $sp, 0x4           # sp = sp >> 0x4
 6a4:	00411063 	slli.d      	$sp, $sp, 0x4           # sp = sp << 0x4
 6a8:	1c0000e7 	pcaddu12i   	$a3, 7(0x7)             # a3 = PC + b0111 0000 0000 0000(0x7000)
 6ac:	03a6600c 	ori         	$t0, $zero, 0x998       # t0 = 0x998
 6b0:	1600000c 	lu32i.d     	$t0, 0
 6b4:	0300018c 	lu52i.d     	$t0, $t0, 0
 6b8:	380c30e7 	ldx.d       	$a3, $a3, $t0           # a3 = a3 + t0
 6bc:	1c0000e8 	pcaddu12i   	$a4, 7(0x7)             # a4 = PC + 0x7000
 6c0:	03a5900c 	ori         	$t0, $zero, 0x964       # t0 = 0x964
 6c4:	1600000c 	lu32i.d     	$t0, 0
 6c8:	0300018c 	lu52i.d     	$t0, $t0, 0
 6cc:	380c3108 	ldx.d       	$a4, $a4, $t0           # a4 = a4 + t0
 6d0:	0015006a 	move        	$a6, $sp                # a6 = sp

 6d4:	1c0000e1 	pcaddu12i   	$ra, 7(0x7)             # ra = PC + 0x7000
 6d8:	03a5700c 	ori         	$t0, $zero, 0x95c       # t0 = 0x95c
 6dc:	1600000c 	lu32i.d     	$t0, 0
 6e0:	0300018c 	lu52i.d     	$t0, $t0, 0
 6e4:	380c3021 	ldx.d       	$ra, $ra, $t0           # ra = ra + t0; 0x6d4 + 0x95c - 0x680 = 0x9b0
 6e8:	4c000021 	jirl        	$ra, $ra, 0

 6ec:	1c0000e1 	pcaddu12i   	$ra, 7(0x7)             # ra = PC + 0x7000
 6f0:	03a5300c 	ori         	$t0, $zero, 0x94c       # t0 = 0x94c
 6f4:	1600000c 	lu32i.d     	$t0, 0
 6f8:	0300018c 	lu52i.d     	$t0, $t0, 0
 6fc:	380c3021 	ldx.d       	$ra, $ra, $t0           # ra = ra + t0; 0x6ec + 0x94c - 0x680 = 0x9b8
 700:	4c000021 	jirl        	$ra, $ra, 0             # call __libc_csu_init
 704:	03400000 	andi        	$zero, $zero, 0x0       # nop

0000000000000708 <deregister_tm_clones>:
 708:	1c000104 	pcaddu12i   	$a0, 8(0x8)
 70c:	02e44084 	addi.d      	$a0, $a0, -1776(0x910)
 710:	1c00010c 	pcaddu12i   	$t0, 8(0x8)
 714:	02e4218c 	addi.d      	$t0, $t0, -1784(0x908)
 718:	58001984 	beq         	$t0, $a0, 24(0x18)	# 730 <deregister_tm_clones+0x28>
 71c:	1c00010c 	pcaddu12i   	$t0, 8(0x8)
 720:	28e4318c 	ld.d        	$t0, $t0, -1780(0x90c)
 724:	40000d80 	beqz        	$t0, 12(0xc)	# 730 <deregister_tm_clones+0x28>
 728:	4c000180 	jirl        	$zero, $t0, 0
 72c:	03400000 	andi        	$zero, $zero, 0x0
 730:	4c000020 	jirl        	$zero, $ra, 0
 734:	03400000 	andi        	$zero, $zero, 0x0

0000000000000738 <register_tm_clones>:
 738:	1c000104 	pcaddu12i   	$a0, 8(0x8)
 73c:	02e38084 	addi.d      	$a0, $a0, -1824(0x8e0)
 740:	1c000105 	pcaddu12i   	$a1, 8(0x8)
 744:	02e360a5 	addi.d      	$a1, $a1, -1832(0x8d8)
 748:	001190a5 	sub.d       	$a1, $a1, $a0
 74c:	00490ca5 	srai.d      	$a1, $a1, 0x3
 750:	0045fcac 	srli.d      	$t0, $a1, 0x3f
 754:	00109585 	add.d       	$a1, $t0, $a1
 758:	004904a5 	srai.d      	$a1, $a1, 0x1
 75c:	400014a0 	beqz        	$a1, 20(0x14)	# 770 <register_tm_clones+0x38>
 760:	1c00010c 	pcaddu12i   	$t0, 8(0x8)
 764:	28e3e18c 	ld.d        	$t0, $t0, -1800(0x8f8)
 768:	40000980 	beqz        	$t0, 8(0x8)	# 770 <register_tm_clones+0x38>
 76c:	4c000180 	jirl        	$zero, $t0, 0
 770:	4c000020 	jirl        	$zero, $ra, 0
 774:	03400000 	andi        	$zero, $zero, 0x0

0000000000000778 <__do_global_dtors_aux>:
 778:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
 77c:	27000077 	stptr.d     	$s0, $sp, 0
 780:	1c000117 	pcaddu12i   	$s0, 8(0x8)
 784:	02e3a2f7 	addi.d      	$s0, $s0, -1816(0x8e8)
 788:	2a0002ec 	ld.bu       	$t0, $s0, 0
 78c:	29c02061 	st.d        	$ra, $sp, 8(0x8)
 790:	44003580 	bnez        	$t0, 52(0x34)	# 7c4 <__do_global_dtors_aux+0x4c>
 794:	1c00010c 	pcaddu12i   	$t0, 8(0x8)
 798:	28e2f18c 	ld.d        	$t0, $t0, -1860(0x8bc)
 79c:	40001d80 	beqz        	$t0, 28(0x1c)	# 7b8 <__do_global_dtors_aux+0x40>
 7a0:	1c00010c 	pcaddu12i   	$t0, 8(0x8)
 7a4:	02e3018c 	addi.d      	$t0, $t0, -1856(0x8c0)
 7a8:	26000184 	ldptr.d     	$a0, $t0, 0
 7ac:	1c000101 	pcaddu12i   	$ra, 8(0x8)
 7b0:	28e29021 	ld.d        	$ra, $ra, -1884(0x8a4)
 7b4:	4c000021 	jirl        	$ra, $ra, 0
 7b8:	57ff53ff 	bl          	-176(0xfffff50)	# 708 <deregister_tm_clones>
 7bc:	0280040c 	addi.w      	$t0, $zero, 1(0x1)
 7c0:	290002ec 	st.b        	$t0, $s0, 0
 7c4:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
 7c8:	26000077 	ldptr.d     	$s0, $sp, 0
 7cc:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
 7d0:	4c000020 	jirl        	$zero, $ra, 0
 7d4:	03400000 	andi        	$zero, $zero, 0x0

00000000000007d8 <frame_dummy>:
 7d8:	53ff63ff 	b           	-160(0xfffff60)	# 738 <register_tm_clones>
 7dc:	03400000 	andi        	$zero, $zero, 0x0

00000000000007e0 <circumf>:
 7e0:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
 7e4:	29c06076 	st.d        	$fp, $sp, 24(0x18)
 7e8:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
 7ec:	0015008c 	move        	$t0, $a0                # t0 = a0
 7f0:	0040818c 	slli.w      	$t0, $t0, 0x0
 7f4:	29bfb2cc 	st.w        	$t0, $fp, -20(0xfec)
 7f8:	28bfb2cc 	ld.w        	$t0, $fp, -20(0xfec)
 7fc:	0040858c 	slli.w      	$t0, $t0, 0x1           # t0 = t0 * 2
 800:	0114a980 	movgr2fr.d  	$fa0, $t0
 804:	011d2001 	ffint.d.w   	$fa1, $fa0              # fa1 = 2 *a
 808:	1c00000c 	pcaddu12i   	$t0, 0                  # t0 = PC(0x808)
 80c:	02c7818c 	addi.d      	$t0, $t0, 480(0x1e0)    # t0 = t0 + 0x1e0 = 0x9e8
 810:	2b800180 	fld.d       	$fa0, $t0, 0            # fa0 = 从内存地址 0x9e8 载入浮点数 3.14159
 814:	01050020 	fmul.d      	$fa0, $fa1, $fa0
 818:	01191800 	fcvt.s.d    	$fa0, $fa0
 81c:	28c06076 	ld.d        	$fp, $sp, 24(0x18)
 820:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
 824:	4c000020 	jirl        	$zero, $ra, 0

0000000000000828 <area>:
 828:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
 82c:	29c06076 	st.d        	$fp, $sp, 24(0x18)
 830:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
 834:	0015008c 	move        	$t0, $a0
 838:	0040818c 	slli.w      	$t0, $t0, 0x0
 83c:	29bfb2cc 	st.w        	$t0, $fp, -20(0xfec)
 840:	28bfb2cd 	ld.w        	$t1, $fp, -20(0xfec)
 844:	28bfb2cc 	ld.w        	$t0, $fp, -20(0xfec)
 848:	001c31ac 	mul.w       	$t0, $t1, $t0
 84c:	0114a980 	movgr2fr.d  	$fa0, $t0
 850:	011d2001 	ffint.d.w   	$fa1, $fa0
 854:	1c00000c 	pcaddu12i   	$t0, 0
 858:	02c6518c 	addi.d      	$t0, $t0, 404(0x194)
 85c:	2b800180 	fld.d       	$fa0, $t0, 0
 860:	01050020 	fmul.d      	$fa0, $fa1, $fa0
 864:	01191800 	fcvt.s.d    	$fa0, $fa0
 868:	28c06076 	ld.d        	$fp, $sp, 24(0x18)
 86c:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
 870:	4c000020 	jirl        	$zero, $ra, 0

0000000000000874 <main>:
 874:	02ff4063 	addi.d      	$sp, $sp, -48(0xfd0)
 878:	29c0a061 	st.d        	$ra, $sp, 40(0x28)
 87c:	29c08076 	st.d        	$fp, $sp, 32(0x20)
 880:	02c0c076 	addi.d      	$fp, $sp, 48(0x30)
 884:	0015008c 	move        	$t0, $a0
 888:	29ff42c5 	st.d        	$a1, $fp, -48(0xfd0)
 88c:	0040818c 	slli.w      	$t0, $t0, 0x0
 890:	29bf72cc 	st.w        	$t0, $fp, -36(0xfdc)
 894:	0280280c 	addi.w      	$t0, $zero, 10(0xa)     # t0 = 10
 898:	29bfb2cc 	st.w        	$t0, $fp, -20(0xfec)
 89c:	24ffeecc 	ldptr.w     	$t0, $fp, -20(0xffec)
 8a0:	00150185 	move        	$a1, $t0                # a1 = t0
 8a4:	1c000004 	pcaddu12i   	$a0, 0                  # a0 = 0x8a4(PC) + 0x0
 8a8:	02c43084 	addi.d      	$a0, $a0, 268(0x10c)    # a0 = a0 + 0x10c = 0x9b0
 8ac:	57fdc7ff 	bl          	-572(0xffffdc4)	        # 670 <printf@plt>
 8b0:	24ffeecc 	ldptr.w     	$t0, $fp, -20(0xffec)
 8b4:	00150184 	move        	$a0, $t0
 8b8:	57ff2bff 	bl          	-216(0xfffff28)	        # 7e0 <circumf>
 8bc:	01192400 	fcvt.d.s    	$fa0, $fa0
 8c0:	0114b805 	movfr2gr.d  	$a1, $fa0               # a1 = fa0
 8c4:	1c000004 	pcaddu12i   	$a0, 0                  # a0 = PC(0x8c4) + 0x0
 8c8:	02c3f084 	addi.d      	$a0, $a0, 252(0xfc)     # a0 = a0 + 0xfc = 0x9c0
 8cc:	57fda7ff 	bl          	-604(0xffffda4)	        # 670 <printf@plt>
 8d0:	24ffeecc 	ldptr.w     	$t0, $fp, -20(0xffec)
 8d4:	00150184 	move        	$a0, $t0                # a0 = 10
 8d8:	57ff53ff 	bl          	-176(0xfffff50)	        # 828 <area>
 8dc:	01192400 	fcvt.d.s    	$fa0, $fa0
 8e0:	0114b805 	movfr2gr.d  	$a1, $fa0               # a1 = fa0
 8e4:	1c000004 	pcaddu12i   	$a0, 0
 8e8:	02c3d084 	addi.d      	$a0, $a0, 244(0xf4)     # a0 = 0x8e4 + 0xf4 = 0x9d8
 8ec:	57fd87ff 	bl          	-636(0xffffd84)	        # 670 <printf@plt>
 8f0:	0015000c 	move        	$t0, $zero
 8f4:	00150184 	move        	$a0, $t0                # a0 = 0
 8f8:	28c0a061 	ld.d        	$ra, $sp, 40(0x28)
 8fc:	28c08076 	ld.d        	$fp, $sp, 32(0x20)
 900:	02c0c063 	addi.d      	$sp, $sp, 48(0x30)
 904:	4c000020 	jirl        	$zero, $ra, 0

0000000000000908 <__libc_csu_init>:
 908:	02ff0063 	addi.d      	$sp, $sp, -64(0xfc0)    # sp = sp - 64
 90c:	29c0c077 	st.d        	$s0, $sp, 48(0x30)      # s0 -> sp + 48
 910:	29c08079 	st.d        	$s2, $sp, 32(0x20)      # s2 -> sp + 32
 914:	1c0000f7 	pcaddu12i   	$s0, 7(0x7)             # s0 = PC(0x914) + 0x7000
 918:	02d432f7 	addi.d      	$s0, $s0, 1292(0x50c)   # s0 = s0 + 0x50c = 1032(0x408)
 91c:	1c0000f9 	pcaddu12i   	$s2, 7(0x7)             # s2 = PC(0x91c) + 0x7000
 920:	02d43339 	addi.d      	$s2, $s2, 1292(0x50c)   # s2 = s2 + 0x50c = 1040(0x410)
 924:	0011df39 	sub.d       	$s2, $s2, $s0           # s2 = s2 - s0 = 0x8
 928:	29c0e061 	st.d        	$ra, $sp, 56(0x38)
 92c:	29c0a078 	st.d        	$s1, $sp, 40(0x28)
 930:	29c0607a 	st.d        	$s3, $sp, 24(0x18)
 934:	29c0407b 	st.d        	$s4, $sp, 16(0x10)
 938:	29c0207c 	st.d        	$s5, $sp, 8(0x8)
 93c:	00490f39 	srai.d      	$s2, $s2, 0x3           # s2 = s2 >>A 0x3 = 0x1
 940:	40003b20 	beqz        	$s2, 56(0x38)	        # 978 <__libc_csu_init+0x70>
 944:	001500dc 	move        	$s5, $a2
 948:	001500bb 	move        	$s4, $a1
 94c:	0015009a 	move        	$s3, $a0
 950:	00150018 	move        	$s1, $zero
 954:	03400000 	andi        	$zero, $zero, 0x0       # nop
 958:	260002ec 	ldptr.d     	$t0, $s0, 0             # t0 = 0x408
 95c:	00150386 	move        	$a2, $s5
 960:	00150365 	move        	$a1, $s4
 964:	00150344 	move        	$a0, $s3
 968:	02c00718 	addi.d      	$s1, $s1, 1(0x1)
 96c:	4c000181 	jirl        	$ra, $t0, 0             # goto 
 970:	02c022f7 	addi.d      	$s0, $s0, 8(0x8)
 974:	5fffe738 	bne         	$s2, $s1, -28(0x3ffe4)	# 958 <__libc_csu_init+0x50>
 978:	28c0e061 	ld.d        	$ra, $sp, 56(0x38)
 97c:	28c0c077 	ld.d        	$s0, $sp, 48(0x30)
 980:	28c0a078 	ld.d        	$s1, $sp, 40(0x28)
 984:	28c08079 	ld.d        	$s2, $sp, 32(0x20)
 988:	28c0607a 	ld.d        	$s3, $sp, 24(0x18)
 98c:	28c0407b 	ld.d        	$s4, $sp, 16(0x10)
 990:	28c0207c 	ld.d        	$s5, $sp, 8(0x8)
 994:	02c10063 	addi.d      	$sp, $sp, 64(0x40)
 998:	4c000020 	jirl        	$zero, $ra, 0
 99c:	03400000 	andi        	$zero, $zero, 0x0

00000000000009a0 <__libc_csu_fini>:
 9a0:	4c000020 	jirl        	$zero, $ra, 0           # goto ra
 9a4:	03400000 	andi        	$zero, $zero, 0x0       # nop
