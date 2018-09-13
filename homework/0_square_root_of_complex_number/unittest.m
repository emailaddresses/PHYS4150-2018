hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(code_template(3,4), sqrt(3+4i))<1e-3, 'your function result has large error')
assert(hfe(code_template(1000,1), sqrt(1000+1i))<1e-3, 'your function result has large error')
assert(hfe(code_template(1e-3,1), sqrt(1e-3+1i))<1e-3, 'your function result has large error')
disp('unittest passed.')
