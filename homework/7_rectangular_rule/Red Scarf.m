%{
right reserved for [Red Scarf]
%}


function ret = code_template(hf1, a, b, num_point)
% rectangular rule
% hf1: function handle
%    e.g. hf1=@(x) 3x
%    more detail see doc('function handle')
% a: lower limit
% b: upper limit
% num_point: number of evaluation point (more point, more accurate)
%----- start coding from here ----
h=(b-a)/num_point;
sum=0;
for i=1:num_point
  sum=sum+hf1(a+h*(i-0.5))*h;
endfor
ret=sum;
% ---- end coding ----
end

