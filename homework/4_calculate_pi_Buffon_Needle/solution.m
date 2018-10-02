function ret = code_template()
% calculate pi use Buffon's needle method
num1 = 1e5;
x1 = rand(1,num1)/2;
theta = rand(1,num1)*pi;
ret = 2*num1/sum(sin(theta)/2>x1);
end

%{
--- add your report here ---
(example) more needles, more accurate
%}
