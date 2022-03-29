%%
%% from MATLAB doc: https://www.mathworks.com/help/audio/ref/pitch.html
%%

%load the file. Return two values X: and audio stream and fs: the sample rate of the song
%check documentation (doc audioread) to file acceptable file types
[x,fs] = audioread('singing-a-major.ogg');

%calculate how long the song file size
t = (0:size(x,1)-1)/fs;

%create a moving window overwhich to determine pitch
winLength = round(0.05*fs);
overlapLength = round(0.045*fs);
[f0,idx] = pitch(x,fs,'Method','SRH','WindowLength',winLength,'OverlapLength',overlapLength);
tf0 = idx/fs;

%turn on and off to play sound
sound(x,fs)

%create a new figure with a tiled layout
figure
tiledlayout(2,1)

%plot the amplitude in the upper figure
nexttile
plot(t,x)
ylabel('Amplitude')
title('Audio Signal')
axis tight

%plot the pitch estimations in the lower figure
nexttile
plot(tf0,f0)
xlabel('Time (s)')
ylabel('Pitch (Hz)')
title('Pitch Estimations')
axis tight