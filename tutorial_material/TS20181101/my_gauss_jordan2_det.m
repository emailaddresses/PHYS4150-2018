function ret = my_gauss_jordan2_det(matA)
% calculate matrix determinant using Gauss Jordan Elimination with pivot along both column and row
% matA(N0,N0)
% ret(1,1)
% reference: https://en.wikipedia.org/wiki/Determinant
N0 = size(matA,1);
sign = 1;
for ind1 = 1:(N0-1)
    [~,ind2,ind3] = matrix_maximum(abs(matA(ind1:end,ind1:end)));
    if ind2~=1
        sign = -sign;
        matA([ind1,ind1+ind2-1],ind1:end) = matA([ind1+ind2-1,ind1],ind1:end);
    end
    if ind3~=1
        sign = -sign;
        matA(:,[ind1,ind1+ind3-1]) = matA(:,[ind1+ind3-1,ind1]);
    end
    tmp1 = -matA((ind1+1):N0,ind1)/matA(ind1,ind1);
    matA((ind1+1):N0,ind1:end) = matA((ind1+1):N0,ind1:end) + tmp1.*matA(ind1,ind1:end);
end
ret = prod(diag(matA))*sign;
end

function [value,ind1,ind2] = matrix_maximum(matA)
sz1 = size(matA,1);
[value,tmp1] = max(matA(:));
ind1 = mod(tmp1-1,sz1)+1;
ind2 = (tmp1-ind1)/sz1 + 1;
end
