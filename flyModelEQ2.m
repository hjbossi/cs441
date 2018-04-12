% fly model equations attempt #1
% CS441 
% 4/4/2018

function dydt = flyModelEQ2(t,y, params)

v_sp   = params(1); 
k_dp   = params(2); 
K_1    = params(3); 
dClock = params(4); 
k      = params(5); 
d      = params(6);

Per  = y(1);
PerA = y(2); 
PerB = y(3); 
PerC = y(4); 



% calc dClockFree
temp1 = dClock - PerC; 
temp2 = 0; 

if temp1>temp2
    dClockFree = temp1; 
else
    dClockFree = temp2; 
end

%calculate R_sp
R_sp = (dClockFree/(K_1 + dClockFree));

% original DDE
dydt(1,1) = (v_sp * R_sp) - (k_dp* PerC);
% first intermediate ODE 
dydt(2,1) = k*Per - d*0.8*PerA; 
% second intermediate ODE
dydt(3,1) = k*PerA - d*0.8*PerB; 
% third intermediate ODE
dydt(4,1) = k*PerB - d*0.8*PerC;

end 