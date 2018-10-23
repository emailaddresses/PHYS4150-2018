%{
right reserved for [W Yi]
%}

function ret = code_template(hf1, a, b, num_iter)
% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----
sum_d = hf1(a) + hf1(b);
sum_o = hf1((a+b)/2);
sum_e = 0;
ret = 0;
n=2;
for i=1:num_iter
    n=n*2;
    h=(b-a)/n;
    sum_e=sum_e+sum_o;
    sum_o=0;
    for j=1:(n/2)
        sum_o=sum_o+hf1(a+(2*j-1)*h);
    end
end
ret=h*(sum_d+2*sum_e+4*sum_o)/3;
end
