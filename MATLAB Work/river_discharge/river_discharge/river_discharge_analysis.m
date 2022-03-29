%% ENGR 112 - River discharge analysis %%
% Name: Andrew Green
% Date: 3/24/2022
% Section: 001
clc,clear
%% Import Huron River data from DAT file
data_huron = readmatrix('huron_river_monthly_discharge.dat');

%% Separate Huron River data into three arrays
year_huron = data_huron(:,1);
month_huron = data_huron(:,2);
discharge_huron = data_huron(:,3);
    
%% Import Moore River data from CSV file
data_moore = readtable('moore_river_monthly_discharge.csv');

%% Calculate the number of rows of data in the file
num_data_pts = size(data_moore, 1);

%% Pre-allocate the arrays
year_moore = zeros(num_data_pts, 1);
month_moore = zeros(num_data_pts, 1);
discharge_moore = zeros(num_data_pts, 1);

%% Extract the data from the CSV table
for i = 1:num_data_pts
    time_stamp_cell = table2array(data_moore(i, 1));
    time_stamp = time_stamp_cell{1};
    split_time_stamp = strsplit(time_stamp, '-');
    year_moore(i) = str2double(split_time_stamp{1}(:));
    month_moore(i) = str2double(split_time_stamp{2}(:));
    discharge_moore(i) = table2array(data_moore(i, 2));
end; clear time_stamp_cell time_stamp split_time_stamp num_data_pts

%% Clean Moore River data
year_moore = year_moore(~isnan(discharge_moore));
month_moore = month_moore(~isnan(discharge_moore));
discharge_moore = discharge_moore(~isnan(discharge_moore));
    
%% Calculate monthly mean discharge
monthly_mean_huron = zeros(12, 1);
monthly_mean_moore = zeros(12, 1);
for i=1:12
    monthly_mean_huron(i) = mean(discharge_huron(month_huron==i));
    monthly_mean_moore(i) = mean(discharge_moore(month_moore==i));
end; clear i

%% Convert units
conversion_factor = (1/35.3147);
monthly_mean_huron = conversion_factor * monthly_mean_huron;

%% Plot monthly mean discharge rates for each river
month_indices = 1:1:12;
figure()
    hold on
    plot(month_indices, monthly_mean_huron, 'LineWidth', 2)
    plot(month_indices, monthly_mean_moore, 'LineWidth', 2)
    hold off
    xlabel('Month')
    ylabel('Discharge (m^3/s)')
    grid on
    xlim([1,12])
    legend('Huron', 'Moore')
        