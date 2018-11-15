function EVL = eig_householder_sturm(matA, max_iter)
% solve eigenvalue problem using Householder method + Sturm sequence (bisection)
% reference: see lecture05.pdf (page26-36)
% matA(N1,N1): symmetric
% max_iter(int)
% EVL(N1,1): short for EigenVaLue
N1 = size(matA,1);
if N1==1
    EVL = matA(1,1);
    return
end

assert(issymmetric(matA), "matrix for eig_jocabi should be symmetric");
[matA,~,~] = tridiagonal_householder(matA);
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
