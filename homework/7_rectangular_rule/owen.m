%{
right reserved for [owen]
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
h = (b-a)/(num_point-1);
ret = h * sum(hf1(a + h*(1:num_point-1) - h/2));
% ---- end coding ----
end
