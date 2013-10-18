%Programa - gauss_jacobi.m
clear all;

A = [  3 2 2 ;
       2 5 2;
       1 3 8];

b = [4; 2; 3];

tamanho = size(A);
n = tamanho(1);

%Construindo Vetor g
g = zeros(n,1);
for i = 1:n 
    g(i)=b(i)/A(i,i);
end    
display(g);

%Construindo Matriz C
C = zeros(n,n);
for i = 1:n %colunas
    for k = 1:n %linhas
        C(i,k) = -A(i,k)/A(i,i);
    end
end

for i = 1:n 
    C(i,i)=0;
end 
display(C);

%Iterações
e = 0.05;
dr = 1;
x1 = zeros(n,1);
Imax = 20; %Número Máximo de Iterações
conta = 0;
while(dr > e)
    if conta > Imax 
        break;
    end
    x0 = x1;
    x1 = C*x0 + g;
    display(x1);
    dr = (max(abs(x1-x0)))/max(abs(x1));
    display(dr);
    conta = conta + 1;      
end
display(conta);

%Verificação
x = A\b;
display(x);