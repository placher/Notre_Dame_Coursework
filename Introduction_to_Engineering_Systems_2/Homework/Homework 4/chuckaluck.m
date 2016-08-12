%chuckaluck.m

%This program simulates a game of chuckaluck. In a normal game, the player
%picks a normal result of rolling a 6-sided die, and places a wager. 3 dice
%are rolled and the player wins the number of correct picks multiplied
%his/her wager as winnings. For the purposes of this program, the user will
%start with $100 in capital and will wager $5 every turn.

%   Author: J. Patrick Lacher

clear
clc

%% Starting Values

%starting capital
purse(1) = 100;

nbets = 150;

bet = input('What number would you like to bet on (1-6): ');

%% Chuckaluck

for i=2:nbets
    while purse(i-1) > 0
        %takes wager
        purse(i) = purse(i-1) - 5;
        
        d1 = randi(6);
        d2 = randi(6);
        d3 = randi(6);
        
        %tabulates whether or not a win occured
        wins = 0;
        if bet == d1
            wins = wins + 1;
        end
        if bet == d2
            wins = wins + 1;
        end
        if bet == d3
            wins = wins + 1;
        end
        
        %determines winnings (if any)
        if wins > 0
            purse(i) = purse(i-1) + 5 + 5*(wins);
        end
    end
end

    %% Plots Winnings
    for it=1:nbets
        x(it) = it;
        y(it) = purse(it-1);
    end
    
    for it=1:Nt
        plot(x(it),y(it),'ko',...
            x(1:it),y(1:it),'b');
        axis([1 x(it) 0 1.1*max(y)]);
        grid on
        drawnow
        pause(.0025)
    end