clear
clc
format long
a = [62 24 1 8 15;23 50 7 14 16;4 6 58 20 22;10 12 19 66 3;11 18 25 2 54];
b = [110 110 110 110 110];
n = length(b);
x0 = zeros(1,n);
xa = x0;
erro = 10^-10;
k = 0;
d = 1;
w = 1;
%w = 1.058;
%w = 0.95;
while( d > erro)
  k += 1;
  for i=1:n
    soma = 0;
    for j=1:n
      if j ~= i
        soma = soma + a(i,j)*x0(j);
      end
    end
    x0(i) = (1-w)*x0(i)+ w*(b(i)-soma)/a(i,i);
  end

  d = max(abs(x0-xa));
  xa = x0;
  x0
end
format long
k
x0
d