%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}


% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
disp(['relative error: ', num2str(hfe(my_pi_Buffon_needle(), pi), 5)])


function ret = my_pi_Buffon_needle()
% calculate pi use Buffon's needle method
% ---- start from here ---
ret = 0;
% --- end ---
end

%{
--- add your report here ---

%}
