#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double arg) {
    return exp(arg) - 2 * cos(arg);
    // return exp(x) * sin(x) - 1;
}

int main(void) {
    int conta_ciclos = 0;
    double a = 0, b = 2, erro = pow(10, -8);
    double xm = 2, fxm = 1, fa = f(a), fb = f(b);

    while (fabs(fxm) > erro) {
        conta_ciclos++;
        xm = (a + b) / 2;
        fxm = f(xm);

        if (fxm * f(a) < 0) {
            b = xm;
            fb = fxm;
        }
        else {
            a = xm;
            fa = fxm;
        }
        
        printf("f(xm): %.16lf\n", fxm);
        printf("xm: %.16lf\n", xm);
    }

    printf("xm(raiz): %.16lf\n", xm);
    printf("f(xm): %.16lf\n", fxm);
    printf("Ciclos: %d\n", conta_ciclos);

    return 0;
}