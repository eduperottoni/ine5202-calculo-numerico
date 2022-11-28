clear
clc

x = [0.2:0.1:0.8];
y = [3.16 2.38 1.75 1.34 1 0.74 0.56];
% número de pontos
n = length(x);
% No caso exponencial, M é sempre 1 (problema está linearizado)
M = 1

z = log(y) %log(y) já realiza a operação vetorial

for i = 1 : M + 1
  for j = 1 : M + 1
    a(i,j) = 0;
    for k = 1 : n
       a(i,j) += x(k)^(j+i-2);
    endfor
  endfor
  b(i) = 0;
  for k = 1 : n
    b(i) += z(k)*x(k)^(i-1);
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
printf("Vetor C de coeficientes:\n");
c = a\b';
c(1) = exp(c(1))

% gera o vetor g(x) para construção do gráfico
for i = 1 : n
  g(i) = c(1) * exp(c(2) * x(i));
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
