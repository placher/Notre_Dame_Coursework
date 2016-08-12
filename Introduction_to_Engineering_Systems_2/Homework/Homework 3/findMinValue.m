%findMinValue.m

%This program creates an array of defined size and fills it with random
%intergers. The program then uses FOR loops to determine the minimum value
%in the array.

%   Author: J. Patrick Lacher

clear
clc

%% Create Array

nRows = 20;
nColumn = 40;
nMax = 200;

%generates the array of size nRows, nColumn with numbers between 1 and nMax
array = randi([1,nMax],nRows,nColumn);

%% Compute Minimum Value

%establishes a start value for minimum
minimum = nMax;

for r = 1:nRows
    for c = 1:nColumn
        if array(r,c) < minimum
            minimum = array(r,c);
        end
    end
end

disp(['The minimum value in the array is: ',num2str(minimum)])