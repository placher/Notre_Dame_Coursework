%transpo.m

%This program determines a user-defined distance of travel and then
%reccomends an optimal mode of transportation.

%   Author: J. Patrick Lacher

clear
clc

%% Determine User Inputs

distance= input('How far do you need to travel (km)? ');
K= menu('Can you ride a bicycle?','yes','no');

%% Determination of Mode of Transport

%if user can ride a bike
if K== 1
    if distance< 1
        disp('You should walk')
    end
    if distance>= 1 && distance< 10
        disp('You should ride your bicycle')
    end
    if distance>= 10 && distance<= 250
        disp('You should drive your car')
    end
    if distance> 250
        disp('You should take an airplane')
    end
end

%if user cannot ride a bike
if K== 2
    if distance< 5
        disp('You should walk')
    end
    if distance>= 5 && distance<= 250
        disp('You should drive your car')
    end
    if distance> 250
        disp('You should take an airplane')
    end
end
