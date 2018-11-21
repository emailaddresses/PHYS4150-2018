function unittest()
hfe = @(x,y) max(max(abs(x-y) ./ (abs(x)+abs(y)+1e-3)));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;
hf_tridiagonal = @(x) triu(x,-1) - triu(x,2);

disp('tri-diagonal matrix')
for ind_repeat = 1:2
    N0 = randi([5,20]);
    matA = hf_tridiagonal(randn(N0,N0));
    [Q,R] = qr_tridiagonal_givens(matA);
    disp([num2str(ind_repeat), '::', 'Q*Q''-I:: ', num2str(hfe_r5(Q*Q.'-eye(N0),0))])
    disp([num2str(ind_repeat), '::', 'isTriu(R):: ', num2str(hfe_r5(R-triu(R), 0))])
    disp([num2str(ind_repeat), '::', 'Q*R-A:: ', num2str(hfe_r5(Q*R-matA,0))])

    [Q,R] = qr_tridiagonal_householder(matA);
    disp([num2str(ind_repeat), '::', 'Q*Q''-I:: ', num2str(hfe_r5(Q*Q.'-eye(N0),0))])
    disp([num2str(ind_repeat), '::', 'isTriu(R):: ', num2str(hfe_r5(R-triu(R), 0))])
    disp([num2str(ind_repeat), '::', 'Q*R-A:: ', num2str(hfe_r5(Q*R-matA,0))])
end

disp(' ')
disp('full matrix')
for ind_repeat = 1:2
    N0 = randi([5,20]);
    matA = randn(N0,N0);
    [Q,R] = qr_full_givens(matA);
    disp([num2str(ind_repeat), '::', 'Q*Q''-I:: ', num2str(hfe_r5(Q*Q.'-eye(N0),0))])
    disp([num2str(ind_repeat), '::', 'isTriu(R):: ', num2str(hfe_r5(R-triu(R), 0))])
    disp([num2str(ind_repeat), '::', 'Q*R-A:: ', num2str(hfe_r5(Q*R-matA,0))])

    [Q,R] = qr_full_householder(matA);
    disp([num2str(ind_repeat), '::', 'Q*Q''-I:: ', num2str(hfe_r5(Q*Q.'-eye(N0),0))])
    disp([num2str(ind_repeat), '::', 'isTriu(R):: ', num2str(hfe_r5(R-triu(R), 0))])
    disp([num2str(ind_repeat), '::', 'Q*R-A:: ', num2str(hfe_r5(Q*R-matA,0))])
end
end
