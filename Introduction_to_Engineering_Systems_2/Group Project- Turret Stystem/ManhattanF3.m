function ManhattanF3(handles)
% Section 2, Group 5
% Will Bottema, Julia DeSanctis, Thomas Hellios, Patrick Lacher, Rachael Shey

% Function that calculates the initial velocity of launcher 1, determines 
% if there are a pair of horizontal angles for launcher 1 and 2 that will 
% result in a collision and animates a plot of x vs y vs z for the projected 
% path of tennis balls launched from launcher 1 and 2

% The function models ballistic motion with (vector) drag force as:
%
%     Fdrag= -(1/2) rho Cd A |v|^2 vhat 
%                  where  vhat is unit vector in v direction
   
%% Velocity Calculator 
% Takes a given force and returns a velocity of the projectile struck by this 
% force after a given distance. 

% Get force from GUI

if handles.L1fButton1.Value==1;
        F0 = 2.33; % in N
        % This force was calculated using F=kx=25.84*0.09
elseif handles.L1fButton2.Value==1; 
        F0 = 2.84; % in N
        % This force was calculated using F=kx=25.84*0.11
elseif handles.L1fButton3.Value==1; 
        F0 = 3.36; % in N
        % This force was calculated using F=kx=25.84*0.13
end 

% Set parameters

m = 0.0589; % Mass of tennis ball in kg
v0 = 0; % Set initial velocity to zero
x = 0.26; % Length of Barrel in meters  

% Calculate the acceleration

a1 = F0/m; % Calculates acceleration using newtons 2nd law

% Calculate velocity of projectile leaving barrel 
% Vf^2 = Vi^2 +2aX

Vs = 2*a1*x; % Squared final velocity 
v10=sqrt(Vs); % Final Velocity of object leaving barrel 

%% Horizontal Angle Calculator

% Calculates the horizontal angle for launcher 1 and 2 that will result in a
% collision 
  

collision=0;

htheta1=zeros(1,181); % horizontal theta for launcher 1 in vector form
htheta2=zeros(1,181); % horizontal theta for launcher 2 in vector form


