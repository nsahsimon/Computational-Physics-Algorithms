 [V] =capacitor_initialise;   
 % run update routine and estimate convergence   
 [V_new, delta_V_new]=capacitor_update(V);   
 %Initialise loop counter  
 loops=1; 
 %  While we have not met the convergence criterion and the number of loops is <20 so that we give the relaxation  
 % algorithm time to converge       
 while (delta_V_new>400e-5  || loops < 20);          
     loops=loops+1;          
     [V_new, delta_V_new]=capacitor_update(V_new);    
 
           
     % draw the  surface using the mesh function            
     mesh (V_new,'Facecolor','interp');           
     title('Potential Surface');          
     axis([0 20 0 20 -1 1]);           
     drawnow;               
     % insert a pause here so we see the evolution of the potential                
     % surface            
     pause(0.5);   
 end; 