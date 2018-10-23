%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

%%%%%%%%%%%%%%
% THIS IS HW8!
%%%%%%%%%%%%%%
function ret = code_template(hf1, a, b, num_iter)
% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----
sum_d = hf1(a) + hf1(b);
sum_o = hf1((a+b)/2);
sum_e = 0;
for ind1 = 1:num_iter
    sum_e = sum_o + sum_e;
    tmp1 = (b-a)/2^ind1;
    sum_o = sum(hf1(a+tmp1/2 + tmp1*(0:(2^ind1-1))));
end
ret = (b-a)/2^(num_iter+1)/3*(sum_d + 2*sum_e + 4*sum_o);      %% almost alike with trapezodal integral, just change factor of some specific terms.
%----end----
end