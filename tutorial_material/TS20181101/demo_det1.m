% demo: calculate matrix determinant using Gauss Jordan Elimination with pivot along column
% see my_gauss_jordan1_det.m

N0 = 5;
matA = rand(N0,N0);

%%
for ind_repeat = 1:2
    matA_ = matA;
    ctrl = demo_matrix(struct('matA', matA_, 'title', ''));
    sign = 1;
    for ind1 = 1:(N0-1)
        [~,ind2] = max(abs(matA_(ind1:end,ind1)));
        if ind2~=1
            sign = -sign;
            matA_([ind1,ind1+ind2-1],:) = matA_([ind1+ind2-1,ind1],:);
            ctrl = demo_matrix(ctrl, matA_, ['exchange row ',num2str(ind1), 'with row ', num2str(ind1+ind2-1)]);
        end
        tmp1 = -matA_((ind1+1):N0,ind1)/matA_(ind1,ind1);
        matA_((ind1+1):N0,:) = matA_((ind1+1):N0,:) + tmp1.*matA_(ind1,:);
        ctrl = demo_matrix(ctrl, matA_, ['Gauss Jordan Elimination for row ',num2str(ind1)]);
    end

    disp(['determinant: ', num2str(prod(diag(matA_))*sign)])
    close(ctrl.fig);
end
