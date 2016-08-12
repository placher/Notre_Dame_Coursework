function vout = bubbleSort(v)
%This function sorts the elements of a vector so they are sequentially
%increasing in magnitude.
%Author: J. Patrick Lacher

n = length(v);
while (n > 0)
    n2 = 0;
    for i = 2:n
        if (v(i) < v(i - 1))
            tvar = v(i);
            v(i) = v(i-1);
            v(i-1) = tvar;
            n2 = i;
        end
    end
    n = n2;
end
vout = v;