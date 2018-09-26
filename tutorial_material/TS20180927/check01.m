% check orthogonality
M = 2;
N = 2;
[~,hf1] = my_legendre(M);
[~,hf2] = my_legendre(N);
hf3 = @(x) hf1(x).*hf2(x);

value = my_rectangular_integral(bulabula);

disp(['integration value: ', num2str(value)])

% plot figure
fig = figure();
ax = axes(fig);
ax.NextPlot = 'add';
fp1 = fplot(hf1, [-1.01,1.01]);
fp2 = fplot(hf2, [-1.01,1.01]);
x = linspace(-1,1,100);
harea = area(x, hf3(x));
tmp1 = {'$P_m$', '$P_n$', ['$\int{P_mP_n=}',num2str(value,4), '$']};
legend([fp1,fp2,harea], tmp1, 'Interpreter','latex');
