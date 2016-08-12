%quadFunc.m

%This function computes the roots of a quadratic function with coefficents
%a, b, and c and determines the type of roots found.

%   Author: J. Patrick Lacher

function [x1,x2,rootDesc] = quadFunc(a,b,c)
discriminant = ((b^2)-(4*a*c));
x1 = ((-b-sqrt(discriminant))/(2*a));
x2 = ((-b+sqrt(discriminant))/(2*a));
if discriminant < 0
    rootDesc = 'Imaginary Roots';
elseif discriminant > 0
    rootDesc = '2 Real Roots';
elseif discriminant == 0
    rootDesc = 'Equal Roots';
else
    rootDesc = '';
end
end