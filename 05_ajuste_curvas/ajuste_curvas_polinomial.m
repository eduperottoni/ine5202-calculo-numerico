clear
clc

x = [1.3 3.4 5.1 6.8 8];
y = [2 5.2 3.8 6.1 5.8];
% número de pontos
n = length(x);
% grau do ajuste
% Quando o ajuste é polinomaial, geralmente não se utiliza grau maior que 2
M = 1;

for i = 1 : M + 1
  for j = 1 : M + 1
    a(i,j) = 0;
    for k = 1 : n
       a(i,j) += x(k)^(j+i-2);
    endfor
  endfor
  b(i) = 0;
  for k = 1 : n
    b(i) += y(k)*x(k)^(i-1);
  endfor
endfor

printf("Matriz A:\n");
a
printf("Vetor B:\n");
b
printf("Determinante de A:\n");
d = det(a)
printf("Condicionamento de A:\n");
c = cond(a)
% resolve o sistema linear
printf("Vetor C de coeficientes:\n");
c = a\b'

% gera o vetor g(x) para construção do gráfico
for i = 1 : n
  g(i) = 0;
  for k = 1 : M + 1
    g(i) += c(k) * x(i) ^ (k - 1);
  endfor 
endfor

printf("Vetor G de aproximações g(x):\n");
g

erro = 0;
for i = 1 : n
  erro += (g(i) - y(i))^2
endfor
printf("Vetor E de erro [g(x) - y(x)]²:\n");
erro

%plotando os pontos da tabela original
plot(x,y,'o')
grid
hold on
%plotando a curva de aproximação
plot(x,g,'r')
