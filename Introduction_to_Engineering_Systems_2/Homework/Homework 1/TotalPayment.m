%TotalPayment.m

%This program calculates the total payments due on a loan and interest accrued 
%over a user-defined period of time given provided principal loan values and 
%the annual interest rate according to the equation 
%P=(L*c*(1+c)^n)/(((1+c)^n)-1)

%   Author: J. Patrick Lacher

%% Clear Command Window and Defined Variables

clc
clear

%% Get Inputs from User

%user defined values
L1= input('Please input the value of the initial loan $');
n1= input('Please input the length of the loan in months ');
c1= input('Please input the annual interest rate on the loan as a percentage ');

%convert annual interest rate to monthly interest rate for use in the
%equation
c1= c1/12;

%% Calculation

P1= (L1*c1*(1+c1)^n1)/(((1+c1)^n1)-1);

%% Display Results

%clear command window
clc

%total ammount due is the initial loan plus the interest accrued over the
%defined time
Ans1= L1+P1;
Ans1= ['The total due to pay off the loan is $',num2str(Ans1)];
disp(Ans1)

%% Assignment Answer

%The total due to pay off the loan is $14666.67