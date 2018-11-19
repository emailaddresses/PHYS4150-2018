%{
right reserved for [Yihan]
%}

function ret = code_template(matA,vecb)
% solve linear equation Ax=b using LU decomposition
% matA(N1,N1), matB(N1,1), ret(N1,1)
% convention: diagonal elements of matL are 1
% reference: https://en.wikipedia.org/wiki/LU_decomposition
N1 = size(matA,1);
[matL,matU] = my_LU_decomposition(matA);

% solve: matL*x = vecb
% ---start of your code (almost 4 lines)
x=zeros(N1,1);
for i=1:N1
    x(i)=vecb(i)-sum(matL(i,1:N1)*x(1:N1));
end
% ---end of your code

% solve: matU*y = x
% ---start of your code (almost 7 lines)
y=zeros(N1,1);
for i=1:N1
    y(N1+1-i)= (x(N1+1-i)-sum(matU(N1+1-i,1:N1)*y(1:N1)))/matU(N1+1-i,N1+1-i);
end
ret = y;
% ---end of your code
end

function [matL,matU] = my_LU_decomposition(matA)
% decompose matrix A into lower trianglar matrix L and upper trianglar matrix: A = LU
% matA(N1*N1) matL(N1*N1) matU(N1*N1)
% convention: diagonal elements of matL are 1
N1 = size(matA,1);
% ---start of your code (almost 11 lines)
matU = zeros(N1,N1);
matL = eye(N1,N1);
matU(1,1:N1) = matA(1,1:N1);
matL(1:N1,1) = matA(1:N1,1)/matU(1,1);
for i=2:N1
    for j=i:N1
        matU(i,j) = matA(i,j)-sum(matL(i,1:i-1)*matU(1:i-1,j));
        matL(j,i) = (matA(j,i)-sum(matL(j,1:i-1)*matU(1:i-1,i)))/matU(i,i);   %%% calculate L(i,j) & U(j,i) for once
    end
end
% ----end of your code
end
