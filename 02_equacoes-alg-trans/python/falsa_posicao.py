from math import sin, cos, exp

def f(arg):
    # return exp(arg) * sin(arg) - 1
    return exp(arg) - 2 * cos(arg);


#intervalo
a = 0; b = 2
erro = 10 ** (-8); conta_ciclos = 0

fa = f(a); fb = f(b); fxm = 1;
xm = 2

if (fa * fb > 0):
    print("O intervalo dado não garante convergência :(")
else:
    while (abs(fxm) > erro):
        conta_ciclos += 1
        xm = (a * fb - b * fa) / (fb - fa);
        fxm = f(xm)

        if (fxm * fa < 0):
            b = xm
            fb = fxm
        elif (fxm * fa > 0):
            a = xm
            fa = fxm

        print(f'a: {a:.16f} | b: {b:.16f} | fx: {fxm:.16f}')
        #input()

print('Operação finalizada!')
print(f'Contador de ciclos: {conta_ciclos}')
print('Raiz: %.16f' %xm)
print('Valor f(raiz): %.16f' %fxm)



