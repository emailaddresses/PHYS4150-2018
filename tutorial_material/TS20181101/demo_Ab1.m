% demo: solve linear equation using Gauss Jordan elimination with pivot along row
% see my_gauss_jordan1_Ab.m

N0 = 5;
matA = rand(N0,N0);
vecb = rand(N0,1);

%%
for ind_repeat = 1:3
    matA_ = [matA,vecb];
    ctrl = demo_matrix(struct('matA', matA_, 'title', 'concatenate [A,b]'));
    for ind1 = 1:(N0-1)
        [~,ind2] = max(abs(matA_(ind1:end,ind1)));
        if ind2~=1
            matA_([ind1,ind1+ind2-1],ind1:end) = matA_([ind1+ind2-1,ind1],ind1:end);
            ctrl = demo_matrix(ctrl, matA_, ['exchange row ',num2str(ind1), 'with row ', num2str(ind1+ind2-1)]);
        end
        matA_(ind1,:) = matA_(ind1,:) / matA_(ind1,ind1);
        ctrl = demo_matrix(ctrl, matA_, ['normalize for row ',num2str(ind1)]);
        matA_((ind1+1):N0,ind1:end) = matA_((ind1+1):N0,ind1:end) - matA_((ind1+1):N0,ind1).*matA_(ind1,ind1:end);
        ctrl = demo_matrix(ctrl, matA_, ['Gauss Jordan Elimation for row ',num2str(ind1)]);
    end
    matA_(N0,:) = matA_(N0,:)/matA_(N0,N0);
    ctrl = demo_matrix(ctrl, matA_, ['normalize for row ',num2str(N0)]);
    for ind1 = N0:-1:2
        matA_(1:(ind1-1),ind1:end) = matA_(1:(ind1-1),ind1:end) - matA_(1:(ind1-1),ind1)*matA_(ind1,ind1:end);
        ctrl = demo_matrix(ctrl, matA_, ['Gauss Jordan Elimation for row ',num2str(ind1)]);
    end
    disp(matA_(:,(N0+1):end));
    close(ctrl.fig);
end
