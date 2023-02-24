/*
ext.w.b rd, rj                  # x[rd] = sext(x[rj][7:0])
ext.w.h rd, rj                  # x[rd] = sext(x[rj][15:0])
*/

.text
    .globl main
main:
    li.w          $s0, 0xa0f1			# equ: lu12i.w $s0, 0xa; ori $s0, $s0, 0xf1
    li.w          $s1, 0xf284			# equ: lu12i.w $s1, 0xf; ori $s1, $s1, 0x284
    li.w          $s2, 0x12e3			# equ: lu12i.w $s2, 0x1; ori $s2, $s2, 0x2e3

    ext.w.b     $s5, $s0
    ext.w.b     $s6, $s1
    ext.w.b     $s7, $s2
    bl          regdump

	/*
	   [1]    s0=0xa0f1				s1=0xf284				s2=0x12e3
	   [1]    s5=0xfffffffffffffff1	s6=0xffffffffffffff84	s7=0xffffffffffffffe3
	 */

    ext.w.h     $s5, $s0
    ext.w.h     $s6, $s1
    ext.w.h     $s7, $s2
    bl          regdump
	/*
	   [2]    s0=0xa0f1	s1=0xf284	s2=0x12e3
	   [2]    s5=0xffffffffffffa0f1	s6=0xfffffffffffff284	s7=0x12e3
	 */

    li.w          $s0, 0x135a0f1			# equ: lu12i.w $s0, 0x135a; ori $s0, $s0, 0xf1
    li.w          $s1, 0x135f284			# equ: lu12i.w $s1, 0x135f; ori $s1, $s1, 0x283
    li.w          $s2, 0x13512e3			# equ: lu12i.w $s2, 0x1351; ori $s2, $s2, 0x2e3

    ext.w.h     $s5, $s0
    ext.w.h     $s6, $s1
    ext.w.h     $s7, $s2

    bl          regdump
	/*
	   [2]    s0=0x135a0f1	s1=0x135f284	s2=0x13512e3
	   [2]    s5=0xffffffffffffa0f1	s6=0xfffffffffffff284	s7=0x12e3
	 */

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
