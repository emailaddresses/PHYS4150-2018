%{
right reserved for [YUAN Mengfeix]
%}

% implement adaptive simpsom rule
% see my_adaptive_trapezoidal_integral for reference
%----start from here----

hf1 = @(x) sin(x);
a = 0;
b = pi;
num_point = 6;
h = (b-a)/(num_point-1);
error = 0.001;

for i = 1:100
 N = linspace(a,b,num_point);
 No = N(2:2:end-2);
 Ne = N(3:2:end-1);
 sum_d = hf1(a) + hf1(b);
 S1 = (h/3)*(sum_d+4*sum(hf1(No))+2*sum(hf1(Ne))); 
 Ne1 = sum(hf1(No)+hf1(Ne));
 N2 = N+h/2;
 N(end) = [];
 N = N2;
 S2 = (h/6)*(sum_d+4*sum(hf1(N2))+2*Ne1);
 error2 = abs(S2-S1);
 %fprintf ('%d\n',i); %
 if error2<error
     break
 end

 num_point = 2* num_point;
 h = (b-a)/(num_point-1);
 N = linspace(a,b,num_point);

end

 fprintf('No. of points: %d\nerror: %d\nI: %d\n', num_point, error2,  S2)