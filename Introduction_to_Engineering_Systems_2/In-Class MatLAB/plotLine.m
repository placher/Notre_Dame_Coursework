%plotLine.m

%This program uses the lineVals.m function to generate a plot of a line
%between two points in the (x,y) plane.

    %Author: J. Patrick Lacher

clear
clc

%% Define Points

x1 = 3.2;
y1 = 5.986;

x2 = 1.7;
y2 = .177;

%% Create Plot Using lineVals.m

[m,b] = lineVals(x1,y1,x2,y2);

%creates the line
for i = 1:001:10
    x(i) = i - 1;
    y(i) = m*x(i) + b;
end

%creates a vector containing the two points
x0(1) = x1;
x0(2) = x2;
y0(1) = y1;
y0(2) = y2;

%plots the two vectors
plot(x,y,'--b',...
    x0,y0,'ko')