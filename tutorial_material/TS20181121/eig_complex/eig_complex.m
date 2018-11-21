function [EVC,EVL] = eig_complex(matA)
% solve eigenvalue problem of complex hermitian matrix
% matA(N0,N0)
% (ret1)EVC(N0,2*N0)
% (ret2)EVL(2*N0,1): remove duplication: TODO
% TODO: add reference
assert(ishermitian(matA), 'eig_complex requires hermitian matrix');
N0 = size(matA,1);
tmp1 = real(matA);
tmp2 = imag(matA);
[tmp1,tmp2] = eig([tmp1, -tmp2; tmp2, tmp1]);
EVC = tmp1(1:N0,:) + 1i*tmp1(N0+1:end,:);
EVL = diag(tmp2);
disp('TODO: remove duplication')
end
