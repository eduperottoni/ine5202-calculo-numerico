from math import sin, cos, exp

def f(arg):
    return exp(arg) - 2 * cos(arg);
    # return exp(arg) * sin(arg) - 1;

def df(arg):
    return exp(arg) + 2 * sin(arg);
    # return exp(arg) * (sin(arg) + cos(arg));

a = 0; b = 2;
erro = 10 ** (-8); conta_ciclos = 0;
x0 = 1; xk = 0;
fx0 = f(x0);

while(fx0 > erro):
    xk = x0 - fx0 / df(x0);
    conta_ciclos += 1;

    print(f'xk = {xk:.16f}')
    print(f'f(xk) = {f(xk):.16f}')

    x0 = xk;
    fx0 = f(xk)

print("Operação realizada!")
print(f'xk (raiz) = {xk:.16f}')
print(f'f(xk) = {xk:.16f}')
print(f'ciclos = {conta_ciclos}')