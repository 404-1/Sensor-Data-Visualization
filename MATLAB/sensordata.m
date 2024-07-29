%% Import file
clc, clearvars

file = 'sensordata.csv';
datafile = readtable(file);

%% analysis
clc, clearvars -except datafile

strain = [];
strain(:,1) = table2array(datafile(:,1));
strain(:,2) = table2array(datafile(:,2));
s3 = table2array(datafile(:,3));

% Convert sensor column to string
s3 = string(s3);

% Split sensor column by delimiter
s3 = split(s3, '!');

% Convert to int
s3 = double(s3(:,1));
strain(:,3) = s3

%% Plotting scatter plot
s_plot = figure('Name','sensorplot','NumberTitle','off');
scatter(strain(:,1), strain(:,2), strain(:,3)*3, strain(:,3), 'filled');
pause(0.5)
title('Strain (MPa) over Sensor Grid')
xlabel('Distance (m)')
ylabel('Distance (m)')
colorBar = colorbar();
title(colorBar, 'MPa')
grid on

%saveas(s_plot,'sensorplot','png')