%% Cell 1
%attempt at transitioning Bmal1 DDE into a series of ODEs
clear all;

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

%k is 1.4*d
% k = 0.42; 
% d = 0.3;

d = 0.2;
k = 0.28;


params = [d_Bmal1, d_RevErb, d_Per2, d_Cry1, d_Dbp, ar1, ar4,...
    cr2, cr3, cr4, cr5, gr2, gr3, gr4, gr5, b_RevErb, ba2, b_Per2,...
    ba3, b_Cry1, ba4, b_Dbp, ba5, fa2, f_RevErb, fa3, f_Per2, fa4,...
    f_Cry1, k, d];

yinit = [1.7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ...
    0.2 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ...
    0.5 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0...
    1.5 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ...
    0.15 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0];

tspan = 0:1:60;

[t,y] = ode15s(@pettHertzel2,tspan,yinit, [],params); 
figure;
plot(t,y(:,1));
hold on;
plot(t,y(:,10));
plot(t,y(:,19));
plot(t,y(:,28));
plot(t,y(:,37));
legend('Bmal1', 'Rev_Erb', 'Per2','Cry1', 'Dbp');
%plot(t,y)