%PlotParabola.m

%Lecture 2
%January 20, 2015

%This program serves as an introduction to the plot commands and processes
%involved in creating a graph

clc
clear

%% Get Inputs for a, b, and c

a1= 2;
b1= 3;
c1= 4;

%% Set Plot Points

x1= linspace(-20,20,20);

f1= ((a1*power(x1,2))+(b1*x1)+c1); 
%the power command raises a set (or element therof) to a power without attempting matrix multiplication)

%% Plot graph

plot(x1,f1,'k--o')
legend('y1','Location','NorthWest')
