%EnergyCalcs.m

%Approximates the position of a baseball falling vertically with no
%horizontal motion.

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
v0 = 0; %ball is dropped from rest so velocity is 0 m/s
theta = 270; %ball falls down vertically, so angle is 270 degrees

%% set initial conditions

%initial position
y0 = 500;

%set initial velocity
vy0 = v0*sind(theta);

%% Initialize arrays

%set timestep
deltat = 0.01; %seconds
t(1) = 0; %time array
y(1) = y0; %y position array
vy(1) = vy0; %y velocity array

%FdragY Array
FdragY(1) = 0;

%% Set up a WHILE loop for the Verlet method

%set loop variable
it = 1;

%set up logical variable for WHILE loop condition
finished = false;

while ~finished
    %find the new time
    t(it+1) = t(it) + deltat;
    
    %Find the drag force as a vector
    Fdrag = (0.5*rho*Cd*(pi*R^2)*vy(it)^2);
        
    %Find the velocity in y at the time halfway between t(it+1) and
    %t(it)
    vhalfy = vy(it) + (-g + Fdrag/m)*0.5*deltat;
    
    %Use the vhalfy to find the new position in y
    y(it+1) = y(it) + vhalfy*deltat;
        
    %Find the drag force as a vector
    FdragY(it+1) = (0.5*rho*Cd*(pi*R^2)*vy(it)^2);
    
    %Find the velocity in y
    vy(it+1) = vhalfy + (-g + FdragY(it+1)/m)*0.5*deltat;
    
    % Check to see if we have hit the ground
    if y(it+1) <= 0
        % ball has hit the ground
        finished = true;
        Nt = it;
    end
   
    % remember to inrement it
    it = it + 1;   
end

%% Determine/Plot results

%Velocity vs. Time
plot(t,vy)
xlabel('t (s)');
ylabel('vy (m/s)');
title('Vertical Velocity vs. Time');

%Energy of Drag
Edrag(1) = 0; %Initial Drag Energy is 0 J
for x = 2:length(y)
Edrag(x) = trapz(y(1:x),FdragY(1:x)); %Drag Energy in J
end

%Energy vs. Time
KE = 0.5*m*vy.^2; %Kinetic Energy in J
PE = m*g*y; %Potential Energy in J
Etot = KE + PE + Edrag; %Total Energy in J

figure
plot(t,KE,'b',t,PE,'r',t,Etot,'g',t,Edrag,'k')
xlabel('t (s)');
ylabel('Energy (J)');
legend('Kinetic Energy','Potential Energy','Total Energy','Drag Energy');
title('Energy in the System as a Function of Time');

%Power Loss to Drag
Power = gradient(Edrag);

figure
plot(t,Power)
xlabel('t (s)')
ylabel('Power (W)')
title('Power Loss Due to Drag')