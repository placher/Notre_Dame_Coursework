%countemF.m

%This function creates a string of "N" consecutive intergers begining with
%"N0".

%   Author: J. Patrick Lacher

function numstr = countemF(N,N0)

numstr = '';

for i = 0:(N-1)
    tvar = N0 + i;
    if i ~= (N-1)
        numstr = [numstr,num2str(tvar),', '];
    else
        numstr = [numstr,num2str(tvar)];
    end
end
end