section .data
    format db 'Argumentos: %s', 0
section .text
    global print_argumentos
print_argumentos:
    push rbp
    mov rbp, rsp
    mov rdi, [rbp + 8]
    mov rsi, format
    xor rax, rax
    call printf
    pop rbp
    ret