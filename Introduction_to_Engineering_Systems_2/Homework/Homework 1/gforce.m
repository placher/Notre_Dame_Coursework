%gforce.m

%This program finds the gravitational force (N) between two subjects given
%the masses (kg) of the two subjects and the distance (m) between them
%according to the equation F=(G*m1*m2)/(r^2)

%   Author: J. Patrick Lacher

% clear variables and command window
clear
clc

%% Get Input Values from the User and Establish Constants

%gravitational constant
GC= 6.67300*10^-11; %(N*m^2)/(kg^2)

%user inputs
m1= input('Please input the mass of the first subject in kilograms  ');
m2= input('Please input the mass of the second subject in kilograms ');
r1= input('Please input the distance between the subjects in meters ');

%keep command window clear
clc

%% Calculations

F1= ((GC*m1*m2)/(r1^2)); %output in Newtons

%% Display Results

Ans1=['The gravitational force between the two subjects is ',num2str(F1),' Newtons'];
disp(Ans1)

%% Results of Assigned Test

%The gravitational force between the two subjects is 8.0076e-08 Newtons