%{
right reserved for [YUAN Mengfei]
%}



% rectangular rule
% hf1: function handle
%  e.g. hf1=@(x) 3x
%    more detail see doc('function handle')
% a: lower limit
% b: upper limit
% num_point: number of evaluation point (more point, more accurate)
%----- start coding from here ----
a = 0; 
b = 10;
num_point = 100;
x = linspace (a, b, num_point+1);
y = 2*x;
x = x(2 : num_point) + ( x(1)+x(num_point+1) ) / 2;
ret = sum (y*(b-a)/(num_point+1))
% ---- end coding ----