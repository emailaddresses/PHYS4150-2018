function unittest()
if ~exist('code_template.m', 'file')
    error('DO NOT rename code_template.m')
end
if ~exist('my_fft.m', 'file')
    error('go to download my_fft.m from course website')
end

hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;

x = rand(1,32);
ret1 = code_template(fft(x));
disp(['relative error: ', num2str(hfe_r5(ret1,x),7)])

x = rand(1,64);
ret1 = code_template(fft(x));
disp(['relative error: ', num2str(hfe_r5(ret1,x),7)])

x = rand(1,128);
ret1 = code_template(fft(x));
disp(['relative error: ', num2str(hfe_r5(ret1,x),7)])

disp('unittest passed');
end
