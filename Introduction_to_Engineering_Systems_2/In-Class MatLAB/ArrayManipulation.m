%Lecture 2
%January 20, 2015

%This program is for practicing the manipulation of arrays as part of
%Lecture 2

clear
clc

%% Enter the Array

arrayA= [24,9,25,10;7,6,16,5;25,17,2,6];

%Display the Second Column of the Array

display([arrayA(1:3,2)])

%Change the Array

arrayA(1,3)= 0;

