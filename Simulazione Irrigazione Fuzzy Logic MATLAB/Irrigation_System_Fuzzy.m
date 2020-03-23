% MAIN PROGRAM IRRIGATION FUZZY LOGIC

clear all;

% READ DATASET
Read_Dataset();

% PLOT DATASET
Plot_Dataset();

% PLOT FUZZY SETS
Plot_Fuzzy_Sets();


% START SIMULATION

% delay between hours
delay = 0;
% create inference matrix
Inference_Matrix();
% soil humidity target of the controller (%)
target = 45;
% initial soil moisture (%)
soil = 60;
soil_timer = 60; % of the timer simulation
% interval between control in hours
ctrl_interval = 6;
ctrl_interval_timer = 24; % timer simulation

% figure of the soil moisture plot
y_humi = zeros();
figure;
hax1 = axes;
plot(hax1, X_date, target * ones(1, length(X_date)), 'r', 'LineWidth', 1.5);
legend('Target', 'Current Soil Moisture');
hold on;
% plot of irrigation
y_irrig = zeros();
figure;
hax2 = axes;
% figure of the soil moisture plot of the timer simulation
y_humi_timer = zeros();
figure;
hax3 = axes;
plot(hax3, X_date, target * ones(1, length(X_date)), 'r', 'LineWidth', 1.5);
legend('Target', 'Current Soil Moisture');
hold on;
% plot of irrigation of the timer simulation
y_irrig_timer = zeros();
figure;
hax4 = axes;

for i = 1 : 1 : length_period
    current_temp = t_hr_avg(i);
    current_solarad = solarad(i);
    current_humidity = air_hum(i);
    current_rain = rain(i);
    current_date = X_date(i);
    irrigation = 0;
    % irrigation of the timer simulation (fixed) in mm
    irrigation_timer = 0;
    
    % pointer to dataset plots
    set(point_temperature, 'Xdata', current_date, 'YData', current_temp);
    set(point_precipitation, 'Xdata', current_date, 'YData', current_rain);
    set(point_radiation, 'Xdata', current_date, 'YData', current_solarad);
    set(point_humidity, 'Xdata', current_date, 'YData', current_humidity);
    % pointer to fuzzy sets
    [belief_temp, labels_temp] = Fuzzy_Logic_Temperature(current_temp);
    set(point_FS_temp_Low, 'Xdata', current_temp, 'YData', belief_temp(1));
    set(point_FS_temp_Med, 'Xdata', current_temp, 'YData', belief_temp(2));
    set(point_FS_temp_Hig, 'Xdata', current_temp, 'YData', belief_temp(3));
    [belief_humi, labels_temp] = Fuzzy_Logic_Humidity(current_humidity);
    set(point_FS_humi_Low, 'Xdata', current_humidity, 'YData', belief_humi(1));
    set(point_FS_humi_Med, 'Xdata', current_humidity, 'YData', belief_humi(2));
    set(point_FS_humi_Hig, 'Xdata', current_humidity, 'YData', belief_humi(3));
    
    % plot of the soil moisture
    soil = soil - (Evapotranspiration(current_solarad, current_temp, latitude, current_humidity) / 24) + current_rain;
    x_soil(i) = current_date;
    y_soil(i) = soil;
    plot(hax1, x_soil, y_soil, 'b', 'LineWidth', 1.5);
    title(hax1, 'Soil Moisture');
    xlabel(hax1, 'Date and Time');
    ylabel(hax1, '%');
    xlim(hax1, [X_date(1), X_date(length(X_date))]);
    ylim(hax1, [0, 100]);

    % plot of the soil moisture of the timer simulation
    soil_timer = soil_timer - (Evapotranspiration(current_solarad, current_temp, latitude, current_humidity) / 24) + current_rain;
    x_soil(i) = current_date;
    y_soil_timer(i) = soil_timer;
    plot(hax3, x_soil, y_soil_timer, 'b', 'LineWidth', 1.5);
    title(hax3, 'Soil Moisture Timer Simulation');
    xlabel(hax3, 'Date and Time');
    ylabel(hax3, '%');
    xlim(hax3, [X_date(1), X_date(length(X_date))]);
    ylim(hax3, [0, 100]);
    
    % calculate difference between our humidity and target
    diff = soil - target;
    
    % set pointer in difference fuzzy sets graphic
    [belief_diff, labels_diff] = Fuzzy_Logic_Difference(diff);
    set(point_FS_diff_VLow, 'Xdata', diff, 'YData', belief_diff(1));
    set(point_FS_diff_Low, 'Xdata', diff, 'YData', belief_diff(2));
    set(point_FS_diff_Med, 'Xdata', diff, 'YData', belief_diff(3));
    set(point_FS_diff_Hig, 'Xdata', diff, 'YData', belief_diff(4));
    
    % add irrigation, so it appears only 1 hr later
    if mod(i, ctrl_interval) == 0
        irrigation = Calculate_Water(belief_temp, belief_diff, belief_humi, inf_rule);
        soil = soil + irrigation;
        if soil > 100
            soil = 100;
        end
%         if i > 30
%            return
%         end
    end
    
    % irrigation of the timer simulation
    % add irrigation, so it appears only 1 hr later
    % give water only if there's no much humidity
    if mod(i, ctrl_interval_timer) == 0 && soil_timer <= target + 10
        irrigation_timer = 17; % mm
        soil_timer = soil_timer + irrigation_timer;
        if soil_timer > 100
            soil_timer = 100;
        end
    end
    
    % plot of the irrigation
    y_irrig(i) = irrigation;
    plot(hax2, x_soil, y_irrig, 'b', 'LineWidth', 1.5);
    title(hax2, 'Irrigation');
    xlabel(hax2, 'Date and Time');
    ylabel(hax2, 'mm');
    xlim(hax2, [X_date(1), X_date(length(X_date))]);
    ylim(hax2, [0, 15]);
    
    % plot of the irrigation of the timer simulation
    y_irrig_timer(i) = irrigation_timer;
    plot(hax4, x_soil, y_irrig_timer, 'b', 'LineWidth', 1.5);
    title(hax4, 'Irrigation Timer Simulation');
    xlabel(hax4, 'Date and Time');
    ylabel(hax4, 'mm');
    xlim(hax4, [X_date(1), X_date(length(X_date))]);
    ylim(hax4, [0, 20]);
    
    % set legend only once because of problems
    if i == 1
        legend(hax1, 'Target', 'Current Soil Moisture');
        legend(hax1, 'AutoUpdate','off');
        legend(hax3, 'Target', 'Current Soil Moisture');
        legend(hax3, 'AutoUpdate','off');
    end

    pause(delay);
    
end










