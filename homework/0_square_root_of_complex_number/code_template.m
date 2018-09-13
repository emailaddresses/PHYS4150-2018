%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}


% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(my_square_root_of_complex_number(3,4), sqrt(3+4i))<1e-3, 'your function result has large error')
assert(hfe(my_square_root_of_complex_number(1000,1), sqrt(1000+1i))<1e-3, 'your function result has large error')
assert(hfe(my_square_root_of_complex_number(1e-3,1), sqrt(1e-3+1i))<1e-3, 'your function result has large error')
disp('unittest passed.')
% unittest


function ret = my_square_root_of_complex_number(x_real, x_imag)
%----- start coding from here ----
ret = 0;
% ---- end coding ----
end
