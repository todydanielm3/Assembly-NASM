section .text
    global bcd_add
    global bcd_sub

bcd_add:

    push ebp          ; Salva o valor de ebp na pilha
    mov ebp, esp      ; Atribui esp a ebp para criar um frame de pilha

    xor eax, eax      ; Zera o registrador eax
    mov al, [ebp+8]   ; Move o primeiro argumento (num1) para al
    add al, [ebp+12]  ; Adiciona o segundo argumento (num2) a al
    add al, 6         ; Adiciona 6 para ajustar o resultado para BCD
    aaa               ; Ajusta o resultado para BCD
    mov esp, ebp      ; Remove o frame de pilha
    pop ebp           ; Restaura o valor de ebp
    ret               ; Retorna o valor da soma em BCD

bcd_sub:
    
    push ebp          ; Salva o valor de ebp na pilha
    mov ebp, esp      ; Atribui esp a ebp para criar um frame de pilha

    xor eax, eax      ; Zera o registrador eax
    mov al, [ebp+8]   ; Move o primeiro argumento (num1) para al
    sub al, [ebp+12]  ; Subtrai o segundo argumento (num2) de al
    sub al, 6         ; Subtrai 6 para ajustar o resultado para BCD
    das               ; Ajusta o resultado para BCD
    mov esp, ebp      ; Remove o frame de pilha
    pop ebp           ; Restaura o valor de ebp
    ret               ; Retorna o valor da subtração em BCD
