

function [circumference, area] = calc_circle(radius)
% function [circumference, area] = calc_circle(radius)
%
% Calculate the area and circumference of a circle from its radius
%
% ARGUMENTS:
% -radius: oositive number, radius of the circle
%
% OUTPUTS:
% - circumference: number, circ of the circle
% - area: number, area of the circle
%
% EXAMPLE
% -[c,a] = calc_circle(1);


circumference = 2 * pi * radius;
area = pi * radius^2;


end