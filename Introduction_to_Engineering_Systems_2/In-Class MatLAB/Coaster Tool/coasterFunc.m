function [pos, vel] = coasterFunc(t, d)
% [pos, vel] = coasterFunc(t, d)
% coasterFunc calculates the y-position (pos in ft) and the
% y-velocity (vel in miles/hr) of a rider on a new rollar coaster.
% The value d, the damping factor, determines the 
% number and height of oscillations.

wn = 0.5;
wd = wn*sqrt(1 - d^2);
sigma = d*wn;
pos = 150*(1 - exp(-sigma*t).*(cos(wd*t) + (sigma/wd)*sin(wd*t)));
vel = 2000*(sigma*exp(-sigma*t).*((sigma^2/wd)*sin(wd*t)+wd*sin(wd*t)));