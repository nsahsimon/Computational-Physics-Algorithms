 [V] =capacitor_initialise_SOR;   
 % run update routine and estimate convergence   
 [V, delta_V_total]=capacitor_update_SOR(V);   
 %Initialise loop counter  
 loops=1; 
 %  While we have not met the convergence criterion and the number of loops is <20 so that we give the relaxation  
 % algorithm time to converge.Note convergence for 1e-5 * No of sites       
 while (delta_V_total>1e-5*size(V,2)^2  || loops < 20);          
     loops=loops+1;          
     [V, delta_V_total]=capacitor_update_SOR(V);               
     % draw the  surface using the mesh function            
     mesh(V,'Facecolor','interp');           
     title('Potential Surface');           
     axis([0 60 0 60 -1 1]);           
     drawnow;                
     % insert a pause here so we see the evolution of the potential               
     % surface            
     pause(0.5);   
 end; 