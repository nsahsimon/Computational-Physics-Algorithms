function [V,x] = point_charge_coulomb
x=[0:0.05:2]; 
% Since q/epsillon_zero=1  
V=1./(4*pi*x); 
 