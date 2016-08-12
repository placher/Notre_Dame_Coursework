function MultiWalkerF(handles)

% Simulates the motion of many random walkers in a square defined by 
% x=[0, 1], y=[0, 1].

% Author: J. Patrick Lacher
% EG10112 Section 2 Group 5

%% Set Parameters

Nw = str2double(handles.NwText.String); %number of walkers (from 5-500)
Ns = str2double(handles.NsText.String); %number of steps for each walker (up to 2000)
r = handles.rSlider.Value; %length of each step (0.01 or 0.02)
x = handles.x0Slider.Value; %initial position of each walker (0, 0.5, or 1)
y = handles.y0Slider.Value; %initial position of each walker (0, 0.5, or 1)

%% Determine Positions of Walkers and Plot for Any Given Step
for it = 1:Ns
    
    %finds the position of all the walkers
    theta = 2*pi*rand(Nw,1);
    x = x + r*cos(theta);
    y = y + r*sin(theta);
    
    %forces the walkers to remain within the bounds of the field
    x(x>1)=1;
    x(x<0)=0;
    y(y>1)=1;
    y(y<0)=0;
    
    % calculate the mean value and standard deviation of x
    meanvalue(it) = mean(x);
    deviation(it) = std(x);
    steps = linspace(1,it,length(meanvalue));
    
    plot(handles.plotAxes,x,y,'.')
    title(handles.plotAxes,'Walker Position')
    hist(handles.histAxes,x,20)
    title(handles.histAxes,'Histogram of X-Coordinates')
    plot(handles.meanAxes,steps,meanvalue,'b',steps,deviation,'r')
    title(handles.meanAxes,'Mean Value and Standard Deviation vs. Steps Taken')
    drawnow
    pause(.15)
end