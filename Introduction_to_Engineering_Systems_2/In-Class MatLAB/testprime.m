%testprime.m

%The following program creates a 5*5 array of intergers between 1-100 and
%tests a user-specified member of the array to determine if it is a prime
%number

%   Author: J. Patrick Lacher

clear
clc

%% Generate Array

randArray= randi(100,5);

%% Ask User for Member of Array

disp('Please indicate a member of the 5*5 array')
column= input('What column? ');
row= input('What row? ');

%% Determine if Number is Prime

tvar1= isprime(randArray);

%% Output Results

if tvar1(row,column)== 1
    Ans1= ['The (',num2str(row),',',num2str(column),') element is ',num2str(randArray(row,column)),', which is prime.'];
else
    Ans1= ['The (',num2str(row),',',num2str(column),') element is ',num2str(randArray(row,column)),', which is not prime.'];
end

disp(Ans1)
