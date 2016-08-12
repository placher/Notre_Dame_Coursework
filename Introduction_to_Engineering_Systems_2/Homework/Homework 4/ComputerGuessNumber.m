%ComputerGuessNumber.m

%This program asks the user to mentally guess a number between 1 and 20
%then systematically attempts to guess the number.

%   Author: J. Patrick Lacher

clear
clc

%% Establish Baseline Values

lowLimit = 1;
highLimit = 20;

%forces the while loop to continue
tvar = 1;

%% Guess Algorithm

while tvar == 1
    guess = randi([lowLimit,highLimit]);
    disp(['I guess ',num2str(guess)])
    switch input('Too low (l), too high (h), correct (c): ','s');
        case 'l'
            lowLimit = guess;
        case 'h'
            highLimit = guess;
        case 'c'
            disp('Thanks for playing!')
            break
    end
    clc
end