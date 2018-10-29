function ret = code_template(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)
if N==0
    ret = zeros(1,0);
    return;
end

[~, hf_legendre] = my_legendre(N);

num_point = 100; %fail when order is quite high,
x = linspace(-1,1,num_point);
y = hf_legendre(x);
ind1 = find(y(1:end-1).*y(2:end) <= 0);
a_array = x(ind1);
b_array = x(ind1+1);
ret = zeros(1,N);
for ind1 = 1:N
    ret(ind1) = my_bisection(hf_legendre, a_array(ind1), b_array(ind1), 20);
end
end
