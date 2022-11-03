clear
clc

#ENTRADAS:
# 1 - Matriz de coeficientes (a)
# 2 - Matriz de termos independentes (b)
# 3 - EStimativa inicial (x0)

a = [3 -1 -1; 1 3 1; 2 -2 4];
b = [1 5 4];

n = length(b);
x0 = zeros(1,n); # cria uma matriz de uma linha e n colunas preenchida com zeros

conta_iteracoes = 0;

erro = 10 ^ (-8); conta_ciclos = 0;
e = 1; # maior elemento em módulo da matriz de desvio entre x0 e x

while(e > erro)
  conta_ciclos++;
  for i = 1 : n
    soma = 0;
    for j = 1 : n
      if (i ~= j)
        soma += a(i,j)*x0(j);
      endif
    endfor
    x(i) = (b(i) - soma) / a(i,i);
  endfor
  e = max(abs(x - x0))
  x0 = x
  pause
endwhile

printf("Número de iterações:\n");
conta_ciclos
printf("Erro:\n");
e
printf("Solução:\n");
x