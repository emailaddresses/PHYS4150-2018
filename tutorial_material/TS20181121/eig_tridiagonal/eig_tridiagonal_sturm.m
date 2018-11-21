function EVL = eig_tridiagonal_sturm(matA, max_iter)
% find eigenvalue of tridiagonal symmetry matrix
% referenc:
%    see lecture05.pdf (page26-36)
%    Gershgorin Circle Theorem WIKI: https://en.wikipedia.org/wiki/Gershgorin_circle_theorem
% matA(N1,N1)
% max_iter(int): parameter for my_bisection (finding root) method
% EVL(N1,1): short for EigenVaLue
tmp1 = (max(max(abs(triu(matA,2))))<1e-7) && max(max(abs(tril(matA,-2))))<1e-7;
assert(tmp1, 'eig_tridiagonal_sturm require tri-diagonal matrix')

N1 = size(matA,1);
M = diag(matA);
L = diag(matA,1);
if N1==1
    EVL = matA(1,1);
    return
end
tmp1 = (M(1) + M(2))/2;
tmp2 = sqrt((M(1)-M(2))^2 + 4*L(1)^2)/2;
EVL = [tmp1-tmp2; tmp1+tmp2];
if N1==2, return; end
min_eig = min(M - abs([0;L]) - abs([L;0]));
max_eig = max(M + abs([0;L]) + abs([L;0]));
for ind1 = 3:N1
    hf1 = @(x) det_tridiagonal(L(1:ind1-1), M(1:ind1)-x, L(1:ind1-1));
    interval = [min_eig; EVL; max_eig];
    EVL = zeros(ind1,1);
    for ind2 = 1:ind1
        EVL(ind2) = my_bisection(hf1, interval(ind2), interval(ind2+1), max_iter);
    end
end
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
