#include <stdio.h>
#include <stdlib.h>

extern void print_argumentos(const char *arg);

int main(int argc, char *argv[], char *getAMBIENTE[]) {
    if (argc < 2) {
        printf("Utilize o formato: busca <argumento>\n");
        return 1;
    }
    print_argumentos(argv[1]);
    return 0;
}
