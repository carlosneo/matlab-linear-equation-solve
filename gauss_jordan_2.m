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

%Elimina��o com Normaliza��o
for k = 1:n %�ndice do Pivot
 
    %Normaliza��o da linha 
    p = Ac(k,k); %Pivot 
    Ac(k,k) = 1;
    for j = (k+1):(n+1) %Colunas
        Ac(k,j) = Ac(k,j)/p;
    end
    display(Ac);
    
    %Elimina��o
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

