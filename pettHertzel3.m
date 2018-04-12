% Hannah Bossi and Chloe Boehm
% CS441 
% 4/12/2018

function dydt = pettHertzel3(t,y, Z, params)
t_Bmal1 = Z(:,1);
t_RevErb = Z(:,2);
t_Per2 = Z(:,3);
t_Cry1 = Z(:,4);
t_Dbp = Z(:,5);

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
RevErb = y(3);
Per2 = y(4);
Cry1 = y(5);
Dbp = y(6);

f1 = (1/((t_RevErb(2)/ar1)+1))^2;
dydt(1,1) = f1 - d_Bmal1*Bmal1A;
dydt(2,1) = k*Bmal1 - d*Bmal1A;

f2 = ((((b_RevErb*Bmal1A)/ba2)+1)/((Bmal1A/ba2)+1))^3;
f3 = (1/((t_Per2(3)/cr2)+1))^3;
f4 = ((((f_RevErb*t_Dbp(5))/fa2)+1)/((t_Dbp(5)/fa2)+1));
f5 = (1/((t_Cry1(4)/gr2)+1))^3;
dydt(3,1) = f2*f3*f4*f5 - d_RevErb*RevErb;

f6 = ((((b_Per2*Bmal1A)/ba3)+1)/((Bmal1A/ba3)+1))^2;
f7 = (1/((t_Per2(3)/cr3)+1))^2;
f8 = ((((f_Per2*t_Dbp(5))/fa3)+1)/((t_Dbp(5)/fa3)+1));
f9 = (1/((t_Cry1(4)/gr3)+1))^2;
dydt(4,1) = f6*f7*f8*f9 - d_Per2*Per2;

f10 = (1/((t_RevErb(2)/ar4)+1))^2;
f11 = ((((b_Cry1*Bmal1A)/ba4)+1)/((Bmal1A/ba4)+1))^2;
f12 = (1/((t_Per2(3)/cr4)+1))^2;
f13 = ((((f_Cry1*t_Dbp(5))/fa4)+1)/((t_Dbp(5)/fa4)+1));
f14 = (1/((t_Cry1(4)/gr4)+1))^2;
dydt(5,1) = f10*f11*f12*f13*f14 - d_Cry1*Cry1;

f15 = ((((b_Dbp*Bmal1A)/ba5)+1)/((Bmal1A/ba5)+1))^3;
f16 = (1/((t_Per2(3)/cr5)+1))^3;
f17 = (1/((t_Cry1(4)/gr5)+1))^3;
dydt(6,1) = f15*f16*f17 - d_Dbp*Dbp;

end






    