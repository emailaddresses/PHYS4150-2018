%{
right reserved for [miaomiaomiao]
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
s = (b-a)/num_point;
va = 0;
for i = 1: num_point
    va = va +hf1(a+i*s-0.5*s);
end
ret = va*s ;
% ---- end coding ----
end