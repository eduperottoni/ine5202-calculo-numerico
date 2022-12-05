clear
clc
% limites de intergração
a = 0
b = 1
n_par = 6;
% distância de cada subintervalo
h = (b - a) / n_par
% vetor de pontos em x
x = [a:h:b]
% vetor de pontos em y
y = exp(x)

soma_pares = 0;
for i = 1 : n_par / 2
  soma_pares += y(2 * i);
endfor
soma_impares = 0;
for i = 1 : (n_par / 2 - 1)
   soma_impares += y(2 * i + 1);
endfor

S = (h/3) * (y(1) + 4 * soma_pares + 2 * soma_impares + y(n_par + 1));

printf("| Aproximação da integral por Simpson = %.16f", S);