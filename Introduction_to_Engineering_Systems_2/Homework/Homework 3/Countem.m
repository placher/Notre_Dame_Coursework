%Countem.m

%This program creates a string of "N" consecutive intergers begining with
%"N0".

%   Author: J. Patrick Lacher

clear
clc

%% Set Perameters

N = 10;
N0 = 5;

%% Create Numeric String

numstr = '';

for i = 0:(N-1)
    tvar = N0 + i;
    if i ~= (N-1)
        numstr = [numstr,num2str(tvar),', '];
    else
        numstr = [numstr,num2str(tvar)];
    end
end

disp(numstr)