 [V] =Initialise_prism;   
 % run update routine and estimate convergence   
 [V_new, delta_V_new]=Update_prism(V);   %Initialise loop counter  
 loops=0; 
 %  While we have not met the convergence criterion and the number of loops is <10 so that we give the relaxation 
 % algorithm time to converge
 % while (delta_V_new > & loops < 30);    
 while (delta_V_new>4e-5  || loops < 20);       
     loops=loops+1;       
     [V_new, delta_V_new]=Update_prism(V_new);       
     % draw the  surface using the mesh function 
     %      mesh (V_new,'FaceColor','interp','EdgeColor','none','FaceLighting','phong');           
     mesh (V_new,'FaceColor','interp');        
     title('Potential Surface');       
     axis([0 20 0 20 0 1]);     
     drawnow;       
     % insert a pause here so we see the evolution of the potential    
     % surface     
     pause(0.5);   
 end;   