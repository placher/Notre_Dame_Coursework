%GoodBye.m

%This program prints a string of "Goodbye" messages with an increasing
%indent for each subsequent message.

%   Author: J. Patrick Lacher

clear
clc

%% Print Message

n = 0;

while n <= 40
    disp ([blanks(n),'Goodbye!'])
    n = n + 2;
end