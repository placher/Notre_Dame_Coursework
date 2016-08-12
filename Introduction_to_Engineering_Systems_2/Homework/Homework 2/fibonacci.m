%fibonacci.m

%This program calculates the values of n iterations of the Fibonacci
%Sequence and returns the sum of all iterations of the Sequence up to n.

%   Author: J. Patrick Lacher

clear
clc

%% Determine Length of Sequence

nfib = input('How many iterations of the Fibonacci Sequence would you like? ');

%% Compute Sequence

%These 2 inputs will serve as the base of the Sequence
fib(1) = 0;
fib(2) = 1;

%ifib will serve as an iteration counter to end the sequence at nfib
ifib = 3;

%the Fibonacci algorithm
while ifib <= nfib
    fib(ifib) = fib(ifib - 1) + fib(ifib - 2);
    ifib = ifib + 1;
end

%% Display Sequence Sum

disp (['The sum of the first ',num2str(nfib),' members of the Fibonacci Sequence is ',num2str(sum(fib)),'.'])