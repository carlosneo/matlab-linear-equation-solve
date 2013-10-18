%Programa - gauss_jordan.m
clear all;

A = [ 3 -0.1 -0.2;
      0.1 7 -0.3;
      0.3 -0.2 10 ];

b = [7.85; -19.3; 71.4];

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

