%{
right reserved for [Huang Richang]
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
x = linspace(a, b, num_point+1);
s = 0 ;

for i = 1:num_point 
    s = s + (b-a)/num_point*(hf1(x(i))+hf1(x(i+1)))/2; 
end

ret = s ;

% ---- end coding ----
end
