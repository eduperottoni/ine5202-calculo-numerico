clear
clc

function [y] = f(x)
    y = exp(-x) - x;
endfunction

a = 0.5;
b = 1;
ciclos = 0;

if f(a) * f(b) > 0
    printf("Intervalo inválido para o método")
else
    do
        xm = (a + b) / 2;
        ciclos++;
        
        if (f(a) * f(xm) < 0)
            b = xm;
        elseif (f(a) * f(xm) > 0)
            a = xm;
        endif
        
        #valor = f(xm);
    until (abs(f(xm)) < (10 ^ (-16)))
endif

xm
ciclos
