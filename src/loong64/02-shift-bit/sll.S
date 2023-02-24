/*
- sll.w                     : Shift Left Logical Word
- srl.w                     : Shift Right Logical Word
- sra.w                     : Shift Right Arithmetic Word
- rotr.w                    : Rotate Right Word ???
- slli.w                    : Shift Left Logical Immediate Word
- srli.w                    : Shift Right Logical Immediate Word
- srai.w                    : Shift Right Arithmetic Immediate Word
- rotri.w                   : Rotate Right Immediate Word ???

- sll.d                     : Shift Left Logical Doubleword
- srl.d                     : Shift Right Logical Doubleword
- sra.d                     : Shift Right Arithmetic Doubleword
- rotr.d                    : Rotate Right Doubleword ???
- slli.d                    : Shift Left Logical Immediate Doubleword
- srli.d                    : Shift Right Logical Immediate Doubleword
- srai.d                    : Shift Right Arithmetic Immediate Doubleword
- rotri.d                   : Rotate Right Immediate Doubleword ???
*/

.text
    .globl main
main:
    li.w          $s0, 0xf2345678             # $s0 = 0b1111 0010 0011 0100 0101 0110 0111 1000 = dec(4063516280)U, -231451016
    li.w          $s1, 0x2                    # $s1 = 2

    sll.w       $s2, $s0, $s1               # $s2 = s0 << s1 = 0b1100 1000 1101 0001 0101 1001 1110 0000  = -925804064(0xc8d159e0); 逻辑左移，最低位补0
    srl.w       $s3, $s0, $s1               # $s3 = s0 >> s1 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 逻辑右移，最高位补0
    sra.w       $s4, $s0, $s1               # $s4 = s0 >>A s1 = 0b1111 1100 1000 1101 0001 0101 1001 1110 = -57862754 (0xfc8d159e); 算术右移，最高位补符号位
    rotr.w      $s5, $s0, $s1               # $s5 = s0 >>R s2 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 循环右移，最低位移到最高位
    bl          regdump

    slli.w      $s2, $s0, 0x2               # $s2 = s0 << s1 = 0b1100 1000 1101 0001 0101 1001 1110 0000  = -925804064(0xc8d159e0); 逻辑左移，最低位补0
    srli.w      $s3, $s0, 0x2               # $s3 = s0 >> s1 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 逻辑右移，最高位补0
    srai.w      $s4, $s0, 0x2               # $s4 = s0 >>A s1 = 0b1111 1100 1000 1101 0001 0101 1001 1110 = -57862754 (0xfc8d159e); 算术右移，最高位补符号位
    rotri.w     $s5, $s0, 0x2               # $s5 = s0 >>R s2 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 循环右移，最低位移到最高位
    bl          regdump

    li.d         $s0, 0xf234567811223344     # $s0 = 0b1111 0010 0011 0100 0101 0110 0111 1000 = dec(4063516280)U, -231451016
    sll.d       $s2, $s0, $s1               # $s2 = s0 << s1 = 0b1100 1000 1101 0001 0101 1001 1110 0000  = -925804064(0xc8d159e0); 逻辑左移，最低位补0
    srl.d       $s3, $s0, $s1               # $s3 = s0 >> s1 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 逻辑右移，最高位补0
    sra.d       $s4, $s0, $s1               # $s4 = s0 >>A s1 = 0b1111 1100 1000 1101 0001 0101 1001 1110 = -57862754 (0xfc8d159e); 算术右移，最高位补符号位
    rotr.d      $s5, $s0, $s1               # $s5 = s0 >>R s2 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 循环右移，最低位移到最高位
    bl          regdump

    slli.d      $s2, $s0, 0x2               # $s2 = s0 << s1 = 0b1100 1000 1101 0001 0101 1001 1110 0000  = -925804064(0xc8d159e0); 逻辑左移，最低位补0
    srli.d      $s3, $s0, 0x2               # $s3 = s0 >> s1 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 逻辑右移，最高位补0
    srai.d      $s4, $s0, 0x2               # $s4 = s0 >>A s1 = 0b1111 1100 1000 1101 0001 0101 1001 1110 = -57862754 (0xfc8d159e); 算术右移，最高位补符号位
    rotri.d     $s5, $s0, 0x2               # $s5 = s0 >>R s2 = 0b0011 1100 1000 1101 0001 0101 1001 1110 = 1015879070(0x3c8d159e); 循环右移，最低位移到最高位
    bl          regdump

# exit(0)
    li.w          $a0, 0
    bl          %plt(exit)
