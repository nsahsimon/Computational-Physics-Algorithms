

clear 
a=10; 
b=8/3;
r=25; 
sigma=10;
npoints =500000;               
%Discretize time  
dt = 0.0001;                      % time step in seconds 
x = zeros(npoints,1);   % initializes x, a vector of dimension npoints X 1,to being all zeros 
y = zeros(npoints,1);   % initializes y, a vector of dimension npoints X 1,to being all zeros 
z = zeros(npoints,1);   % initializes z, a vector of dimension npoints X 1,to being all zeros 
time = zeros(npoints,1);    % this initializes the vector time to being all zeros  
x(1)=1;    
for step = 1:npoints-1    % loop over the timesteps and solve the difference equations              
    x(step+1)=x(step)+sigma*(y(step)-x(step))*dt;
    y(step+1)=y(step)+(-x(step)*z(step)+r*x(step)-y(step))*dt; 
    z(step+1)=z(step)+(x(step)*y(step)-b*z(step))*dt;     
    % Update time array           
    time(step+1) = time(step) + dt;  
end;    
subplot (2,1,1); 
 
plot(time,z,'b' );
xlabel('time'); 
ylabel('z'); 
subplot (2,1,2); 
plot (x,z,'g' );  
xlabel('x'); 
ylabel('z') 
 
 