function EVL = eig_householder_sturm(matA, max_iter)
% solve eigenvalue problem using Householder method + Sturm sequence (bisection)
% reference:
%   lecture05.pdf (page26-36)
%   Gershgorin Circle Theorem WIKI: https://en.wikipedia.org/wiki/Gershgorin_circle_theorem
% matA(N1,N1): symmetric
% max_iter(int)
% EVL(N1,1): short for EigenVaLue
N1 = size(matA,1);
if N1==1
    EVL = matA(1,1);
    return
end

assert(issymmetric(matA), "matrix for eig_jocabi should be symmetric");
[matA,~,~] = tridiagonalize_householder(matA);
%L = U
M = diag(matA);
U = diag(matA, 1);
tmp1 = (M(1) + M(2))/2;
tmp2 = sqrt((M(1)-M(2))^2 + 4*U(1)^2)/2;
EVL = [tmp1-tmp2; tmp1+tmp2];
if N1==2, return; end
min_eig = min(M - abs([0;U]) - abs([U;0]));
max_eig = max(M + abs([0;U]) + abs([U;0]));
for ind1 = 3:N1
    hf1 = @(x) det_tridiagonal(U(1:ind1-1), M(1:ind1)-x, U(1:ind1-1));
    interval = [min_eig; EVL; max_eig];
    EVL = zeros(ind1,1);
    for ind2 = 1:ind1
        EVL(ind2) = my_bisection(hf1, interval(ind2), interval(ind2+1), max_iter);
    end
end
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

function ret = det_tridiagonal(L,M,U)
% calculate the determinant of tridiagonal matrix
% reference: see lecture05.pdf page66
% L(N1-1,1) M(N1,1) U(N1-1,1)
% ret(1,1)
N1 = size(M,1);
if N1==1
    ret = M;
    return
end
det_i = zeros(N1,1);
det_i(1) = M(1);
det_i(2) = M(1)*M(2) - L(1)*U(1);
for ind1 = 3:N1
    det_i(ind1) = det_i(ind1-1)*M(ind1) - det_i(ind1-2)*L(ind1-1)*U(ind1-1);
end
ret = det_i(end);
end

function [ret,tracks] = my_bisection(hf1, a, b, step)
% find root using bisection method
% reference: https://en.wikipedia.org/wiki/Bisection_method
% hf1(function handle), a(float), b(float) step(int)
% ret(float), tracks(1,step)
fa = hf1(a);
fb = hf1(b);
assert(fa*fb<0, 'bisection method require function value signs at a and b differ');
tracks = zeros(1,step);
for ind1 = 1:step
    new_x = (a+b)/2;
    fx = hf1(new_x);
    tracks(ind1) = new_x;
    if fx*fa<0
        fb = fx;
        b = new_x;
    elseif fx*fb<0
        fa = fx;
        a = new_x;
    else
        break;
    end
end
tracks = tracks(1:ind1);
ret = tracks(ind1);    
end
