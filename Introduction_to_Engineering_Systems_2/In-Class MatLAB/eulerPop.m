%% eulerPop.m

%This program uses Euler's method to analyze population dynamics

    %Author: J. Patrick Lacher
clc
clear

%% Define Constants and Arrays

%constants
pmax = 10000;
G = 0.00005;
tmin = 0;
tmax = 20;
 
 %population/time arrays
 t = linspace(0,20,21);
 p = zeros(1,21);
 p(1) = 800;
 
 %% Loop Over Euler's Method
 
 for it = 1:20
     p(it+1) = p(it) + (G*(pmax-p(it))*p(it));
 end
 
 %% Plot the Population vs Time
 
 plot (t,p)
 axis square