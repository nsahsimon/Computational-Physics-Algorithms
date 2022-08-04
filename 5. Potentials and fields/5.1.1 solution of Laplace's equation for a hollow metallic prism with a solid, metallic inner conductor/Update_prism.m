function [ V_new, delta_V_new] = Update_prism(V)
row_size = size(V,1);
column_size=size(V,2);  
% preallocate memeory for speed    
V_new=V; 
delta_V_new=0;   
% Move along the matrix, element by element  computing  Eq 5.10, ignoring 
% boundaries       
for j =2:column_size-1;         
    for i=2:row_size -1;                           
        % Do not update V in metal bar             
        if  V(i,j) ~=1;                 
            % If the value of V is not =1, calculate V_new and                 
            % delta_V_new to test for convergence                          
            V_new(i,j) = (V(i-1,j)+V(i+1,j)+V(i,j-1)+V(i,j+1))/4;                             
            delta_V_new=delta_V_new+abs(V_new(i,j)-V(i,j))             
        else
            % otherwise, leave value unchanged                             
            V_new(i,j)=V(i,j);             
        end;         
    end;     
end;