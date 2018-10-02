%{
right reserved for [JIN Yuanjun]
%}

function pi_n = Byffonmethod()
% calculate pi use Byffon's method
N = 0;
M = 0;
fprintf('      n,    my_pi\n') % print head of table
for N1 = [10^3 10^4 10^5 10^6 10^7 10^8]; % the total num of drop needles each times
    
    while N<N1
        x = rand*180;
        d  = rand*0.5; %%% fix the boundary conditions
        if d < 0.5 * sind(x)
            M = M+1; % count the crosing needles
        end;
        N= N+1;
    end
    
    pi_n = 2*N/M; %calucate pi through probility
    fprintf('%10d,  %.15f\n', N1, pi_n) %doc('fprintf')
end
end

%{
      n,    my_pi
      1000,  3.189792663476874
     10000,  3.117692907248636
    100000,  3.159008703068977
   1000000,  3.143018334797456
  10000000,  3.141053729294566
 100000000,  3.141703899654103
%}
