.section .data
	.equ SYS_WRITE, 1
	.equ STD_IN,    1
	.equ SYS_EXIT, 60
	.equ EXIT_CODE, 0

WRONG_ARGC:
    .asciz "Must be two command line argument\n"
    len = . - WRONG_ARGC                    # 字串长度
NEW_LINE:
    .string "\n"

.section    .text
    .globl _start
_start:
    pop    %rcx
    cmp    $0x3,    %rcx        # 参数个数如果不是3，则跳到 argcError
    jne    argcError
    add    $8,      %rsp
    pop    %rsi
    callq  str_to_int
    mov    %rax,    %r10
    pop    %rsi
    callq  str_to_int
    mov    %rax,    %r11
    add    %r11,    %r10
    mov    %r10,    %rax
    xor    %r12,    %r12
    jmp    int_to_str

argcError:
   	mov    $SYS_WRITE,  %rax
   	mov    $1,          %rdi
   	movabs $WRONG_ARGC, %rsi
   	mov    $len,        %rdx
   	syscall
   	jmp    exit

int_to_str:
    mov    $0x0,%rdx
    mov    $10, %rbx
    div    %rbx
    add    $48, %rdx
    push   %rdx
    inc    %r12
    cmp    $0x0,%rax
    jne    int_to_str
    jmp    print

str_to_int:
    xor    %rax,    %rax
    mov    $10,     %rcx

next:
    cmpb   $0,    (%rsi)
    je     return_str
    mov    (%rsi),  %bl
    sub    $48,     %bl
    mul    %rcx
    add    %rbx,    %rax
    inc    %rsi
    jmp    next

return_str:
    retq

print:
    mov    $0x1,%rax
    mul    %r12
    mov    $0x8,%r12d
    mul    %r12
    mov    %rax,%rdx

    mov    $SYS_WRITE,  %rax
    mov    $STD_IN,     %rdi
    mov    %rsp,        %rsi
    syscall
    jmp    printNewline

printNewline:
  	mov    $SYS_WRITE,%rax
  	mov    $STD_IN,   %rdi
  	movabs $NEW_LINE, %rsi
  	mov    $1,%rdx
  	syscall
  	jmp    exit

exit:
    mov    $SYS_EXIT, %rax
    mov    $EXIT_CODE, %rdi
    syscall
