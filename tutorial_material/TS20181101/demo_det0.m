% demo: calculate matrix determinant using Gauss Jordan Elimination no pivot
% see my_gauss_jordan0_det.m

N0 = 5;
matA = rand(N0,N0);

%%
for ind_repeat = 1:3
    matA_ = matA;
    ctrl = demo_matrix(struct('matA', matA_, 'title', ''));
    for ind1 = 1:(N0-1)
        tmp1 = -matA_((ind1+1):N0,ind1)/matA_(ind1,ind1);
        matA_((ind1+1):N0,:) = matA_((ind1+1):N0,:) + tmp1.*matA_(ind1,:);
        ctrl = demo_matrix(ctrl, matA_, ['Gauss Jordan Elimination for row ',num2str(ind1)]);
    end
    disp(['determinant: ', num2str(prod(diag(matA_)))])
    close(ctrl.fig);
end
