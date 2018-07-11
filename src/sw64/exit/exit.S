# exit(3)
	.set noreorder
#	.set volatile
	.set noat
#.set nomacro
	.arch sw6a
	.text
	.align 2
    .include "regdef.inc"
	.globl main
	.ent main
main:
	ldih gp, 0(pv)		!gpdisp!1           # ldih gp, 0(pv)
	ldi  gp, 0(gp)		!gpdisp!1           # ldi gp, 0(gp)

	ldi  sp, -16(sp)                        # ldi sp, -16(sp)
	stl  ra, 0(sp)                          # stl ra, 0(sp)
	stl  fp, 8(sp)                          # stl fp, 8(sp)
	mov  sp, fp                             # mov sp, fp

	ldi  a0, 3
	ldl  pv, exit(gp)	!literal!2          # ldl pv, exit(gp)
	call ra, (pv), exit
	.end main
