function [mat,vec] = householder_matrix(source_vec, target_vec)
% find Householder transformation that transform source_vec (direction) to target_vec (direction)
% reference: https://en.wikipedia.org/wiki/Householder_transformation#Transformation
% sepcial case: target_case==[1,0,0,...]
%   see lecture note and wiki. Actually, exactly the same as below
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
