clear
clc

# Dados de entrada
# 1 - Matriz de coeficientes
# 2 - Matriz de termos independentes

a = [4 2 3; 2 -4 -1; -1 1 4]; # ; -> dentro de vetor determina coluna
b = [7 1 -5];
n = length(b);
# n = size(a,1); # size(a) retorna vetor com [número de linhas, número de colunas]

# Loop de escalonamento
for k = 1 : (n - 1)
  for i = (k + 1) : n
    multip = a(i, k) / a(k, k);
    for j = k : n
      a(i, j) = a(i, j) - multip * a(k, j);
    endfor
    b(i) = b(i) - multip * b(k);
  endfor
endfor

#Loop de retrossubstituição
x(n) = b(n) / a(n,n);
for i = (n - 1) : -1 : 1 #entre inicio e parada, passo (no caso, -1)
  soma = 0;
  #Loop do somatório
  for j = (i + 1) : n
    soma += a(i,j) * x(j);
  endfor
  x(i) = (b(i) - soma)/a(i, i);
endfor

format long
printf("Resultado do escalonamento: \n");
a
b
printf("Solução:\n")
x
