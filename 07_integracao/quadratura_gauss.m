clear
clc

a = 0;
b = 1;

n = 3; % pontos de integração
% ESCOLHA NA TABELA
if n == 1
  t(1) = 0;
  A(1) = 2;
elseif n == 2
  t(1) = -1 / sqrt(3);
  t(2) = 1 / sqrt(3);
  A(1) = 1;
  A(2) = 1;
elseif n == 3
  t(1) = -0.7745966692414834;
  t(2) = 0.7745966692414834;
  t(3) = 0;
  A(1) = 0.5555555555555556;
  A(2) = 0.5555555555555556;
  A(3) = 0.8888888888888888;
elseif n == 4
  t(1) = -0.8611363115940526;
  t(2) = 0.8611363115940526;
  t(3) = -0.3399810435848563;
  t(4) = 0.3399810435848563;
  A(1) = 0.3478548451374538;
  A(2) = 0.3478548451374538;
  A(3) = 0.6521451548625461;
  A(3) = 0.6521451548625461;
endif

% transformação de variável (t já é um vetor com os valores de t(i))
x = ((b - a)/2)*t + (b + a)/2;
dx = (b-a)/2;
% F é vetor com F(t(i))
F = exp(x) * dx;
I = A * F';

printf("Integral de x³ dx para limite 0 à 1: %.16f\n", I);