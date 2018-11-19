%{
right reserved for [mooooooooo~]
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
tmp(1,1) = vecb(1,1);
for i = 2:N1
    tmp(i,1) = vecb(i,1) - sum(matL(i,1:i-1)'.*tmp(1:i-1,1));
end
% ---end of your code

% solve: matU*y = x
% ---start of your code (almost 7 lines)
x(N1,1) = tmp(N1,1)/matU(N1,N1);
for i = N1-1:-1:1
    x(i,1) = (tmp(i,1) - sum(matU(i,N1:-1:i+1)'.*x(N1:-1:i+1,1)))/matU(i,i);
end
ret = x;
% ALTERNATIVE METHOD but with worse precision possibly due to limit of flip function
% matUflip = flip(flip(matU,1),2);
% tmpflip = flip(tmp,1);
% x(1,1) = tmpflip(1,1)/matUflip(1,1);
% for i = 2:N1
%     x(i,1) = (tmpflip(i,1) - sum(matUflip(i,1:i-1)'.*x(1:i-1,1)))/matUflip(i,i);
% end
% ret = flip(x,1);
% ---end of your code
end

function [matL,matU] = my_LU_decomposition(matA)
% decompose matrix A into lower trianglar matrix L and upper trianglar matrix: A = LU
% matA(N1*N1) matL(N1*N1) matU(N1*N1)
% convention: diagonal elements xof matL are 1
N1 = size(matA,1);
% ---start of your code (almost 11 lines)
matU = zeros(N1,N1);
matL = eye(N1,N1);
matU(1,:) = matA(1,:);
for i = 2:N1   % #row
    matL(i,1) = matA(i,1)/matU(1,1);
    for j = 2:N1    % #column
        if j < i
            matL(i,j) = (matA(i,j) - sum(matL(i,1:j-1)'.*matU(1:j-1,j)))/matU(j,j);
        else
            matU(i,j) =  matA(i,j) - sum(matL(i,1:i-1)'.*matU(1:i-1,j));
        end
    end
end
% ----end of your code
end
