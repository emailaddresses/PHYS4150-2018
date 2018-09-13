% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(code_template(), pi)<1e-3, 'your function result has large error')
disp('unittest passed')
