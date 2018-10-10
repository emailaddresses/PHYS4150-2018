num_data = 5;
data_x = linspace(0,1,num_data);
data_y = 2*rand(size(data_x))-1;
num_round = 3;

num_interp_x = 100;
interp_x = linspace(0,1,num_interp_x);
interp_y = zeros(num_data, num_interp_x);

for ind1 = 1:num_data
    tmp1 = data_x([1:(ind1-1),(ind1+1):num_data]);
    interp_y(ind1,:) = prod(interp_x - tmp1',1)/prod(data_x(ind1)-tmp1)*data_y(ind1);
end

fig = figure('Position', [1,1,1000,800], 'Color', [1,1,1]);
ax = axes('Parent', fig, 'NextPlot', 'add');
ylim_min = min(min(sum(interp_y,1)), min(interp_y(:)));
ylim_max = max(max(sum(interp_y,1)), max(interp_y(:)));
ax.XLim = [min(interp_x), max(interp_x)];
ax.Box = 'on';
grid(ax, 'on')
ax.Title.FontSize = 20;
hLine = gobjects(1,num_data+1);

for ind0 = 1:num_round
    cla(ax);
    hLine_data = plot(data_x, data_y, '+', 'LineWidth',3,'Color',[1,0,0], 'MarkerSize', 15);
    for ind1 = 1:num_data
        plot([data_x(ind1),data_x(ind1)], [ylim_min,ylim_max], 'LineStyle', '--', 'LineWidth', 1, 'Color', [1,0,0]);
    end
    ax.Title.String = 'interp points';
    
    drawnow;
    pause(1);
    
    for ind1 = 1:num_data
        hLine(ind1) = plot(interp_x, interp_y(ind1,:), 'LineWidth', 2, 'LineStyle', '-.');
        ax.Title.String = ['P_',num2str(ind1),'(x)'];
        drawnow;
        pause(1);
    end
    
    ax.Title.String = 'Lagragian Polynomial';
    hLine(num_data+1) = plot(interp_x, sum(interp_y,1), 'LineWidth',4);
    drawnow;
    pause(2);
end