for phi1=1:51
    for phi2=1:51
        
        htheta1(phi1)=(phi1-1)-10; % calculates if collision for horizontal angles -10 through 10 for launcher 2
        htheta2(phi2)=(phi2-1)-10; % calculates if collision for horizontal angles -10 through 10 for launcher 2
        %% Set parameters
        Cd = 0.3; % Drag coefficient
        R = .0654; % radius of racquetball in m
        m = .0589; % mass of racquetball in kg
        rho = 1.225; % density of air in kg/m^3
        g = 9.81; % gravitational constant in m/s^2
        
        %% set initial conditions for Launcher 1
        % launch angle in degrees
        theta1=handles.L1vAngleSlider.Value;
        
        % set inital position
        x10=0;
        y10=0;
        z10=0;
        
        % set inital velocity
        vy10 = v10*cosd(theta1)*cosd(htheta1(phi1));
        vx10 = v10*cosd(theta1)*sind(htheta1(phi1));
        vz10 = v10*sind(theta1);
        
        %% set initial conditions for Launcher 2
        % Set initial position
        x20=handles.xSlider.Value;
        y20=handles.ySlider.Value;
        z20=0;
        
        % Set initial velocity
        xspring2=.11; % distance the spring is pulled back in m
        k=25.84; % spring constant in N/m
        Fspring2=xspring2*k; % force of spring
        a2=Fspring2/m; % initial acceleration
        barrel=.26; % length of barrel
        v20=sqrt(2*a2*barrel); % initial speed in m/s
        
        % set inital velocity
        theta2=40; % vertical angle for launcher 2
        vx20 = -(v20*cosd(theta2)*cosd(htheta2(phi2)));
        vz20 = v20*sind(theta2);
        vy20 = v20*sind(theta2)*sind(htheta2(phi2));
        
        %% Initialize my arrays
        % set the timestep
        deltat = 0.006; % seconds
        t(1) = 0; % time array
        % Launcher 1
        x1(1) = x10; % x position array for launcher 1
        y1(1) = y10; % y position array for launcher 1
        z1(1) = z10; % z position array for launcher 1
        vy1(1) = vy10; % y velocity for launcher 1
        vx1(1) = vx10; % x velocity for launcher 1
        vz1(1) = vz10; % z velocity for launcher 1
        % Launcher 2
        x2(1)=x20;
        y2(1)=y20;
        z2(1)=z20;
        vx2(1)=vx20; % x velocity
        vz2(1)=vz20; % z velocity
        vy2(1)=vy20; % y velocity
        
        %% set up a while loop to do the verlet method
        % set up the loop variable
        it = 1;
        % set up a logical variable for the while loop condition
        finished = false;
        
        while ~finished
            % find the new time
            t(it+1) = t(it) + deltat;
            
            % Launcher 1
            % Find the drag force in the x and y directions at the inital time
            vmag1 = sqrt(vy1(it)^2 + vz1(it)^2 + vx1(it)^2);
            % Find unit vector direction of the velocity -- array of length 2
            vhat1 = [vy1(it),vz1(it),vx1(it)]/vmag1;
            % Find the drag force as a vector
            Fdrag1 = (-0.5*rho*Cd*(pi*R^2)*vmag1^2)*vhat1;
            % Find the y component of the drag force
            Fdrag1Y = Fdrag1(1);
            % Find the z component of the drag force
            Fdrag1Z = Fdrag1(2);
            % Find the x component of the drag force
            Fdrag1X = Fdrag1(3);
            
            % Find the velocity in y and z and x at the time halfway between t(it+1) and
            % t(it)
            vhalfy1 = vy1(it) + (Fdrag1Y/m)*0.5*deltat;
            vhalfx1 = vx1(it) + (Fdrag1X/m)*0.5*deltat;
            vhalfz1 = vz1(it) + (-g + Fdrag1Z/m)*0.5*deltat;
            
            % use the vhalfy, vhalfx and vhalfz to find the new position in y, x and z
            y1(it+1) = y1(it) + vhalfy1*deltat;
            x1(it+1) = x1(it) + vhalfx1*deltat;
            z1(it+1) = z1(it) + vhalfz1*deltat;
            
            % evaluate the force and acceleration at the halfway time
            vmag1 = sqrt(vhalfy1^2 + vhalfz1^2 + vhalfx1^2);
            % Find unit vector direction of the velocity -- array of length 2
            vhat1 = [vhalfy1,vhalfz1,vhalfx1]/vmag1;
            % Find the drag force as a vector
            Fdrag1 = (-0.5*rho*Cd*(pi*R^2)*vmag1^2)*vhat1;
            % Find the y component of the drag force
            Fdrag1Y = Fdrag1(1);
            % Find the z component of the drag force
            Fdrag1Z = Fdrag1(2);
            % Find the x component of the drag force
            Fdrag1X = Fdrag1(3);
            
            % Find the velocity in y and z at the time halfway between t(it+1) and
            % t(it)
            vy1(it+1) = vhalfy1 + (Fdrag1Y/m)*0.5*deltat;
            vx1(it+1) = vhalfx1 + (Fdrag1X/m)*0.5*deltat;
            vz1(it+1) = vhalfz1 + (-g + Fdrag1Z/m)*0.5*deltat;
            
            % Launcher 2
            % Find the drag force in the x and z and y directions at the inital time
            vmag2 = sqrt(vx2(it)^2 + vy2(it)^2 + vz2(it)^2);
            % Find unit vector direction of the velocity -- array of length 2
            vhat2 = [vx2(it),vz2(it),vy2(it)]/vmag2;
            % Find the drag force as a vector
            Fdrag2 = (-0.5*rho*Cd*(pi*R^2)*vmag2^2)*vhat2;
            % Find the x component of the drag force
            Fdrag2X = Fdrag2(1);
            % Find the z component of the drag force
            Fdrag2Z = Fdrag2(2);
            % Find the y component of the drag force
            Fdrag2Y = Fdrag2(3);
            
            % Find the velocity in x and y and z at the time halfway between t(it+1) and
            % t(it)
            vhalfx2 = vx2(it) + (Fdrag2X/m)*0.5*deltat;
            vhalfz2 = vz2(it) + (-g + Fdrag2Z/m)*0.5*deltat;
            vhalfy2 = vy2(it) + (Fdrag2Y/m)*.5*deltat;
            
            % use the vhalfx and vhalfz to find the new position in x and y and z
            x2(it+1) = (x2(it) + vhalfx2*deltat);
            z2(it+1) = z2(it) + vhalfz2*deltat;
            y2(it+1) = (y2(it)+ vhalfy2*deltat);
            
            % evaluate the force and acceleration at the halfway time
            vmag2 = sqrt(vhalfx2^2 + vhalfz2^2 + vhalfy2^2);
            % Find unit vector direction of the velocity -- array of length 2
            vhat2 = [vhalfx2,vhalfz2,vhalfy2]/vmag2;
            % Find the drag force as a vector
            Fdrag2 = (-0.5*rho*Cd*(pi*R^2)*vmag2^2)*vhat2;
            % Find the x component of the drag force
            Fdrag2X = Fdrag2(1);
            % Find the z component of the drag force
            Fdrag2Z = Fdrag2(2);
            % Find the y component of the drag force
            Fdrag2Y = Fdrag2(3);
            
            % Find the velocity in x and y and z at the time halfway between t(it+1) and
            % t(it)
            vx2(it+1) = vhalfx2 + (Fdrag2X/m)*0.5*deltat;
            vz2(it+1) = vhalfz2 + (-g + Fdrag2Z/m)*0.5*deltat;
            vy2(it+1) = vhalfy2 + (Fdrag2Y/m)*0.5*deltat;
            
            % Check to see if we have hit ground
            if z1(it+1) <= 0
                % ball has hit the ground
                finished = true;
                Nt = it;
            end
            
            % increment it
            it = it + 1;
            
        end
        % Make constant variable a vector
        x1(it)=x10+(y1(it)*tand(htheta1(phi1))); % x direction for Launcher 1
        y2(it)=y20+(x20-x2(it))*tand(htheta2(phi2)); % y direction for Launcher 2
        
        
        %% Determine if there is a collision and if so, find x,y,z position and horizontal angle of collision
        for it=1:length(t)
            if abs(x1(it)-x2(it))<=0.1 && abs(y1(it)-y2(it))<=0.1 && abs(z1(it)-z2(it))<=0.1
                collision=collision+1;
                xdiff(collision)=abs(x1(it)-x2(it));
                Atheta1(collision)=htheta1(phi1);
                Atheta2(collision)=htheta2(phi2);
            end
        end
    end
