erro = 10 ** (-8); conta_ciclos = 0
xk = 1 # estimativa inicial

coeficientes = [1, 0, 2, -1]
r = 1
while (abs(r) > erro):
    conta_ciclos += 1
    b = coeficientes[0]; c = b
    for i in range(1, len(coeficientes)):
        b = b * xk + coeficientes[i]
        if (i < len(coeficientes) - 1):
            c = c * xk + b;
    
    xk = xk - b / c
    r = b

    print(f'R = {b:.16f}')
    print(f'R1 = {c:.16f}')
    print(f'xk = {xk:.16f}')

print('Operaçao finalizada!\n')    
print(f'xk = {xk:.16f}')
print(f'p(xk) = {b:.16f}')
print(f'ciclos: {conta_ciclos}')

