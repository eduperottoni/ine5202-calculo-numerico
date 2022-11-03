clear
clc

# Dados de entrada
# 1 - Matriz de coeficientes
# 2 - Matriz de termos independentesP

a = [4 2 3; 2 -4 -1; -1 1 4]; # ; -> dentro de vetor determina coluna
b = [7 1 -5];
n = length(b);

ca = a;
cb = b;

#Decomposição LU
for k = 1 : n
  for j = k : n
    soma = 0;
    for t = 1 : (k - 1)
      soma = soma + L(k,t) * U(t,j);
    endfor
    U(k,j) = a(k,j) - soma;
  endfor
  L(k,k) = 1;
  for i = (k + 1) : n
    soma = 0;
    for t = 1 : (k - 1)
      soma = soma + L(i,t) * U(t,k);
    endfor
    L(i,k) = (a(i,k) - soma)/U(k,k);
  endfor
endfor

#Substituição direta (Ly = b)
y(1) = b(1)/L(1,1);

for i = 2 : n
  soma = 0;
  for j = 1 : (i - 1)
     soma = soma + (L(i,j) * y(j));
  endfor
  y(i) = (b(i) - soma)/L(i,i);
endfor

#Loop de retrossubstituição (Ux = y)
x(n) = y(n) / U(n,n);
for i = (n - 1) : -1 : 1 #entre inicio e parada, passo (no caso, -1)
  soma = 0;
  #Loop do somatório
  for j = (i + 1) : n
    soma += U(i,j) * x(j);
  endfor
  x(i) = (y(i) - soma) / U(i, i);
endfor

#residuo
r = abs(b' - a * x');

printf("Decomposição LU:\n");
L
U
printf("Resultado de Y:\n");
y 
printf("Resultado de X:\n");
x
printf("Resíduo:\n");
r
