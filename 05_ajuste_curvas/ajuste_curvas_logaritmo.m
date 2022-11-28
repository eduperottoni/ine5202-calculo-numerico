clear
clc

x = [1 2 3 4];
y = [3 5 6 8];
% número de pontos
n = length(x);
% No caso exponencial, M é sempre 1 (problema está linearizado)
M = 1

t = log(x) %log(x) já realiza a operação vetorial

for i = 1 : M + 1
  for j = 1 : M + 1
    a(i,j) = 0;
    for k = 1 : n
       a(i,j) += t(k)^(j+i-2);
    endfor
  endfor
  b(i) = 0;
  for k = 1 : n
    b(i) += y(k)*t(k)^(i-1);
  endfor
endfor

printf("Matriz A:\n");
a
printf("Vetor B:\n");
b
printf("Determinante de A:\n");
d = det(a)
printf("Condicionamento de A:\n");
n_cond = cond(a)
% resolve o sistema linear
c = a\b';

% vetor inteiro deve ser operado com exponencial
printf("Vetor C de coeficientes:\n");
c

% gera o vetor g(x) para construção do gráfico
for i = 1 : n
  g(i) = c(1) + c(2) * log(x(i));
endfor

printf("Vetor G de aproximações g(x):\n");
g

erro = 0;
for i = 1 : n
  erro += (g(i) - y(i))^2;
endfor
printf("Vetor E de erro [g(x) - y(x)]²:\n");
erro

%plotando os pontos da tabela original
plot(x,y,'o')
grid
hold on
%plotando a curva de aproximação
plot(x,g,'r')
