%openClasses.m

%This program takes a list of theoretical classes and creates a list of
%courses in which a study group of 5 could enroll together.

    %Author: J. Patrick Lacher
    
clear
clc

%% Create Classes Array

class(1).title = 'Introduction to Engineering';
class(1).number = 10111;
class(1).seats = [45,32];

class(2).title = 'Computers in Psychology';
class(2).number = 20000;
class(2).seats = [28,25];

class(3).title = 'Writing and Rhetoric';
class(3).number = 12100;
class(3).seats = [14,14];

class(4).title = 'Begining Spanish';
class(4).number = 10101;
class(4).seats = [19,13];

class(5).title = 'Introduction to Africana Studies';
class(5).number = 20082;
class(5).seats = [36,32];

%% Find Classes With At Least 5 Openings

possibleclasses = 0;

for t = 1:5
    tarray = class(t).seats;
    openseats = tarray(1) - tarray(2);
    if openseats >= 5
        disp(class(t).title)
    end
end
        