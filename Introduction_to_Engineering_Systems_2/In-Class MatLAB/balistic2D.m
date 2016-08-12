%balistic2D.m

%model ballistic motion with (vector) drag force is:

%F(drag) = -(1/2) * rho * Cd * A * (abs(v)^2) * vhat
        %where vhat is a unit vector in v direction
clear
clc

%% Set Parameters
Cd = 0.5; %Drag coefficent
R = 36e-3; %radius of baseball in m
m = 150e-3; %mass in kg
rho = 1.225; %density of air in kg/m^3
g = 9.81; %gravitational constant in m/s^2
v0 = 44; %initial speed in m/s
theta = 45; %launch angle in degrees

%% set initial conditions

%initial position
x0 = 0;
y0 = 0;

%set initial velocity
vx0 = v0*cosd(theta);
vy0 = v0*sind(theta);

%% Initialize arrays

%set timestep
deltat = 0.01; %seconds
t(1) = 0; %time array
x(1) = x0; %x position array
y(1) = y0; %y position array
vx(1) = vx0; %x velocity array
vy(1) = vy0; %y velocity array

%% Set up a WHILE loop for the Verlet method

%set loop variable
it = 1;

%set up logical variable for WHILE loop condition
finished = false;

while ~finished
    %find the new time
    t(it+1) = t(it) + deltat;
    
    %Find drag force in the x and y directions at the time halfway between
    %t(it+1) and t(it)
    vmag = sqrt(vx(it)^2 + vy(it)^2);
    
    %Find unit vector direction of the velocity -- array of length 2
    vhat = [vx(it),vy(it)]/vmag;
    
    %Find the drag force as a vector
    Fdrag = (-0.5*rho*Cd*(pi*R^2)*vmag^2)*vhat;
    
    %Find the x and y components of drag
    FdragX = Fdrag(1);
    FdragY = Fdrag(2);
    
    %Find the velocity in x and y at the time halfway between t(it+1) and
    %t(it)
    vhalfx = vx(it) + (FdragX/m)*0.5*deltat;
    vhalfy = vy(it) + (-g + FdragY/m)*0.5*deltat;
    
    %Use the vhalfx and vhalfy to find the new position in x and y
    x(it+1) = x(it) + vhalfx*deltat;
    y(it+1) = y(it) + vhalfy*deltat;
    
    %evalulate force and acceleration at the halfway time
    vmag = sqrt(vhalfx^2 + vhalfy^2);
    
    %Find the unit vector direction of the velocity 
    vhat = [vhalfx,vhalfy]/m;
    
    %Find the drag force as a vector
    Fdrag = (-0.5*rho*Cd*(pi*R^2)*vmag^2)*vhat;
    
    %Find the x and y components of drag
    Fdragx = Fdrag(1);
    Fdragy = Fdrag(2);
    
    %Find the velocity in x and y
    vx(it+1) = vhalfx + (FdragX/m)*0.5*deltat;
    vy(it+1) = vhalfy + (-g + FdragY/m)*0.5*deltat;
    
    % Check to see if we have hit the ground
    if y(it+1) <= 0
        % ball has hit the ground
        finished = true;
        Nt = it;
    end
   
    % remember to inrement it
    it = it + 1;   
end

% Find xmax and ymax
xmax = max(x); % finds the maximum x distance
ymax = max(y); % finds the maximum y distance

% Plot results
plot(x,y)
xlabel('x (m)');
ylabel('y (m)');
title(['Y(x) vs X for drag coefficient Cd = ',num2str(Cd)]);
axis([0 xmax+2 0 ymax+2]);

figure
plot(t,x,'b',t,y,'r')
xlabel('t (s)');
ylabel('Position (m)');
legend('x position','y position');
title(['Position vs time for drag coefficient Cd = ',num2str(Cd)]);

figure
plot(t,vx,'b',t,vy,'r')
xlabel('t (s)');
ylabel('Velocity (m)');
legend('x velocity','y velocity');
title(['Velocity vs time for drag coefficient Cd = ',num2str(Cd)]);
