section .data
    input_file db 'input.bin', 0
    output_file db 'output.bin', 0
    mode db 'wb', 0
    buf db 8192 dup (0)

section .bss
    file_handle resb 8

section .text
    global negate_file

negate_file:
    push rbp
    mov rbp, rsp

    ; abre o arquivo de entrada
    mov rdi, input_file
    mov rsi, 0 ; read-only mode
    call fopen
    mov [file_handle], rax

    ; verifica se o arquivo foi aberto com sucesso
    cmp rax, 0
    jz end

    ; lê e nega os dados do arquivo
    .read:
   
 ; lê os dados do arquivo
    mov rdi, [file_handle]
    mov rsi, buf
    mov rdx, 8192
    call fread
    test rax, rax
    jz end

    ; nega os dados
    mov rcx, rax
    .negate:
         xor byte [rsi + rcx - 1], 1
        dec rcx
        jnz negate

    ; escreve os dados negados no arquivo de saída
    mov rdi, output_file
    mov rsi, mode
    call fopen
    cmp rax, 0
    jz end
    mov rdi, rax
    mov rsi, buf
    mov rdx, rax
    call fwrite
    jmp .read

    ; fecha o arquivo de entrada e de saída
    end:
    mov rdi, [file_handle]
    call fclose

    mov rdi, rax
    call fclose

    pop rbp
ret
