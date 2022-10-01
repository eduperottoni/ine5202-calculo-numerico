function falsa_posicao #deve ter o mesmo nome do arquivo.m
	clear
	clc

	a = 0;
	b = 1;
	erro = 10 ^ (-8);
	ciclos = 0;
    fa = f(a);
    fb = f(b);

	x = [a:0.1:b]; % gera vetor de pontos que particionam o intervalo [a,b] em um passo de 0.1
	y = f(x); % gera vetor y, com os resultados da função no ponto correspondente de x
	plot(x,y) %plota o grafico com os eixos passados
	grid %habilita linhas de grid
	hold on %plota gráfico na mesma janela gráfica
		
	if fa * fb > 0
		disp("Intervalo inválido para o método")
	else
		do
			xm = (a * fb - b * fa) / (fb - fa);
			ciclos++;

			if (fa * f(xm) < 0) %caso a fique fixo, f(a) deve ser reduzida
        pa = fb / (fb + f(xm));
        fa = fa * pa;
				b = xm;
        fb = f(xm);
			else % caso b fique fixo, f(b) deve ser reduzida
        pb = fa / (fa + f(xm));
        fb = fb * pb; 
				a = xm;
        fa = f(xm);
			endif
      a
      b
			valor = f(xm)
      r = fa + (fb - fa)/(b - a) * (x - a); #reta com os dois pontos
			plot(x, r, 'r') #plota reta ao invés de ponto
			hold on
			pause
		until (abs(f(xm)) < erro)
	endif

	xm
	f(xm)
	ciclos
endfunction;

function y = f(x)
	y = exp(x) .* sin(x) - 1; %. antes do operador informa que esse operador pode ser usado em vetores
endfunction
