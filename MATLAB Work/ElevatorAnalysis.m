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

% Plot that
plot(timevar,Za)