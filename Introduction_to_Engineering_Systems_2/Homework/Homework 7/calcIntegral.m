function calcIntegral(handles)

%This program tabulates and plots sin(x) from (0,2pi) and computes the
%integral from xleft to xright while shading the resulting area.

%Author: J. Patrick Lacher

%% Tabulate Function for Plotting

xmin = 0;
xmax = 2*pi;
Nx = 100;
x = linspace(xmin,xmax,Nx);
y = sin(x);

%% Tabulate Function on Finer Grid for Integration and Filling

Nf = 300;
xleft = handles.xleftslider.Value;
xright = handles.xrightslider.Value;
xf = linspace(xleft,xright,Nf);
yf = sin(xf);

%% Calculate Integral of Defined Area

deltax = xf(2) - xf(1);
Integ = 0;
for ix = 1:Nf-1
    Integ = Integ + 0.5*(yf(ix+1) + yf(ix))*deltax;
end

%change value of Integral edit box
handles.integralEdit.String = num2str(Integ);

%% Plot Curve With Area Defined by (xf,yf) shaded

plot(handles.plotaxes,x,y)
hold on
fill([xf(1),xf,xf(Nf),xf(1)],[0,yf,0,0],'r','Parent',gca);
hold off
grid on
xlabel('x')
ylabel('y')