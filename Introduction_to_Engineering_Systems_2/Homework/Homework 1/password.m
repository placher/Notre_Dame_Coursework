%password.m

%The following program uses the full name of the user and a telephone
%number to generate a complex, 6-character password.

%   Author: J. Patrick Lacher

%% Clear Command Window and Variables

clc
clear

%% Get Name and Telephone Number from User

first= input('Please type your first name: ','s');
middle= input('Please type your middle initial: ','s');
last= input('Please type your last name: ','s');
phone= input('Please type your 10-digit phone number: ','s');

%clean command window
clc

%% Generate Password

pswrd= [lower(first(1)),phone(9),lower(last(1)),lower(middle(1)),phone(10),lower(last(2))];

%% Display New Passowrd

pswrd= ['Your new password is: ',pswrd];
disp(pswrd)