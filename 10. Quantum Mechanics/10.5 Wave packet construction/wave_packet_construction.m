
clear; 
x=(0:0.0005:1); 
x_0=0.4; 
C=25; 
sigma_squared=1e-3; 
delta_x=0.0005; 
delta_t=0.2; 
k_0=500;   
psi=C*exp(-(x-x_0).^2/sigma_squared).*exp(1i*k_0*x);   
subplot(2,2,1); 

plot(x,real(psi), 'b'); 
title('Real part of wavefunction '); 
xlabel('distance'); 
ylabel('Re(wavefunction)');   
subplot(2,2,2); 
plot(x,imag(psi),'r'); 
title('Imaginary part of wavefunction'); 
xlabel('distance'); 
ylabel('Im(wavefunction)');   
subplot(2,2,3);
plot(x,(conj(psi).*psi),'k'); 
title('Probability of finding particle  '); 
xlabel('distance'); 
ylabel('psi*conj(psi)');   