%findprimes.m

%This program generates a 5*4 array of random intergers and then tests them
%to determine which, if any are prime numbers.

%   Author: J. Patrick Lacher

clear
clc

%% Generate the Random Numbers

numrows = 5;
numcol = 4;

%generate array
myarray = randi([1,50],numrows,numcol);

%% test for primes
n = 1;
for iRow=1:numrows
    for iCol=1:numcol
        if isprime(myarray(iRow,iCol))
            primeVector(n) = myarray(iRow,iCol);
            n = n+1;
        end
    end
end

%% Display Prime Numbers

disp(['These prime numbers were found in the random array: '])
disp([num2str(primeVector)])