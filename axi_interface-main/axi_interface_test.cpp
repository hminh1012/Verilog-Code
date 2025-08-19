#include <stdio.h>

void example(char *a, char *b, char *c)
{
    char a;
    char b;
    char c;
    char d;
    char sw_result;

    printf("HLS AXI_Lite Example\n");
    printf("Function c += a + b\n");
    printf("Initial value a = 5, b = 10, c = 0\n");

    a = 5;
    b = 10;
    c = 0;
    d = 0;

    example(&a, &b, &c);
    d += a + b;
    printf("HW result = %d\n", c);
    printf("SW result = %d\n", d);

    if(d == c){
        printf("Success SW and HW result match\n");
        return 0;


    }
    else{
        printf("ERROR SW and HW result mismatch\n");
        return 1;
    }
}