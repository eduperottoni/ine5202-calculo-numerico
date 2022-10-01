#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double arg) {
    return (exp(arg) - 2 * cos(arg));
}

int main(void) {
    int conta_ciclos = 0;
    double a = 0, b = 2, erro = 0.000000001;
    double xm = 2, fx = 1;

    while (fabs(fx) > erro) {
        conta_ciclos++;
        xm = a - (f(a) * (b - a))/(f(b) - f(a));
        fx = f(xm);
        if (fx * f(a) < 0)
            b = xm;
        else
            a = xm;
        
        printf("f(xm): %.16lf\n", fx);
    }

    printf("Raiz: %.16lf\n", xm);
    printf("f(raiz): %.16lf\n", fx);
    printf("Ciclos: %d\n", conta_ciclos);

    return 0;
}