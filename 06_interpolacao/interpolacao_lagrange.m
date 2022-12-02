function interpolacao_lagrange
  
clear
clc

x = [-1 0 1];
y = [4 1 -1];

n = length(x);

printf("| Interpolação em 0.5 = %.16f\n", interpola(0.5));

% interpolando para cada ponto da tabela
%for i = 1 : n
%  p1(i) = interpola(x(i));
%endfor

% interpolando para mais pontos
xi = [x(1) : 0.1 : x(n)];
ni = length(xi);
for i = 1 : ni
  pi(i) = interpola(xi(i));
endfor

% plot do gráfico
plot(x,y,'*');
grid
hold on
plot(0.5, interpola(0.5), 'go');
plot(xi, pi, 'r');

function result = interpola(xs)
  result = 0;
  for i = 1 : n
    mult = 1;
    for j = 1 : n
      if (j != i)
        mult *= (xs - x(j)) / (x(i) - x(j));
      endif
    endfor
    result += y(i) * mult;
  endfor
endfunction

endfunction