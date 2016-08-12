%progChallenge.m

    %Author: J. Patrick Lacher
    
clear
clc

%% Challenge 2- Calling the Function

myV = 4.3;
y1 = myfunc(myV);
disp(['For x = ',num2str(myV),', myfunc yields the result: ',num2str(y1)])

if y1 > 0
    disp('The value of y1 is positive')
elseif y1 == 0
    disp('The value of y1 is 0')
else
    disp('The value of y1 is negative')
end

%% Challenge 3- Arrays and Vectors

A = zeros(25,50);

for i = 1:25
    for j = 1:50
        if isprime(i+j)
            A(i,j) = 100;
        elseif i*j == 50
            A(i,j) = 10;
        else
            A(i,j) = ((2*i)+(4*j));
        end
    end
end

%% Challenge 4- WHILE Loops and Logic

for column = 1:250
    xVals(1,column) = rand;
end

%counts the number of values in the sum
count = 1;
%initializes xSum
xSum = 0;

while xSum < 100
    if xVals(1,count) < 0.005
        break
    end
    if count > 250
        break
    end
    xSum = xSum + xVals(1,count);
    count = count + 1;
end

disp (['The final sum includes ',num2str(count),' entries.'])

%% Challenge 5- Plotting

Nx = input('How many points would you like to plot? ');
myX = linspace(0,2*pi,Nx);
myY = myfunc(myX);

plot(myX,myY)
xlabel('x')
ylabel('y')
title('myfunc.m Function')

%% Challenge 6- Animation

figure
for t = 1:length(myX)
    plot(myX(t),myY(t),'ro',myX(1:t),myY(1:t),'b')
    xlabel('x')
    ylabel('y')
    title('myfunc.m Animation')
    axis([0 2*pi -1.1 1.1])
    drawnow
end