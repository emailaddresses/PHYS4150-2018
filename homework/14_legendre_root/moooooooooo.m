%{
right reserved for [moooooooooo~]
%}

function ret = code_template(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)
if N==0
    ret = zeros(1,0);
    return;
end

[~, hf_legendre] = my_legendre(N);
hf_legendre_gradient = @(x) (hf_legendre(x+1e-5) - hf_legendre(x-1e-5))/2e-5;
% ---start coding from here---
roots = zeros(1,N);
j = 1; N=N*12;
for i = 1:N
    if (hf_legendre(2/N*(i-1)-1) == 0)
        root(j) = 0;
        j++;
    else if hf_legendre(2/N*i-1)*hf_legendre(2/N*(i-1)-1)<0
        tmp = my_bisection(hf_legendre, 2/N*i-1, 2/N*(i-1)-1, 3);
        [roots(j),~] = my_newton_raphson(hf_legendre, hf_legendre_gradient, tmp, 10);
        j++;
    end
end
ret = roots;
% ---end coding---
end

