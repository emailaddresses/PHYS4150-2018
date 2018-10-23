%{
right reserved for [W. Yi]
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
x = a;
h=(b-a)/num_point;
ret = 0;
i=0;
I=0;
while i<num_point
    xi=x;
    xip1=xi+h;
    I=I+h*hf1((xi+xip1)/2);
    i=i+1;
    x=xip1;
end
ret=I;
% ---- end coding ----
end
