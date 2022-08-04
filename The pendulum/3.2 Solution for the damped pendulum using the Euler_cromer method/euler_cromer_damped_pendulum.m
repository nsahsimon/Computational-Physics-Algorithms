clear; length= 1;                                      
%pendulum length in metres 
g=9.8; % acceleration due to gravity 
q=1;                                          
% damping strength   
npoints = 250;               
%Discretize time into 250 intervals 
dt = 0.04;                      
% time step in seconds   
omega = zeros(npoints,1);   
% initializes omega, a vector of dimension npoints X 1,to being all zeros 
theta = zeros(npoints,1);   
% initializes theta, a vector of dimension npoints X 1,to being all zeros  
time = zeros(npoints,1);    
% this initializes the vector time to being all zeros    
theta(1)=0.2;                    
% you need to have some initial displacement, otherwise the pendulum will not swing   
for step = 1:npoints-1 % loop over the timesteps              
    omega(step+1) = omega(step) - (g/length)*theta(step)*dt-q*omega(step)*dt; 
    theta(step+1) = theta(step)+omega(step+1)*dt;      
    % In the Euler method, , the previous value of omega  
    % and the previous value of theta are used to calculate the  new values of omega and theta.  
    % In the Euler Cromer method, the previous value of omega  and the previous value of theta are used to calculate the the new value 
    % of omega. However, the NEW value of omega is used to calculate the new 
    % theta 
    %  
    time(step+1) = time(step) + dt;  
end;   
plot(time,theta,'r' );
%plots the numerical solution in red 
xlabel('time (seconds) '); 
ylabel('theta (radians)'); 