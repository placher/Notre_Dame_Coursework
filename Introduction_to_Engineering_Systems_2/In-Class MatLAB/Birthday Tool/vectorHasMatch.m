function bMatch = vectorHasMatch(x)
% Function tests entry in vector x for at least one repeated value

    %Author: J. Patrick Lacher

bMatch = false;

% find the length of the x array
vectLength = length(x);

% Sort the array
xSorted = sort(x);

if (vectLength > 1)
    % Check for matches
    % Create a loop variable
    iLoop = 2;
    while (~bMatch) && (iLoop < vectLength)
        if(xSorted(iLoop) == xSorted(iLoop - 1))
            % true when match found
            bMatch = true;
        end
        % increment the loop counter
        iLoop = iLoop + 1;
    end
end


