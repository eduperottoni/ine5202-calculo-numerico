clc
clear

x = 2;

soma = 1;
num = 1;
fat = 1;
i = 1;
exata = exp(x);
erro = abs(exata - soma);

while (erro > 0.00001)
  num = num*x;
  fat = fat*i;
  soma = soma + (num/fat)
  erro = abs(exata - soma)
  pause
  i = i + 1;
endwhile

soma
i
