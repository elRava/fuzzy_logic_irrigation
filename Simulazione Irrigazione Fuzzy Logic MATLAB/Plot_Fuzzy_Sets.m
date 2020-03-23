
% PLOT FUZZY SETS TEMPERATURE

temp = zeros();
labels_temp = zeros();
k = 1;
min_temp = -10;
max_temp = 40;
x_temp = min_temp : 1 : max_temp;
for i = min_temp : 1 : max_temp
    [belief, labels_temp] = Fuzzy_Logic_Temperature(i);
    temp(k, 1) = belief(1);
    temp(k, 2) = belief(2);
    temp(k, 3) = belief(3);
    k = k + 1;
end

figure;
subplot(2, 2, 1);
plot(x_temp, temp, 'LineWidth', 1.5);
title('Fuzzy Set Temperature');
xlabel('°C');
ylabel('Grade of Belief');
xlim([min_temp, max_temp]);
ylim([0, 1.1]);
hold on;
[belief, labels_temp] = Fuzzy_Logic_Temperature(t_hr_avg(1));
point_FS_temp_Low = plot(t_hr_avg(1), belief(1), 'r*');
point_FS_temp_Med = plot(t_hr_avg(1), belief(2), 'r*');
point_FS_temp_Hig = plot(t_hr_avg(1), belief(3), 'r*');
legend(labels_temp(1), labels_temp(2), labels_temp(3));


% PLOT FUZZY SETS HUMIDITY

humi = zeros();
labels_humi = zeros();
k = 1;
min_humi = 0;
max_humi = 100;
x_humi = min_humi : 1 : max_humi;
for i = min_humi : 1 : max_humi
    [belief, labels_humi] = Fuzzy_Logic_Humidity(i);
    humi(k, 1) = belief(1);
    humi(k, 2) = belief(2);
    humi(k, 3) = belief(3);
    k = k + 1;
end

% figure;
subplot(2, 2, 2);
plot(x_humi, humi, 'LineWidth', 1.5);
hold on;
title('Fuzzy Set Humidity');
xlabel('%');
ylabel('Grade of Belief');
xlim([min_humi, max_humi]);
ylim([0, 1.1]);
hold on;
[belief, labels_temp] = Fuzzy_Logic_Humidity(t_hr_avg(1));
point_FS_humi_Low = plot(t_hr_avg(1), belief(1), 'r*');
point_FS_humi_Med = plot(t_hr_avg(1), belief(2), 'r*');
point_FS_humi_Hig = plot(t_hr_avg(1), belief(3), 'r*');
legend(labels_humi(1), labels_humi(2), labels_humi(3));


% PLOT FUZZY SETS DIFFERENCE

diff = zeros();
labels_diff = zeros();
k = 1;
min_diff = -50;
max_diff = 50;
x_diff = min_diff : 1 : max_diff;
for i = min_diff : 1 : max_diff
    [belief, labels_diff] = Fuzzy_Logic_Difference(i);
    diff(k, 1) = belief(1);
    diff(k, 2) = belief(2);
    diff(k, 3) = belief(3);
    diff(k, 4) = belief(4);
    k = k + 1;
end

% figure;
subplot(2, 2, 3:4);
plot(x_diff, diff, 'LineWidth', 1.5);
hold on;
title('Fuzzy Set Difference');
xlabel('%');
ylabel('Grade of Belief');
xlim([min_diff, max_diff]);
ylim([0, 1.1]);
[belief, labels_diff] = Fuzzy_Logic_Difference(0);
point_FS_diff_VLow = plot(0, belief(1), 'r*');
point_FS_diff_Low = plot(0, belief(2), 'r*');
point_FS_diff_Med = plot(0, belief(3), 'r*');
point_FS_diff_Hig = plot(0, belief(4), 'r*');
legend(labels_diff(1), labels_diff(2), labels_diff(3), labels_diff(4));

