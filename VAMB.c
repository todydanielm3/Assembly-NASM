#include <stdio.h>
#include <stdlib.h>

extern char *get_variavel_ambiente(const char *name);

int main(int argc, char *argv[], char *getAMBIENTE[]) {
    char *path = get_variavel_ambiente("PATH");
    if (path == NULL) {
        printf("PATH Variavel de ambiente não declarada\n");
    } else {
        printf("PATH: %s\n", path);
    }
    return 0;