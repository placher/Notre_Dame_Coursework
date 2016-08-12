%randCount.m

%This program randomly generates a number between 0 and 1 and continues
%doing so until the nuber is stored is between .7 and .75. This counts the
%number of times the value must be recomputed and takes an average of 1000
%trials.

    %Author: J. Patrick Lacher

clear
clc

%% RandCount

cycles = 0;

for run = 1:1000
    proceed = 0;
    while proceed ~= 1
        x = rand(1,1);
        if x >= 0.7 && x <= .75
            proceed = 1;
        end
        cycles = cycles + 1;
    end
end
avgcycles = cycles/1000;

disp(['The average number of random values generated is ',num2str(avgcycles)])