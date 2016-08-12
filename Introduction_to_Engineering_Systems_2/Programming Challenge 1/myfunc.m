function y = myfunc(x)

%evaluates the equation y(x) = cos(x) * cos(2x)
    %Author: J. Patrick Lacher
    
tvar1 = cos(x);
tvar2 = cos(2*x);

%test for vector value
if length(tvar1) > 1
    for it = 1:length(tvar1)
        y(it) = tvar1(it)*tvar2(it);
    end
else
    y = tvar1*tvar2;
end
end