function [ret,tracks] = my_newton_raphson(hf1, hf1_gradient, x0, step)
% find root using Newton-Raphson method
% reference: https://en.wikipedia.org/wiki/Newton%27s_method
% hf1(function handle)
% hf1_gradient(function handle) gradient of function hf1
% step(int)
% ret(float), tracks(1,step)
tracks = zeros(1,step);
tracks(1) = x0;
for ind1 = 2:step
    x0 = x0 - hf1(x0)/hf1_gradient(x0);
    tracks(ind1) = x0;
end
ret = tracks(end);
end
