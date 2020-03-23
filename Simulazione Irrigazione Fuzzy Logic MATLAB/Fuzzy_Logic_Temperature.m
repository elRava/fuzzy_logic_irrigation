% label, state of belief

function [belief, labels] = Fuzzy_Logic_Temperature(val)

labels = ["Low", "Medium", "High"];

x1 = 0;
x2 = 10;
x3 = 15;
x4 = 20;
x5 = 30;

% COMPUTE LOW MEBMERSHIP FUNCTION

if val <= x1
    belief(1) = 1;
elseif val >= x4
    belief(1) = 0;
else
    belief(1) = 1 - (val - x1) / (x4 - x1);
end

% COMPUTE MEDIUM MEBMERSHIP FUNCTION

if val <= x1
    belief(2) = 0;
elseif val >= x5
    belief(2) = 0;
elseif val >= x1 && val <= x3
    belief(2) = (val - x1) / (x3 - x1);
else
    belief(2) = 1 - (val - x3) / (x5 - x3);
end

% COMPUTE HIGH MEBMERSHIP FUNCTION

if val <= x2
    belief(3) = 0;
elseif val >= x5
    belief(3) = 1;
else
    belief(3) = (val - x2) / (x5 - x2);
end



