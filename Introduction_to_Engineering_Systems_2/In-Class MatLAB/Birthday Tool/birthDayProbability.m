function Pbirthday = birthDayProbability(Npeople, Nsamples)

%Function returns the probability of at least two people having the same
%birthday in a group Npeople.

    %Author: J. Patrick Lacher

%Creates an array with random birthdays for Npeople and Nsamples number of
%tests.
for row = 1:Nsamples
    for column = 1:Npeople
        bdays(row,column) = randi(365);
    end
end

%Tests for matches within a given test.
Nmatches = 0;

for row = 1:Nsamples
    if vectorHasMatch(bdays(row,:))
        Nmatches = Nmatches + 1;
    end
end

%Returns the probability of having a match for sample size Nsamples
Pbirthday = Nmatches/Nsamples;