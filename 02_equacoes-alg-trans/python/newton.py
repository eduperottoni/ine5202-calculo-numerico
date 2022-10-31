from math import sin, cos, exp

def f(arg):
    # return exp(arg) - 2 * cos(arg)
    # return exp(arg) * sin(arg) - 1
    return arg ** 4 + 2 * arg ** 3 - 7 * arg ** 2 + 3

def df(arg):
    return  4 * arg ** 3 + 6 * arg ** 2 - 14 * arg
    # return exp(arg) + 2 * sin(arg)
    # return exp(arg) * (sin(arg) + cos(arg))
    # return arg * cos(arg) * sin(arg);

a = 0; b = 2;
erro = 10 ** (-6); conta_ciclos = 0
x0 = -4; xk = 0
fx0 = f(x0)

while(abs(fx0) > erro):
    print(f'x0 = {x0:.16f}')
    print(f'fx0 = {fx0:.16f}')
    print(f'dx0 = {df(x0):.16f}')
    
    xk = x0 - fx0 / df(x0)
    conta_ciclos += 1

    print(f'xk = {xk:.16f}')
    print(f'f(xk) = {f(xk):.16f}')

    x0 = xk
    fx0 = f(xk)

print("Operação realizada!")
print(f'xk (raiz) = {xk:.16f}')
print(f'f(xk) = {xk:.16f}')
print(f'ciclos = {conta_ciclos}')