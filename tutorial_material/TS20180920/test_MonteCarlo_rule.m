function test_MonteCarlo_rule()
hf1 = @(x) x.^3 + sin(1*x).^2;
a = rand(1);
b = a+rand(1);
hfe = @(x,y) max(abs(x-y)/(abs(x)+abs(y)+1e-3));

% compare result with built-in integral
ret1 = integral(hf1,a,b);
ret2 = my_MonteCarlo_rule(hf1, a, b, 5000);
assert(hfe(ret1,ret2)<1e-2, 'my_MonteCarlo_rule result has large error')
disp('unittest passed')

hf1 = @(x) sqrt(1-x.^2);
disp(my_MonteCarlo_rule(hf1, -1, 1, 5000)*2);
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
x = rand([1,num_point])*(b-a) + a;
ret = sum(hf1(x))/num_point * (b-a);
end
