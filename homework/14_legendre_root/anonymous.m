%{
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
ret = zeros(1,N);
meow = linspace(-1,1,N+1);

for i =1:N
    left = meow(i);
    right = meow(i+1);
    [meowmeow,~] = my_bisection(@(x)hf_legendre(x),left,right,15);
    ret(1,i) = meowmeow;
end

% ---end coding---
end