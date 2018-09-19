function test_rectangular_rule()
hf1 = @(x) x.^3 + sin(1*x).^2;
a = rand(1);
b = a+rand(1);
hfe = @(x,y) max(abs(x-y)/(abs(x)+abs(y)+1e-3));

% compare result with built-in integral
ret1 = integral(hf1,a,b);
ret2 = my_rectangular_integral(hf1, a, b, 1000);
assert(hfe(ret1,ret2)<1e-2, 'my_rectangular_integral result has large error')
disp('unittest passed')
end

function ret = my_rectangular_integral(hf1, a, b, num_point)
tmp1 = linspace(a,b,num_point+1);
x = (tmp1(1:(end-1))+tmp1(2:end))/2;
ret = sum(hf1(x))*(b-a)/num_point;
end
