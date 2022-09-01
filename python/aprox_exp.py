from math import exp

#entrada
x = 2
erro_admitido = 0.000001 #1*10^(-6)
#valor exato
exato = exp(x)
#variáveis
soma = potencia = fatorial = contador = 1
erro = abs(exato - soma)

while erro > erro_admitido:
    potencia *= x
    fatorial *= contador
    soma += (potencia/fatorial)
    erro = abs(exato - soma)
    contador += 1

print(f'Soma: {soma}')
print(f'Nº de termos: {contador}')