ewack = readmatrix("ENGR112\ekg-data.xlsx");

time = ewack(:,1);
v5 = ewack(:,3);

derivative = diff(v5);

squares = derivative.^2;

moving_average = movmean(squares,10);

figure;
plot(time,v5);
xlabel('Time');
ylabel('V5');
title('Plot of Single EKG');

figure;
plot(time(2:end),moving_average);
title('Wowowz')
xlabel('Time (seconds)');
ylabel('Moving Average Value');