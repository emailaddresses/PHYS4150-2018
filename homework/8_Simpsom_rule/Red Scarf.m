%{
right reserved for [Red Scarf]
%}

function ret = code_template(hf1, a, b, num_iter)
% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----
sum_d = hf1(a) + hf1(b);
sum_o = hf1((a+b)/2);
sum_e = 0;
N=2;
for i=1:num_iter
  N*=2;
  h=(b-a)/N;
  sum_e=sum_e+sum_o;
  sum_o=0;
  for j=1:(N/2)
    sum_o+=hf1(a+(2*j-1)*h);
  endfor
endfor
ret = h/3*(sum_d+4*sum_o+2*sum_e);
%----end----
end
