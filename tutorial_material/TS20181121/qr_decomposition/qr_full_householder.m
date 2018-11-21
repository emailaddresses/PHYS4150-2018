function [Q,R] = qr_full_householder(matA)
% apply qr decomposition on full matrix using householder reflector
% reference: TO BE ADDED
% matA: tri-diagonal
% (ret1)Q(N0,N0): orthogonal matrix
% (ret2)R(N0,N0): upper triangle matrix

N0 = size(matA,1);
R = matA;
Q = eye(N0);
for ind1 = 1:N0-1
    T = householder_matrix(R(ind1:N0,ind1), [1;zeros(N0-ind1,1)]);
    R(ind1:N0,ind1:N0) = T*R(ind1:N0,ind1:N0);
    Q(:,ind1:N0) = Q(:,ind1:N0)*T;
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
