recObj = audiorecorder();
time_in_second = 2;

%% record your voice
disp('start speaking')
pause(1); %make sure that you are speaking when start recording
recordblocking(recObj, time_in_second);
disp('End of Recording.');

%%
% save my_voice.mat recObj
% load my_voice.mat
% play(recObj);
y = getaudiodata(recObj);
num1 = 2^floor(log2(size(y,1)));
effect_time = time_in_second*num1/size(y,1);
y = y(1:num1);

figure();
plot((1:num1)/num1*effect_time, y)
xlabel('time(s)')
ylabel('volume');

fx = (1:num1)/effect_time;
fy = fft(y);

figure()
plot(fx, abs(fy));
xlabel('frequency(Hz)')
ylabel('volume')
grid on
