function ret = my_naive_simpsom_integral(hf1, a, b, num_point)
x = linspace(a,b,num_point);
weight = ones(1,num_point);
weight(3:2:end-1) = 2;
weight(2:2:end-1) = 4;
weight = weight*(b-a)/(num_point-1)/3;
ret = sum(hf1(x).*weight);
end
