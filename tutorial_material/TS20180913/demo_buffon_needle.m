% code snippet demoing Buffon's Needle

num1 = 1e3;
x1 = rand(1,num1);
theta = rand(1,num1)*2*pi;
tmp1 = x1+sin(theta);
my_pi = 2*num1/sum(tmp1<0 | tmp1>1);
disp(['my_pi: ', num2str(my_pi,10)])

fig1 = figure('Position', [100,100,1000,500]);
ax1 = axes('Parent', fig1, 'Position', [0.05,0.05,0.4,0.9]);
axis equal
ax1.XLim = [-1.3,1.3];
ax1.YLim = [-0.8, 1.8];
ax1.NextPlot = 'add';
grid on
line(ax1,[-1.3,1.3], [0,0], 'LineWidth', 3)
line(ax1,[-1.3,1.3], [1,1], 'LineWidth', 3)

ax2 = axes('Parent', fig1, 'Position', [0.55,0.1,0.4,0.8]);
line(ax2, [0,num1], [pi,pi], 'Color', 'r')
ax2.XLim = [0, num1];
ax2.YLim = [0, 4];
hLine0 = line(ax2, 1:num1, nan(1,num1));
hit = 0;

for ind1=1:num1
    tmp1 = [0, sin(theta(ind1))];
    tmp2 = [x1(ind1), x1(ind1)+cos(theta(ind1))];
    if tmp2(2)<0 || tmp2(2)>1
        hit = hit + 1;
        line(ax1,tmp1, tmp2, 'color', 'r')
    else
        line(ax1,tmp1, tmp2, 'color', 'k')
    end
    hLine0.YData(ind1) = 2*ind1 / hit;
    if mod(ind1,10)==0
        drawnow
    end
end
