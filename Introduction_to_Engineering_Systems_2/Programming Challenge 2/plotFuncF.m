function plotFuncF(handles)
%  Plots the function of the form 
%    f(x) = cos(x)*cos(b*x)

% Author: J. Patrick Lacher
% 2 April 2015
% Eg 10112 Section 2

%% set parameters
xmin=pi;        % Minimum value of x being plotted
xmax=3*pi;      % Maximum value of x being plotted
Nx=300;         % Number of points plotted
b = handles.bSlider.Value;        % Coefficient b of the equation f(x)=cos(x)*cos(b*x)

%% calculate function values - Do not change
x=linspace(xmin,xmax,Nx);     % Calculate x points
y = cos(x).*cos(b*x);         % Calculate y points of function

%% calculate derivative values - Do not change
dx = 1*10^-6;               
xp = x + dx;  
xm = x - dx;
yp = cos(xp).*cos(b*xp)./xp;
ym = cos(xm).*cos(b*xm)./xm;
dydx = (yp - ym)/(2*dx);      % Approximate Derivative

%% Plot the function
plot(handles.funcAxes,x,y);             % Plots the function
xlabel(handles.funcAxes,'X');           % Label on the x-axis
ylabel(handles.funcAxes,'Y');           % Label on the y-axis
title(handles.funcAxes,'My Function');  % Title of the figure

if handles.gridonCheckbox.Value              % If statement will add the grid if the variable 
    grid(handles.funcAxes,'on');           % doGrid is set to be true.  Othewise, the grid will
end                    % not appear

%% Plot of the derivative
plot(handles.derivAxes,x, dydx);           % Plots the derivative
xlabel(handles.derivAxes,'X');             % Label on the x-axis
ylabel(handles.derivAxes,'dy/dx');         % Label on the y-axis
title(handles.derivAxes,'My Derviative');  % Title of the figure

if handles.gridonCheckbox.Value         % If statement will add the grid if the variable 
    grid(handles.derivAxes,'on');      % doGrid is set to be true.  Othewise, the grid will
end               % not appear