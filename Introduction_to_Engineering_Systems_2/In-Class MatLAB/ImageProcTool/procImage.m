function procImage(handles)
%    read in RGB JPG image, convert to grayscale
%    and process with logistic function
%    adjust threshold and width

%% get  image
filename='MJS2.jpg';
Mimage=imread(filename);

%% convert to grayscale
M=rgb2gray(Mimage);

%%  original figure
% Send image to current figure, return the handle to the image object
% created by the imshow command. We tell MATLAB to fit the image to the
% current axes
imshow(M,'InitialMagnification','fit',handles.origAxes); 

%% set threshold and width
x0=handles.thresholdSlider.Value;
width=handles.widthSlider.Value;

%% define filter-function as logistic
% Here is a local function that is going to apply the logistic function
% it must be capable of sending in an array
logistic=@(x)  1./(1+ exp ( -(double(x)-x0)/width ));

%% tabulate and plot transfer function
% Create an array x
x=linspace(0,255,200);
% Create an array by calling the logistic function - scale it to 255
transferFunction=255*logistic(x);

% Here we plot the transfer function in a second figure
plot(handles.plotAxes,x,transferFunction);
xlabel(handles.plotAxes,'pixel input level')
ylabel(handles.plotAxes,'pixel output level')
axis([0 255 0 255]);
title(handles.plotAxes,'Transfer function')

%% transform image and plot
% Create a new image. We send in our grayscale image
% A new image is created based on the xo and width values we send in
MS=255*logistic(M); % Create a new image
% Now show the image
imshow(MS,'InitialMagnification','fit',handles.procAxes);

