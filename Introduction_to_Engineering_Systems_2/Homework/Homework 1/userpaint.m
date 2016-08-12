%userpaint.m

%This program helps a user calculate the ammount of paint needed to paint
%a room with defined dimensions while accounting for gaps in the walls
%created by doors and windows.

%   Author: J. Patrick Lacher

%clear command window and variables
clear
clc

%% Get Room Measurements From User

name= input('What is your name: ','s');
clc

%the room
disp('Please input all measurements in feet.')
lr= input('What is the length of the room? ');
wr= input('What is the width of the room? ');
hr= input('What is the height of the room? ');
clc

%the windows
ww= input('What is the width of the windows? ');
hw= input('What is the height of the windows? ');
nw= input('How many windows are there? ');
clc

%the doors
wd= input('What is the width of the doors? ');
hd= input('What is the height of the doors? ');
nd= input('How many doors are there? ');
clc

%% Calculations

dimroom= (2*lr*hr)+(2*wr*hr)-(nw*ww*hw)-(nd*wd*hd); %ft^2 of wall space
paint= dimroom/400; %gallons of paint needed

%% Display Results

response= [name,', you will need ',num2str(paint),' gallons of paint to cover the walls you described'];
disp(response)