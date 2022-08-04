alpha_relativity=1.1e-8;        % predicted alpha value from General Relativity                                                                                                                                           
% Load up data  
alpha=[0.0005 0.0007 0.001 0.002 0.003 0.004];
precession_rate=[5.3 7.4 10.7 21.9 33.6 45.9];                                                                                                                                          
% Format graph 
axis([0 0.004 0 40]); 
xlabel('alpha'); 
ylabel('Precession rate (degrees/year)'); 
hold on;                                                                                                                                            
% Plot graph 
scatter(alpha, precession_rate,  'ko')     
%  Perform a linear fit to the data, degree N=1, 
%  returning the coefficient, or slope. Note you can't use the MATLAB function polyval as the 
%  intercept value of the fitted line would dominate the precession rate.  
% 
poly_matrix = polyfit(alpha, precession_rate, 1); 
% Perform the fit                                                                                    
% Plot the fit on the data 
alpha_for_fit=[0:0.0001:0.004]; 
Polynomial_values = polyval(poly_matrix,alpha_for_fit);     
% Evaluate the polynomial at points in the vector 
plot(alpha_for_fit,Polynomial_values, 'g', 'LineWidth',2);
Mercury_rate = poly_matrix(1)*alpha_relativity; % Extract the slope from the fit and multiply it by the predicted alpha                                                                                      
% value from General Relativity. Answer is in degrees per year    
Mercury_rate_arc_sec_century =  Mercury_rate*100 *3600;    % Convert to arc/s per century                                                                             
title(['Calculated precession rate of Mercury for alpha = ', num2str(alpha_relativity),' AU^2 is ',num2str(Mercury_rate_arc_sec_century,'%.1f'),' arc/s per century']); 