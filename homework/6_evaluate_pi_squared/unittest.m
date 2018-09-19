hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(code_template(), pi^2)<1e-1, 'your function result has large error')
disp('unittest passed.')
