function [time,y] = SHM_Euler_Cromer(initial_displacement)

npoints  = 2500;
dt = 0.04;

v = zeros(npoints,1);
y = zeros(npoints,1);
time = zeros(npoints,1);
y(1) = initial_displacement;

for step = 1:npoints-1
    v(step + 1) = v(step) - y(step)*dt;
    y(step+1) = y(step) + v(step + 1)*dt;
    time(step+1) = time(step) + dt;
end;