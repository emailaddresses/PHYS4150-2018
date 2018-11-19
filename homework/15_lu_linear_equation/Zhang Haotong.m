%{
right reserved for [Zhang Haotong]
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
x = zeros(N1,1);
x(1)=vecb(1)/matL(1,1);
for i=2:1:N1
    for j=1:1:i-1
        x(i) = x(i)+matL(i,j)*x(j);
    end
    x(i) = (vecb(i)-x(i))/matL(i,i);
end
% ---end of your code
% solve: matU*y = x
% ---start of your code (almost 7 lines)
y = zeros(N1,1);
y(N1)=x(N1)/matU(N1,N1);
for i=N1-1:-1:1
    for j=N1:-1:i+1
        y(i) = y(i)+matU(i,j)*y(j);
    end
    y(i) = (x(i)-y(i))/matU(i,i);
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
for i=1:1:N1
    matL(2,1)=matA(2,1)/matA(1,1);
    if i>2
        for j=1:1:i-1
            matL(i,1) = matA(i,1)/matA(1,1);
            if j>1
                for m=1:1:j-1
                    matL(i,j) = matL(i,j)+matL(i,m)*matU(m,j);
                end
                matL(i,j) = (matA(i,j)-matL(i,j))/matU(j,j);
            end
        end
    end
    for j=1:1:N1
        if i<=j
            matU(i,j) = matA(i,j);
            if i == 1
                matU(i,j) = matU(i,j);
            else
                for m=1:1:i-1
                    matU(i,j) = matU(i,j)-matL(i,m)*matU(m,j);
                end
            end
        end
    end
end

% ----end of your code
end