end

if collision==0;
    phiL1=0;
    phiL2=9;
    handles.L1hAngleText.String=('--');
    handles.L2hAngleText.String=('--');
else
    % Determine the best collision and display angles
    xdiffmin=min(xdiff);
    for icol=1:length(xdiff)
        if xdiff(icol)==xdiffmin;
            phiL1=Atheta1(icol);
            phiL2=Atheta2(icol);
            set(handles.L1hAngleText,'String',num2str(phiL1))
            set(handles.L2hAngleText,'String',num2str(phiL2))
        end
    end
end


%% Set parameters
Cd = 0.3; % Drag coefficient
R = .0654; % radius of racquetball in m
m = .0589; % mass of racquetball in kg
rho = 1.225; % density of air in kg/m^3
g = 9.81; % gravitational constant in m/s^2


%% Set initial conditions for Launcher 1
% launch angle in degrees
theta1 = handles.L1vAngleSlider.Value; % vertical
htheta1 =phiL1; % horizontal

% set inital position
x10=0;
y10=0;
z10=0;

% set inital velocity
vy10 = v10*cosd(theta1)*cosd(htheta1);
vx10 = v10*cosd(theta1)*sind(htheta1);
vz10 = v10*sind(theta1);

%% Set initial conditions for Launcher 2
% Set initial position
x20=handles.xSlider.Value;
y20=handles.ySlider.Value;
z20=0;

% Set initial velocity
xspring2=.11; % distance the spring is pulled back in m
k=25.84; % spring constant in N/m
Fspring2=xspring2*k; % force of spring
a2=Fspring2/m; % initial acceleration
barrel=.26; % length of barrel
v20=sqrt(2*a2*barrel); % initial speed in m/s

% set inital velocity
theta2=40; % vertical angle for launcher 2
htheta2=phiL2; % calculate horizontal theta for launcher 2
vx20 = -(v20*cosd(theta2)*cosd(htheta2));
vz20 = v20*sind(theta2);
vy20 = v20*cosd(theta2)*sind(htheta2);

%% Initialize my arrays
% set the timestep
deltat = 0.006; % seconds
t(1) = 0; % time array
% Launcher 1
x1(1) = x10; % x position array for launcher 1
y1(1) = y10; % y position array for launcher 1
z1(1) = z10; % z position array for launcher 1
vy1(1) = vy10; % y velocity for launcher 1
vx1(1) = vx10; % x velocity for launcher 1
vz1(1) = vz10; % z velocity for launcher 1
% Launcher 2
x2(1)=x20;
y2(1)=y20;
z2(1)=z20;
vx2(1)=vx20; % x velocity 
vz2(1)=vz20; % z velocity
vy2(1)=vy20; % y velocity

