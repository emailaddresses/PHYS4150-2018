function [EVC,EVL] = eig_qr_householder(matA, max_iter, tol)
% solve eigenvalue problem using Jacobi method
% reference: https://en.wikipedia.org/wiki/Jacobi_eigenvalue_algorithm
% matA(N1,N1): symmetric
% max_iter(int)
% EVC(N1,N1): short for EigenVeCtor, each column corresponding one eigenvector
% EVL(N1,1): short for EigenVaLue
if nargin==2, tol=1e-5; end
N1 = size(matA,1);
if N1==1
    EVC = 1;
    EVL = matA(1,1);
    return
end

assert(issymmetric(matA), "matrix for eig_jocabi should be symmetric");
[R,~,EVC] = tridiagonal_householder(matA);
for ind1 = 1:max_iter
    [Q,R] = qr_tridiagonal(R);
    EVC = EVC * Q;
    tmp1 = R*Q;
    if max(abs(R-tmp1))<tol, break; end
    R = tmp1;
end
EVL = diag(R);
end
