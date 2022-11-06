clc
clear

#{
  ENTRADAS:
  1 - Estimativa inicial
  2 - Equações
#}

#f1 = e^x1 + x2 - 1 = 0
function y1 = f1(x)
  y1 = exp(x(1)) + x(2) - 1;
endfunction

#f2 = x1^2 + x2^2 - 4 = 0
function y2 = f2(x)
  y2 = x(1)^2 + x(2)^2 - 4;
endfunction

#Estimativa inicial - vetor coluna
x = [1; -1];

erro = 10 ^ (-8); conta_ciclos = 0;
maximo = 1;

while (maximo > erro)
  conta_ciclos++;
  
  #Formação da matriz Jacobiana
  J(1,1) = exp(x(1));
  J(1,2) = 1;
  J(2,1) = 2*x(1);
  J(2,2) = 2*x(2);
  J
  #Formação do vetor F(X);
  F(1) = f1(x);
  F(2) = f2(x);
  F
  
  #Calcula a solução d do sistema linear formado na iteração
  #Aqui, chamaríamos um método já construído de Gauss, por exemplo
  d = J\-F'
  
  #Atualização de X
  x = x + d
  
  #critério de parada
  maximo = max(abs(d));
  pause
endwhile;

format long
printf("Solução do sistema: %.16ld\n", x);
printf("Nº de ciclos: %d\n", conta_ciclos);
printf("Precisão: %.16ld\n", maximo);
