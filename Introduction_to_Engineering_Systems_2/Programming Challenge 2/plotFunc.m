% plotFunc.m
%  Plots the function of the form 
%    f(x) = cos(x)*cos(b*x)

%% set parameters
xmin=pi;        % Minimum value of x being plotted
xmax=3*pi;      % Maximum value of x being plotted
Nx=300;         % Number of points plotted
b = 1.5;        % Coefficient b of the equation f(x)=cos(x)*cos(b*x)
doGrid = true;  % Boolean variable to control if the grid is on or off

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
plot(x,y);             % Plots the function
xlabel('X');           % Label on the x-axis
ylabel('Y');           % Label on the y-axis
title('My Function');  % Title of the figure

if doGrid              % If statement will add the grid if the variable 
    grid on;           % doGrid is set to be true.  Othewise, the grid will
end                    % not appear

%% Plot of the derivative
plot(x, dydx);           % Plots the derivative
xlabel('X');             % Label on the x-axis
ylabel('dy/dx');         % Label on the y-axis
title('My Derviative');  % Title of the figure

if doGrid         % If statement will add the grid if the variable 
    grid on;      % doGrid is set to be true.  Othewise, the grid will
end               % not appear