% Hannah Bossi and Chloe Boehm
% CS441 
% 2/20/2018

function dydt = pettHertzel(t,statevars, params)
t_Bmal1  = params(1); 
t_RevErb = params(2); 
t_Per2   = params(3);
t_Cry1   = params(4); 
t_Dbp    = params(5); 
d_Bmal1  = params(6); 
d_RevErb = params(7); 
d_Per2   = params(8); 
d_Cry1   = params(9); 
d_Ddp    = params(10); 
ar1      = params(11); 
ar4      = params(12); 
cr2      = params(13); 
cr3      = params(14); 
cr4      = params(15); 
cr5      = params(16); 
gr2      = params(17); 
gr3      = params(18); 
gr4      = params(19); 
gr5      = params(20); 
b_RevErb = params(21); 
ba2      = params(22); 
b_Per2   = params(23); 
ba3      = params(24); 
b_Cry1   = params(25); 
ba4      = params(26); 
b_Dbp    = params(27); 
ba5      = params(28); 
fa2      = params(29); 
f_RevErb = params(30); 
fa3      = params(31); 
f_Per2   = params(32); 
fa4      = params(33);
f_Cry1   = params(34); 

    