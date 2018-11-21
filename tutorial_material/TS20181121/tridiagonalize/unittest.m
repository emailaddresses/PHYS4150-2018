function unittest()
hfe = @(x,y) max(max(abs(x-y) ./ (abs(x)+abs(y)+1e-3)));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;
hf_tridiagonal = @(x) triu(x,-1) - triu(x,2);
hf_symmetry = @(x) x + x.';

for ind_repeat = 1:5
    N0 = randi([5,15]);
    matA = hf_symmetry(randn(N0,N0));
    [retA,~,retB] = tridiagonalize_householder(matA);
    tmp1 = hfe_r5(retA - hf_tridiagonal(retA), 0);
    disp(['tridiagonalize_householder:: isTridiagonal(): ', num2str(tmp1)])
    tmp1 = hfe_r5(matA - retB*retA*retB', 0);
    disp(['tridiagonalize_householder:: A - B*C*B'': ', num2str(tmp1)])
end
end
