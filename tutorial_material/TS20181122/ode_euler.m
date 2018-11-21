function ret = ode_euler(hf1,x,y0)
% solve ODE using Euler's method
% hf1(function handle): ((1,1),(N2,1))->(N2,1)
% x(1,N1): 
% y0(N2,1): initial value for at x(1)
% ret(N2,N1)
% reference: https://en.wikipedia.org/wiki/Euler_method
N1 = size(x,2);
N2 = size(y0,1);
ret = zeros(N2,N1);
ret(:,1) = y0;
for ind1 = 2:N1
    h = x(ind1)-x(ind1-1);
    ret(:,ind1) = ret(:,ind1-1) + hf1(x(ind1-1),ret(:,ind1-1))*h;
end
end
