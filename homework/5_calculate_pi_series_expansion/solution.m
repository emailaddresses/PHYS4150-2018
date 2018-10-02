function ret = code_template()
% calculate pi with series expansion
num1 = 1e4;
ret = 4*sum((2*(mod(1:num1,2)==1)-1)./(2*(1:num1)-1));
end
