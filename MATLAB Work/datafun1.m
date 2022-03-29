%% blah blah program plan

%start
clear,clc %reset everything
%load in data
load cannondata.mat
%extract data into variable
cnd = rangedata;
%extract more variables from data
angles = cnd(1,:);
horizontalDistance = cnd(2:end,:);
horizonalAvg = mean(horizontalDistance);
%define arrays for calculations and graphs
Vi = 130;
radAngles = angles*pi/180;
g = 3.711;
genAngles = 0:0.01:pi/2;
%do calculations
s = Vi^2*sin(2*genAngles)/g;
%plot data
plot(radAngles,horizonalAvg,'r*')
hold on
plot(genAngles,s,'b')
xlabel('Cannon launching angles in radians')
ylabel('Horizontal distance in meters')
legend('Measured distances','Predicted distances')
title('Cannon launched on Mars: Measured and Predicted Distances')
hold off
