#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double arg) {
    // return exp(arg) * sin(arg) - 1; 
    return exp(arg) - 2 * cos(arg);
}

int main(void) {
    int conta_ciclos = 0;
    double a = 0, b = 2, erro = pow(10, -8);
    double xm = 2, fxm = 1;
    double fa = f(a), fb = f(b);

    while (fabs(fxm) > erro) {
        conta_ciclos++;
        xm = (a * fb - b * fa) / (fb - fa);
        fxm = f(xm);

        if (fxm * fa < 0) {
            b = xm;
            fb = fxm;
        } else {
            a = xm;
            fa = fxm;
        }
        
        printf("a: %.16f | b: %.16f | f(xm): %.16f\n", a, b, fxm);
    }

    printf("Operação finalizada!\n");
    printf("xm (raiz): %.16lf\n", xm);
    printf("f(xm): %.16lf\n", fxm);
    printf("Ciclos: %d\n", conta_ciclos);

    return 0;
}