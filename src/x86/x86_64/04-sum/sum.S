# vim: set ts=4 sts=4 sw=4 expandtab:
.section .data
    # Define constants
    .equ num1, 100
    .equ num2, 50
    # initialize message
msg:
    .ascii "Sum is correct\n"

.section .text
    .global _start

## entry point
_start:
    movq $num1, %rax     # set num1's value to rax
    movq $num2, %rbx     # set num2's value to rbx
    addq %rbx, %rax      # get sum of rax and rbx, and store it's value in rax
    cmp  $150, %rax      # compare rax and 150
    jne  .exit           # go to .exit label if rax and 150 are not equal
    jmp  .rightSum       # go to .rightSum label if rax and 150 are equal

# Print message that sum is correct
.rightSum:
    mov     $1, %rax    ## write syscall
    mov     $1, %rdi    ## file descritor, standard output
    mov     $msg, %rsi  ## message address
    mov     $15, %rdx   ## length of message
    syscall             ## call write syscall
    jmp .exit           # exit from program

# exit procedure
.exit:
    mov    $60, %rax    # exit syscall
    mov    $0, %rdi     # exit code
    syscall             # call exit syscall
