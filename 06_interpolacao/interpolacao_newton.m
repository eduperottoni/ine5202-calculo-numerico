# Algoritmo de interpolação de Newton
# Método das Diferenças Divididas
function interpolacao_newton
clear
clc

# =========
# Entradas:
# Vetores x e y de pontos tabelados
x=[0 1 2 3];
y=[-3 -2 4 0];

# x simbólico
xs = 2.5;
# ==========

# número de pontos  -> grau (n-1)
n = length(x);

# Monta a matriz a de diferenças divididas
for i = 1 : n
  a(i,1) = y(i);
endfor
for j = 2 : n
   for i = j : n
     a(i,j) = (a(i,(j-1)) - a((i-1),(j-1)))/(x(i) - x(i-j+1));
   endfor
endfor

format long

printf("| Matriz a de diferenças divididas:\n");
a

printf("| Valor de p(2.5): %.16f\n", p(2.5));

# 2) Como temos poucos pontos tabelados para ter uma boa precisão na interpolação, usaremos mais pontos.
#    A ideia é dividir o intervalo de x de 0.1 em 0.1, formando 30 pontos 

printf("| Vetor de interpolação nos pontos tabelados:\n");
# Interpolando pontos tabelados
for i = 1 : n
   g(i) = p(x(i));
endfor
g

# Interpolando pontos tabelados + outros pontos entre x(1) e x(n) e armazenando em vetor g
others_x = [x(1) : 0.1 : x(n)];
others_n = length(others_x);
for i = 1 : others_n
   g1(i) = p(others_x(i));
endfor

printf("| Vetor de interpolação em mais pontos:\n");
g1

# Plot do gráfico com os pontos tabelados
plot(x,y,'o')
grid
hold on
# Plot da curva aproximada interpolada nos pontos tabelados + pontos extra
plot(others_x,g1,'r')

# Calcula polinômio para x passado
function result = p(x_symb)
result = 0;
for i = 1 : n
  mult = 1;
  for j = 1 : (i - 1)
    mult *= (x_symb - x(j));
  endfor
  result += a(i,i) * mult;
endfor
endfunction

endfunction

