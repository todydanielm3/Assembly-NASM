section .text
    global soma

soma:
    push rbp
    mov rbp, rsp
    mov eax, [rbp + 8]
    add eax, [rbp + 12]
    pop rbp
    ret

