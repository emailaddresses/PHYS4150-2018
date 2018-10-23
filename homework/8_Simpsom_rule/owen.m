%{
right reserved for [owen]
%}

function ret = code_template(hf1, a, b, num_iter)
% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----
sum_d = hf1(a) + hf1(b);
sum_o = hf1((a+b)/2);
sum_e = 0;

for ind1 = 1:num_iter
    sum_e = sum_o + sum_e;
    tmp1 = (b-a)/2^(ind1+1);
    sum_o = sum(hf1(a + (2*(1:2^(ind1))-1)*tmp1));
end
ret = (b-a)/2^(num_iter+1)/3*(sum_d + 4*sum_o + 2*sum_e);
%----end----
end
