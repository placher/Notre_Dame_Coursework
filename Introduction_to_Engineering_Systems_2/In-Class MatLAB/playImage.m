%playImage.m

%Playing around with images

clear
clc

%set filename to open
filename = 'imgres.jpg';
myImage = imread(filename);

%% let's display the image
%open new figure
figure(1)
axis; %turn on the current axis
hax1 = gca; %refers to handle for axis 1 is gca: function that gets current axiis

%hgs is a structured variable that has  info about the image window
hgs = imshow(myImage,'InitialMagnification','fit');
%ensures hgs is a dominant window
hgs.Parent = hax1;
%turn off the axes so they are not visible
axis(hax1,'off');
%makes the image undistorted
axis(hax1,'image');

%% turn the image to grayscale
grayImage = rgb2gray(myImage);

%open new figure
figure(2)
axis; %turn on the current axis
hax2 = gca; %refers to handle for axis 1 is gca: function that gets current axiis

%hgs is a structured variable that has  info about the image window
hgs2 = imshow(grayImage,'InitialMagnification','fit');
%ensures hgs is a dominant window
hgs2.Parent = hax2;
%turn off the axes so they are not visible
axis(hax2,'off');
%makes the image undistorted
axis(hax2,'image');

%% create negative image
for ix = 1:220
    for iy = 1:229
        negImage(iy,ix) = 255 - grayImage(iy,ix);
    end
end

%open new figure
figure(3)
axis; %turn on the current axis
hax3 = gca; %refers to handle for axis 1 is gca: function that gets current axiis

%hgs is a structured variable that has  info about the image window
hgs3 = imshow(negImage,'InitialMagnification','fit');
%ensures hgs is a dominant window
hgs3.Parent = hax3;
%turn off the axes so they are not visible
axis(hax3,'off');
%makes the image undistorted
axis(hax3,'image');

%% create binary image
for ix = 1:220
    for iy = 1:229
        if grayImage(iy,ix) >= 150
            binaryImage(iy,ix) = 255;
        elseif grayImage(iy,ix) < 150
            binaryImage(iy,ix) = 0;
        end
    end
end

%open new figure
figure(4)
axis; %turn on the current axis
hax4 = gca; %refers to handle for axis 1 is gca: function that gets current axiis

%hgs is a structured variable that has  info about the image window
hgs4 = imshow(binaryImage,'InitialMagnification','fit');
%ensures hgs is a dominant window
hgs4.Parent = hax4;
%turn off the axes so they are not visible
axis(hax4,'off');
%makes the image undistorted
axis(hax4,'image');