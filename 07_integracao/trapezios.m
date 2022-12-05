clc
clear

% limites de integração
a = 0;
b = 1;

% número de subintervalos
n = 10;

% definindo altura de cada trapézio
h = (b - a) / n;
x = [a:h:b];

% função a ser integrada
y = exp(x);

s = 0;
for i = 2 : n
  s += y(i);
endfor

T = (h/2)*(y(1) + 2*s + y(n+1));

printf("Integral pela regra do trapézio = %.16f", T);