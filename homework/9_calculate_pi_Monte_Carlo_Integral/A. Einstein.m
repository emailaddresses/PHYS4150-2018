%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

%%%%%%%%%%%%%%%%%
% THIS IS HW9!
%%%%%%%%%%%%%%%%%

function ret = code_template()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
 
    function ret = q(x)                %% this functions is to add all the 2|y| coresponding to random number 'x' in Monte Carlo, as an integration.
        ret = 2*sqrt(1-abs(1-x).^2);     
    end
hf1 = @q;
ret = my_MonteCarlo_rule(hf1,0,2,8000000);

% --- end ---
end


function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
  %one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;

ret = sum(hf1(x))/num_point * (b-a);
end