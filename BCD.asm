section .text

    global soma_BINARIA ; 
    global sub_BINARIA  ;

soma_BINARIA:
    push rbp
    mov rbp, rsp
    mov al, [rbp + 8]
    add al, [rbp + 12]
    aaa ;AJUSTE DE ADICAO ASCII
    mov [rbp -8], al
    pop rbp
    ret
sub_BINARIA:
    push rbp
    mov rbp, rsp
    mov al, [rbp + 8]
    sub al, [rbp + 12]
    daa ;ACOMULADOR DE AJUSTE DE SUBTRACAO ASCII
    mov [rbp -8], al
    pop rbp
    ret