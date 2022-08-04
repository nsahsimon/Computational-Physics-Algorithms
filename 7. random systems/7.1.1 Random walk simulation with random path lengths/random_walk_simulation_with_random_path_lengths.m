clear; number_of_walkers=500; 
number_of_steps=100; 
step_number=zeros(1,number_of_steps); 
x2ave=zeros(1,number_of_steps); 
step_number_array=[1:1:number_of_steps];   
for  r=1:number_of_walkers; 
    %     initialise position             
    x=0;             
    y=0;                     
    for i=1:number_of_steps;                               
        if rand<0.5;                                
            x=x+rand;                            
        else
            x=x-rand;                            
        end;                               
        % Accumulate value of x^2 , the squared displacement,  for each step number                                                                  
        x2ave(i)=x2ave(i)+x^2;           
    end;          
end;   % Divide by number of walkers   
x2ave= x2ave/number_of_walkers; 
plot(step_number_array, x2ave, 'g');
title('Random walk with random step length'); 
xlabel('Step number');
ylabel('x^2');