function [EVC, EVL] = eig_jacobi(matA, max_iter)
% solve eigenvalue problem using Jacobi method
% reference: https://en.wikipedia.org/wiki/Jacobi_eigenvalue_algorithm
% matA(N1,N1): symmetric
% EVC(N1,N1): short for EigenVeCtor, each column corresponding one eigenvector
% EVL(N1,1): short for EigenVaLue
assert(issymmetric(matA), "matrix for eig_jocabi should be symmetric");
N1 = size(matA,1);
EVC = eye(N1,N1);

for ind0 = 1:max_iter
    [~,ind1,ind2] = matrix_maximum(abs(triu(matA,1) + tril(matA, -1)));
    if abs(matA(ind1,ind2))<1e-7, break; end
    theta = atan(2*matA(ind1,ind2) / (matA(ind2,ind2)-matA(ind1,ind1)))/2;
    s = sin(theta);
    c = cos(theta);

    % update matA
    tmp1 = c*matA(ind1,:) - s*matA(ind2,:);
    tmp1(ind1) = c^2*matA(ind1,ind1) - 2*s*c*matA(ind1,ind2) + s^2*matA(ind2,ind2);
    tmp1(ind2) = 0;
    tmp2 = s*matA(ind1,:) + c*matA(ind2,:);
    tmp2(ind1) = 0;
    tmp2(ind2) = s^2*matA(ind1,ind1) + 2*s*c*matA(ind1,ind2) + c^2*matA(ind2,ind2);
    matA(ind1,:) = tmp1;
    matA(ind2,:) = tmp2;
    matA(:,ind1) = matA(ind1,:).';
    matA(:,ind2) = matA(ind2,:).';

    % update EVC
    tmp1 = EVC(:,ind1)*c - EVC(:,ind2)*s;
    tmp2 = EVC(:,ind1)*s + EVC(:,ind2)*c;
    EVC(:,ind1) = tmp1;
    EVC(:,ind2) = tmp2;
end
EVL = diag(matA);
end


function [value,ind1,ind2] = matrix_maximum(matA)
% find maximum value of a matrix
N1 = size(matA,1);
[value,ind0] = max(matA(:));
ind1 = mod(ind0-1,N1)+1;
ind2 = floor((ind0-1)/N1) + 1;
end
