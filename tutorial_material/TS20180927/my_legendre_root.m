function ret = my_legendre_root(N)
% N(int)
% (ret)(float,(N+1,)): root of legendre_N
[weight,~] = my_legendre(N);
ret = roots(weight);
end
