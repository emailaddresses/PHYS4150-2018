function unittest_gauss_jordan_Ab()
hfe = @(x,y) max(abs(x-y)./(abs(x)+abs(y)+1e-3));

for ind1 = 1:3
    matA = rand(5,5);
    vecb = rand(5,1);
    ret1 = matA\vecb;
    ret2 = my_gauss_jordan0_Ab(matA,vecb);
    ret3 = my_gauss_jordan1_Ab(matA, vecb);
    ret4 = my_gauss_jordan2_Ab(matA, vecb);
    disp(['determinant:: builtin vs my_gauss_jordan0: ', num2str(hfe(ret1,ret2))])
    disp(['determinant:: builtin vs my_gauss_jordan1: ', num2str(hfe(ret1,ret3))])
    disp(['determinant:: builtin vs my_gauss_jordan2: ', num2str(hfe(ret1,ret4))])
end

disp('sometimes gauss_jordan0 will fail (that why pivot necessary)')
matA = [0,1;1,1];
vecb = [2;3];
ret1 = matA\vecb;
ret2 = my_gauss_jordan0_Ab(matA,vecb);
ret3 = my_gauss_jordan1_Ab(matA, vecb);
ret4 = my_gauss_jordan2_Ab(matA, vecb);
disp(['determinant:: builtin vs my_gauss_jordan0: ', num2str(hfe(ret1,ret2))])
disp(['determinant:: builtin vs my_gauss_jordan1: ', num2str(hfe(ret1,ret3))])
disp(['determinant:: builtin vs my_gauss_jordan2: ', num2str(hfe(ret1,ret4))])
end
