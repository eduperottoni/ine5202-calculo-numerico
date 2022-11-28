clear
clc

x = [1.3 3.4 5.1 6.8 8];
y = [2 5.2 3.8 6.1 5.8];

n = length(x);
M = 1   #m é grau do ajuste

for i = 1 : (M + 1)
  b(i) = 0;
  for j = 1 : (M + 1)
    a(i,j) = 0;
    for k = 1 : n
      a(i,j) += x(k)^(i+j-2);
    endfor
  endfor
  for k = 1 : n
    b(i) += y(k)*x(k)^(i-1);
  endfor
endfor

a
b
c = a\b'  #resolve o sistema linear (chamar método de resolução de sistemas - nesse caso, direto)

#gerando os pontos da curva de acordo com os coeficientes da curva descobertos em c
for k = 1 : n
  g(k) = 0;
  for i = 1 : (M + 1)
    g(k) += c(i)*x(k)^(i-1);
  endfor
endfor

plot(x,y, 'o');
grid
hold on
plot(x,g,'r');
