clear
clc

# Dados de entrada
# 1 - Matriz de coeficientes
# 2 - Matriz de termos independentes

a = [1 1 1.5 1 1.5 0 0 0 0 0; 0 1 0.01 0.51 1.5 0.5 0 0 0 0; 2.9 1 2 1 1 0 5 0 0 0; 9 1 0.2 1 1 0 0 1.5 0 0; 1 0 2 0 0 1 1 1 0 2; 0 1 0 0 -2 0 1 -1 1 1 ; 1 0 2 0 0 0 1 1 1 0; 0 1 0 0 2 0 1 1 1 -1; 0 0 1 0 2 1 -1 0 -1 -1; 0 1 0 0 2 0 1 0 1 1];
b = [4 -3 1 -1 -1 0 -1 1 3 -2];
#a = [1 -1 1; 2 3 -1; -3 1 1]; # ; -> dentro de vetor determina coluna
#b = [1 4 -1];
n = length(b);

o = [1 : 1 : n];
#Cópias da matriz/vetor para cálculo do resíduo
ca = a;
cb = b;
# n = size(a,1); # size(a) retorna vetor com [número de linhas, número de colunas]

# Loop de escalonamento
for k = 1 : (n - 1)
  
  #Busca maior elemento em módulo da coluna k
  linha_maior = k; coef_maior = abs(a(o(k),k));
  for i = (k + 1) : n
    if abs(a(o(i), k)) > coef_maior
      coef_maior = abs(a(o(i), k));
      linha_maior = i;
    endif
  endfor
  #Troca de linhas -> apenas logicamente usando o vetor o
  if linha_maior > k
    aux = o(k);
    o(k) = o(linha_maior);
    o(linha_maior) = aux;
  endif

  #Triangularização
  for i = (k + 1) : n
    multip = a(o(i), k) / a(o(k), k);
    for j = k : n
      a(o(i), j) = a(o(i), j) - multip * a(o(k), j);
    endfor
    b(o(i)) = b(o(i)) - multip * b(o(k));
  endfor
endfor

#Loop de retrossubstituição
x(n) = b(o(n)) / a(o(n),n);
for i = (n - 1) : -1 : 1 #entre inicio e parada, passo (no caso, -1)
  soma = 0;
  #Loop do somatório
  for j = (i + 1) : n
    soma += a(o(i),j) * x(j);
  endfor
  x(i) = (b(o(i)) - soma)/a(o(i), i);
endfor

#Cálculo do resíduo
r = abs(cb' - ca * x'); # ' -> transposta

format long
printf("Resultado do escalonamento: \n");
a
b
printf("Vetor de ordenamento após trocas: \n");
o
printf("Solução:\n");
x
printf("Resíduo:\n");
r