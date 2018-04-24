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

figure;
p1 = plot(sol.x,sol.y);
hold on; 
p2 = plot(sol.x, dClock - sol.y);
legend('PER', 'dClockFree');
ylim([0 0.5]); 
ylabel('Concentraion [nM]','FontSize',16)
xlabel('Circadian Time [h]','FontSize',16)
set([p1,p2],'LineWidth',2);
title('Simulation of Circadian Oscillations with Fixed dClock','FontSize',16);

%% Cell 2
% ode attempt #1
% 4/4/2018

clear all; 

 

v_sp = 0.5; 
k_dp = 0.5; 
K_1 = 0.3; 
dClock = 0.25;

k = 0.3; 
d = k + 0.28; 

%parameters tried
% k = 0.42; d = 0.3 (small oscillations with blow up after 30h)
% k = 0.4; d = 0.4 (less damping and slower blow up)
% k = 0.3; d = 0.6 (not much damping but oscillations occur between 0.2 and
% 1.4)
% k = 0.32; d = 0.6 (fairly stable oscillations but amplitude is too high,
% period is correct though)



yinit = [0.4 0.0 0.0 0.0]; 
params = [v_sp k_dp K_1 dClock k d]; 
tspan = 0:1:200;

[t,y] = ode15s(@flyModelEQ2,tspan,yinit, [],params); 

figure;
p1 = plot(t,y(:,1));
hold on;
p2 = plot(t,dClock - y(:,1));
%ylim([0 1.5])
xlim([100 140]);
legend('PER', 'dClock Free');
set([p1,p2],'LineWidth',2); 
ylabel('Concentraion [nM]','FontSize',16)
xlabel('Circadian Time [h]','FontSize',16)
title('Simulation of Circadian Oscillations with Fixed dClock','FontSize',16);
