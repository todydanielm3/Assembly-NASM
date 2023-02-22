#include <stdio.h>

extern unsigned char bcd_add(unsigned char a, unsigned char b);
extern unsigned char bcd_sub(unsigned char a, unsigned char b);

int main(int argc, char *argv[]) {
    unsigned char a = 0x12;
    unsigned char b = 0x34;
    unsigned char result;

    result = bcd_add(a, b);
    printf("Addition result: %x\n", result);

    result = bcd_sub(a, b);
    printf("Subtraction result: %x\n", result);

    return 0;
}

