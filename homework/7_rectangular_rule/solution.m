function ret = solution(hf1, a, b, num_point)
% rectangular rule
% hf1: function handle
%    e.g. hf1=@(x) 3x
%    more detail see doc('function handle')
% a: lower limit
% b: upper limit
% num_point: number of evaluation point (more point, more accurate)
%----- start coding from here ----
x = linspace(a, b, num_point+1);
x = (x(2:end) + x(1:end-1))/2;
ret = sum(hf1(x)*(b-a)/num_point);
% ---- end coding ----
end
