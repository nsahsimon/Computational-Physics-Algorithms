clear
npoints=500; 
dt = 0.002;                     % time step in years   
x=1;                     %  initialise position of planet in AU 
y=0;                     
v_x=0;                   % initialise velocity of planet in AU/yr 
v_y=2*pi;     % Plot the Sun at the origin
plot(0,0,'oy','MarkerSize',30, 'MarkerFaceColor','yellow'); 
axis([-1 1 -1 1]); 
xlabel('x(AU)'); 
ylabel('y(AU)');  
hold on;   
for step = 1:npoints-1;  
    % loop over the timesteps             
    radius=sqrt(x^2+y^2); 
    % Compute new velocities in the x and y directions 
    v_x_new=v_x - (4*pi^2*x*dt)/(radius^3); 
    v_y_new=v_y - (4*pi^2*y*dt)/(radius^3);   
    % Euler Cromer Step - update positions using newly calculated velocities   
    x_new=x+v_x_new*dt; 
    y_new=y+v_y_new*dt;   
    % Plot planet position immediately   
    plot(x_new,y_new,'-k');  
    drawnow;       
    % Update x and y velocities  with new velocities 
    v_x=v_x_new; 
    v_y=v_y_new; % Update x and y with new positions 
    x=x_new; 
    y=y_new;   
end; 