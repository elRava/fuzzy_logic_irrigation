% label, state of belief

function [belief, labels] = Fuzzy_Logic_Difference(val)

labels = ["Very Low", "Medium", "High (Much)", "High (Low)"];

x1 = -20;
x2 = -10;
x3 = 0;
x4 = 10;
x5 = 20;




% COMPUTE VERY LOW MEBMERSHIP FUNCTION

if val <= x2
    belief(1) = 0;
elseif val >= x4
    belief(1) = 0;
elseif val >= x2 && val <= x3
    belief(1) = (val - x2) / (x3 - x2);
else
    belief(1) = 1 - (val - x3) / (x4 - x3);
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



% COMPUTE HIGH (MUCH) MEBMERSHIP FUNCTION

if val <= x3
    belief(3) = 0;
elseif val >= x5
    belief(3) = 1;
else
    belief(3) = (val - x3) / (x5 - x3);
end



% COMPUTE HIGH (LOW) MEBMERSHIP FUNCTION

if val <= x1
    belief(4) = 1;
elseif val >= x2
    belief(4) = 0;
else
    belief(4) = 1 - (val - x1) / (x2 - x1);
end







