section .data
    ; Define constants
    num1:   equ 100
    num2:   equ 50
    ; initialize message
    msg:    db "Sum is correct", 0x0a

section .text

    global _start

;; entry point
_start:
    mov rax, num1		; set num1's value to rax
    mov rbx, num2		; set num2's value to rbx
    add rax, rbx		; get sum of rax and rbx, and store it's value in rax
    cmp rax, 150		; compare rax and 150
    jne .exit			; go to .exit label if rax and 150 are not equal
    jmp .rightSum		; go to .rightSum label if rax and 150 are equal

; Print message that sum is correct
.rightSum:
    mov     rax, 1		;; write syscall
    mov     rdi, 1		;; file descritor, standard output
    mov     rsi, msg	;; message address
    mov     rdx, 15		;; length of message
    syscall				;; call write syscall
    jmp .exit			; exit from program

; exit procedure
.exit:
    mov    rax, 60		; exit syscall
    mov    rdi, 0		; exit code
    syscall				; call exit syscall
