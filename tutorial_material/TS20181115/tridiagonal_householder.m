function [retA,vec_reflector,retB] = tridiagonal_householder(matA)
% transform matA into tri-diagonal form
% reference: https://en.wikipedia.org/wiki/Householder_transformation#Tridiagonalization
% matA(N1,N1): symmetric
% (ret1)retA: tri-diagonal matrix
% (ret2)vec_reflector: reflector vector used in transformation
% (ret3)retB: matA = retB*retA*retB', retB * retB' = I
% doc hess
assert(issymmetric(matA), "matrix for eig_jocabi should be symmetric");
N1 = size(matA,1);

vec_reflector = zeros(N1,N1-2);
retB = eye(N1);
for ind1 = 2:(N1-1)
    vec1 = matA(ind1:end,ind1-1);
    vec2 = zeros(size(vec1));
    vec2(1) = 1;
    [mat,vec_reflector(ind1:end,ind1-1)] = householder_matrix(vec1,vec2);
    T = blkdiag(eye(ind1-1), mat);
    retB = retB * T;
    matA = T * matA * T;
end
retA = matA;
end
