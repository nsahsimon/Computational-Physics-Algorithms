clear; 
string_dimension=100; 
time_loops=1500; 
% Preallocate matrices for speed; 
x=1/string_dimension:1/string_dimension:1; 
x_scale=1:1:string_dimension; 
y_next =zeros(1,string_dimension); 
signal_data=zeros(1,time_loops); 
elapsed_time=zeros(1,time_loops); 
% Initialise string position  
k=1000; 
x_0=0.5;  
delta_t=3.33e-5; 
f_sample=1/delta_t; 
initial_position=exp(-k.*(x-x_0).^2);
y_current =initial_position; 
y_previous = initial_position; 
initial_time=0; time=initial_time; 
for time_step = 1:time_loops;             
    time=time+delta_t;             
    [y_next]=propagate(y_current, y_previous);                
    y_previous=y_current;             
    y_current=y_next;             
    clf;             
    subplot(2,2,1);             
    plot(x_scale/string_dimension, y_current,'r');             
    title('Waves on a string - fixed ends');            
    xlabel('distance');             
    ylabel('Displacement');             
    axis([0 1 -1 1]);             
    hold on;                       
    drawnow;             
    %%%%%%%                           
    % Record displacement at 5 percent from left end of the string for future plot                
    signal_data(time_step)=y_current(5);             
    elapsed_time(time_step)=time; 
end;             
subplot(2,2,2);             
% plot displacement at 5 percent from left end of the string             
% using suitable scaling               
plot(elapsed_time,signal_data);             
title('Signal from a string');  
 
            
xlabel('time (s)');             
ylabel('Displacement(au)');                         
% Generate FFT and calculate the power spectrum. The power spectral density,              
% a measurement of the energy at various frequencies, is equal             
% to the sum of the real and imaginary components of the              
% FFT. You can multiply the result of the FFT by its complex             
% conjugate in order to calculate it.                      
f_sample=1/delta_t;                                          
NFFT = 2^(nextpow2(length(signal_data))); % No. of points in DFT=Next power of 2 up from length of signal_data             
fft_value = fft(signal_data,NFFT);    % Perform (NFFT point) DFT padding out with zeros so length of fft_value is NFFT                 
Num_Unique_Pts=ceil((NFFT+1)/2); % only half points are unique due to nature of FFT. Calculate number             
fft_value=fft_value(1:Num_Unique_Pts); % throw away half the points                          
%Calculate the scaled power spectrum normalised by dividing              
% by the length of the signal data vector                 
power_spectrum=  fft_value.*conj(fft_value)/(length(signal_data));                                    
% Since we dropped half the FFT, we multiply the power_spectrum by 2 to keep the same energy.             
% The DC component and Nyquist component, if it exists, are unique and should not be multiplied by 2.                        
if rem(NFFT, 2) % odd NFFT excludes Nyquist point                        
    power_spectrum(2:end) = power_spectrum(2:end)*2;                     
else
    power_spectrum(2:end -1) = power_spectrum(2:end -1)*2;                    
end
% Calculate scaled frequency scale                                   
f =  (0:Num_Unique_Pts-1)*f_sample/NFFT;             
subplot(2,2,3);              
%         Power spectrum is symmetric so plot first half                
plot(f,power_spectrum,'g');              
axis([0 3000 0 6]);              
title('Power spectrum');             
xlabel('frequency (Hz)');             
ylabel('Power(au)');                
%             Matlab offers the facility to play sounds. It would be nice to signal the end of program execution with the tone that would be heard from 
%             this string,. You would use the displacement from the vector 'signal_data' for this. Note that 1500 samples are played in 0.05s,  
%             therefore each sample should be played for 0.05/1500 =    3.3333e-05 seconds.The sampling frequency is, therefore,1/3.3333e-05 = 30 kHz.   
%             So the sampling rate is 1/3.3333e-5 =30 kHz     
sound(signal_data, 30e3);


