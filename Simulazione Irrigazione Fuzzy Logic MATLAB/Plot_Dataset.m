
% PLOT DATASET

% TEMPERATURE
figure;
subplot(2, 2, 1);
plot(X_date, t_hr_avg);
hold on;
xlim([X_date(1), X_date(length(X_date))]);
xlabel('Date and Time');
ylabel('°C');
title('Temperature');
point_temperature = plot(X_date(1), t_hr_avg(1), 'r*');

% PRECIPITATION
subplot(2, 2, 2);
plot(X_date, rain);
hold on;
xlim([X_date(1), X_date(length(X_date))]);
xlabel('Date and Time');
ylabel('mm');
title('Precipitation');
point_precipitation = plot(X_date(1), rain(1), 'r*');

% SOLAR RADIATION
subplot(2, 2, 3);
plot_radiation = plot(X_date, solarad);
hold on;
xlim([X_date(1), X_date(length(X_date))]);
xlabel('Date and Time');
ylabel('W/m^2');
title('Solar Radiation');
point_radiation = plot(X_date(1), solarad(1), 'r*');

% AIR HUMIDITY
subplot(2, 2, 4);
plot_humidity = plot(X_date, air_hum);
hold on;
xlim([X_date(1), X_date(length(X_date))]);
xlabel('Date and Time');
ylabel('%');
title('Air Humidity');
point_humidity = plot(X_date(1), air_hum(1), 'r*');