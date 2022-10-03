function secante # deve ter o mesmo nome do arquivo.m
	clear
	clc

    % intervalo apenas para ajudar no chute inicial
	a = 0; b = 2;
	erro = 10 ^ (-8); conta_ciclos = 0;
    x0 = 1; x1 = 0;  % estimativa inicial
    fx0 = f(x0);
    fx1 = f(x1);

    % GRÁFICO
	x = [a:0.1:b]; % gera vetor de pontos que particionam o intervalo [a,b] em um passo de 0.1
	y = f(x); % gera vetor y, com os resultados da função no ponto correspondente de x
	plot(x,y) % plota o grafico com os eixos passados
	grid % habilita linhas de grid
	hold on % plota gráfico na mesma janela gráfica
	
    while (abs(fx1) > erro)
        xk = x1 - (fx1 * (x1 - x0) / (fx1 - fx0));
        conta_ciclos++;

        % GRÁFICO
        r =  fx0 + (fx1 - fx0) / (x1 - x0) * (x - x0); % reta secante a curva em x0 e x1
        plot(x, r, 'r') % plota reta ao invés de ponto
        hold on
        pause
        
        printf("xk = %.16f\n", xk)
        printf("f(xk) = %.16f\n", f(xk))

        x0 = x1;
        fx0 = fx1;
        x1 = xk;
        fx1 = f(xk);
    endwhile;

    printf("Operação finalizada!\n")
    printf("xk (raiz) : %.16f\n", xk)
    printf("Número de iterações: %d\n", conta_ciclos)
endfunction;

function y = f(x)
    y = exp(x) .- 2 .* cos(x); 
	% y = exp(x) .* sin(x) - 1; % . antes do operador informa que esse operador pode ser usado em vetores
endfunction
