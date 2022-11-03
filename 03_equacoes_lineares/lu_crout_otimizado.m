clear
clc

# Dados de entrada
# 1 - Matriz de coeficientes
# 2 - Matriz de termos independentesP

a = [4 2 3; 2 -4 -1; -1 1 4]; # ; -> dentro de vetor determina coluna
b = [7 1 -5];
n = length(b);

ca = a;

#Decomposição LU
for k = 1 : n
  for i = k : n
    soma = 0;
    for t = 1 : (k - 1)
      soma += a(i,t) * a(t,k);
    endfor
    a(i,k) = a(i,k) - soma;
  endfor
  for j = (k + 1) : n
    soma = 0;
    for t = 1 : (k - 1)
      soma += a(k,t) * a(t,j);
    endfor
    a(k,j) = (a(k,j) - soma)/a(k,k);
  endfor
endfor

#Substituição direta (Ly = b)
y(1) = b(1)/a(1,1);

for i = 2 : n
  soma = 0;
  for j = 1 : (i - 1)
     soma = soma + (a(i,j) * y(j));
  endfor
  y(i) = (b(i) - soma)/a(i,i);
endfor

#Loop de retrossubstituição (Ux = y)
x(n) = y(n);
for i = (n - 1) : -1 : 1 #entre inicio e parada, passo (no caso, -1)
  soma = 0;
  #Loop do somatório
  for j = (i + 1) : n
    soma += a(i,j) * x(j);
  endfor
  x(i) = y(i) - soma;
endfor

#residuo
r = abs(b' - ca * x');

printf("Decomposição LU na matriz A:\n");
a
printf("Resultado de Y:\n");
y 
printf("Resultado de X:\n");
x
printf("Resíduo:\n");
r
