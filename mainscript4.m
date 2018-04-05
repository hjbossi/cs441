% applying DDE Solver to the Fly Model
% CS441
% 4/4/2018

clear all; 

t_1 = 10; 

v_sp = 0.5; 
k_dp = 0.5; 
K_1 = 0.3; 
dClock = 0.25;

params = [v_sp k_dp K_1 dClock]; 

sol = dde23('flyModelEQ',t_1, 'flyModelHistory', [0,40], [],params); 


plot(sol.x,sol.y);
hold on; 
plot(sol.x, dClock - sol.y);
legend('PER', 'dClockFree');
ylim([0 0.5]); 
ylabel('Concentraion [nM]')
xlabel('Circadian Time [h]')
title('Simulation of Circadian Oscillations with Fixed dClock');

%% Cell 2
% ode attempt #1
% 4/4/2018

clear all; 

 

v_sp = 0.5; 
k_dp = 0.5; 
K_1 = 0.3; 
dClock = 0.25;
k = 0.42; 
d = 0.3; 

yinit = [0.4 0.0 0.0 0.0]; 
params = [v_sp k_dp K_1 dClock k d]; 
tspan = 0:1:40;

[t,y] = ode15s(@flyModelEQ2,tspan,yinit, [],params); 

figure;
plot(t,y);
legend('PER', 'PERA', 'PERB','PERC');
%ylim([0 0.5]); 
ylabel('Concentraion [nM]')
xlabel('Circadian Time [h]')
title('Simulation of Circadian Oscillations with Fixed dClock');
