function unittest()
hfe = @(x,y) max(max(abs(x-y) ./ (abs(x)+abs(y)+1e-3)));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;
hf_symmetry = @(x) x + x.';

for ind_repeat = 1:10
    N0 = randi([5,10]);
    M0 = hf_symmetry(rand(N0));
    M1 = hf_symmetry(rand(N0));
    M2 = hf_symmetry(rand(N0)) + eye(N0)*N0/2; %make sure inversible
    [EVC,EVL] = eig_quadratic(M0,M1,M2);
    tmp1 = M0*EVC + (M1*EVC).*EVL.' + (M2*EVC).*(EVL.').^2;
    disp(['eig_quadratic:: maximum absolute error: ', num2str(hfe_r5(tmp1, 0))])
end
end
