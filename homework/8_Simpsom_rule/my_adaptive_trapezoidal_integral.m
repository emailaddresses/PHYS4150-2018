function ret = my_adaptive_trapezoidal_integral(hf1, a, b, num_iter)
sum_d = hf1(a) + hf1(b);
sum_o = hf1((a+b)/2);
sum_e = 0;
for ind1 = 1:num_iter
    sum_e = sum_o + sum_e;
    tmp1 = (b-a)/2^ind1;
    sum_o = sum(hf1(a+tmp1/2 + tmp1*(0:(2^ind1-1))));
end
ret = (b-a)/2^(num_iter+1)/2*(sum_d + 2*sum_e + 2*sum_o);
end
