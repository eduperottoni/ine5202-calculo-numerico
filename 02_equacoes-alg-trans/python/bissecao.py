import math

def f(arg):
    #return math.exp(arg) * math.sin(arg) - 1
    return math.e**arg - 2 * math.cos(arg)
#intervalo
a = 0; b = 2
erro = 10**-8; conta_ciclos = 0
fxm = 1; fa = f(a); fb = f(b);
xm = 2

if (f(a) * f(b) > 0):
    print("O intervalo dado não garante convergência :(")
else:
    while (abs(fxm) > erro):
        conta_ciclos += 1
        xm = (a + b) / 2
        fxm = f(xm)

        if (fxm * f(a) < 0):
            b = xm
            fb = fxm
        elif (fxm * f(a) > 0):
            a = xm
            fa = fxm

        print(f'xm = {xm:.16f}')
        print(f'f(xm) = {fxm:.16f}')
        #input()

print(f'Contador de ciclos: {conta_ciclos}')
print('xm (raiz): %.16f' %xm)
print('f(xm): %.16f' %fxm)



