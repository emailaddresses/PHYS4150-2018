function ret = my_gauss_jordan2_Ab(matA,matB)
% solve linear equation using Gauss Jordan elimination with pivot along row and column
% matA(N0,N0) vecb(N0,1)
% ret(N0,1)
% reference: https://en.wikipedia.org/wiki/Gaussian_elimination

N1 = size(matA,1);
ind1 = 1:N1;
ind2 = 1:N1;
for ind3 = 1:(N1-1)
    [~,ind4,ind5] = matrix_maximum(abs(matA(ind1(ind3:end),ind2(ind3:end))));
    ind1([ind3,ind3+ind4-1]) = ind1([ind3+ind4-1,ind3]);
    ind2([ind3,ind3+ind5-1]) = ind2([ind3+ind5-1,ind3]);
    tmp1 = -matA(ind1((ind3+1):end),ind2(ind3)) / matA(ind1(ind3),ind2(ind3));
    matA(ind1((ind3+1):end),ind2(ind3:end)) = matA(ind1((ind3+1):end),ind2(ind3:end))...
        + tmp1*matA(ind1(ind3),ind2(ind3:end));
    matB(ind1((ind3+1):end),:) = matB(ind1((ind3+1):end),:) + tmp1*matB(ind1(ind3),:);
end

for ind3 = 1:N1
    tmp1 = matA(ind1(ind3),ind2(ind3));
    matA(ind1(ind3),ind2(ind3:end)) = matA(ind1(ind3),ind2(ind3:end))/tmp1;
    matB(ind1(ind3),:) = matB(ind1(ind3),:)/tmp1;
end

for ind3 = N1:-1:2
    tmp1 = -matA(ind1(1:(ind3-1)),ind2(ind3));
    matB(ind1(1:(ind3-1)),:) = matB(ind1(1:(ind3-1)),:) + tmp1*matB(ind1(ind3),:);
    matA(ind1(1:(ind3-1)),ind2(ind3)) = 0;
end
[~,ind2_] = sort(ind2);
ret = matB(ind1(ind2_),:);
end

function [value,ind1,ind2] = matrix_maximum(matA)
sz1 = size(matA,1);
[value,tmp1] = max(matA(:));
ind1 = mod(tmp1-1,sz1)+1;
ind2 = (tmp1-ind1)/sz1 + 1;
end