function [time,y] = SHM_Runge_Kutta(initial_displacement)

npoints = 2500;
dt = 0.04;

%v = zeros(npoints,1);
y = zeros(npoints,1);
%time = zeros(npoints, 1);
y(1) = initial_displacement;

v = zeros(npoints,1);
y = zeros(npoints,1);
%v_dash = zeros(npoints,1);
%y_dash = zeros(npoints,1);
time = zeros(npoints,1);
y(1)  = 10;

for step = 1:npoints-1
    v_dash = v(step)-0.5*y(step)*dt;
    y_dash = y(step) +0.5*v(step)*dt;
    
    v(step+1) = v(step)-y_dash*dt;
    y(step+1) = y(step)+v_dash*dt;
    time(step+1) = time(step) + dt;
end;