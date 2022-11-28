clear
clc
x = [-1 0 2];
y = [4 1 -1];
n = length(x);
for i = 1 : n
  for j = 1 : n
    V(i,j) = x(i)^(j - 1);
  endfor
endfor

V
det(V)
cond(V)
a = V\y'


for k = 1 : n
  # Plotando o gráfico
  for i = 1 : n
    p(k) += a(i) * x(k)^(i - 1);
  endfor
endfor
p

