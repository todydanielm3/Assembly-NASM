section .data
    num1 dd 10 ;atribuindo valores no registrador
    num2 dd 5
    result dd 0 ;resultado iniciado em 0

section .text
    global _start

_start:
    ; realiza a soma
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax

    ; realiza a subtração
    mov eax, [num1]
    sub eax, [num2]
    mov [result], eax

    ; termina o programa
    mov eax, 1 ; number of system call (sys_exit)
    xor ebx, ebx ; exit status
    int 0x80 ; call kernel
