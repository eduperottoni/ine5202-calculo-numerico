#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double arg) {
    // return exp(arg) * sin(arg) - 1;
    return exp(arg) - 2 * cos(arg);
}

double df(double arg) {
    // return exp(arg) * sin(arg) + exp(arg) * cos(arg);
    return exp(arg) + 2 * sin(arg); 
}

int main(void) {
    int conta_ciclos = 0; 
    double erro = 0.000000001;
    double a = 0, b = 2;
    double x0 = 1, xk = 0, fx0 = f(x0);

    while (fx0 > erro) {
        conta_ciclos++;
        xk = x0 - fx0 / df(x0);

        printf("xk = %.16lf\n", xk);
        printf("f(xk) = %.16lf\n", f(xk));

        fx0 = f(xk);
        x0 = xk;
    }

    printf("Operação finalizada!\n");
    printf("xk (raiz) : %.16lf\n", xk);
    printf("Número de iterações: %d\n", conta_ciclos);
}