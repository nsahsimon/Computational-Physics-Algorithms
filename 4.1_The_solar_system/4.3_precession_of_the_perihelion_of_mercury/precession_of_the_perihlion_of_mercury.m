npoints=30000; 
dt = 0.0001;                     % time step in years 
time = zeros(npoints,1);   % initializes time, a vector of dimension npoints X 1,to being all zeros  
angleInDegrees = zeros(npoints,1);   % initializes angleInDegrees, a vector of dimension npoints X 1,to being all zeros  
x=0.47;                     %  initialise x position of planet in AU 
y=0;                          %  initialise x position of planet in AU 
v_x=0;                     % initialise x velocity of planet in AU/yr 
v_y=8.2;                   % initialise y velocity of planet in AU/yr   
alpha=0.0008;   
for step = 1:npoints-1;         
    % loop over the timesteps              
    time(step+1) = time(step) + dt;                   % Increment total elapsed time          
    radius=sqrt(x^2+y^2);        % Calculate radius         
    relativity_factor=1+alpha/radius^2;          
    % Compute Runge Kutta values for the y equations          
    y_dash=y+0.5*v_y*dt;     
    v_y_dash=v_y - 0.5*(4*pi^2*y*dt)*relativity_factor/(radius^3);          
    % Update positions and new y velocity          
    y_new=y+v_y_dash*dt;     
    v_y_new=v_y-(4*pi^2*y_dash*dt)*relativity_factor/(radius^3);          
    % Compute Runge Kutta values for the x equations          
    x_dash=x+0.5*v_x*dt;     
    v_x_dash=v_x - 0.5*(4*pi^2*x*dt)*relativity_factor/(radius^3);         
    % Update positions using newly calculated velocity          
    x_new=x+v_x_dash*dt;     
    v_x_new=v_x-(4*pi^2*x_dash*dt)*relativity_factor/(radius^3);         
    % Update x and y velocities  with new velocities     
    v_x=v_x_new;     
    v_y=v_y_new;          
    
    % Identify semi-major axes in the planetary orbit and draw them on the     
    % plot. I need to monitor the time derivative of the radius and identify when it    
    % changes from positive to negative.  Then calculate the angle made     
    % by the vector joining the origin and this point with the x axis.          
    
    new_radius=sqrt(x_new^2+y_new^2);     
    time_derivative=(new_radius-radius)/dt; 

 
         
    %  Update x and y with new positions     
    x=x_new;     
    y=y_new;               
    if abs(time_derivative) <0.0025;     % This is a way of identifying the long axis of the orbit. Note that if this is not the case,the value                                                                     % angle_In_Degrees will remain zero                      
        [theta,rho] = cart2pol(x_new,y_new);      %Convert Cartesian coordinates to polar,  noting that the result is in radians             
        angleInDegrees(step)= 180*(theta/pi);  % convert to degrees              
    end;        
end;    
% Plot Orbit orientation versus time. Remove data with angles = zero or 
% less,  this means we only plot the angles of the long axes of the orbit   
I=find(angleInDegrees < 0.01); 
time(I)=NaN; 
angleInDegrees(I)=NaN;  
% Remove all NaN values from the array to reduce dataset size   
time(isnan(time)) = []; 
angleInDegrees(isnan(angleInDegrees)) = [];     
axis([0 3 0 20]);   
xlabel('time(year)');   
ylabel('theta(degrees)');   
hold on;   
scatter (time, angleInDegrees, 'or');     
% Perform a linear fit to the data, degree N=1,  
% returning the coefficient, or slope, to the variable slope   
poly_matrix = polyfit(time,angleInDegrees,1) ; 
slope=poly_matrix(1); 
title(['Orbit orientation versus time for alpha=',num2str(alpha), ' and slope = ', num2str(slope)]);   
% Plot the fit    
time_for_fit=[0:0.1:3]; 
Polynomial_values = polyval(poly_matrix,time_for_fit);      % Evaluate the polynomial at times from 0 to 2.5 
plot(time_for_fit,Polynomial_values, 'g', 'LineWidth',2);