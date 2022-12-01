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
# ==========

# calcula número de pontos  -> grau do polinômio = (n-1)
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

printf("\n| Interpolação em x = 2.5\n");
printf("p(2.5) = %.16f\n", p(2.5));

# 2) Como temos poucos pontos tabelados para ter uma boa precisão na interpolação, usaremos mais pontos.
#    A ideia é dividir o intervalo de x de 0.05 em 0.05, formando 60 pontos 

# Interpolando pontos tabelados
for i = 1 : n
   g(i) = p(x(i));
endfor
# Print da interpolação nos pontos tabelados
printf("\n| Interpolação nos pontos tabelados:\n");
printf("         x         |         y          \n");
for i = 1 : n
  printf("%.16f | %.16f\n", x(i), g(i));
endfor

# Interpolando pontos tabelados + outros pontos entre x(1) e x(n) e armazenando em vetor g1
others_x = [x(1) : 0.05 : x(n)];
others_n = length(others_x);
for i = 1 : others_n
   g1(i) = p(others_x(i));
endfor
# Print da interpolação e mais pontos
printf("\n| Interpolação em mais pontos:\n");
printf("         x         |         y          \n");
for i = 1 : others_n
  printf("%.16f | %.16f\n", others_x(i), g1(i));
endfor

# Plot do gráfico com os pontos tabelados
plot(x,y,'o')
grid
hold on
# Plot da curva aproximada interpolada nos pontos tabelados + pontos extra
plot(others_x,g1,'r')

# Função que calcula valor do polinômio para x passado
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

