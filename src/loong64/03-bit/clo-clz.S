/*
clo.w rd, rj                    # x[rd] = count_of_0x1_from_leading(x[rj][31:0])
clz.w rd, rj                    # x[rd] = count_of_0x0_from_leading(x[rj][31:0])
cto.w rd, rj                    # x[rd] = count_of_0x1_from_tailing(x[rj][31:0])
ctz.w rd, rj                    # x[rd] = count_of_0x0_from_tailing(x[rj][31:0])
clo.d rd, rj                    # x[rd] = count_of_0x1_from_leading(x[rj][63:0])
clz.d rd, rj                    # x[rd] = count_of_0x0_from_leading(x[rj][63:0])
cto.d rd, rj                    # x[rd] = count_of_0x1_from_tailing(x[rj][63:0])
ctz.d rd, rj                    # x[rd] = count_of_0x0_from_tailing(x[rj][63:0])
*/

.text
    .globl main
main:
    li.w          $s0, 0xa0f1			# equ: lu12i.w $s0, 0xa; ori $s0, $s0, 0xf1
    li.w          $s1, 0xf284			# equ: lu12i.w $s1, 0xf; ori $s1, $s1, 0x284
    li.w          $s2, 0x12e3			# equ: lu12i.w $s2, 0x1; ori $s2, $s2, 0x2e3

    clo.w       $s5, $s0
    clz.w       $s6, $s1
    cto.w       $s7, $s2
    ctz.w       $s8, $s2
    bl          regdump

	/*
	   [1] S: s0=0xa0f1	s1=0xf284	s2=0x12e3	s3=(nil)	s4=(nil)
	   [1]    s5=(nil)	s6=0x10	s7=0x2	s8=(nil)
	 */
	/*
	   [2]    s0=0x135a0f1	s1=0x135f284	s2=0x13512e3
	   [2]    s5=0xffffffffffffa0f1	s6=0xfffffffffffff284	s7=0x12e3
	 */

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
