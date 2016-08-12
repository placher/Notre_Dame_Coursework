function plotLJ(handles)

%This program plots a parametrically defined motion system characterized by
%a, b, r, and phi.

%   Author: J. Patrick Lacher

%% Recieve Handles Inputs

a = handles.Aslider.Value;
b = handles.Bslider.Value;
phi = handles.Phislider.Value;

%% Set Parameters

T = 1;
Nt = 500; %number of time points in time array
tf = T; %final time

%% Create Arrays

%time array
t = linspace(0,tf,Nt);

%set up a for loop to fill the x and y arrays
for it=1:Nt
    x(it) = (cos(a*(2*pi/T)*t(it)));
    y(it) = (sin((b*(2*pi/T)*t(it))+phi));
end

%% Plot Animation

plot(handles.LJaxes,x,y,'b');
axis([-3 3 -3 3]);
axis square
grid on