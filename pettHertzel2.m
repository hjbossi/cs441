% Hannah Bossi and Chloe Boehm
% CS441 
% 4/10/2018
%attempt at transitioning to ODEs from DDEs
%pettHertzel ODE version

function dydt = pettHertzel2(t,y, params)

d_Bmal1  = params(1); 
d_RevErb = params(2); 
d_Per2   = params(3); 
d_Cry1   = params(4); 
d_Dbp    = params(5); 
ar1      = params(6); 
ar4      = params(7); 
cr2      = params(8); 
cr3      = params(9); 
cr4      = params(10); 
cr5      = params(11); 
gr2      = params(12); 
gr3      = params(13); 
gr4      = params(14); 
gr5      = params(15); 
b_RevErb = params(16); 
ba2      = params(17); 
b_Per2   = params(18); 
ba3      = params(19); 
b_Cry1   = params(20); 
ba4      = params(21); 
b_Dbp    = params(22); 
ba5      = params(23); 
fa2      = params(24); 
f_RevErb = params(25); 
fa3      = params(26); 
f_Per2   = params(27); 
fa4      = params(28);
f_Cry1   = params(29);
k        = params(30);
d        = params(31);


Bmal1 = y(1);
Bmal1A = y(2);
Bmal1B = y(3);
Bmal1C = y(4);
Bmal1D = y(5);
Bmal1E = y(6);
Bmal1F = y(7);
Bmal1G = y(8);
Bmal1H = y(9);

RevErb = y(10);
RevErbA = y(11);
RevErbB = y(12);
RevErbC = y(13);
RevErbD = y(14);
RevErbE = y(15);
RevErbF = y(16);
RevErbG = y(17);
RevErbH = y(18);

Per2 = y(19);
Per2A = y(20);
Per2B = y(21);
Per2C = y(22);
Per2D = y(23);
Per2E = y(24);
Per2F = y(25);
Per2G = y(26);
Per2H = y(27);

Cry1 = y(28);
Cry1A = y(29);
Cry1B = y(30);
Cry1C = y(31);
Cry1D = y(32);
Cry1E = y(33);
Cry1F = y(34);
Cry1G = y(35);
Cry1H = y(36);

Dbp = y(37);
DbpA = y(38);
DbpB = y(39);
DbpC = y(40);
DbpD = y(41);
DbpE = y(42);
DbpF = y(43);
DbpG = y(44);
DbpH = y(45);

f1 = (1/((RevErb/ar1)+1))^2;
dydt(1,1) = f1 - d_Bmal1*Bmal1H;
dydt(2,1) = k*Bmal1 - d*Bmal1A;
dydt(3,1) = k*Bmal1A - d*Bmal1B;
dydt(4,1) = k*Bmal1B - d*Bmal1C;
dydt(5,1) = k*Bmal1C - d*Bmal1D;
dydt(6,1) = k*Bmal1D - d*Bmal1E;
dydt(7,1) = k*Bmal1E - d*Bmal1F;
dydt(8,1) = k*Bmal1F - d*Bmal1G;
dydt(9,1) = k*Bmal1G - d*Bmal1H;

f2 = ((((b_RevErb*Bmal1)/ba2)+1)/((Bmal1/ba2)+1))^3;
f3 = (1/((Per2/cr2)+1))^3;
f4 = ((((f_RevErb*Dbp)/fa2)+1)/((Dbp/fa2)+1));
f5 = (1/((Cry1/gr2)+1))^3;
dydt(10,1) = f2*f3*f4*f5 - d_RevErb*RevErbH;
dydt(11,1) = k*RevErb - d*RevErbA;
dydt(12,1) = k*RevErbA - d*RevErbB;
dydt(13,1) = k*RevErbB - d*RevErbC;
dydt(14,1) = k*RevErbC - d*RevErbD;
dydt(15,1) = k*RevErbD - d*RevErbE;
dydt(16,1) = k*RevErbE - d*RevErbF;
dydt(17,1) = k*RevErbF - d*RevErbG;
dydt(18,1) = k*RevErbG - d*RevErbH;

f6 = ((((b_Per2*Bmal1)/ba3)+1)/((Bmal1/ba3)+1))^2;
f7 = (1/((Per2/cr3)+1))^2;
f8 = ((((f_Per2*Dbp)/fa3)+1)/((Dbp/fa3)+1));
f9 = (1/((Cry1/gr3)+1))^2;
dydt(19,1) = f6*f7*f8*f9 - d_Per2*Per2H;
dydt(20,1) = k*Per2 - d*Per2A;
dydt(21,1) = k*Per2A - d*Per2B;
dydt(22,1) = k*Per2B - d*Per2C;
dydt(23,1) = k*Per2C - d*Per2D;
dydt(24,1) = k*Per2D - d*Per2E;
dydt(25,1) = k*Per2E - d*Per2F;
dydt(26,1) = k*Per2F - d*Per2G;
dydt(27,1) = k*Per2G - d*Per2H;

f10 = (1/((RevErb/ar4)+1))^2;
f11 = ((((b_Cry1*Bmal1)/ba4)+1)/((Bmal1/ba4)+1))^2;
f12 = (1/((Per2/cr4)+1))^2;
f13 = ((((f_Cry1*Dbp)/fa4)+1)/((Dbp/fa4)+1));
f14 = (1/((Cry1/gr4)+1))^2;
dydt(28,1) = f10*f11*f12*f13*f14 - d_Cry1*Cry1H;
dydt(29,1) = k*Cry1 - d*Cry1A;
dydt(30,1) = k*Cry1A - d*Cry1B;
dydt(31,1) = k*Cry1B - d*Cry1C;
dydt(32,1) = k*Cry1C - d*Cry1D;
dydt(33,1) = k*Cry1D - d*Cry1E;
dydt(34,1) = k*Cry1E - d*Cry1F;
dydt(35,1) = k*Cry1F - d*Cry1G;
dydt(36,1) = k*Cry1G - d*Cry1H;

f15 = ((((b_Dbp*Bmal1)/ba5)+1)/((Bmal1/ba5)+1))^3;
f16 = (1/((Per2/cr5)+1))^3;
f17 = (1/((Cry1/gr5)+1))^3;
dydt(37,1) = f15*f16*f17 - d_Dbp*DbpH;
dydt(38,1) = k*Dbp - d*DbpA;
dydt(39,1) = k*DbpA - d*DbpB;
dydt(40,1) = k*DbpB - d*DbpC;
dydt(41,1) = k*DbpC - d*DbpD;
dydt(42,1) = k*DbpD - d*DbpE;
dydt(43,1) = k*DbpE - d*DbpF;
dydt(44,1) = k*DbpF - d*DbpG;
dydt(45,1) = k*DbpG - d*DbpH;

end