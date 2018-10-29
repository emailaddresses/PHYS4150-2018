function ret = code_template(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)
if N==0
    ret = zeros(1,0);
    return;
end

[~, hf_legendre] = my_legendre(N);
hf_legendre_gradient = @(x) (hf_legendre(x+1e-5) - hf_legendre(x-1e-5))/2e-5;

num_point = 100; %fail when order is quite high,
x = linspace(-1,1,num_point);
y = hf_legendre(x);
x0_array = x([y(1:end-1).*y(2:end) <= 0, false]);
ret = zeros(1,N);
for ind1 = 1:N
    ret(ind1) = my_newton_raphson(hf_legendre, hf_legendre_gradient, x0_array(ind1), 5);
end
end
