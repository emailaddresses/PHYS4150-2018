function unittest_root_finding()
hf1 = @sin;

ret1 = my_bisection(hf1, -rand(), rand(), 20);
assert(hf1(ret1)<1e-3, 'bisection has large error');

ret1 = my_newton_raphson(hf1, @cos, 2*rand()-1, 10);
assert(hf1(ret1)<1e-3, 'newton-raphson has large error');
end
