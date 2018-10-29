%{
right reserved for [Zhang Haotong]
%}

function ret = ZHT_14_legendreroot(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)
if N==0
    ret = zeros(1,0);
    return;
end
[~, hf_legendre] = my_legendre(N);
hf_legendre_gradient = @(x) (hf_legendre(x+1e-5) - hf_legendre(x-1e-5))/2e-5;
% ---start coding from here---
ret = zeros(1,N);
a = 1;
for i=-1:0.0001:1
    if hf_legendre(i)*hf_legendre(i+0.0001)<0
       [ret(1,a),~]= my_bisection(hf_legendre, i, i+0.0001, 50);
       a = a+1;
    end
end
ret = sort(ret);
% ---end coding---
end