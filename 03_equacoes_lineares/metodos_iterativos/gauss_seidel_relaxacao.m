
# ========================================================================
# TRABALHO GAUSS-SEIDEL COM RELAXAÇÕES | EDUARDO DANI PEROTTONI (21204003)
# ========================================================================

# =========
# ALGORITMO
# =========

clear
clc

#{
ENTRADAS:
1 - Matriz de coeficientes (a)
2 - Matriz de termos independentes (b)
3 - Estimativa inicial (x)
#}

a = [62 24 1 8 15;23 50 7 14 16;4 6 58 20 22;10 12 19 66 3;11 18 25 2 54];
b = [110 110 110 110 110]; 

n = length(b);

# cria uma matriz de uma linha e n colunas preenchida com zeros (estimativa inicial)
x = zeros(1,n);

#fator de relaxação
w = 1.0801;

erro = 10 ^ (-10); conta_ciclos = 0;

#variável para calcular o desvio
x_ant = x;
# maior elemento em módulo da matriz de diferença entre x e xk
e = 1; 

# Loop de resoluçãos
while(e > erro)
  conta_ciclos++;
  for i = 1 : n
    soma = 0;
    for j = 1 : n
      if (i ~= j)
        soma += a(i,j)*x(j);
      endif
    endfor
    x(i) = (1 - w)*x(i) + w*(b(i) - soma) / a(i,i);
  endfor
  e = max(abs(x - x_ant));  #pode-se usar e = sum(abs(x - a_ant))
  x_ant = x;
endwhile

format long
printf("GAUSS-SEIDEL COM RELAXAÇÃO\n");
printf("Fator de relaxação : w = %ld\n", w);
printf("Número de iterações: %d\n", conta_ciclos);
printf("Erro: %ld\n", e);
printf("Solução:\n");
x

# ====================
# RESPOSTAS/CONCLUSÕES
# ====================

#{
  a) Sabendo que a principal condição de convergência para os métodos iterativos de resolução de sistemas lineares é a matriz
     de coeficientes ser IRREDUTÍVEL e DIAGONAL DOMINANTE, vemos que a matriz A dada como entrada satisfaz a condição de ser
     irredutível, visto que não se pode chegar ao resultado de alguma variável sem resolver o sistema todo.
     Sobre ser diagonal dominante, analisemos agora cada uma das linhas:
     
     A(1,1) = 48 | S1 = 24 + 01 + 08 + 15 = 48 | 62 >= 48 | SATISFAZ
     A(2,2) = 50 | S2 = 23 + 07 + 14 + 16 = 60 | 50 < 60  | NÃO SATISFAZ
     A(3,3) = 58 | S3 = 04 + 06 + 20 + 22 = 52 | 58 >= 52 | SATISFAZ
     A(4,4) = 66 | S4 = 10 + 12 + 19 + 03 = 44 | 66 >= 44 | SATISFAZ
     A(5,5) = 54 | S5 = 11 + 18 + 25 + 02 = 56 | 54 < 56  | NÃO SATISFAZ
     
     Logo, podemos ver que estamos diante de um sistema linear com diagonal pouco dominante (algumas das linhas do sistema não
     satisfazem a condição a(i,i) >= Si). Nesse caso, de antemão NÃO PODEMOS GARANTIR A CONVERGÊNCIA. Porém, quando não garan-
     timos a convergência, nada podemos afirmar e o sistema ainda pode convergir.
     
     Testaremos, portanto, a convergência utilizando o método de Gauss-Seidel com relaxações (que inclusive, é indicado para es-
     se tipo de sistema - com diagonal pouco dominante), sabendo que o método das relaxações por vezes ajuda sistemas desse tipo
     a chegarem em uma convergência.  
#}

#{
  b) Conforme solicitado, o algoritmo, escrito abaixo, foi executado com os seguintes parâmetros:
     --> Precisão: 10^(-10)
     --> Critério de parada |x(k) - x(k-1)|
         IMPORTANTE! Aqui, para comparação com a precisão, foi utilizado o VALOR MÁXIMO do vetor |x(k) - x(k-1)|
     --> Fator de relaxação: w = 1
     --> Estimativa inicial: x = [0 0 0 0 0]
   
    Como resultado, obteve-se:
     --> Número de iterações: 22
     --> Solução:
          x =
             1.000000000000361   1.000000000007196   1.000000000017799   0.999999999995074   0.999999999989470
     --> Precisão:
          e = 4.025690891751310e-11   
#}

#{
  c) 
    ESCOLHA DE W < 1
    Primeiro, escolheu-se um fator de relaxação w < 1. Nesse caso, optou-se por 0.95. Os resultados com esse fator de relaxação
    estão descritos abaixo:
    
    --> w = 0.95
        --> Número de iterações: 26
        --> Solução:
             x = 
               1.000000000000575   1.000000000011696   1.000000000025261   0.999999999991833   0.999999999983135
        --> Precisão:
             e = 4.144640186609649e-11
             
    Ou seja vemos que, para w < 1, temos um número maior de iterações. Segue mais um teste, agora com w = 0.99
    
    --> w = 0.99
        --> Número de iterações: 23
        --> Solução:
             x =
               1.000000000000276   1.000000000006660   1.000000000015841   0.999999999995450   0.999999999990354
        --> Precisão:
             e = 3.328448627826219e-11
             
    Confirmadamente, uma sub-relaxação não é o indicado para esse sistema. Logo, após alguns testes utilizando sobrerrelaxações
    chegou-se no seguinte fator ótimo:
    
    --> w = 1.0801
        --> Número de iterações: 16
        --> Solução:
             x = 
               0.999999999992730   1.000000000009545   1.000000000008777   0.999999999997965   0.999999999994977
        --> Precisão:
             e = 1.77012e-11
#}