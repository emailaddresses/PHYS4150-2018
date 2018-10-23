%{
right reserved for [Zhang Haotong]
%}

function ret = ZHT_8_Simpsom_rule(hf1, a, b, num_iter)
% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----
N = 4;%starting from N = 4
sum_d = hf1(a) + hf1(b);
sum_o = hf1(a + (b-a)/4) + hf1(a + (b-a)*3/4);
sum_e = hf1((a+b)/2);
for ind1 = 1:num_iter
   sum_e = sum_e + sum_o;
   sum_o = 0;
   for i = 1:N
       sum_o = sum_o+hf1(a+(2*i-1)*(b-a)/(2*N));
   end
   N = N*2;
end
ret = (sum_d + 2*sum_e + 4*sum_o)*(b-a)/N/3;
%----end----
end