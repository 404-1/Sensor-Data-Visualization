%% Import file
clc, clearvars

file = 'sensordata.csv';
datafile = readtable(file, 'TextType','string');

%% analysis
clc, clearvars -except datafile

% Split sensor column by delimiter and extract the useful part to column 3 of strain array
datafile.sensor = double(extractBefore(datafile.sensor,'!'));

% Convert datafile table into an array
strain = table2array(datafile);

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