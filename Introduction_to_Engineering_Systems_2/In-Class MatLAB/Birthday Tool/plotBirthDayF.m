function plotBirthDayF(handles)

%Uses the birthDayProbability function to tabulate and plot the birthday
%match probabilities P(Npeople) for groups of size Npeople = [2:Nmax]

    %Author: J. Patrick Lacher

%Gets values from Birthday Tool
Nmax = str2double(handles.NmaxEdit.String);
Nsamples = str2double(handles.NsamplesEdit.String);

%Determines the probability for every size in the range of [2:Nmax] people.
h = waitbar(0,'Working...');
P = [];
for Npeople = 2:Nmax
    P(Npeople) = birthDayProbability(Npeople,Nsamples);
    waitbar(Npeople/Nmax,h);
end

%plots a bar graph of P
bar(handles.probabilityAxes,P,.6)
title(handles.probabilityAxes,'Same-Birthday Probability')
xlabel(handles,probabilityAxes,'N People')
ylabel(handles.probabilityAxes,'Probability')