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
    double fa = f(a), fb = f(b);

    while (fabs(fx) > erro) {
        conta_ciclos++;
        xm = a - (fa * (b - a))/(fb - fa);
        fx = f(xm);
        if (fx * fa < 0) {
            double pb = fa / (fa + fx);
            b = xm;
            fb = pb * fb;
        }
        else {
            double pa = fb / (fb + fx);
            a = xm;
            fa = pa * fa;
        }
        
        printf("f(xm): %.16lf\n", fx);
        printf("a: %.16f | b: %.16f\n", a, b);
    }

    printf("Raiz: %.16lf\n", xm);
    printf("f(raiz): %.16lf\n", fx);
    printf("Ciclos: %d\n", conta_ciclos);

    return 0;
}