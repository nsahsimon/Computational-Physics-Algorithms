clear;
length = 1;
g = 9.8;
npoints = 250;
dt = 0.04;
omega = zeros(npoints,1);
theta = zeros(npoints,1);
time = zeros(npoints,1);
theta(1)=0.2;


for step = 1:npoints-1
    omega(step+1) = omega(step) - (g/length)* theta(step)*dt;
    theta(step+1) = theta(step) + omega(step)*dt;
    time(step+1) = time(step) + dt;
end;

plot(time,theta,'r');
xlabel('time(seconds)');
ylabel('theta(radians)');