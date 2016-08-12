%plotLJ.m

%This program plots a parametrically defined motion system characterized by
%T, a, b, r, and phi.

%   Author: J. Patrick Lacher

clear
clc

%% Get User Inputs for Function

disp('Please input values for the following variables in the parametric equation')
T = input('T= ');
a = input('a= ');
b = input('b= ');
r = input('r= ');
phi = input('phi= ');
animateON = input('Plot as an animation? (true/false): ');

%% Set Parameters

Nt = 500; %number of time points in time array
tf = 10; %final time

%% Create Arrays

%time array
t = linspace(0,tf,Nt);

%set up a for loop to fill the x and y arrays
for it=1:Nt
    x(it) = r*(cos(a*(2*pi/T)*t(it)));
    y(it) = r*(sin((b*(2*pi/T)*t(it))+phi));
end

%% Plot Animation

pause on;

if animateON
    %Plot the Animation
    for it=1:Nt
        plot(x(it),y(it),'ko',...
            x(1:it),y(1:it),'b');
        axis([-3 3 -3 3]);
        axis square
        grid on
        drawnow
        pause(.00025)
    end
else
    plot(x,y,'b');
    axis([-3 3 -3 3]);
    axis square
    grid on
end