%% Cell 1
%initial model using DDE equations
clear all;

t_Bmal1 = 4.76;
t_RevErb = 1.79;
t_Per2 = 3.82;
t_Cry1 = 3.13;
t_Dbp = 2.08;

d_Bmal1 = 0.4;
d_RevErb = 0.67;
d_Per2 = 0.51;
d_Cry1 = 0.2;
d_Dbp = 0.56;
ar1 = 4.05;
ar4 = 1.1;
cr2 = 1.83;
cr3 = 33.5;
cr4 = 6.63;
cr5 = 0.99;
gr2 = 80.2;
gr3 = 0.37;
gr4 = 0.51;
gr5 = 1.02;
%b_RevErb = 3.26;
b_RevErb = 2.6;
ba2 = 0.51;
%b_Per2 = 3.69;
b_Per2 = 3.5;
ba3 = 14.78;
%b_Cry1 = 1.35;
b_Cry1 = 2;
ba4 = 1.06;
%b_Dbp = 12.87;
b_Dbp = 4.5;
ba5 = 0.01;
fa2 = 0.19;
f_RevErb = 1.23;
fa3 = 0.58;
f_Per2 = 11.69;
fa4 = 1.61;
f_Cry1 = 32.2;

scale = 12; 
d_B = 1/scale;
d_R = 0.002;
k_B = 2/scale;
k_R = 0.001;

% list of meaningful attempts
% written as a list with [d,k] format
% [0.42,0.3](osicllations with damping)
% [0.15 0.3] (oscillations with less damping but irregular pattern),
% [0.1 0.3], [0.3,0.1] (integration error)

lags = [t_Bmal1, t_RevErb, t_Per2, t_Cry1, t_Dbp];
params = [d_Bmal1, d_RevErb, d_Per2, d_Cry1, d_Dbp, ar1, ar4,...
    cr2, cr3, cr4, cr5, gr2, gr3, gr4, gr5, b_RevErb, ba2, b_Per2,...
    ba3, b_Cry1, ba4, b_Dbp, ba5, fa2, f_RevErb, fa3, f_Per2, fa4, f_Cry1 k_B d_B k_R d_R];

%sol = dde23(ddefile,lags,history,tspan,options);
sol = dde23('pettHertzel3', lags, 'pettHertzelHistory3',[0,200],[],params);

%tint = linspace(0,20);
%yint = deval(sol.y,tint);
%plot(tint, yint)
figure;
plot(sol.x,sol.y(1,:));
hold on; 
plot(sol.x,sol.y(3,:));
plot(sol.x,sol.y(4,:));
plot(sol.x,sol.y(5,:));
plot(sol.x,sol.y(6,:));
xlim([100 160]); 
legend('Bmal1','RevErb','Per2','Cry1','Dbp');
ylabel('Gene Expression [a.u.]')
xlabel('Circadian Time [h]')
title('Simulation of gene expression of all 5 genes')