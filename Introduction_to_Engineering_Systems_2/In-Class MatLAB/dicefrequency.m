%dicefrequency.m

%This program rolls two dice N times and records the frequency with which
%each possible result appears. The frequency of the results is then graphed
%as a bar plot.

%Author: Patrick Lacher

clear
clc

%% Create Tabulation Array

nscores = [0,0,0,0,0,0,0,0,0,0,0,0];

%% Get Total Number of Rolls

rolls = input('How many times should the dice be rolled? ');

%% Roll the Dice

rollcount = 0;

while le(rollcount,rolls)
    d1 = randi(6);
    d2 = randi(6);
    score = d1+d2;
    nscores(score) = nscores(score) + 1;
    rollcount = rollcount + 1;
end

%% Print the Resulting Graph as Frequency of Score

frequency = ((nscores(1:12)/rolls)*100);

bar((2:12),frequency(2:12),.5,'b')
xlabel ('Dice Per Score')
ylabel ('Frequency (%)')
title ([num2str(rolls),' Rolls of 6-Sided Dice'])
grid on
grid minor
axis ([2,12,0,22])


