%Andrew Green, ENGR112-0001, 3/3/22
%
%clear command window and variables before begining
clear; clc;

%load in the EKG data as time, ml2, and v5
load ekg-data-challenge.mat

%provide a common name for the heart beat signal so we can try out
%different data sets
heart_beat_signal = v5;

%perform the diff operation. Give the resulting variable
%a new name beside "diff" so we don't overload the function name
derivative = diff(heart_beat_signal);

%perform the square operation on each element of the derivative
squares = derivative.^2;

%conduct a moving average over 10 pts/samples
moving_average = movmean(squares,10);

%use the findpeaks() function to identify the number of peaks
[peaks,locs] = findpeaks(moving_average,'MinPeakHeight',.003,'MinPeakProminence',.006,'MinPeakDistance',8);

%print out in the command window the number of peaks detected
num_beats = length(peaks);
fprintf('The algorithm found %f peaks\n',num_beats);

%plot the original with time stamps
figure;
plot(time,heart_beat_signal);
title('Plot of Single Trace EKG');
xlabel('Time (seconds)');
ylabel('V5 Signal (volts)');

%plot the final moving average with detected peaks overlayed as 
%orange circles
figure;
new_time=time(2:end);
plot(new_time,moving_average);
hold on;
plot(new_time(locs),peaks,'or');
title('Moving Average of EKG Trace with Found Peaks Annotated');
xlabel('Time (seconds)');
ylabel('Moving Average Value');

