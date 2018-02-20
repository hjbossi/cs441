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
b_RevErb = 3.26;
ba2 = 0.51;
b_Per2 = 3.69;
ba3 = 14.78;
b_Cry1 = 1.35;
ba4 = 1.06;
b_Dbp = 12.87;
ba5 = 0.01;
fa2 = 0.19;
f_RevErb = 1.23;
fa3 = 0.58;
f_Per2 = 11.69;
fa4 = 1.61;
f_Cry1 = 32.2;