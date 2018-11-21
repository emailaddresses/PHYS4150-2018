function [EVC,EVL] = eig_householder_qr(matA, max_iter, tol)
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
[R,~,EVC] = tridiagonalize_householder(matA);
hf_tridiagonal = @(x) triu(x,-1) - triu(x,2);
for ind1 = 1:max_iter
    [Q,R] = qr_tridiagonal_householder(R);
    EVC = EVC * Q;
    tmp1 = hf_tridiagonal(R*Q); %due to rounding error
    if max(abs(R-tmp1))<tol, break; end
    R = tmp1;
end
EVL = diag(R);
end

function [retA,vec_reflector,retB] = tridiagonalize_householder(matA)
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

function [Q,R] = qr_tridiagonal_householder(matA)
% apply qr decomposition on tri-diagonal matrix using householder reflector
% reference: TO BE ADDED
% matA: tri-diagonal
% (ret1)Q(N0,N0): orthogonal matrix
% (ret2)R(N0,N0): upper triangle matrix
tmp1 = (max(max(abs(triu(matA,2))))<1e-7) && max(max(abs(tril(matA,-2))))<1e-7;
assert(tmp1, 'qr_tridiagonal require tri-diagonal matrix')

N0 = size(matA,1);
R = matA;
Q = eye(N0);
for ind1 = 1:N0-1
    ind2 = ind1 + 1;
    T = householder_matrix([R(ind1,ind1);R(ind2,ind1)],[1;0]);
    t11 = T(1,1);
    t12 = T(1,2);%t21
    t22 = T(2,2);
    
    tmp1 = t11*R(ind1,:) + t12*R(ind2,:);
    tmp2 = t12*R(ind1,:) + t22*R(ind2,:);
    R([ind1,ind2],:) = [tmp1;tmp2];
 
    tmp1 = t11*Q(:,ind1) + t12*Q(:,ind2);
    tmp2 = t12*Q(:,ind1) + t22*Q(:,ind2);
    Q(:,[ind1,ind2]) = [tmp1,tmp2];
end
end

function [mat,vec] = householder_matrix(source_vec, target_vec)
% find Householder transformation that transform source_vec (direction) to target_vec (direction)
% reference: https://en.wikipedia.org/wiki/Householder_transformation#Transformation
% source_vec/target_vec(N1,1)
% mat(N1,N1)
% vec(N1,1)

N1 = size(source_vec,1);
assert(size(target_vec,1)==N1);

source_vec = source_vec / sqrt(sum(source_vec.^2,1));
target_vec = target_vec / sqrt(sum(target_vec.^2,1));
vec = source_vec - target_vec;
vec = vec/sqrt(sum(vec.^2,1));
mat = eye(N1) - 2*(vec*vec.');
end
