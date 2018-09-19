hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
hf1 = @(x) sin(x);
a = rand();
b = rand() + a;

ret1 = integral(hf1, a, b);
assert(hfe(code_template(hf1, a, b, 500), ret1)<1e-2, 'your function result has large error')
disp('unittest passed.')

