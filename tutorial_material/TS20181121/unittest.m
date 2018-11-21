function unittest
hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;
hf_symmetry = @(x) x + x.';

for ind1 = 1:5
    N0 = randi([5,15]);
    matA = hf_symmetry(randn(N0,N0));
    EVL_ = sort(eig(matA));

    [EVC,EVL] = eig_jacobi(matA, 5*N0^2);
    [EVL,ind2] = sort(EVL);
    EVC = EVC(:,ind2);
    disp(['eig_jacobi:: vs builtin: ', num2str(hfe_r5(EVL, EVL_))])
    disp(['eig_jacobi:: EVC*EVC''-I: ', num2str(hfe_r5(eye(N0), EVC*EVC'))])
    disp(['eig_jacobi:: A-EVC*EVL*EVC'': ', num2str(hfe_r5(matA, (EVC.*EVL.')*EVC'))])
    
    EVL = eig_householder_sturm(matA, 40);
    disp(['eig_householder_sturm:: vs builtin: ', num2str(hfe_r5(sort(EVL), EVL_))])

    [EVC,EVL] = eig_householder_qr(matA, 10000); %really slow
    [EVL,ind2] = sort(EVL);
    EVC = EVC(:,ind2);
    disp(['eig_householder_qr:: vs builtin: ', num2str(hfe_r5(EVL, EVL_))])
    disp(['eig_householder_qr:: EVC*EVC''-I: ', num2str(hfe_r5(eye(N0), EVC*EVC'))])
    disp(['eig_householder_qr:: A-EVC*EVL*EVC'': ', num2str(hfe_r5(matA, (EVC.*EVL.')*EVC'))])
end
end
