clear;   
delta_x=0.2;    
% spatial step size 
convergence_per_site=1e-6;  
rho=zeros(20,20,20);     
% Create box to contain charge 
rho(10,10,10)=(1/delta_x^3);  
% place charge of 1 at centre of box shaped volume 
% Create Potential matrix 
V_matrix=zeros(20,20,20);   
% run Update routine for the first time and calculate convergence metric   
[V_new, delta_V_new]=point_charge_update(V_matrix, rho, delta_x);   
%Initialise loop counter  
loops=1; 
%  While we have not met the convergence criterion and the number of loops is <20 so that we give the   
% algorithm time to converge       
while (delta_V_new>convergence_per_site*size(V_matrix,2)^3 || loops < 20);              
    loops=loops+1;             
    [V_new, delta_V_new]=point_charge_update(V_new,rho, delta_x);           
end; 
% Run the routine to plot the potential as calculated analytically using Coulomb's Law        
[coulomb, r]=point_charge_coulomb;        
% Visualise result by taking a slice half way up the cube.         
slice = V_new(:, :, 10);         
subplot(1,2,1);        
surf(slice);          
title('Potential');        
view(3);         
axis on;         
grid on;         
light;         
lighting phong;         
camlight('left');         
shading interp;            
% take a cutline across the slice surface and plot                
subplot(1,2,2); 
       
cut_slice=slice(10, 10:20);        
rescale=[0:0.2:2];          
plot(rescale,cut_slice,'og');        
xlabel('x');       
ylabel('V');             
axis([0 2 0 0.8]);        
title('Numerical result and Coulombs Law')        
hold on;               
% Plot Coulomb's law result for comparison                
plot(r,coulomb,'k');        
legend('Numerical results','Coulomb');   