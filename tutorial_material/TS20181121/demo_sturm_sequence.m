error('not finished yet')

hf_tridiagonal = @(x) triu(x,-1) - triu(x,2);
hf_symmetry = @(x) x + x.';

N1 = 5;
matA = hf_tridiagonal(hf_symmetry(randn(N1,N1)));
M = diag(matA);
L = diag(matA,1);

if exist('fig', 'var'), close(fig); end
fig = figure('Position', [1,1,600,800]);
ctrl1 = struct('fig',fig,'ax',axes(fig, 'Position', [0.05,0.2,0.9,0.7]),'pause_time',0);
ctrl1 = demo_matrix(ctrl1, matA, 'tri-diagonal matrix');
ctrl1.pause_time = 1;
ax2 = axes(fig, 'Position', [0.05,0.05,0.9,0.1]);
ax2.YAxis.Visible = 'off';
% ax2.Color = 'none';
ax2.Title.String = 'eigenvalue';
ax2.NextPlot = 'add';

tmp1 = (M(1) + M(2))/2;
tmp2 = sqrt((M(1)-M(2))^2 + 4*L(1)^2)/2;
EVL = [tmp1-tmp2; tmp1+tmp2];
min_eig = min(M - abs([0;L]) - abs([L;0]));
max_eig = max(M + abs([0;L]) + abs([L;0]));
hs1 = scatter(ax2,[min_eig,max_eig],[0,0],'filled','SizeData',100,'MarkerFaceAlpha',0.2,'MarkerEdgeAlpha',0.2);
hs2 = scatter(ax2,EVL,[0,0],'filled','SizeData',100,'MarkerFaceAlpha',0.5,'MarkerEdgeAlpha',0);
hs3 = scatter(ax2,EVL,[0,0],'filled','SizeData',100,'MarkerFaceAlpha',0.5,'MarkerEdgeAlpha',0);
hl = legend()
for ind1 = 3:N1
    hf1 = @(x) det_tridiagonal(L(1:ind1-1), M(1:ind1)-x, L(1:ind1-1));
    interval = [min_eig; EVL; max_eig];
    EVL = zeros(ind1,1);
    for ind2 = 1:ind1
        EVL(ind2) = my_bisection(hf1, interval(ind2), interval(ind2+1), max_iter);
    end
end
