function unittest_eig()
hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;

for ind1 = 1:10
    N0 = randi([5,20]);
    tmp1 = rand(N0,N0);
    matA = tmp1 + tmp1.';
    EVL_ = sort(eig(matA));

    [EVC,EVL] = eig_jacobi(matA, N0^2);
    [EVL,ind2] = sort(EVL);
    EVC = EVC(:,ind2);
    disp(['EVL:: builtin vs eig_jocabi: ', num2str(hfe_r5(EVL, EVL_))])
    disp(['EVC:: EVC*EVC''-I: ', num2str(hfe_r5(eye(N0), EVC*EVC'))])
    disp(['EVC:: A-EVC*EVL*EVC'': ', num2str(hfe_r5(matA, (EVC.*EVL.')*EVC'))])
end
end
