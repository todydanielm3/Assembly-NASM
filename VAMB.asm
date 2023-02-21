section .text
    global get_variavel_ambiente

get_variavel_ambiente:
    push rbp
    mov rbp, rsp
    mov rdi, [rbp + 8]
    call getAMBIENTE
    mov [rbp - 8], rax
    pop rbp
    ret