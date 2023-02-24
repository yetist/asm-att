#div.w  rd, rj, rk               # x[rd] = sext(x[rj][31:0]  / x[rk][31:0])
#mod.w  rd, rj, rk               # x[rd] = sext(x[rj][31:0]  % x[rk][31:0])
#div.wu rd, rj, rk               # x[rd] = sext(x[rj][31:0]U / x[rk][31:0])
#mod.wu rd, rj, rk               # x[rd] = sext(x[rj][31:0]U % x[rk][31:0])
#div.d  rd, rj, rk               # x[rd] = sext(x[rj][63:0]  / x[rk][63:0])
#mod.d  rd, rj, rk               # x[rd] = sext(x[rj][63:0]  % x[rk][63:0])
#div.du rd, rj, rk               # x[rd] = sext(x[rj][63:0]U / x[rk][63:0])
#mod.du rd, rj, rk               # x[rd] = sext(x[rj][63:0]U % x[rk][63:0])

/*
# Python function: convert HEX to int
def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)        # compute negative value
    return val
twos_comps(0xf234567811223344,64)
*/

.text
    .globl main
main:
# 32 bit
    li.d          $s0, 0x12345678             # s0 = dec(305419896)
    li.w          $s1, 0x4
    li.w          $s2, 0x5

    div.w       $s3, $s0, $s1               # $s3 = (s0 / s1) = 305419896 / 4 = 0x48d159e
    div.w       $s4, $s0, $s2               # $s4 = (s0 / s2) = 305419896 / 5 = 0x3a4114b
    mod.w       $s5, $s0, $s1               # $s5 = (s0 % s1) = 305419896 % 4 = 0x0
    mod.w       $s6, $s0, $s2               # $s6 = (s0 % s2) = 305419896 % 5 = 0x1
    div.wu      $s7, $s0, $s1               # $s7 = (s0 / s1) = 305419896 / 4 = 0x48d159e
    div.wu      $s8, $s0, $s2               # $s8 = (s0 / s2) = 305419896 / 5 = 0x3a4114b
    bl          regdump

    mod.wu      $s5, $s0, $s1               # $s5 = (s0 % s1) = 305419896 % 4 = 0x0
    mod.wu      $s6, $s0, $s2               # $s6 = (s0 % s2) = 305419896 % 5 = 0x1
    bl          regdump

    li.d          $s0, 0xf2345678             # s0 = dec(-231451016)U; dec(4063516280)

    div.w       $s3, $s0, $s1               # $s3 = (s0 / s1) = -231451016 / 4 = -57862754(fc8d159e)
    div.w       $s4, $s0, $s2               # $s4 = (s0 / s2) = -231451016 / 5 = -46290203(0xfd3daae5)
    mod.w       $s5, $s0, $s1               # $s5 = (s0 % s1) = -231451016 % 4 = 0x0
    mod.w       $s6, $s0, $s2               # $s6 = (s0 % s2) = -231451016 % 5 = -1(0xffffffffffffffff)
    div.wu      $s7, $s0, $s1               # $s7 = (s0 / s1) = 4063516280 / 4 = 1015879070(0x3c8d159e)
    div.wu      $s8, $s0, $s2               # $s8 = (s0 / s2) = 4063516280 / 5 = 812703256(0x3070de18)
    bl          regdump

    mod.wu      $s5, $s0, $s1               # $s5 = (s0 % s1) = 4063516280 % 4 = 0x0
    mod.wu      $s6, $s0, $s2               # $s6 = (s0 % s2) = 4063516280 % 5 = 0x0
    bl          regdump

#############################################################

    li.d         $s0, 0x1234567811223344     # s0 = dec(1311768465155175236)
    div.d       $s3, $s0, $s1               # $s3 = (s0 / s1) = 1311768465155175236 / 4 = 0x48d159e04488cd1
    div.d       $s4, $s0, $s2               # $s4 = (s0 / s2) = 1311768465155175236 / 5 = 0x3a4114b36a070a7
    mod.d       $s5, $s0, $s1               # $s5 = (s0 % s1) = 1311768465155175236 % 4 = 0x0
    mod.d       $s6, $s0, $s2               # $s6 = (s0 % s2) = 1311768465155175236 % 5 = 0x1
    div.du      $s7, $s0, $s1               # $s7 = (s0 / s1) = 1311768465155175236 / 4 = 0x48d159e04488cd1
    div.du      $s8, $s0, $s2               # $s8 = (s0 / s2) = 1311768465155175236 / 5 = 0x3a4114b36a070a7
    bl          regdump

    mod.du      $s5, $s0, $s1               # $s5 = (s0 % s1) = 305419896 % 4 = 0x0
    mod.du      $s6, $s0, $s2               # $s6 = (s0 % s2) = 305419896 % 5 = 0x1
    bl          regdump

    li.d         $s0, 0xf234567811223344     # s0 = dec(17452669529651032900)U, dec(-994074544058518716)
    div.d       $s3, $s0, $s1               # $s3 = (s0 / s1) = -994074544058518716 / 4 = 0xfc8d159e04488cd1
    div.d       $s4, $s0, $s2               # $s4 = (s0 / s2) = -994074544058518716 / 5 = 0xfd3daae4d03a0a41
    mod.d       $s5, $s0, $s1               # $s5 = (s0 % s1) = -994074544058518716 % 4 = 0x0
    mod.d       $s6, $s0, $s2               # $s6 = (s0 % s2) = -994074544058518716 % 5 = -1(0xf)
    div.du      $s7, $s0, $s1               # $s7 = (s0 / s1) = 17452669529651032900 / 4 = 0x3c8d159e04488cd1
    div.du      $s8, $s0, $s2               # $s8 = (s0 / s2) = 17452669529651032900 / 5 = 0x3070de18036d3d74
    bl          regdump

    mod.du      $s5, $s0, $s1               # $s5 = (s0 % s1) = 17452669529651032900 % 4 = 0x0
    mod.du      $s6, $s0, $s2               # $s6 = (s0 % s2) = 17452669529651032900 % 5 = 0x0
    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
