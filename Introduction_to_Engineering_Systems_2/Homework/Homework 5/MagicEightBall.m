%MagicEightBall.m

%This program simulates a "magic eight ball" that provides randomized
%answers to yes or no questions.

    %Author: J. Patrick Lacher
  
clear
clc

%% Ask the User for a Question

disp('What would you like to know?')
q = input(': ','s');

answers = {'It is certain','Yes - definitely','Most likely','Signs point to yes','Better not tell you now','Outlook not so good','It is decidedly so','You may rely on it','My reply is no','No'};

%% Answer Question

disp(answers(randi(10)))