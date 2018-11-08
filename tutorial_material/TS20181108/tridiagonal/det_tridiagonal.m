function ret = det_tridiagonal(L,M,U)
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
