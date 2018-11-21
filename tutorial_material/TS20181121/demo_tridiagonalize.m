N1 = 5;
tmp1 = rand(N1,N1);
matA = tmp1 + tmp1';

for ind_repeat = 1:2
    matA_ = matA;

    if exist('fig', 'var'), close(fig); end
    fig = figure('Position', [1,1,1200,600]);
    ctrl1 = struct('fig',fig,'ax',subplot(1,2,1),'pause_time',0);
    ctrl1.pause_time = 1;
    ctrl1 = demo_matrix(ctrl1, eye(N1), 'householder matrix');
    ctrl2 = struct('fig',fig,'ax',subplot(1,2,2),'pause_time',1);
    ctrl2 = demo_matrix(ctrl2, matA_, 'A_1');

    for ind1 = 2:(N1-1)
        vec1 = matA_(ind1:end,ind1-1);
        vec2 = zeros(size(vec1));
        vec2(1) = 1;
        [mat,~] = householder_matrix(vec1,vec2);
        T = blkdiag(eye(ind1-1), mat);
        ctrl1 = demo_matrix(ctrl1, T, sprintf('householder matrix: S_%d', ind1-1));
        matA_ = T * matA_ * T;
        ctrl2 = demo_matrix(ctrl2, matA_, sprintf('A_%d = S_%dA_%dS_%d', ind1,ind1-1,ind1-1,ind1-1));
    end
    pause(1);
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
