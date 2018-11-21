function ctrl = demo_matrix(ctrl, matA, title)
% ctrl(struct) .pause_time(float) .fig(handle) .ax(handle) .htext(gobjects)
% matA(matrix)
% title(string)
%{
%plot matrix in figure and then update
matA = rand(3,4);
ctrl = struct('matA', matA);
ctrl = demo_matrix(ctrl);
ctrl.matA = rand(3,4);
ctrl = demo_matrix(ctrl);
%}
if nargin>1, ctrl.matA = matA; end
if nargin>2, ctrl.title = title; end
tmp1 = size(ctrl.matA);
Nx = tmp1(2);
Ny = tmp1(1);
if ~isfield(ctrl, 'htext')%first create htext
    if ~isfield(ctrl,'pause_time'), ctrl.pause_time = 2; end
    if ~isfield(ctrl,'fig'), ctrl.fig = figure(); end
    if ~isfield(ctrl,'ax')
        ctrl.ax = axes(ctrl.fig);
    end
    ctrl.ax.XAxis.Visible = 'off';
    ctrl.ax.YAxis.Visible = 'off';
    ctrl.ax.XLim = [0,Nx];
    ctrl.ax.YLim = [0,Ny];
    ctrl.ax.Title.String = ctrl.title;
    ctrl.htext = gobjects(Ny, Nx);
    for ind1 = 1:Ny
        for ind2 = 1:Nx
            tmp1 = num2str(round(ctrl.matA(Ny-ind1+1,ind2),4));
            ctrl.htext(ind1,ind2) = text(ind2-0.5, ind1-0.5, tmp1, 'HorizontalAlignment', 'center');
        end
    end
else%update htext
    for ind1 = 1:Ny
        for ind2 = 1:Nx
            ctrl.htext(ind1,ind2).String = num2str(round(ctrl.matA(Ny-ind1+1,ind2),4));
        end
    end
    ctrl.ax.Title.String = ctrl.title;
end
drawnow;
pause(ctrl.pause_time);
end
