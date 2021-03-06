% Importing the data and splitting it into what we need
clc
Saccel = readmatrix('ElevatorUp.txt');
Za = Saccel(:,3); 

% Work to create an x axis that fits the data 
StepX = 20.641/849;
hindex = 0:849;
timevar = Za;
for i=1:849
    timevar(i) = StepX*hindex(i);
end

ZaN = Za;
for i=1:849
    ZaN(i) = (Za(i) - 0.964)*9.80665;
end

% Plot Acceleration
figure(1)
plot(timevar,ZaN)
title ("Plot of Acceleration in King Hall Elevator Going Up")
xlabel("Time (seconds)")
ylabel("Acceleration (m/s^2)")

%%% Integrating for Velocity
Vz = ZaN;  % Making Vz a list with the same length of Za
for i=1    % Setting the first velocity value to 0 m/s
    Vz(i) = timevar(i)*0;
end
% Integrating the rest of the velocity values.
for i=2:849
    Vz(i) = Vz(i-1) + ZaN(i) * steppy;
end

% Plot integrated velocity
figure(2)
plot(timevar,Vz)
title ("Plot of Integrated Velocity in King Hall Elevator Going Up")
xlabel("Time (seconds)")
ylabel("Velocity (m/s)")

for i=80:680
    VzMean = Vz;
end
VzMean = mean(VzMean,'all');

% Messing around trying to make the Accel graph more readable
timeXvar = 1:.1:849;
Zq = 1:.1:849;
VintZ = interp1(timevar,Za,Zq,"linear");
figure(3)
plot(timeXvar,VintZ)
title ("Plot of Interpolated Accel in King Hall Elevator Going Up")
xlabel("Time (seconds)")
ylabel("Velocity (m/s)")

%Zmed = medfilt1(ZaN,7);
Zavgmed = movmean(Zmed,5);

figure(4)
plot(timevar,Zavgmed)
title ("Plot of Moving Avg of Accel in King Hall Elevator Going Up")
xlabel("Time (seconds)")
ylabel("Velocity (m/s)")