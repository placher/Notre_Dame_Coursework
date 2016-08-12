%TerminalVel.m

%This program caclutates the terminal velocity of an object in air with a
%user-defined mass and cross vertical area for two different cross vertical
%areas and compares the two values

%V = sqrt((2*m*g)/(d*A*C))

%Author: J. Patrick Lacher
%Date: 1/15/15

clear
clc
%% Get variables from user

area1= input('please input the value of the first cross vertical area in m^2= ');
area2= input('please input the value of the second cross vertical area in m^2= ');
mass= input('please input the mass of the object in kg= ');

%Define existing values

gravity= 9.81;  %(m/s^2)
densityair= 1.18;   %(kg/m^3)
drag= .3; %(dimensionless drag)

%% Calculations

%First Cross Veritical Area
tvariable1= 2*mass*gravity;
tvariable2= densityair*area1*drag;
velocity1= sqrt(tvariable1/tvariable2);

%Second Cross Vertical Area
tvariable3= densityair*area2*drag;
velocity2= sqrt(tvariable1/tvariable3);

%Difference of Velocities
diffvelocity= velocity2-velocity1;

%Conversion from Meters/Second to Miles/Hour
% 1m/s = 2.23694mi/h
velocity12= 2.23694*velocity1;
velocity22= 2.23694*velocity2;

%% Answer Output
clc

%Velocity 1
ans1= ['First Velocity = ',num2str(velocity1),' m/s = ',num2str(velocity12),' mi/h'];
disp(ans1)

%Velocity 2
ans2= ['Second Velocity = ',num2str(velocity2),' m/s = ',num2str(velocity22),' mi/h'];
disp(ans2)

%Difference in Velocities
ans3= ['Difference in Velocities = ',num2str(diffvelocity),' m/s'];
disp(ans3)
