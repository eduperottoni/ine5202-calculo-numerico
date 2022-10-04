#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void) {
    double erro = pow(10, -8);
    double coeficientes[] = {1, 0, 2, -1};
    double degree = 3;
    int conta_ciclos = 0;

    double b = coeficientes[0], c = b;
    double xk = 1, r = 1;

    while (fabs(r) > erro) {
        conta_ciclos++;
        double b = coeficientes[0], c = b;
        for (int i = 1; i < degree + 1; i++) {
            b = b * xk + coeficientes[i];
            if (i < degree)
                c = c * xk + b;
        }

        xk = xk - b / c;
        r = b;

        printf("R = %.16f\n", b);
        printf("R1 = %.16f\n", c);
        printf("xk = %.16f\n", xk);
    }

    printf("Operação finalizada!\n");
    printf("xk = %.16f\n", xk);
    printf("p(xk) = %.16f\n", r);
    printf("Ciclos = %d", conta_ciclos);
    return 0;
}