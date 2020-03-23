
% READ DATASET

dataset = readtable('CRNH0203-2016-AL_Fairhope_3_NE.txt');

% use only a part of the dataset, from row begin_ to row end_
begin_period = 4000;
end_period = 4500;
length_period = end_period - begin_period;

% extract useful informations from dataset
station_number = dataset(1, 1); % XXXXX
date = table2array(dataset(begin_period : end_period, 2));   % YYYYMMDD
time = table2array(dataset (begin_period : end_period, 3));  % HHmm
longitude = table2array(dataset(1, 7));  % decimal degrees
latitude = table2array(dataset(1, 8));   % decimal degrees
t_hr_avg = table2array(dataset(begin_period : end_period, 10));  % celsius
rain = table2array(dataset(begin_period : end_period, 13));  % mm
solarad = table2array(dataset(begin_period : end_period, 14));   % W/m^2
solaradmax = table2array(dataset(begin_period : end_period, 16));    % W/m^2  
air_hum = table2array(dataset(begin_period : end_period, 27));   % perc %

% define intial date time
date_beg_str = num2str(date(1, 1));
time_beg_str = num2str(time(1, 1));
Y = str2double(date_beg_str(1 : 4));
M = str2double(date_beg_str(5 : 6));
D = str2double(date_beg_str(7 : 8));
H = str2double(time_beg_str(1 : 2));
MI = str2double(time_beg_str(3 : 4));

begin_date = datetime(Y, M, D, H, MI, 0);
X_date = dateshift(begin_date, 'start', 'hour', (0 : length_period));


