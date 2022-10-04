function birge_vieta
    clear
    clc

    coeficientes  = [1 0 2 -1];
    len_coef = length(coeficientes);
    erro = 10 ^ (-8); conta_ciclos = 0;
    xk = 1; % estimativa inicial e aproximacao da raiz
    r = 1;

    while (abs(r) > erro)
        conta_ciclos++;
        b = coeficientes(1);
        c = b;
        for i = 2: len_coef
            b = b * xk + coeficientes(i);
            if (i < len_coef)
                c = c * xk + b;
            endif;
        endfor;

        r = b;
        xk = xk - b / c; 

        printf("R = %.16f\n", b);
        printf("R' = %.16f\n", c);
        printf("xk = %.16f\n", xk);
        pause
    endwhile;

    printf("Operação finalizada!\n");
    printf("xk = %.16f\n", xk);
    printf("p(xk) = %.16f\n", r);
    printf("Ciclos = %d\n", conta_ciclos);

endfunction;
