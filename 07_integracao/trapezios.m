clc
clear
a = 0;
b = 1;

N = 10;
h = (b - a) / N;
x = [a:h:b];

% função interna à integral
y = exp(x);

s = 0;
for i = 2 : N
  s += y(i);
endfor

T = (h/2)*(y(1) + 2*s + y(N+1))