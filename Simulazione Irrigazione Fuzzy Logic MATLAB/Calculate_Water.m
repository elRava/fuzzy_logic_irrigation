
function [water, labels] = Calculate_Water(bel_temp, bel_diff, bel_humi, inf_rule)

% mat = matrix with inference rules

% 1 2 3 4 
labels = ["Nothing", "Bit", "Some", "Lot"];

% exact quantity of water (mm)
nothing = 0;
bit = 5;
some = 10;
lot = 20;

% array that contains the belief values of the output
arr_1 = zeros();
arr_2 = zeros();
arr_3 = zeros();
arr_4 = zeros();

% indexes
k1 = 1;
k2 = 1;
k3 = 1;
k4 = 1;
    
% calculate believes of all table
for i = 1 : 1 : length(inf_rule)
    % get current values from table inf_rules
    t = inf_rule(i, 1);
    d = inf_rule(i, 2);
    h = inf_rule(i, 3);
    w = inf_rule(i, 4);
    
    % array that contains current beliefs
    bel_var = zeros(1, 3);
    bel_var(1) = bel_temp(t);
    bel_var(2) = bel_diff(d);
    bel_var(3) = bel_humi(h);
    
    % get min == belief of the output
    min_bel = min(bel_var);
    
    % insert into array that contains all beliefs. next calculate maximum
    if w == 1   % nothing
        arr_1(k1) = min_bel;
        k1 = k1 + 1;
    end
    if w == 2   % bit
        arr_2(k2) = min_bel;
        k2 = k2 + 1;
    end
    if w == 3   % some
        arr_3(k3) = min_bel;
        k3 = k3 + 1;
    end
    if w == 4   % lot
        arr_4(k4) = min_bel;
        k4 = k4 + 1;
    end
    
end

% calculate maximum of belief
max_n = max(arr_1);
max_b = max(arr_2);
max_s = max(arr_3);
max_l = max(arr_4);

% weighted mean - calculate exact value of water necessary
water = (max_n * nothing + max_b * bit + max_s * some + max_l * lot) / (max_n + max_b + max_s + max_l);






