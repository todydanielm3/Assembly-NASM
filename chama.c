#include <stdio.h>

extern int soma(int a, int b);

int main(int argc, char *argv[]) {
    int result = soma(5, 7);
    printf("Soma =  %d\n", result);
    return 0;
}

