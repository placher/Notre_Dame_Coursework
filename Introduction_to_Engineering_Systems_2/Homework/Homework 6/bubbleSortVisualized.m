function vout = bubbleSortVisualized(v)
%This function sorts the elements of a vector so they are sequentially
%increasing in magnitude, printing the vector after each change so the
%process can be visualized.
%Author: J. Patrick Lacher

n = length(v);
disp(v)
while (n > 0)
    n2 = 0;
    for i = 2:n
        if (v(i) < v(i - 1))
            tvar = v(i);
            v(i) = v(i-1);
            v(i-1) = tvar;
            n2 = i;
            disp(v)
            pause(1)
        end
    end
    n = n2;
end
vout = v;