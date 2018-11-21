function [EVC,EVL] = eig_quadratic(M0,M1,M2)
% solve eigenvalue problem (M0 + a*M1 + a^2*M2)*phi = 0
% M0/M1/M2(N0,N0)
% EVC(N0,2*N0) EVL(2*N0,1)
% reference:
%   https://en.wikipedia.org/wiki/Quadratic_eigenvalue_problem
%   https://prod.sandia.gov/techlib-noauth/access-control.cgi/2007/072072.pdf
N0 = size(M0, 1);
tmp1 = eye(N0,N0);
matA = [zeros(N0,N0), tmp1; M0, M1];
matB = blkdiag(tmp1, -M2);
[tmp1,tmp2] = eig(matA,matB);
EVC = tmp1(1:N0,:);
EVL = diag(tmp2);
end
