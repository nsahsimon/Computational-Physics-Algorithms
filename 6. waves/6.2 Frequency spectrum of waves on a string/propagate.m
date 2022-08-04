function [y_next] = propagate(y_current, y_previous)    
% c=300, delta_x=0.01, which makes delta_t = delta_x/c = 0.01/300 = 3.33e-5  
% since r=c*delta_t/delta_x and for the Figure 6.2 example  
% delta_t=delta_x/c, giving r=1.   

r=1;   M=size(y_current,2);       
% Vector size = number of columns   
% there are 3 vectors containing positional information for the whole
% string,;    y_new, y_current and y_old
% preallocate memory for speed 
% This function calculates the new shape of the string after one time step   
% HERE IS THE ORIGINAL CODE 
% for i=2:M-1;                                            
%This loop index takes care of the fact that the boundaries are fixed 
%        y_next(i) = 2*(1-r^2)*y_current(i).... 
%                           -y_previous(i).... 
%                           +r^2*(y_current(i+1)+y_current(i-1)); 
%end; 
% HERE IS THE VECTORISED CODE, WHICH IS MORE EFFICIENT  
y_next=zeros(1,M);  
i=2:1:M-1;                                            
%This loop index takes care of the fact that the boundaries are fixed        
y_next(i) = 2*(1-r^2)*y_current(i)....                           
    -y_previous(i)....                           
    +r^2*(y_current(i+1)+y_current(i-1)); 