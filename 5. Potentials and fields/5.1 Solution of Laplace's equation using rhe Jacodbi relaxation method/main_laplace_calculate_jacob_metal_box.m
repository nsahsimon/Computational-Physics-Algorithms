% Jacobi methos to solve laplace equation
 [V] =Initialise_V_Jacobi_metal_box;  
 % run update routine and estimate convergence   
 %Initialise loop counter  
 loops=1; 
 [V_new, delta_V_new]=Update_V_Jacobi_Metal_box(V);   
 
 %  While we have not met the convergence criterion and the number of loops is <10 so that we give the relaxation  
 % algorithm time to converge    
 while (delta_V_new > 49e-5 && loops < 10);      
     loops=loops+1;     
     [V_new, delta_V_new]=Update_V_Jacobi_Metal_box(V_new);        
     % draw the  surface using the mesh function     
     mesh (V_new);     
     title('Potential Surface');     
     drawnow;       
     % insert a pause here so we see the evolution of the potential     
     % surface    
     pause(1);   
 end;   