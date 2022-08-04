function [V_new, delta_V_new] = point_charge_update(V, rho, delta_x)  
% This function takes a matrix V and solves Poisson's equation. It needs rho and delta_x  
%the charge distribution and spatial step size also. It returns the 
% processed matrix to the  calling function, together with the value of delta_V, 
% the total accumulated amount by which the elements 
% of the matrix have changed     
x_size = size(V,1); 
y_size = size(V,2); 
z_size = size(V,3);   
% preallocate memory for speed    
V_new=zeros(x_size, y_size, z_size); 
delta_V_new=0;   
% Move along the matrix, element by element  computing  Eq 5.20, ignoring 
% boundaries. Note the use of a,b,c instead of i,j,k since i and j are
% already defined in MATLAB   
for c=2:z_size-1;     
    for b =2:y_size-1;         
        for a=2:x_size -1;                          
            % calculate V_new and cumulative delta_V_new to test for convergence                 
            V_new(a,b,c) = (V(a-1,b,c)+V(a+1,b,c)+V(a,b+1,c)+V(a,b-1,c)+V(a,b,c+1)+V(a,b,c-1))/6 + rho(a,b,c)*delta_x^2/6 ;                 
            delta_V_new=delta_V_new+abs(V_new(a,b,c)-V(a,b,c));               
        end;         
    end;     
end;