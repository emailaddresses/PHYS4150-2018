function unittest()
if ~exist('code_template.m', 'file')
    error('DO NOT rename code_template.m')
end
if ~exist('my_legendre.m', 'file')
    error('go to download my_legendre.m from course website')
end
if ~exist('my_legendre_root.m', 'file')
    error('go to download my_legendre_root.m from course website')
end
if ~exist('my_bisection.m', 'file')
    error('go to download my_bisection.m from course website')
end
if ~exist('my_newton_raphson.m', 'file')
    error('go to download my_newton_raphson.m from course website')
end

hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r4 = @(x,y) round(hfe(x,y)*1e4)/1e4;

for ind1 = 1:15
    ret1 = sort(my_legendre_root(ind1).');
    ret2 = code_template(ind1);
    disp(['relative error for legendre_', num2str(ind1),...
            ' compared with built-in: ', num2str(hfe_r4(ret1,ret2),7)])
end
end
