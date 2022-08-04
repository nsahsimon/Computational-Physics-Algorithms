N_uranium_initial = 1000; 
npoints = 100;
dt = 1e7;
tau=4.4e9;

N_uranium = zeros(npoints,1);
time = zeros(npoints,1); 

N_uranium(1) = N_uranium_initial;
time(1) =  0;
for step=1:npoints-1
    N_uranium(step+1) = N_uranium(step) - (N_uranium(step)/tau)*dt; 
    time(step+1) = time(step) + dt;  
end
t=0:1e8:10e9; 
N_analytical=N_uranium_initial*exp(-t/tau); 
plot(time,N_uranium,'r',t,N_analytical,'b');
xlabel('Time in years')
ylabel('Number of atoms') 