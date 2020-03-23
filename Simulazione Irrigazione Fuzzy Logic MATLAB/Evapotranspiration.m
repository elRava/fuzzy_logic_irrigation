% Rs = Solar Radiation W/m^2
% Ta = Air Temperature Daily %
% L = Latitude Radiant
% Rh = Air Humidity %
function et = Evapotranspiration(Rs, Ta, L, Rh)

% constant of the plant
k = 3;

% from W/m^2 to MJ/m^2/day
Rs = Rs / 11.57;
% from decimal degrees to radiants
L = mod(L + 360, 360) * pi / 180;

% mm / day
et = (0.0393 * Rs * sqrt(Ta + 9.5)) - (0.19 * (Rs^0.6) * (L^0.15)) + (0.048 * (Ta + 20) * (1 - Rh / 100));

et = k * et;