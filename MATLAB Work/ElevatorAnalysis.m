% Importing the data and splitting it into what we need
Saccel = readmatrix('ElevatorUp.txt');
Za = Saccel(:,3); 

% Work to create an x axis that fits the data 
steppy = 21.941/902;
hindex = 0:902;
timevar = Za;
for i=1:902
    timevar(i) = steppy*hindex(i);
end

% Plot Acceleration
plot(timevar,Za)

% Integrating for Velocity
% Uz = Za(1,:) * steppy;  % Setting the first velocity value
Vz = Za;  % Making Vz a list with the same length of Za
for i=1
    Vz(i) = timevar(i)*0;
end

ZaN = Za;
for i=1:902
    ZaN(i) = Za(i) - 0.964;
end

for i=2:902
    Vz(i) = Vz(i-1) + ZaN(i) * steppy;
end

plot(timevar,Vz)