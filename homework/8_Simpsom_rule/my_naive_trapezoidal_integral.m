function ret = my_naive_trapezoidal_integral(hf1, a, b, num_point)
x = linspace(a,b,num_point);
weight = [1/2, ones(1,num_point-2), 1/2] * (b-a)/(num_point-1);
ret = sum(hf1(x).*weight);
end
