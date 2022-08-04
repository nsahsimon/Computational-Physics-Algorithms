npoints=100000; 
dt = 0.0001;                     % time step in years   
time=zeros(npoints,1); 
r_c=zeros(npoints,1);                                       
% Create arrays to store position, velocity and angle and angular velocity of                                        
% centre of mass x=zeros(npoints,1); 
y=zeros(npoints,1);   
v_x=zeros(npoints,1); 
v_y=zeros(npoints,1);   
theta=zeros(npoints,1); 
omega=zeros(npoints,1);   
x(1)=1;                     %  initialise position of centre of mass of Hyperion  in HU y(1)=0;                     
v_x(1)=0;                   % initialise velocity of centre of mass of Hyperion   
v_y(1)=2*pi;        % initialise  theta and omega of Hyperion     
for i= 1:npoints-1;               
    %loop over the timesteps                
    r_c(i)=sqrt(x(i)^2+y(i)^2);           
    % Compute new velocities in the x and y directions           
    v_x(i+1)=v_x(i) - (4*pi^2*x(i)*dt)/(r_c(i)^3);        
    v_y(i+1)=v_y(i) - (4*pi^2*y(i)*dt)/(r_c(i)^3);           
    % Euler Cromer Step - update positions of centre of mass of Hyperion using NEWLY calculated velocities           
    x(i+1)=x(i)+v_x(i+1)*dt;         
    y(i+1)=y(i)+v_y(i+1)*dt;   
    % Calculate new angular velocity omega and angle theta. Note that GMsaturn=4*pi^2, see book for details     
    Term1=3*4*pi^2/(r_c(i)^5); 
    Term2=x(i)*sin(theta(i))- y(i)*cos(theta(i)); 
    Term3=x(i)*cos(theta(i)) +y(i)*sin(theta(i));  
    omega(i+1)=omega(i) -Term1*Term2*Term3*dt;   
    %Theta is an angular variable so values of theta that differ by 2*pi correspond to the same position.  
    %We need to adjust theta after each iteration so as to keep it between 
 
%+/-pi for plotting purposes. We do that here   
temporary_theta_i_plus_1= theta(i)+omega(i+1)*dt;    
if (temporary_theta_i_plus_1 < -pi)          
    temporary_theta_i_plus_1= temporary_theta_i_plus_1+2*pi;        
elseif (temporary_theta_i_plus_1 > pi)       
    temporary_theta_i_plus_1= temporary_theta_i_plus_1-2*pi;      
end;     
% Update theta array                  
    theta(i+1)=temporary_theta_i_plus_1;   
    time(i+1)=time(i)+dt;   
end;

subplot(2,1,1); 
plot(time, theta,'-g');  
axis([0 8 -4 4]); 
xlabel('time(year)'); 
ylabel('theta(radians)'); 
title('theta versus time for Hyperion');   

subplot(2,1,2); plot(time, omega,'-k'); 
axis([0 8 0 15]); 
xlabel('time(year)'); 
ylabel('omega(radians/yr)'); 
title('omega versus time for Hyperion'); 
 
 