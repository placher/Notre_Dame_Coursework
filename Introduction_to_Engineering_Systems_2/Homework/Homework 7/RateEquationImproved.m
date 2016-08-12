%RateEquationImproved.m

%This program solves the differential equation dy/dt = (ky - kT) using the
%improved Euler method.

%Author: J. Patrick Lacher

clear
clf
clc

%% Define Constants

k = -0.028; %min^-1
T = 60; %temp of room in degrees F

%% Define Arrays

%values for time
t = linspace(0,100,500);
%initialize y array
y = zeros(1,500);
%initial value of y
y(1) = 100; %degrees F;
%define delta t as dt
dt = t(2) - t(1);

%% Improved Euler Method

for iLoop = 1:length(t) - 1
    y(iLoop + 1) = ((2 + k*dt)*y(iLoop) - (k*T*dt)) / (2 - k*dt);
end

%% Plot the Results

plot(t,y)
title('Temp. vs Time Using Improved Euler Method')
xlabel('Time (s)')
ylabel('Temp. (F)')