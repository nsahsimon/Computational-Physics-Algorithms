Omega_D=2/3; 
for F_Drive_step=1:0.1:13;  
    F_Drive=1.35+F_Drive_step/100; 
    %  Calculate the plot of theta as a function of time for the current drive step 
    % using the function :- pendulum_function 
    [time,theta]= pendulum_function(F_Drive, Omega_D);   
    %Filter the results to exclude initial transient of 300 periods, note 
    % that the period is 3*pi.    
    I=find (time< 3*pi*300); 
    time(I)=NaN; 
    theta(I)=NaN;   
    %Further filter the results so that only results in phase with the driving force 
    % F_Drive are displayed.  
    % Replace all those values NOT in phase with NaN  
    Z=find(abs(rem(time, 2*pi/Omega_D)) > 0.01); 
    time(Z)=NaN; 
    theta(Z)=NaN; 
    
    % Remove all NaN values from the array to reduce dataset size  
    time(isnan(time)) = []; 
    theta(isnan(theta)) = [];   
    
    % Now plot the results    
    plot(F_Drive,theta,'k'); 
    hold on; 
    axis([1.35 1.5 1 3]); 
    xlabel('F Drive'); 
    ylabel('theta (radians)');     
end;   