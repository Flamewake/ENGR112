%load all the housing data from a .mat file
load housing.mat;

%create a new figure
figure;

%hold the figure so we can plot multiple items
hold on;

%plot the housing price index for several regions
plot(months,USA);
plot(months,MiddleAtlantic);
plot(months,NewEngland);
plot(months,Pacific);
plot(months,Mountain);
plot(months,WestNorthCentral);

%create a legend
legend('USA','Mid-Atlantic','New England','Pacific','Mountain','Mid-West');

%add axis and title labels
xlabel('Time');
ylabel('Housing Price Index');
title('Change in Housing Prices in Various USA Regions since 1991');