%% set up a while loop to do the verlet method
% set up the loop variable
it = 1;
% set up a logical variable for the while loop condition
finished = false;

while ~finished
   % find the new time
   t(it+1) = t(it) + deltat;
   
   % Launcher 1
   % Find the drag force in the x and y directions at the inital time
   vmag1 = sqrt(vy1(it)^2 + vz1(it)^2 + vx1(it)^2);
   % Find unit vector direction of the velocity -- array of length 2
   vhat1 = [vy1(it),vz1(it),vx1(it)]/vmag1;
   % Find the drag force as a vector
   Fdrag1 = (-0.5*rho*Cd*(pi*R^2)*vmag1^2)*vhat1;
   % Find the y component of the drag force
   Fdrag1Y = Fdrag1(1);
   % Find the z component of the drag force
   Fdrag1Z = Fdrag1(2);
   % Find the x component of the drag force
   Fdrag1X = Fdrag1(3);
   
   % Find the velocity in y and z and x at the time halfway between t(it+1) and
   % t(it)
   vhalfy1 = vy1(it) + (Fdrag1Y/m)*0.5*deltat;
   vhalfx1 = vx1(it) + (Fdrag1X/m)*0.5*deltat;
   vhalfz1 = vz1(it) + (-g + Fdrag1Z/m)*0.5*deltat;
   
   % use the vhalfy, vhalfx and vhalfz to find the new position in y, x and z
   y1(it+1) = y1(it) + vhalfy1*deltat;
   x1(it+1) = x1(it) + vhalfx1*deltat;
   z1(it+1) = z1(it) + vhalfz1*deltat;
   
   % evaluate the force and acceleration at the halfway time
   vmag1 = sqrt(vhalfy1^2 + vhalfz1^2 + vhalfx1^2);
   % Find unit vector direction of the velocity -- array of length 2
   vhat1 = [vhalfy1,vhalfz1,vhalfx1]/vmag1;
   % Find the drag force as a vector
   Fdrag1 = (-0.5*rho*Cd*(pi*R^2)*vmag1^2)*vhat1;
   % Find the y component of the drag force
   Fdrag1Y = Fdrag1(1);
   % Find the z component of the drag force
   Fdrag1Z = Fdrag1(2);
   % Find the x component of the drag force
   Fdrag1X = Fdrag1(3);
   
   % Find the velocity in y and z at the time halfway between t(it+1) and
   % t(it)
   vy1(it+1) = vhalfy1 + (Fdrag1Y/m)*0.5*deltat;
   vx1(it+1) = vhalfx1 + (Fdrag1X/m)*0.5*deltat;
   vz1(it+1) = vhalfz1 + (-g + Fdrag1Z/m)*0.5*deltat;
   
   % Launcher 2
   % Find the drag force in the x and z and y directions at the inital time
   vmag2 = sqrt(vx2(it)^2 + vy2(it)^2 + vz2(it)^2);
   % Find unit vector direction of the velocity -- array of length 2
   vhat2 = [vx2(it),vz2(it),vy2(it)]/vmag2;
   % Find the drag force as a vector
   Fdrag2 = (-0.5*rho*Cd*(pi*R^2)*vmag2^2)*vhat2;
   % Find the x component of the drag force
   Fdrag2X = Fdrag2(1);
   % Find the z component of the drag force
   Fdrag2Z = Fdrag2(2);
   % Find the y component of the drag force
   Fdrag2Y = Fdrag2(3);
   
   % Find the velocity in x and y and z at the time halfway between t(it+1) and
   % t(it)
   vhalfx2 = vx2(it) + (Fdrag2X/m)*0.5*deltat;
   vhalfz2 = vz2(it) + (-g + Fdrag2Z/m)*0.5*deltat;
   vhalfy2 = vy2(it) + (Fdrag2Y/m)*.5*deltat;
   
   % use the vhalfx and vhalfz to find the new position in x and y and z
   x2(it+1) = (x2(it) + vhalfx2*deltat);
   z2(it+1) = z2(it) + vhalfz2*deltat;
   y2(it+1) = (y2(it)+ vhalfy2*deltat);
   
   % evaluate the force and acceleration at the halfway time
   vmag2 = sqrt(vhalfx2^2 + vhalfz2^2 + vhalfy2^2);
   % Find unit vector direction of the velocity -- array of length 2
   vhat2 = [vhalfx2,vhalfz2,vhalfy2]/vmag2;
   % Find the drag force as a vector
   Fdrag2 = (-0.5*rho*Cd*(pi*R^2)*vmag2^2)*vhat2;
   % Find the x component of the drag force
   Fdrag2X = Fdrag2(1);
   % Find the z component of the drag force
   Fdrag2Z = Fdrag2(2);
   % Find the y component of the drag force
   Fdrag2Y = Fdrag2(3);
   
   % Find the velocity in x and y and z at the time halfway between t(it+1) and
   % t(it)
   vx2(it+1) = vhalfx2 + (Fdrag2X/m)*0.5*deltat;
   vz2(it+1) = vhalfz2 + (-g + Fdrag2Z/m)*0.5*deltat;
   vy2(it+1) = vhalfy2 + (Fdrag2Y/m)*0.5*deltat;
   
   % Check to see if we have hit ground
   if z1(it+1) <= 0
       % ball has hit the ground
       finished = true;
       Nt = it;
   end 
   
   % increment it
   it = it + 1; 
   
 
   % Make constant variable a vector
   x1(it)=x10+(y1(it)*tand(htheta1)); % x direction for Launcher 1
   y2(it)=y20+(x20-x2(it))*tand(htheta2); % y direction for Launcher 2
   
   % Find xmax, ymax and zmax for launcher 1
   ymax1 = max(y1); % finds the maximum y distance
   xmax1 = max(x1); % finds the maximum x distance
   zmax1 = max(z1); % finds the maximum z distance
   
   % Find xmax, ymax and zmax for launcher 2
   xmax2 = max(x2); % finds the maximum x distance
   ymax2 = max(y2); % finds the maximum y distance
   zmax2 = max(z2); % finds the maximum z distance
   
   % Find xmin and ymin for launcher 1
   ymin1 = min(y1); % finds the minimum y distance
   xmin1 = min(x1); % finds the minimum x distance
   
   % Find xmin and ymin for launcher 2
   xmin2 = min(x2); % finds the minimum x distance
   ymin2 = min(y2); % finds the minimum y distance
   
   % find x max
   if xmax1>=xmax2
       xmax=xmax1;
   else
       xmax=xmax2;
   end
   
   % find y max
   if ymax1>=ymax2
       ymax=ymax1;
   else
       ymax=ymax2;
   end
   
   % find z max
   if zmax1>=zmax2
       zmax=zmax1;
   else
       zmax=zmax2;
   end
   
   
   % find x min
   if xmin1<=xmin2
       xmin=xmin1;
   else
       xmin=xmin2;
   end
   
   % find y min
   if ymin1<=ymin2
       ymin=ymin1;
   else
       ymin=ymin2;
   end
   
   % find z min
   zmin=0;
   
   
