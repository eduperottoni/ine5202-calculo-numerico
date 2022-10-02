function falsa_posicao_mod #deve ter o mesmo nome do arquivo.m
	clear
	clc

	a = 0; b = 2;
	erro = 10 ^ (-8); ciclos = 0;
    fa = f(a); fb = f(b);
	fxm = 1;

	% GRÁFICO
	x = [a:0.1:b]; % gera vetor de pontos que particionam o intervalo [a,b] em um passo de 0.1
	y = f(x); % gera vetor y, com os resultados da função no ponto correspondente de x
	plot(x,y) %plota o grafico com os eixos passados
	grid %habilita linhas de grid
	hold on %plota gráfico na mesma janela gráfica
		
	if (fa * fb > 0)
		disp("Intervalo inválido para o método")
	else
		while(abs(fxm) > erro)
			xm = (a * fb - b * fa) / (fb - fa);
			fxm = f(xm);
			ciclos++;

			if (fa * fxm < 0) %caso a fique fixo, f(a) deve ser reduzida
				pa = fb / (fb + fxm);
				fa = fa * pa;
				b = xm;
				fb = fxm;
			else % caso b fique fixo, f(b) deve ser reduzida
				pb = fa / (fa + fxm);
				fb = fb * pb; 
				a = xm;
				fa = fxm;
			endif
			
			printf("a : %.16f | b: %.16f | f(xm): %.16f\n", a, b, fxm);
	
			%GRÁFICO
      		r = fa + (fb - fa)/(b - a) * (x - a); #reta com os dois pontos
			plot(x, r, 'r') #plota reta ao invés de ponto
			hold on
			pause
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
