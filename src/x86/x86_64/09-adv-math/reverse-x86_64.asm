;;
;; initialized data
;;
section .data
	SYS_WRITE	equ 1
	STD_OUT		equ 1
	SYS_EXIT	equ 60
	EXIT_CODE	equ 0

	NEW_LINE	db 0xa
	INPUT		db "Hello world!"

;;
;; non initialized data
;;
section .bss
	OUTPUT	resb 1

;;
;; code
;;
section .text
;;
;; Print result string
;;
global	printResult
printResult:
	mov	rdx, rdi
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, OUTPUT
	syscall
	jmp	printNewLine

;;
;; Print new line
;;
printNewLine:
	mov	rax, SYS_WRITE
	mov	rdi, STD_OUT
	mov	rsi, NEW_LINE
	mov	rdx, 1
	syscall
	jmp	exit

;;
;; Exit from program
;;
exit:
	;; syscall number
	mov	rax, SYS_EXIT
	;; exit code
	mov	rdi, EXIT_CODE
	;; call sys_exit
	syscall
