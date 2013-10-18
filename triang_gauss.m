%Programa - triang_gauss.m
clear all;

A = [ 3 2 4;
      1 1 2;
      4 3 -2 ];

b = [1; 2; 3];

tamanho = size(A);
n = tamanho(1);
x = zeros(1,n);

%Triangularização
ATS = A;
bts = b;
for k = 1:(n-1)
    for i = (k+1):n
        m = ATS(i,k)/ATS(k,k);
        ATS(i,k) = 0;
        for j = (k+1):n
            ATS(i,j)=ATS(i,j)-m*ATS(k,j);
        end
        bts(i) = bts(i)-m*bts(k);
    end
end
display(ATS);
display(bts)

%Solução do Sistema Triangular Superior
x(n) = bts(n)/ATS(n,n);
for k = (n-1):-1:1
    s = 0;
    for j = (k+1):n
        s = s + ATS(k,j)*x(j);
        x(k) = (bts(k) - s)/ATS(k,k);
    end
end

display(x);