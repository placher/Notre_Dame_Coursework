%% RateEquationEuler.m

%This program uses the Euler method to approximate 3x^2 - 20x + 10.

clc
clear

%% Define Constants
step = 0.1;      %Number of points in approximation
xmin = 0;       %Lower end of domain
xmax = 10;    %Upper end of domain

%% Define Arrays
%create array of x values
x1 = [];
arraystep = 1;
for x = (xmin:step:xmax)
    x1(arraystep) = x;
    arraystep = arraystep + 1;
end
%create array for approximation of y
y1 = zeros(1,arraystep-1);

%% Loop through Euler Method to find Approximation
%define delta x as dx
dx = x1(2) - x1(1);
%define initial y value
y1(1) = 0;

%Loop through Euler Method
for iLoop = 1:length(x1)-1
    y1(iLoop+1) = y1(iLoop) + dx*cos(x1(iLoop));
end

%% Loop through Ideal Function
for iLoop = 1:arraystep-1
    y2(iLoop) = sin(x1(iLoop));
end

plot (x1,y1,'r',x1,y2,'b')