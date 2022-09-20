function bissecao
  clear
  clc

  a = 0;
  b = 1;
  erro = 10 ^ (-8);
  ciclos = 0;

  x = [a:0.1:b];
  y = funcao(x);
  plot(x,y)
  grid
  hold on %plota gráfico na mesma janela gráfica

  if funcao(a) * funcao(b) > 0
      disp("Intervalo inválido para o método")
  else
      do
          xm = a - (funcao());
          ciclos++;

          if (funcao(a) * funcao(xm) < 0)
              b = xm;
          elseif (funcao(a) * funcao(xm) > 0)
              a = xm;
          endif

          valor = funcao(xm);
          %plot(xm, valor, 'r*')
          %hold on
          %pause
      until (abs(funcao(xm)) < erro)
  endif

  xm
  funcao(xm)
  ciclos
endfunction;

function y = funcao(x)
    y = exp(x) .* sin(x) - 1;
endfunction
