%candyCreation.m

%This program perfomrs a number of tasks with theoretical Valentine's Day
%candies to practice with structure and cell arrays.

%   Author: J. Patrick Lacher

clear
clc

%% Task 1

chocolate(1).name = 'Truffle';
chocolate(1).number = 27;
chocolate(1).cost = 0.55;
chocolate(1).type = 'Dark';

chocolate(2).name = 'Cashew Cluster';
chocolate(2).number = 53;
chocolate(2).cost = 0.70;
chocolate(2).type = 'Milk';

display(['There are ',num2str(chocolate(2).number),' Cashew Clusters available.'])

display([chocolate(1).name,'s are ',lower(chocolate(1).type),' chocolate.'])

%% Task 2

candy(1).message = 'Be Mine';
candy(1).color = 'White';
candy(2).message = 'True Love';
candy(2).color = 'Yellow';
candy(3).message = 'All Mine';
candy(3).color = 'Red';
candy(4).message = 'BFF';
candy(4).color = 'Purple';
candy(5).message = 'You Rock';
candy(5).color = 'Orange';

bemine = 0;
redrock = 0;
for it = 1:50
    box(it).message = candy(randi(5)).message;
    box(it).color = candy(randi(5)).color;
    if strcmp(box(it).message,'Be Mine')
        bemine = bemine + 1;
    end
    if strcmp(box(it).message,'You Rock') && strcmp(box(it).color,'Red')
        redrock = redrock + 1;
    end
end

if bemine == 1
    display(['There is ',num2str(bemine),' candy that says "Be Mine"'])
else
    display(['There are ',num2str(bemine),' candies that say "Be Mine"'])
end

if redrock == 1
    display(['There is ',num2str(redrock),' red candy that says "You Rock"'])
else
    display(['There are ',num2str(redrock),' red candies that say "You Rock"'])
end