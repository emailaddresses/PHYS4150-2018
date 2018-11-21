function unittest()
hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;
hf_hermitian = @(x) x + x';

for ind_repeat = 1:5
    N0 = randi([5,15]);
    matA = hf_hermitian(randn(N0,N0)+1i*randn(N0,N0));
    [EVC,EVL] = eig_complex(matA);
    disp(['eig_complex:: A*EVC - EVC*EVL: ', num2str(hfe_r5(matA*EVC-EVC.*EVL.',0))])
end
end
