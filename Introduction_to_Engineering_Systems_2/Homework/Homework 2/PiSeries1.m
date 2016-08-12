%PiSeries1.m

%This program uses Leonard Euler's solution to the Basel problem to
%estimate the value of pi to 9 digits. Euler's solution states that the sum
%of the reciprocal squares of all positive intergers is equal to (pi^2)/6.
%This program will assume approximate equivalence for n numbers.

%   Author: J. Patrick Lacher

clear
clc

%% Determine Extent of Set

n = input('Please set a value for n= ');

%% Compute Reimann Sum

sumcount = 1;
rsum = 0;

while sumcount <= n
    rsum = rsum + (1/power(sumcount,2));
    sumcount = sumcount + 1;
end

%% Solve for Pi

piApprox = sqrt(6*rsum);

disp(num2str(piApprox,9))

%% Assignment Solutions

%n=100, piApprox=3.13207653
%n=1000, piApprox=3.14063806
%n=1000000, piApprox=3.1415917
%n=10000000, piApprox=3.14159256