function [V, delta_V_total] = capacitor_update_SOR(V)
% This function takes a matrix V and applies Eq 5.14 to it. Only the values inside the boundaries are changed. It returns the 
% processed matrix to the  calling function, together with the value of delta_V, the total accumulated amount by which the elements
% of the matrix have changed     
row_size = size(V,1); 
column_size=size(V,2); 
L=column_size;        
% grid size, for a square grid 20 X 20 , L=20 
alpha = 2/(1+pi/L); 
% use recommended value for book for alpha            
% intialise convergence metric 
delta_V_total=0;   
% Move along the matrix, in a raster scan, element by element  computing  Eq 5.14, ignoring 
% boundaries     
for i=2:row_size -1;         
    for j =2:column_size-1;            
        % Do not update V on the plates               
        if  V(i,j)~=1 && V(i,j) ~=-1;                                                  
            % If the value of V is not =1 or -1, calculate the new value of the cell and                 
            % delta_V_new to test for convergence                                            
            V_star = (V(i-1,j)+V(i+1,j)+V(i,j-1)+V(i,j+1))/4;   
            % This is the Gauss Siedel updated value for the cell                          
            delta_V =V_star-V(i,j);
            % delta_V is the difference between the Gauss Siedel updated value for the cell                           
            % and the original value of the cell                          
            % Update Matrix V , in place, so latest values will be used                         
            % for SOR                         
            V(i,j)=alpha*delta_V+V(i,j);  % add a multiple of delta_V to the original value in the cell, that is, 'over-relax'                           
            % Update convergence metric for this update                        
            delta_V_total= delta_V_total+abs(delta_V);                
        end;         
    end;     
end;   