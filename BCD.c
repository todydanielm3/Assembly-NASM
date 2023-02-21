#include <stdio.h>

extern unsigned char soma_BINARIA(unsigned char a, unsigned char b);
extern unsigned char sub_BINARIA(unsigned char a, unsigned char b);

int main(int argc, char *argv[]){
    unsigned char a = 0x12;
    unsigned char b = 0x34;
    unsigned char result;

    result = soma_BINARIA(a,b);
    printf("SOMA = %x\n",result);

    result = sub_BINARIA(a,b);
    print("SUB = %x\n",result);
    

    return 0;