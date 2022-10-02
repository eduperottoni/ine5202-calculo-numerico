function bissecao #deve ter o mesmo nome do arquivo.m
	clear
	clc

	a = 0; b = 2;
	erro = 10 ^ (-8); ciclos = 0;
	fa = f(a); fb = f(b); fxm = 1;

	% GRÁFICO
	x = [a:0.1:b]; % gera vetor de pontos que particionam o intervalo [a,b] em um passo de 0.1
	y = f(x); % gera vetor y, com os resultados da função no ponto correspondente de x
	plot(x,y) %plota o grafico com os eixos passados
	grid %habilita linhas de grid
	hold on %plota gráfico na mesma janela gráfica
		
	if f(a) * f(b) > 0
		disp("Intervalo inválido para o método")
	else
		while(abs(fxm) > erro)
			xm = (a + b) / 2;
			fxm = f(xm);
			ciclos++;

			if (fa * fxm < 0)
				b = xm;
				fb = fxm;
			elseif (fa * fxm > 0)
				a = xm;
				fa = fxm;
			endif

			printf("xm = %.16f\n", xm);
			printf("f(xm) = %.16f\n", fxm);

			% GRÁFICO
			plot(xm, f(xm), 'r*')
			hold on
			
			% pause
		endwhile
	endif

	printf("Operação finalizada!\n");
	printf("xm (raiz) = %.16f\n", xm);
	printf("f(xm) = %.16f\n", fxm);
	printf("ciclos = %d\n", ciclos);
endfunction;

function y = f(x)
	y = exp(x) .- 2 .* cos(x);
	% y = exp(x) .* sin(x) - 1; %. antes do operador informa que esse operador pode ser usado em vetores
endfunction
