function [ret,tracks] = my_bisection(hf1, a, b, step)
% find root using bisection method
% reference: https://en.wikipedia.org/wiki/Bisection_method
% hf1(function handle), a(float), b(float) step(int)
% ret(float), tracks(1,step)
fa = hf1(a);
fb = hf1(b);
assert(fa*fb<0, 'bisection method require function value signs at a and b differ');
tracks = zeros(1,step);
for ind1 = 1:step
    new_x = (a+b)/2;
    fx = hf1(new_x);
    tracks(ind1) = new_x;
    if fx*fa<0
        fb = fx;
        b = new_x;
    elseif fx*fb<0
        fa = fx;
        a = new_x;
    else
        break;
    end
end
tracks = tracks(1:ind1);
ret = tracks(ind1);    
end
