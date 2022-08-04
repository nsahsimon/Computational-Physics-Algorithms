clear; 
N=200; 
delta_x=0.01; 
E_initial=1.879; 
delta_E=0.1; 
x=(delta_x: delta_x: N*delta_x);   
% Create half the potential well   
V= zeros(1, N); 
V(100:N) =1000;   
% Create an intial vector to hold the wavefunction     
b= 1.5;                           
%  suggested cutoff parameter %  
% Implement psi_prime(0)=0 for an even parity solution by  
% letting psi_in(0) and psi_in(-1)=0; Since this is the center of the well, we use indices 200 and 199 for these positions.  % Initialise last_diverge which keeps track of the diverging trend to zero 
% since we don't know this direction yet   
last_diverge=0;   
% If delta_E is small enough then the current E is acceptable. We define a minimum value for this quantity here   
minimum_delta_E=0.005;     
% initialise E   
E=E_initial;   
% MAIN LOOP 
 
while abs(delta_E)>minimum_delta_E; 
    %     Initialise      
    psi= zeros(1, N);      
    psi(1)=1;     
    psi(2)=1;      
    
    % Calculate wavefunction          
    [psi,i]=calculate_psi(psi, N, delta_x, E, b,V);        
    
    % Visualise results with movie         
    plot(x, psi,'r');        
    title('Square well');        
    axis([0 2 -2 2]);        
    xlabel('distance');        
    ylabel('Wavefunction');        
    drawnow;        
    pause(0.5);              
    if sign(psi(i+1))~=sign(last_diverge);                                  
        % If last value of psi evaluated before                               
        % breakout from calculate_psi function and                               
        % last diverge are of different signs, turn                              
        % round direction of varying E and halve its                              
        % value          
        delta_E=-delta_E/2;          
    end;           
    E=E+delta_E;            
    last_diverge=sign(psi(i+1));   
end; 