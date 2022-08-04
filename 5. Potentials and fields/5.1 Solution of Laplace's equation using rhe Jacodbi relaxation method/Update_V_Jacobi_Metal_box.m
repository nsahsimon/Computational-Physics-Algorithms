function [ V_new, delta_V_new] = Update_V_Jacobi_Metal_box(V); 

row_size = size(V,1); column_size=size(V,2);   
% preallocate memory for speed    
V_new=V; delta_V_new=0;   
% Move along the matrix, element by element  computing  Eq 5.10, ignoring 
% boundaries       
for j =2:column_size-1;         
    for i=2:row_size -1;                            
        V_new(i,j) = (V(i-1,j)+V(i+1,j)+V(i,j-1)+V(i,j+1))/4;                          
        % Calculate delta_V_new value, the cumulative change in V during this update call,  to test for convergence                        
        delta_V_new=delta_V_new+abs(V_new(i,j)-V(i,j));        
    end;     
end;   