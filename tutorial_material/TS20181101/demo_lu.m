% demo lu decomposition
N1 = 5;
matA = rand(N1,N1);

%%
for ind_repeat = 1:3
    matU = zeros(N1,N1);
    matL = eye(N1,N1);
    fig = figure('Position', [1,1,1000,800]);
    ctrl1 = struct('fig',fig,'ax',subplot(2,2,2),'pause_time',0);
    ctrl1 = demo_matrix(ctrl1, matU, 'matU');
    ctrl2 = struct('fig',fig,'ax',subplot(2,2,3),'pause_time',0);
    ctrl2 = demo_matrix(ctrl2, matL, 'matL');
    ctrl3 = struct('fig',fig,'ax',subplot(2,2,4));
    ctrl3 = demo_matrix(ctrl3, matL*matU-matA, 'matL*matU-matA');

    matU(1,:) = matA(1,:);
    matL(:,1) = matA(:,1)/matA(1,1);
    ctrl1 = demo_matrix(ctrl1, matU, 'matU');
    ctrl2 = demo_matrix(ctrl2, matL, 'matL');
    ctrl3 = demo_matrix(ctrl3, matL*matU-matA, 'matL*matU-matA');
    for ind1 = 2:N1
        tmp1 = (ind1+1):N1;
        tmp2 = 1:(ind1-1);
        tmp3 = ind1:N1;
        matU(ind1,tmp3) = matA(ind1,tmp3) - matL(ind1,tmp2)*matU(tmp2,tmp3);
        matL(tmp1,ind1) = (matA(tmp1,ind1) - matL(tmp1,tmp2)*matU(tmp2,ind1))/matU(ind1,ind1);
        ctrl1 = demo_matrix(ctrl1, matU, 'matU');
        ctrl2 = demo_matrix(ctrl2, matL, 'matL');
        ctrl3 = demo_matrix(ctrl3, matL*matU-matA, 'matL*matU-matA');
    end
    close(fig);
end
