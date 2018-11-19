%{
right reserved for [Richang HUANG]
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
temp1 = 0;
temp2 = 0;
vecx = zeros(N1,1);
vecx(1,1) = vecb(1,1);
for i = 2 :N1
    for j = 1 : (i-1)
        temp1 = temp1+matL(i,j)*vecx(j,1);
    end
    vecx(i,1) = (vecb(i,1)-temp1);
    temp1 = 0 ;
end
% ---end of your code

% solve: matU*y = x
% ---start of your code (almost 7 lines)
vecy = zeros(N1,1);
vecy(N1,1) = vecx(N1,1)/matU(N1,N1);
for i = (N1-1) : -1 : 1
    for j = i+1 : N1
        temp2 = temp2+matU(i,j)*vecy(j);
    end
    vecy(i,1) = (vecx(i,1)-temp2)/matU(i,i);
    temp2 = 0 ;
end
ret = vecy;
% ---end of your code
end

function [matL,matU] = my_LU_decomposition(matA)
% decompose matrix A into lower trianglar matrix L and upper trianglar matrix: A = LU
% matA(N1*N1) matL(N1*N1) matU(N1*N1)
% convention: diagonal elements of matL are 1
N1 = size(matA,1);
% ---start of your code (almost 11 lines)
sum1 = 0;
sum2 = 0;
matU = zeros(N1,N1);
matL = eye(N1,N1);

for j = 1 : N1
    matU(1,j) = matA(1,j);
end

for i = 1 : N1
    matL(i,1) = matA(i,1)/matU(1,1);
end

for i = 2 : N1
    for j = i : N1
        for m = 1: (i-1)
            sum1 = sum1+matL(i,m)*matU(m,j);
            sum2 = sum2+matL(j,m)*matU(m,i);
        end
        matU(i,j) = matA(i,j)-sum1;
        matL(j,i) = (matA(j,i)-sum2)/matU(i,i);
        sum1 = 0 ;
        sum2 = 0 ;
    end
end
% ----end of your code
end
