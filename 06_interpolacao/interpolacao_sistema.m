function interpolacao_sistema

clear
clc

x = [-1 0 1];
% y já é coluna
y = [4; 1; -1];

% ponto a interpolar
xs = 0.5;

n = length(x);
grau = n - 1;

% montando a matriz de vandermonde
for i = 1 : n
  for j = 1 : n
    V(i,j) = x(i) ^ (j - 1);
  endfor
endfor

% resolvendo o sistema linear
a = V\y;

printf("| Coeficientes do polinômio:\n");
a

printf("| P(%.16f) = %.16f\n", xs, interpola(xs));

plot(x,y,'*')
grid
hold on
plot(xs, interpola(xs),'o')

% gerando intepolação nos pontos tabelados
%for i = 1 : n
% interpolados(i) = interpola(x(i));
%endfor

% gerando intepolação com mais pontos -> passo 0.2
xi = [x(1) : 0.2 : x(n)];
ni = length(xi);
for i = 1 : ni
  interpolados(i) = interpola(xi(i));
endfor

plot(xi, interpolados,'r')

% funcao que interpola para ponto passado
function result = interpola(x)
  result = 0;
  for i = 1 : n
    result += a(i) * x ^ (i - 1);
  endfor
endfunction

endfunction