% studentDataS2.m
% Creates a structured array of student information and then
% use some logic to sort students
% Fields: Name, Major, Graduation Year (or Class of)
% 
% Author: J. Patrick Lacher
% Section 2
% Lecture 10
% February 12, 2015

clear
clc

%% Set up Values

% Below are the first 6 entries in our array of structures

student(1).name = 'J. Bleck';
student(1).major = 'Electrical Engineering';
student(1).gradYear = 2018;

student(2).name = 'E. Mattel';
student(2).major = 'Electrical Engineering';
student(2).gradYear = 2017;

student(3).name = 'C. McQuinn';
student(3).major = 'Aerospace Engineering';
student(3).gradYear = 2016;

student(4).name = 'M. Williams';
student(4).major = 'Chemical Engineering';
student(4).gradYear = 2017;

student(5).name = 'K. Hargs';
student(5).major = 'Computer Science';
student(5).gradYear = 2018;

student(6).name = 'P. Falco';
student(6).major = 'Civil Engineering';
student(6).gradYear = 2017;

%% Add data here

% Add one or two more students here

student(7).name = 'J. Lacher';
student(7).major = 'Computer Science';
student(7).gradYear = 2018;

student(8).name = 'M. Seelinger';
student(8).major = 'Mechanical Engineering';
student(8).gradYear = 1994;

%% Display all student names with Grad Year = 2018

% Output all students graduating in a certain year

numStudents = length(student) %finds the length of the student array

for iLoop = 1:numStudents
    if student(iLoop).gradYear == 2018
        display([student(iLoop).name,' graduated in 2018.'])
    end
end
%% Display students with Grad Year = 2018 and major in Comp Science

for iLoop = 1:numStudents
    if student(iLoop).gradYear == 2018 && strcmp(student(iLoop).major,'Computer Science')
       display([student(iLoop).name,' graduated in 2018 with a degree in Computer Science'])
    end
end
%% Display all student initials

%opens an initial array "x"
x = '';

for iLoop = 1:numStudents
    x = [x,student(iLoop).name(1:2),student(iLoop).name(4),'. ; '];
end

display([x])