from math import sin, cos, exp

def f(arg):
    return exp(arg) - 2 * cos(arg)
    # return exp(arg) * sin(arg) - 1

a = 0; b = 2
erro = 10 ** (-8); conta_ciclos = 0
x0 = 1; x1 = 0; xk = 0
fx0 = f(x0)
fx1 = f(x1)

while(abs(fx1) > erro):
    xk = x1 - (fx1 * (x1 - x0)) / (fx1 - fx0)
    conta_ciclos += 1

    print(f'xk = {xk:.16f}')
    print(f'f(xk) = {f(xk):.16f}')

    x0 = x1
    fx0 = fx1
    x1 = xk
    fx1 = f(xk)

print("Operação realizada!")
print(f'xk (raiz) = {xk:.16f}')
print(f'f(xk) = {xk:.16f}')
print(f'ciclos = {conta_ciclos}')