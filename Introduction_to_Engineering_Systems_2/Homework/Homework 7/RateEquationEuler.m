%% RateEquationEuler.m

%This program uses the Euler method to approximate 3x^2 - 20x + 10.

%Author: J. Patrick Lacher
clc
clf
clear

%% Define Constants
step = 0.1;      %Step Size
xmin = 0;       %Lower end of domain
xmax = 10;    %Upper end of domain

%% Define Arrays
%create array of x values
x1 = [];
arraystep = 1;
for x = xmin:step:xmax
    x1(arraystep) = x;
    arraystep = arraystep + 1;
end
%create array for approximation of y
y1 = zeros(1,length(x1));

%% Loop through Euler Method to find Approximation

%define initial y value
y1(1) = 0;

%Loop through Euler Method
for iLoop = 1:length(x1)-1
    y1(iLoop+1) = y1(iLoop) + step*(3*(x1(iLoop))^2 - 20*(x1(iLoop)) + 10);
end

%% Plot the Results

plot(x1,y1)
title('Solution Using Euler Method')
xlabel('X')
ylabel('Y')