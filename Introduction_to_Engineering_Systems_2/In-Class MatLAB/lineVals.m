%lineVals.m

%function that takes the x and y coordinates of two points as inputs and
%returns the slope and intercept of the line defined by these two points.

%Author: J. Patrick Lacher
    
function [m,b] = lineVals(x1,y1,x2,y2)
m = ((y2 - y1)/(x2 - x1)); %slope
b = (y1 - (m*x1)); %intercept
end