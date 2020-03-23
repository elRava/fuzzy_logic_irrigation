% label, state of belief

function [belief, labels] = Fuzzy_Logic_Humidity(val)

labels = ["Low", "Medium", "High"];

x1 = 25;
x2 = 50;
x3 = 75;

% COMPUTE LOW MEBMERSHIP FUNCTION

if val <= x1
    belief(1) = 1;
elseif val >= x2
    belief(1) = 0;
else
    belief(1) = 1 - (val - x1) / (x2 - x1);
end

% COMPUTE MEDIUM MEBMERSHIP FUNCTION

if val <= x1
    belief(2) = 0;
elseif val >= x3
    belief(2) = 0;
elseif val >= x1 && val <= x2
    belief(2) = (val - x1) / (x2 - x1);
else
    belief(2) = 1 - (val - x2) / (x3 - x2);
end

% COMPUTE HIGH MEBMERSHIP FUNCTION

if val <= x2
    belief(3) = 0;
elseif val >= x3
    belief(3) = 1;
else
    belief(3) = (val - x2) / (x3 - x2);
end



