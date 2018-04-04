% fly model equations
% CS441 
% 4/4/2018

function dydt = flyModelEQ(t,y,Z, params)
t_1 = Z(:,1); 

v_sp   = params(1); 
k_dp   = params(2); 
K_1    = params(3); 
dClock = params(4); 

Per = y(1);


% calc dClockFree
temp1 = dClock - t_1(1); 
temp2 = 0; 

if temp1>temp2
    dClockFree = temp1; 
else
    dClockFree = temp2; 
end

%calculate R_sp
R_sp = (dClockFree/(K_1 + dClockFree));

% original DDE
dydt(1,1) = (v_sp * R_sp) - (k_dp* Per);
end 

 

