/*
 * Print environment
 * while (*envp != NULL)
 * {
 *     printf ("%s\n",*envp);
 *     envp++;
 * }
 */
    .text
    .align  1
    .globl  main
    .type   main, @function
main:
    addi    sp,sp,-16
    sd      ra,8(sp)
    sd      a2,0(sp)

    j       2f
1:
    ld      a0,0(sp)        # puts(*envp)
    ld      a0,0(a0)
    call    puts

    ld      t0,0(sp)        # envp++
    addi    t0,t0,8
    sd      t0,0(sp)

2:
    ld      t0,0(sp)        # *envp == NULL?
    ld      t0,0(t0)
    bnez    t0, 1b

    ld      ra,8(sp)
    addi    sp,sp,16
    jr      ra
