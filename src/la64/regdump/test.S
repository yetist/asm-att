.text
    .globl main
main:
#    li          $s0, 0x12345678
#	bl	        regdump
#    ext.w.b     $s1, $s0
#	bl	        regdump
#    ext.w.h     $s1, $s0
#	bl	        regdump

    li          $s2, 0x11223344
    li          $s3, 0xAABBCCDD
    bytepick.w  $s4, $s2, $s3,3
	bl	        regdump

    ori         $a0, $zero, 8
    ori         $a7, $zero, 93
    syscall     0x0
