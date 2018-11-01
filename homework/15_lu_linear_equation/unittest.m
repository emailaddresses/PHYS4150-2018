function unittest()
% reference: wiki: https://en.wikipedia.org/wiki/Pad%C3%A9_approximant
if ~exist('code_template.m', 'file')
    error('DO NOT rename code_template.m')
end
hfe = @(x,y) max(max(abs(x-y) ./ (abs(x)+abs(y)+1e-3)));

for ind_repeat = 1:5
    N0 = randi([5,10]);
    matA = rand(N0,N0) + eye(N0)*N0/2; %to avoid generate not invertible matrix
    vecb = rand(N0,1);
    ret1 = matA\vecb;
    ret2 = code_template(matA, vecb);
    tmp1 = ['the shape of your return should be (',num2str(N0),', 1), not (',num2str(size(ret2)),')'];
    assert(all(size(ret1)==size(ret2)), tmp1)
    disp(['relative error:: builtin vs code_template: ', num2str(hfe(ret1,ret2))])
end
end
