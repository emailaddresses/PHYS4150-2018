function [weight,hf1] = my_legendre(N)
% reference: https://en.wikipedia.org/wiki/Legendre_polynomials
% N(int)
% (ret1)weight(float,(1,N+1))
% (ret2)hf1 (function handle) x(?)->y(?)
if N==0
    weight = 1;
    hf1 = @(x) ones(size(x));
else
    weight = zeros(1,N+1);
    k = 0:floor(N/2);
    tmp1 = arrayfun(@(x) nchoosek(N,x), k);
    tmp2 = arrayfun(@(x) nchoosek(2*N-2*x,N), k);
    tmp3 = (-1).^k .* tmp1 .* tmp2 / 2^N;
    weight(1:2:end) = tmp3;
    hf1 = @(x) sub_legendre(x, weight);
end
end

function ret = sub_legendre(x, weight)
ret = 0;
N0 = size(weight,2)-1;
for ind1=N0:-1:0
    ret = ret + x.^ind1*weight(N0+1-ind1);
end
end
