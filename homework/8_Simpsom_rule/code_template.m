%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

function ret = code_template(hf1, a, b, num_iter)
% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----
sum_d = hf1(a) + hf1(b);
sum_o = hf1((a+b)/2);
sum_e = 0;
ret = 
%----end----
end
