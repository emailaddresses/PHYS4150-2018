%{
right reserved for [Red Scarf]
%}

function ret = code_template(matA,vecb)
% solve linear equation Ax=b using LU decomposition
% matA(N1,N1), matB(N1,1), ret(N1,1)
% convention: diagonal elements of matL are 1
% reference: https://en.wikipedia.org/wiki/LU_decomposition
N1 = size(matA,1);
[matL,matU] = my_LU_decomposition(matA);
% solve: matL*y = vecb
% ---start of your code (almost 4 lines)
y=zeros(N1,1);
y(1,1)=vecb(1,1)/matL(1,1);
for i=2:N1
    y(i,1)=vecb(i,1);
    for j=1:i-1
        y(i,1)=y(i,1)-matL(i,j)*y(j,1);
    end
    y(i,1)=y(i,1)/matL(i,i);
end
% ---end of your code

% solve: matU*y = x
% ---start of your code (almost 7 lines)
ret = zeros(N1,1);
ret(N1,1)=y(N1,1)/matU(N1,N1);
for i=N1-1:-1:1
    ret(i,1)=y(i,1);
    for j=N1:-1:i+1
        ret(i,1)=ret(i,1)-matU(i,j)*ret(j,1);
    end
    ret(i,1)=ret(i,1)/matU(i,i);
end
%}
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
    matL(j,1)=matA(j,1)/matU(1,1);
end
for i=2:N1
    for j=i:N1
        s1=0;s2=0;
        for m=1:i-1
            s1=s1+matL(i,m)*matU(m,j);
            s2=s2+matL(j,m)*matU(m,i);
        end
        matU(i,j)=matA(i,j)-s1;
        matL(j,i)=(matA(j,i)-s2)/matU(i,i);
    end
end
% ----end of your code
end