function bissecao #deve ter o mesmo nome do arquivo.m
	clear
	clc

	a = 0;
	b = 1;
	erro = 10 ^ (-8);
	ciclos = 0;

	x = [a:0.1:b]; % gera vetor de pontos que particionam o intervalo [a,b] em um passo de 0.1
	y = f(x); % gera vetor y, com os resultados da função no ponto correspondente de x
	plot(x,y) %plota o grafico com os eixos passados
	grid %habilita linhas de grid
	hold on %plota gráfico na mesma janela gráfica
		
	if f(a) * f(b) > 0
		disp("Intervalo inválido para o método")
	else
		do
			xm = (a + b) / 2;
			ciclos++;

			if (f(a) * f(xm) < 0)
				b = xm;
			elseif (f(a) * f(xm) > 0)
				a = xm;
			endif

			valor = f(xm)
			plot(xm, valor, 'r*')
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
