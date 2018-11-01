function unittest_gauss_jordan_det()
hfe = @(x,y) max(abs(x-y)./(abs(x)+abs(y)+1e-3));

for ind1 = 1:3
    matA = rand(5,5);
    ret1 = det(matA);
    ret2 = my_gauss_jordan0_det(matA);
    ret3 = my_gauss_jordan1_det(matA);
    ret4 = my_gauss_jordan2_det(matA);
    disp(['determinant:: builtin vs my_gauss_jordan0: ', num2str(hfe(ret1,ret2))])
    disp(['determinant:: builtin vs my_gauss_jordan1: ', num2str(hfe(ret1,ret3))])
    disp(['determinant:: builtin vs my_gauss_jordan2: ', num2str(hfe(ret1,ret4))])
end

disp('sometimes gauss_jordan0 will fail (that why pivot necessary)')
matA = [0,1;1,1];
ret1 = det(matA);
ret2 = my_gauss_jordan0_det(matA);
ret3 = my_gauss_jordan1_det(matA);
ret4 = my_gauss_jordan2_det(matA);
disp(['determinant:: builtin vs my_gauss_jordan0: ', num2str(hfe(ret1,ret2))])
disp(['determinant:: builtin vs my_gauss_jordan1: ', num2str(hfe(ret1,ret3))])
disp(['determinant:: builtin vs my_gauss_jordan2: ', num2str(hfe(ret1,ret4))])
end
