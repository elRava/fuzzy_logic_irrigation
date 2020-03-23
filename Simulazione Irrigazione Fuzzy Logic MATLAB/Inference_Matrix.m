% initialize matrix

inf_rule = zeros(36, 4);

% temperature
k = 1;
for i = 1 : 12 : 36
    inf_rule(i : i + 11, 1) = k;
    k = k + 1;
end

% difference
k = 1;
for i = 1 : 3 : 36
    inf_rule(i : i + 2, 2) = k;
    k = k + 1;
    if k == 5
        k = 1;
    end
end

% humidity
k = 1;
for i = 1 : 1 : 36
    inf_rule(i , 3) = k;
    k = k + 1;
    if k == 4
        k = 1;
    end
end

% temp: 1 = low, 2 = med, 3 = high
% difference: 1 = very low, 2 = low, 3 = medium, 4 = high
% humidity: 1 = low, 2 = med, 3 = high

inf_rule(1, 4) = 1;
inf_rule(2, 4) = 1;
inf_rule(3, 4) = 1;
inf_rule(4, 4) = 2;
inf_rule(5, 4) = 2;
inf_rule(6, 4) = 1;
inf_rule(7, 4) = 1;
inf_rule(8, 4) = 1;
inf_rule(9, 4) = 1;
inf_rule(10, 4) = 2;
inf_rule(11, 4) = 2;
inf_rule(12, 4) = 3;
inf_rule(13, 4) = 2;
inf_rule(14, 4) = 2;
inf_rule(15, 4) = 1;
inf_rule(16, 4) = 2;
inf_rule(17, 4) = 2;
inf_rule(18, 4) = 2;
inf_rule(19, 4) = 1;
inf_rule(20, 4) = 1;
inf_rule(21, 4) = 1;
inf_rule(22, 4) = 3;
inf_rule(23, 4) = 3;
inf_rule(24, 4) = 2;
inf_rule(25, 4) = 2;
inf_rule(26, 4) = 2;
inf_rule(27, 4) = 2;
inf_rule(28, 4) = 3;
inf_rule(29, 4) = 3;
inf_rule(30, 4) = 3;
inf_rule(31, 4) = 1;
inf_rule(32, 4) = 1;
inf_rule(33, 4) = 1;
inf_rule(34, 4) = 4;
inf_rule(35, 4) = 4;
inf_rule(36, 4) = 4;


