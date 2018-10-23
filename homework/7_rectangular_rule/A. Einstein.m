%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

%%%%%%%%%%%%%%
% THIS IS HW7!
%%%%%%%%%%%%%%
function ret = code_template(hf1, a, b, num_point)
% rectangular rule
% hf1: function handle
%    e.g. hf1=@(x) 3x
%    more detail see doc('function handle')
% a: lower limit
% b: upper limit
% num_point: number of evaluation point (more point, more accurate)
%----- start coding from here ----

tmp = (b-a)/num_point;
x=a+(1:num_point).*tmp-tmp/2;

ret = sum(hf1(x)*(b-a)/num_point);

% ---- end coding ----
end