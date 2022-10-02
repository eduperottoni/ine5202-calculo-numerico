import math

def f(arg):
    #return math.exp(arg) * math.sin(arg) - 1
    return math.e**arg - 2 * math.cos(arg)
#intervalo
a = 0
b = 2
erro = 10**-8
conta_ciclos = 0
fx = 1
fa = f(a); fb = f(b)

xm = 2

if (f(a) * f(b) > 0):
    print("O intervalo dado não garante convergência :(")
else:
    while (abs(fx) > erro):
        conta_ciclos += 1
        xm = a - (fa * (b - a))/(fb - fa)
        fx = f(xm)

        if (fx * fa < 0):
            pb = fa / (fa + fx)
            b = xm
            fb *= pb
        elif (fx * fa > 0):
            pa = fb / (fb + fx)
            a = xm
            fa *= pa

        print(f'a: {a} | b: {b} | fx: {fx}')
        #input()

print(f'Contador de ciclos: {conta_ciclos}')
print('Raiz: %.16f' %xm)
print('Valor f(raiz): %.16f' %fx)



