%rps3.m

%This program is the third version of a rock, paper, scissors game that
%simulates gameplay with the user. In this version, a running tally of wins
%is kept and reported at the end of every turn. The game will continue
%until the user enters "q" to end the game.

%   Author: J. Patrick Lacher

clear
clc

%% Rock, Paper, Scisors

%this sets an initial value for the choice variable so matlab will allow
%the for loop to begin
choice = 0;

%initializes win counter
wins = 0;

%converts the user choices to numbers
r = 1;
p = 2;
s = 3;
q = 4;

while choice ~= 4
    choice = input('Please choose rock(r), paper(p), scissors(s), or quit the game(q): ');
    cpuchoice = randi([1,3]);
    
    %Computer Chose Rock
    if cpuchoice == 1
        if choice == 1
            disp('You tied!')
            disp(['Total wins = ',num2str(wins)])
        end
        if choice == 3
            disp('You lost!')
            disp(['Total wins = ',num2str(wins)])
        end
        if choice == 2
            disp('You win!')
            wins = wins + 1;
            disp(['Total wins = ',num2str(wins)])
        end
    end
    
    %Computer Chose Paper
    if cpuchoice == 2
        if choice == 2
            disp('You tied!')
            disp(['Total wins = ',num2str(wins)])
        end
        if choice == 1
            disp('You lost!')
            disp(['Total wins = ',num2str(wins)])
        end
        if choice == 3
            disp('You win!')
            wins = wins + 1;
            disp(['Total wins = ',num2str(wins)])
        end
    end
    
    %Computer Chose Scissors
    if cpuchoice == 3
        if choice == 3
            disp('You tied!')
            disp(['Total wins = ',num2str(wins)])
        end
        if choice == 2
            disp('You lost!')
            disp(['Total wins = ',num2str(wins)])
        end
        if choice == 1
            disp('You win!')
            wins = wins + 1;
            disp(['Total wins = ',num2str(wins)])
        end
    end
end

clc
disp('Thanks for playing!')