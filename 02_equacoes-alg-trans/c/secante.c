#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double arg) {
    // return exp(arg) * sin(arg) - 1;
    return exp(arg) - 2 * cos(arg);
}

int main(void) {
    int conta_ciclos = 0; 
    double erro = pow(10, -8);
    double a = 0, b = 2;
    double x0 = 1, x1 = 0, xk = 0, fx0 = f(x0), fx1 = f(x1);

    while (fabs(fx1) > erro) {
        conta_ciclos++;
        xk = x0 - (fx0 * (x1 - x0) / (fx1 - fx0));

        printf("xk = %.16lf\n", xk);
        printf("f(xk) = %.16lf\n", f(xk));

        x0 = x1;
        fx0 = fx1;
        fx1 = f(xk);
        x1 = xk;
    }

    printf("Operação finalizada!\n");
    printf("xk (raiz) : %.16lf\n", xk);
    printf("Número de iterações: %d\n", conta_ciclos);
}