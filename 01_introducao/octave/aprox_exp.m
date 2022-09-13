#limpa as variáveis
clear
#limpa o terminal da janela de comandos
clc
# dado de entrada:
x = 2;
# variáveis de inicialização:
soma = 1;
num = 1;
fat = 1;

# Tudo que estiver sem ponto e vírgula será escrito na tela
for i = 1:4
  num = num*x;
  fat = fat*i;
  soma = soma + (num/fat);
endfor

soma #será printada na tela
