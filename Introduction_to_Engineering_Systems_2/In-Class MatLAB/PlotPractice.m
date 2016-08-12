%PlotPractice.m

%This program plots experimental and theoretical data onto a single graph
%as specified by the in-class assignment recieved on January 20, 2015

%Author: J. Patrick Lacher (jlacher1@nd.edu)
%Date: January 20,2015

clear
clc

%% Part A- graph of cos(2pix/L)

L= 5;

%create a set that will comprise the "x" values of the graph
x1= linspace(0,6,100);

%compute the output values of the function
y1= cos(2*(pi)*x1/L);

%% Part B- graph of experimental data

%domain of the experimental data
xexp= [1,2,3,4,5];

%experimental values
trial1= [.38,-.82,-.79,.28,.93];
trial2= [.36,-.8,-.88,.45,1.1];
trial3= [.22,-.67,-.94,.27,.98];

%% Output the graph

%plot the actual graph
plot (x1,y1,'g-',xexp,trial1,'ko',xexp,trial2,'bo',xexp,trial3,'ro')

%input a legend and labels for the graph
legend('theoretical data','trial 1','trial 2','trial 3','Location','SouthEast')
title('Graph of Cosine Experimental Data')
xlabel('input values (x)')
ylabel('output values (f(x))')
