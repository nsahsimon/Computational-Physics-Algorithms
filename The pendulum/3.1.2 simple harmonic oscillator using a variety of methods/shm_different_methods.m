
%Calcutlate the numeraical solution using Euler method in red
[time,y] = SHM_Euler(10);

subplot(2,2,1);
plot(time,y,'r');
axis([0 100 -100 100]);
xlabel('Time');
ylabel('Displacement');
legend('Euler method');

%Calculate the numberiaca solution using Euler Cromer method in blue
[time,y] = SHM_Euler_Cromer(10);

subplot(2,2,2);
plot(time,y,'b');
axis([0 100 -20 20]);
xlabel('Time');
ylabel('Displacement');
legend('Euler Cromer method');

%Calcutlate the numeraical solution using Runge-Kutta method in green
[time,y] = SHM_Runge_Kutta(10);

subplot(2,2,3);
plot(time,y,'g');
axis([0 100 -20 20]);
xlabel('Time');
ylabel('Displacement');
legend('Runge-Kutta method');

%Calcutlate the numeraical solution using Euler method in red
[t,y]=ode23(@SHM_ODE45_function,[0,100],[0,10]);

subplot(2,2,4);
plot(t,y(:,2),'k');
axis([0 100 -20 20]);
xlabel('Time');
ylabel('Displacement');
legend('ODE45 solver');


%Simple harmonic motion - Euler method



