# Assembly-NASM
Processos basicos em C +  Assembly 

Para debugar um programa em NASM usando GDB no Linux, você pode seguir os seguintes passos:

Compile o programa com a opção de depuração -g para incluir informações de depuração no executável.
$ nasm -f elf64 -g -o programa.o programa.nasm
$ ld -o programa programa.o

Execute o GDB com o comando:
$ gsb programa

## Para os programas com passagem de parâmetros via linha de comando em NASM a partir de um programa C
$ nasm -f elf64 -o program.o program.asm
$ gcc -c main.c
$ gcc -o program main.o program.o
