%Programa - gauss_jordan_2.m
clear all;

A = input('A = ');

b = input('b = ');

tamanho = size(A);
n = tamanho(1);
x = zeros(1,n);

%Concatenar A e b
Ac = [ A b ];
display(Ac);

%Eliminação com Normalização
for k = 1:n %Índice do Pivot
 
    %Normalização da linha 
    p = Ac(k,k); %Pivot 
    Ac(k,k) = 1;
    for j = (k+1):(n+1) %Colunas
        Ac(k,j) = Ac(k,j)/p;
    end
    display(Ac);
    
    %Eliminação
    for i = 1:n %Linhas
        if (i ~= k)
            m = Ac(i,k);
            Ac(i,k) = 0;
            for j = (k+1):(n+1) %Obs: Colunas (+1)
                Ac(i,j)=Ac(i,j)-m*Ac(k,j);
            end
        end
    end
    display(Ac);
end

