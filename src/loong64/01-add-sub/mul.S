# mul.w mulh.w mulh.wu
# mul.d mulh.d mulh.du
# mulw.d.w mulw.d.wu

.text
    .globl main
main:
# 32 bit
    li.w          $s0, 0x12345678
    li.w          $s1, 0xfff
    li.w          $s2, 0x10e

    mul.w       $s3, $s0, $s1               # $s3 = (s0 * s1) & 0xffffffff = 0x123 3333 2988 & 0xffffffff = 0x33332988
    mul.w       $s4, $s0, $s2               # $s4 = (s0 * s2) & 0xffffffff = 0x013 3333 3290 & 0xffffffff = 0x33333290
    mulh.w      $s5, $s0, $s1               # $s5 = (s0 * s1) >> 8 = 0x123 3333 2988 >> 8 = 0x123
    mulh.w      $s6, $s0, $s2               # $s6 = (s0 * s2) >> 8 = 0x013 3333 3290 >> 8 = 0x13
    mulh.wu     $s7, $s0, $s1               # $s7 = (s0 * s1) >> 8 = 0x123 3333 2988 >> 8 = 0x123
    mulh.wu     $s8, $s0, $s2               # $s8 = (s0 * s2) >> 8 = 0x013 3333 3290 >> 8 = 0x13
    bl          regdump

    li.d         $s0, 0x1234567812345678
    li.w          $s1, 0x3a15ff
    li.w          $s2, 0x11223344
    mul.d       $s3, $s0, $s1               # $s3 = (s0 * s1) & 0xffff ffff ffff ffff = 0x4216c 046e 1af4 0469 f988 & 0xffff ffff ffff ffff = 0x46e1af40469f988
    mul.d       $s4, $s0, $s2               # $s4 = (s0 * s2) & 0xffff ffff ffff ffff = 0x0137 e856 b848 c836 b710 dfe0 & 0xffff ffff ffff ffff = 0xb848c836b710dfe0
    mulh.d      $s5, $s0, $s1               # $s5 = (s0 * s1) >> 16 = 0x4216c 046e 1af4 0469 f988 >> 16 = 0x4216c
    mulh.d      $s6, $s0, $s2               # $s6 = (s0 * s2) >> 16 = 0x0137 e856 b848 c836 b710 dfe0 >> 16 = 0x137 e856
    mulh.du     $s7, $s0, $s1               # $s7 = (s0 * s1) >> 16 = 0x4216c 046e 1af4 0469 f988 >> 16 = 0x4216c
    mulh.du     $s8, $s0, $s2               # $s8 = (s0 * s2) >> 16 = 0x0137 e856 b848 c836 b710 dfe0 >> 16 = 0x137 e856
    bl          regdump

    li.w          $s0, 0x12345678
    mulw.d.w    $s3, $s0, $s1               # $s3 = (s0 * s1) = 0x4216c0469f988
    mulw.d.w    $s4, $s0, $s2               # $s4 = (s0 * s1) = 0x137e856b710dfe0
    mulw.d.wu   $s5, $s0, $s1               # $s5 = (x[s0]U * x[s1]U) = 0x4216c0469f988
    mulw.d.wu   $s6, $s0, $s2               # $s6 = (x[s0]U * x[s1]U) = 0x137e856b710dfe0
    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
