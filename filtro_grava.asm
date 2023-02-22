section .data
    ; Definição de constantes
    input_file db 'arquivo_entrada.txt',0
    output_file db 'arquivo_saida.txt',0
    buffer_size equ 1024

section .bss
    ; Reserva de espaço para variáveis
    buffer resb buffer_size
    ; O buffer é usado para armazenar temporariamente os dados lidos do arquivo de entrada

section .text
    global _start

_start:
    ; Abre o arquivo de entrada
    mov eax, 5 ; sys_open
    mov ebx, input_file
    mov ecx, 0 ; O_RDONLY
    int 0x80
    mov esi, eax ; O retorno do sys_open contém o handle do arquivo

    ; Cria o arquivo de saída
    mov eax, 5 ; sys_open
    mov ebx, output_file
    mov ecx, 0x0212 ; O_CREAT | O_WRONLY | O_TRUNC
    mov edx, 1644 ; Permissões do arquivo
    int 0x80
    mov edi, eax ; O retorno do sys_open contém o handle do arquivo

loop:
    ; Lê dados do arquivo de entrada
    mov eax, 3 ; sys_read
    mov ebx, esi ; handle do arquivo de entrada
    mov ecx, buffer ; buffer onde os dados serão armazenados
    mov edx, buffer_size ; tamanho máximo do buffer
    int 0x80
    cmp eax, 0 ; se eax é 0, significa que chegamos ao fim do arquivo
    je end_loop

    ; Aplica o filtro
    mov esi, buffer ; Aponta o registrador esi para o início do buffer
    mov edi, buffer ; Aponta o registrador edi para o início do buffer
    mov ecx, eax ; ecx contém o número de bytes lidos na chamada anterior a sys_read
    cld ; Define a direção do movsb para esquerda-direita
    rep movsb ; Move ecx bytes de dados do buffer origem (esi) para o buffer destino (edi)

    ; Escreve os dados filtrados no arquivo de saída
    mov eax, 4 ; sys_write
    mov ebx, edi ; handle do arquivo de saída
    mov ecx, buffer ; buffer contendo os dados filtrados
    mov edx, eax ; edx contém o número de bytes lidos na chamada anterior a sys_read
    int 0x80
    jmp loop

end_loop:
    ; Fecha os arquivos
    mov eax, 6 ; sys_close
    mov ebx, esi ; handle do arquivo de entrada
    int 0x80
    mov eax, 6 ; sys_close
    mov ebx, edi ; handle do arquivo de saída
    int 0x80

    ; Termina o programa
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Código de retorno
    int 0x80

