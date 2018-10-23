%{
right reserved for [Zhang Haotong]
%}

function ret = ZHT_7_rectangular_rule(hf1, a, b, num_point)
% rectangular rule
% hf1: function handle
%    e.g. hf1=@(x) 3x
%    more detail see doc('function handle')
% a: lower limit
% b: upper limit
% num_point: number of evaluation point (more point, more accurate)
%----- start coding from here ----
ret = 0;
y = (b - a)/num_point;
while a < b
 x = hf1(a) * y;
 ret = ret + x;
 a = a + y;
end
% ---- end coding ----
end