end

% plot position of lauchers
plot(handles.imageAxes,x10,y10,'ro',[x10,x1(Nt)],[y10,y1(Nt)],'r--',x20,y20,'ko',[x20,x2(Nt)],[y20,y2(Nt)],'k--')
grid(handles.imageAxes,'on')
axis(handles.imageAxes,[-2 5 -1 6]);
xlabel(handles.imageAxes,'x (m)');
ylabel(handles.imageAxes,'y (m)');
title(handles.imageAxes,'Top View');


%% Plot animation, determine if there is a collision and if so, find x,y,z position of collision
numcollide=0;
tol=.11;
for it=1:length(t)
    if abs(x1(it)-x2(it))<=tol && abs(y1(it)-y2(it))<=tol && abs(z1(it)-z2(it))<=tol
        numcollide=numcollide+1;
        if numcollide==1;
            set(handles.ximpactText,'String',num2str(x1(it)))
            set(handles.yimpactText,'String',num2str(y1(it)))
            set(handles.zimpactText,'string',num2str(z1(it)))
            handles.collisionText.String=('Yes');
        end
    end
    % Plot animation
    plot3(handles.launchAxes,x1(1:it),y1(1:it),z1(1:it),'-r',...
        x2(1:it),y2(1:it),z1(1:it),'-k')
    xlabel(handles.launchAxes,'x (m)');
    ylabel(handles.launchAxes,'y (m)');
    zlabel(handles.launchAxes,'z (m)');
    title(handles.launchAxes,'3D Plot');
    legend(handles.launchAxes,'Launcher 1','Launcher 2')
    axis([xmin-1 xmax+1 ymin-1 ymax+1 zmin zmax])
    grid on
    drawnow
    if numcollide==1;
        break
    end
end
if numcollide==0;
    handles.collisionText.String=('No');
    handles.ximpactText.String=('--');
    handles.yimpactText.String=('--');
    handles.zimpactText.String=('--');
end