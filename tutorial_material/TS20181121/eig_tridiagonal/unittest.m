function unittest()
hfe = @(x,y) max(max(abs(x-y) ./ (abs(x)+abs(y)+1e-3)));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;
hf_tridiagonal = @(x) triu(x,-1) - triu(x,2);
hf_symmetry = @(x) x + x.';

for ind_repeat = 1:4
    N0 = randi([5,15]); % sometimes still fail for large N0
    matA = hf_tridiagonal(hf_symmetry(rand(N0)));
    ret1 = sort(eig(matA));
    ret2 = sort(eig_tridiagonal_sturm(matA,40));
    disp(['eig_tridiagonal_sturm EVL:: relative error: ', num2str(hfe_r5(ret1,ret2))])
    
    [EVC,EVL] = eig_tridiagonal_qr(matA,10000); %slow
    tmp1 = sort(EVL);
    disp(['eig_tridiagonal_qr EVL:: relative error: ', num2str(hfe_r5(ret1,tmp1))])
    disp(['eig_tridiagonal_qr A*EVC-EVC*EVL:: ', num2str(hfe_r5(matA*EVC-EVC*diag(EVL), 0))])
end
end
