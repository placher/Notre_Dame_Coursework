%test1.m

%This program uses the fymby function to determine age from the years 2009
%to 2050.

    %Author: J. Patrick Lacher
    
clear
clc

%% Test 1

for t = 2009:2050
    age = fymby(t);
    disp(['In ',num2str(t),' I will turn ',num2str(age),'.'])
end