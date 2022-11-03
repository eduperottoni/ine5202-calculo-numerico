clear
clc

# Dados de entrada
# 1 - Matriz de coeficientes
# 2 - Matriz de termos independentes
a =[1 1 1.5 1 1.5 0 0 0 0 0; 0 1 0.01 0.51 1.5 0.5 0 0 0 0; 2.9 1 2 1 1 0 5 0 0 0; 9 1 0.2 1 1 0 0 1.5 0 0; 1 0 2 0 0 1 1 1 0 2; 0 1 0 0 -2 0 1 -1 1 1 ; 1 0 2 0 0 0 1 1 1 0; 0 1 0 0 2 0 1 1 1 -1; 0 0 1 0 2 1 -1 0 -1 -1; 0 1 0 0 2 0 1 0 1 1];
#a = [1 -1 1; 2 3 -1; -3 1 1]; # ; -> dentro de vetor determina coluna
b =[4 -3 1 -1 -1 0 -1 1 3 -2];
#b = [1 4 -1];
n = length(b);

#Cópias da matriz/vetor para cálculo do resíduo
ca = a;
cb = b;
# n = size(a,1); # size(a) retorna vetor com [número de linhas, número de colunas]

contador_trocas = 0;

# Loop de escalonamento
for k = 1 : (n - 1)
  
  #Busca maior elemento em módulo da coluna k
  linha_maior = k; coef_maior = abs(a(k,k));
  for i = (k + 1) : n
    if abs(a(i, k)) > coef_maior
      coef_maior = abs(a(i, k));
      linha_maior = i;
    endif
  endfor
  #Troca de linhas
  if linha_maior > k
    contador_trocas++;
    for j = k : n
      aux = a(k,j);
      a(k,j) = a(linha_maior,j);
      a(linha_maior,j) = aux; 
    endfor
    aux = b(k);
    b(k) = b(linha_maior);
    b(linha_maior) = aux;
  endif

  #Triangularização
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

#Cálculo do resíduo
r = abs(cb' - ca * x'); # ' -> transposta

format long
printf("Resultado do escalonamento: \n");
a
b
printf("Solução:\n");
x
printf("Resíduo:\n");
r
printf("Nº de trocas de linhas = %d\n", contador_trocas);