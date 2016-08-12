%randomwalk.m

% This program computes then graphs and animates the path of a random walk.

%   Author: J. Patrick Lacher

clear
clc

%% Define Starting Values

%total number of steps taken
nwalk = 500;

%walk starts at the origin
xwalk(1) = 0;
ywalk(1) = 0;
stride = 1;

%% Walk Values

for it1 = 2:nwalk
    direction = randi([0,360]);
    xwalk(it1) = xwalk(it1-1)+stride*cosd(direction);
    ywalk(it1) = ywalk(it1-1)+stride*sind(direction);
end

%% Plot Walk

for it2 = 1:nwalk
        plot(xwalk(it2),ywalk(it2),'ro',...
            xwalk(1:it2),ywalk(1:it2),'b');
        axis([1.1*min(xwalk) 1.1*max(xwalk) 1.1*min(ywalk) 1.1*max(ywalk)]);
        grid on
        drawnow
        pause(.00025)
end