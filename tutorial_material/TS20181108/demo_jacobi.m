% demo solving eigenvalue problem with Jacobi method

N0 = 5;
max_iter = 25;
tmp1 = rand(N0,N0);
matA = tmp1 + tmp1.';

for ind_repeat = 1:3
    matA_ = matA;
    EVC = eye(N0,N0);

    fig = figure('Position', [1,1,1200,600]);
    ctrl1 = struct('fig',fig,'ax',subplot(1,2,1),'pause_time',0);
    ctrl1 = demo_matrix(ctrl1, EVC, 'Eigenvector');
    ctrl2 = struct('fig',fig,'ax',subplot(1,2,2),'pause_time',1);
    ctrl2 = demo_matrix(ctrl2, matA_, 'matrix A''');

    for ind0 = 1:max_iter
        tmp1 = abs(triu(matA_,1) + tril(matA_, -1));
        [~,tmp1] = max(tmp1(:));
        ind1 = mod(tmp1-1,N0)+1;
        ind2 = floor((tmp1-1)/N0) + 1;
        if abs(matA_(ind1,ind2))<1e-7, break; end
        theta = atan(2*matA_(ind1,ind2) / (matA_(ind2,ind2)-matA_(ind1,ind1)))/2;
        s = sin(theta);
        c = cos(theta);

        % update matA
        tmp1 = c*matA_(ind1,:) - s*matA_(ind2,:);
        tmp1(ind1) = c^2*matA_(ind1,ind1) - 2*s*c*matA_(ind1,ind2) + s^2*matA_(ind2,ind2);
        tmp1(ind2) = 0;
        tmp2 = s*matA_(ind1,:) + c*matA_(ind2,:);
        tmp2(ind1) = 0;
        tmp2(ind2) = s^2*matA_(ind1,ind1) + 2*s*c*matA_(ind1,ind2) + c^2*matA_(ind2,ind2);
        matA_(ind1,:) = tmp1;
        matA_(ind2,:) = tmp2;
        matA_(:,ind1) = matA_(ind1,:).';
        matA_(:,ind2) = matA_(ind2,:).';

        % update EVC
        tmp1 = EVC(:,ind1)*c - EVC(:,ind2)*s;
        tmp2 = EVC(:,ind1)*s + EVC(:,ind2)*c;
        EVC(:,ind1) = tmp1;
        EVC(:,ind2) = tmp2;

        ctrl1 = demo_matrix(ctrl1, EVC, 'Eigenvector');
        ctrl2 = demo_matrix(ctrl2, matA_, 'matrix A''=GAG^T');
    end
    close(fig);
end
