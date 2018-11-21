function ret = ode_runge_kutta(hf1,x,y0)
% solve ODE using Runge-Kutta's method
% hf1(function handle): ((1,1),(N2,1))->(N2,1)
% x(1,N1): 
% y0(N2,1): initial value for at x(1)
% ret(N2,N1)
% reference: https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods
N1 = size(x,2);
N2 = size(y0,1);
ret = zeros(N2,N1);
ret(:,1) = y0;
for ind1 = 2:N1
    h = x(ind1) - x(ind1-1);
    tmp1 = x(ind1-1);
    tmp2 = ret(:,ind1-1);
    k1 = hf1(tmp1, tmp2);
    k2 = hf1(tmp1+h/2, tmp2+h*k1/2);
    k3 = hf1(tmp1+h/2, tmp2+h*k2/2);
    k4 = hf1(tmp1+h, tmp2+h*k3);
    ret(:,ind1) = tmp2 + h/6*(k1+2*k2+2*k3+k4);
end
end
