function Newton
  format long
  clear
  clc
  x = [0 1 2 3];
  y = [-3 -2 4 0];
  n = length(x);
  xx = 2.5;
  printf("Valor de %d:\n", xx)
  r = New(x,y,n,xx)

  printf("\n====== VALORES TABELADOS ======\n")
  for i = 1:n
     printf("\nValor de %d:\n", x(i))
     x2 = New(x,y,n, x(i))
  end

  printf("\n===== VALORES NÃO TABELADOS =====\n")
  x1 = [x(1):0.1:x(n)]
  n1 = length(x1);
  for k=1:n1
    p1(k)= New(x,y,n,x1(k));
  end
  p1
end

function p = New(x,y,n,xx)
  for i = 1:n
    a(i,1) = y(i);
  end

  for j = 2:n
    for i = j:n
      a(i,j) = (a(i,j-1) - a(i-1, j-1))/(x(i) - x(i-j+1));
    end
  end

  p = 0;
  for i = 1:n
    b = 1;
    for j = 1:i-1
      b *= (xx - x(j));
    end

    p += a(i,i) * b;
  end
end