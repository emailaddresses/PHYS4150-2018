%{
right reserved for [Zhou Wenhan]
%}

function ret = lu_linear_equation(matA,vecb)
% solve linear equation Ax=b using LU decomposition
% matA(N1,N1), matB(N1,1), ret(N1,1)
% convention: diagonal elements of matL are 1
% reference: https://en.wikipedia.org/wiki/LU_decomposition
N1 = size(matA,1);
[matL,matU] = my_LU_decomposition(matA);
% solve: matL*x = vecb
% ---start of your code (almost 4 lines)
x=zeros(N1,1);x(1)=vecb(1);
if N1>1
    for i=2:N1
        x(i,1)=vecb(i,1)-sum(diag(matL(i,1:i-1).*x(1:i-1,1)));
    end
end
% ---end of your code

% solve: matU*y = x
% ---start of your code (almost 7 lines)
ret = zeros(N1,1); ret(N1)=x(N1,1)/matU(N1,N1);
if N1>1
    for i=N1-1:-1:1
        ret(i,1)=(x(i,1)-sum(diag(matU(i,i+1:N1).*ret(i+1:N1,1))))/(matU(i,i));
    end
end
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
for j=1:N1
    matU(1,j)=matA(1,j);
end
for i=1:N1
    matL(i,1)=matA(i,1)/matU(1,1);
end
for j=2:N1
    
    matU(2,j)=matA(2,j)-sum(diag(matL(2,1).*matU(1,j)));
end
if N1>2
    for i=3:N1
        for j=2:i-1
            matL(i,j)=(matA(i,j)-sum(diag(matL(i,1:j-1).*matU(1:j-1,j))))/matU(j,j);
        end
        for j=i:N1
            matU(i,j)=matA(i,j)-sum(diag(matL(i,1:i-1).*matU(1:i-1,j)));
        end
    end
end
% ----end of your code
end
