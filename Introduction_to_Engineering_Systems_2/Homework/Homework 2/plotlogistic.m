%plotlogistic.m

%This program plots the function p=1/(1+e^(-(y-y0)/a)) over 100 entries in
%the domain y=[0,50] for user-defined values of y0 and a.

%   Author: J. Patrick Lacher

clear
clc

%% Get User Inputs

y0 = input('Please input a value for y0: ');
a1 = input('Please input a nonzero value for a: ');

%ensure a does not equal 0
while a1 == 0
    disp('The value of a must not equal zero for the function to exist')
    a1 = input('Please input a new value for a: ');
end

%% Compute Domain and Range Arrays for Plot

domain = linspace (0,50);

tvar1 = -((domain-y0)/a1);
range = power((1+exp(tvar1)),-1);

%% Plot Function

plot (domain,range)
ylim ([0 1.25])