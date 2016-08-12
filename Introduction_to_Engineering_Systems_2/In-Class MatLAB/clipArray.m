%clipArray.m

%This program generates a 100*50 array of randomly generated intergers
%ranging from 1-100. Each value is then compared against a user-defined
%nMax. If any number is greater than nMax, that number is reset to nMax.
%The program will then report the number of terms changed to nMax.

%   Author: J. Patrick Lacher

clear
clc

%% Determine nMax

nMax = input('Please input a max value for generated numbers ');

%% Create Array

numrows = 100;
numcol = 50;

array = randi([1,100],numrows,numcol);

%% Test Array

nchanged = 0;
for iRow=1:numrows
    for iCol=1:numcol
        if array(iRow,iCol)>nMax
            array(iRow,iCol)=nMax;
            nchanged = nchanged+1;
        end
    end
end

%% Report Results

disp(['The number of terms in the array reset to nMax was ',num2str(nchanged),' terms.'])

%% In-Class Trial

%for nMax=50, the program reported 2497, 2531, and 2448 terms changed in
%three seperate trials.