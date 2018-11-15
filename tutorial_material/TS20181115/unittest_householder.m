function unittest_householder()
hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;

for ind_repeat = 1:10
    N1 = randi([5,20]);
    vec1 = randn(N1,1);
    vec2 = randn(N1,1);
    [mat,~] = householder_matrix(vec1,vec2);
    tmp1 = mat*vec1./vec2;
    disp(['householder_matrix relative error: ', num2str(hfe_r5(tmp1, mean(tmp1,1)))])
end

for ind_repeat = 1:10
    N1 = randi([5,20]);
    tmp1 = randn(N1,3);
    ret_ = det(spdiags(tmp1, [-1,0,1], N1, N1));
    L = tmp1(1:N1-1,1);
    M = tmp1(:,2);
    U = tmp1(2:end,3);
    ret = det_tridiagonal(L,M,U);
    disp(['det_tridiagonal relative error: ', num2str(hfe_r5(ret, ret_))])
end

for ind_repeat = 1:10
    N1 = randi([5,10]);
    tmp1 = randn(N1,N1);
    matA = tmp1 + tmp1.';
    EVL_ = sort(eig(matA));
    EVL = sort(eig_householder_sturm(matA, 40)); %requre large max_iter (or replace my_bisection with high-converge-rate algorithm)
    disp(['EVL:: builtin vs eig_householder: ', num2str(hfe_r5(EVL, EVL_))])
end

for ind_repeat = 1:10
    N0 = randi([5,20]);
    tmp1 = rand(N0,N0);
    matA = tmp1 + tmp1.';
    EVL_ = sort(eig(matA));

    [EVC,EVL] = eig_qr_householder(matA, 5000); %terrible converge rate
    [EVL,ind2] = sort(EVL);
    EVC = EVC(:,ind2);
    disp(['eig_qr_householder:: builtin vs eig_jocabi: ', num2str(hfe_r5(EVL, EVL_))])
    disp(['eig_qr_householder:: EVC*EVC''-I: ', num2str(hfe_r5(eye(N0), EVC*EVC'))])
    disp(['eig_qr_householder:: A-EVC*EVL*EVC'': ', num2str(hfe_r5(matA, (EVC.*EVL.')*EVC'))])
end
end
