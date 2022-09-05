#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
    //entrada
    int x = 2, contador = 1;
    //erro admitido
    double erro_admitido = 0.000001;
    //valor exato
    double exato = exp(x);
    //variáveis
    double soma = 1;
    double potencia = 1, fatorial = 1;
    double erro = fabs(exato - soma);
    
    while (erro > erro_admitido){
        potencia = potencia * x;
        fatorial = fatorial * contador;
        soma = soma + ((double)potencia / fatorial);
        erro = fabs(exato - soma);
        //printf("erro na %d iteracao: %f\n", contador, erro);
        contador++;
    }

    printf("Soma: %.16lf\n", soma);
    printf("N de termos: %d", contador);

    return 0;
}