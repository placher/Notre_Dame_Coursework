%TakeOrder2.m

%This program takes a user's order for a number of different thurgins and
%reports back to the user a recept of order and an expected order cost.

%   Author: J. Patrick Lacher

%clear command window and variables
clc
clear

%%  Greet User

name= input('What is your name: ','s');
greeting= ['Hello, ',name,'. We have a variety of thurgins for you to choose from today.'];
disp(greeting)
disp('')

%% Order Input

nur= input('How many nurvels would you like? ');
tom= input('How many tombits? ');
wee= input('How many weenives? ');

%% Price Calculation

price= (.55*nur)+(.45*tom)+(1.23*wee);

%% Order Confirmation

clc
order= ['You have ordered ',num2str(nur),' nurvels, ',num2str(tom),' tombits, and ',num2str(wee),' weenives.'];
cost= ['This will cost $',num2str(price)];
thankyou= ['Thank you for your order ',name];

%display recipt
disp(order)
disp(cost)
disp(thankyou)