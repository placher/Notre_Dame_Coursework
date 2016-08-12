%PiSeries2.m

%This program approximates the value of pi using the solution to the
%Gregory-Leibniz series.

%   Author: J. Patrick Lacher

clear
clc

%% Determine Extent of Set

n = input('Please set a value for n= ');

%% Compute Reimann Sum

sumcount = 0;
rsum = 0;

while sumcount <= n
    rsum = rsum + ((power(-1,sumcount))/((2*sumcount)+1));
    sumcount = sumcount + 1;
end

piApprox = (4*rsum);

clc
disp(['PiApprox= ',num2str(piApprox,9)])

%% Assignment Answers

%n=100      pi= 3.1514934
%n=1000     pi= 3.14259165
%n=1000000  pi= 3.14159365
%n=10000000 pi= 3.14159275
