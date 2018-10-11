hf1 = @sin;
hf1_gradient = @cos;
% x0 = 2*rand() - 1;
x0 = 1.15;

[~,tracks] = my_newton_raphson(hf1, hf1_gradient, x0, 4);


fig = figure();
ax = axes('Parent', fig, 'NextPlot', 'add', 'Box', 'on');
for ind0 = 1:3
    cla(ax);
    ax.Title.String = 'demo Newton-Raphson method';
    x = linspace(-pi, pi, 100);
    plot(x, hf1(x))
    grid on;
    pause(1.5);

    for ind1 = 1:size(tracks,2)-1
        x0 = tracks(ind1);
        x1 = tracks(ind1+1);
        plot([x0,x1],[hf1(x0),0]);
        plot([x1,x1], [0,hf1(x1)]);
        pause(1.5);
    end
    pause(1.5);
end