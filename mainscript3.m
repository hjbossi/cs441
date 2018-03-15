% mainscript3.m
% DDE Solver Using a For Loop
% Chloe Boehm and Hannah Bossi 
% CS441
% 3/12/2018

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

B_0 = 1.7;
R_0 = 0.2;
P_0 = 0.5;
C_0 = 1.5;
D_0 = 0.15;

numSteps = 100; 

for i = 1:numSteps
    tstart = (i-1)*1.79;
    tend = i*1.79;
    tspan = tstart:0.1:tend; 
    % make the final result all in one array
    if i == 1
        total_t = tspan;
    else
        total_t = cat(2,total_t,tspan);
    end

    %Bmal1
    f1 = (1/((R_0/ar1)+1))^2;
    dBdt = @(t,Bmal1) f1 - d_Bmal1*Bmal1;
    [t,Bmal1val] = ode15s( dBdt, tspan, B_0);
    % first time through the loop set it to initial vals, all other times
    % concatenate
    if i == 1
        bmal1Vals = Bmal1val;
    else
        bmal1Vals = cat(1, bmal1Vals,Bmal1val);
    end
    

    %RevErb
    f2 = ((((b_RevErb*B_0)/ba2)+1)/((B_0/ba2)+1))^3;
    f3 = (1/((P_0/cr2)+1))^3;
    f4 = ((((f_RevErb*D_0)/fa2)+1)/((D_0/fa2)+1));
    f5 = (1/((C_0/gr2)+1))^3;
    dRdt = @(t,RevErb) f2*f3*f4*f5 - d_RevErb*RevErb;
    [t,RevErbval] = ode15s(dRdt, tspan, R_0);
    if i == 1
        reverbVals = RevErbval; 
    else
        reverbVals = cat(1, reverbVals,RevErbval); 
    end
   
    
    %Per2
    f6 = ((((b_Per2*B_0)/ba3)+1)/((B_0/ba3)+1))^2;
    f7 = (1/((P_0/cr3)+1))^2;
    f8 = ((((f_Per2*D_0)/fa3)+1)/((D_0/fa3)+1));
    f9 = (1/((C_0/gr3)+1))^2;
    dPdt = @(t,Per2) f6*f7*f8*f9 - d_Per2*Per2;
    [t,Per2val] = ode15s(dPdt, tspan, P_0);
    if i == 1
        Per2Vals = Per2val;
    else
        Per2Vals = cat(1,Per2Vals,Per2val);
    end

    %Cry1
    f10 = (1/((R_0/ar4)+1))^2;
    f11 = ((((b_Cry1*B_0)/ba4)+1)/((B_0/ba4)+1))^2;
    f12 = (1/((P_0/cr4)+1))^2;
    f13 = ((((f_Cry1*D_0)/fa4)+1)/((D_0/fa4)+1));
    f14 = (1/((C_0/gr4)+1))^2;
    dCdt = @(t,Cry1) f10*f11*f12*f13*f14 - d_Cry1*Cry1;
    [t,Cry1val] = ode15s(dCdt, tspan, C_0); 
    if i == 1
        Cry1Vals = Cry1val; 
    else
        Cry1Vals = cat(1,Cry1Vals,Cry1val);
    end
    
        
    
    %Dbp
    f15 = ((((b_Dbp*B_0)/ba5)+1)/((B_0/ba5)+1))^3;
    f16 = (1/((P_0/cr5)+1))^3;
    f17 = (1/((C_0/gr5)+1))^3;
    dDdt = @(t,Dbp) f15*f16*f17 - d_Dbp*Dbp;
    [t,Dbpval] = ode15s(dDdt, tspan, D_0);
    if i == 1
        DbpVals = Dbpval; 
    else
        DbpVals = cat(1,DbpVals,Dbpval); 
    end
    
    %update the initial conditions for the next time step
    B_0 = Bmal1val(end);  
    R_0 = RevErbval(end);
    P_0 = Per2val(end);
    C_0 = Cry1val(end);
    D_0 = Dbpval(end);
end


figure;
p1 = plot(total_t, bmal1Vals);
hold on; 
p2 = plot(total_t, reverbVals); 
p3 = plot(total_t, Per2Vals); 
p4 = plot(total_t, Cry1Vals); 
p5 = plot(total_t, DbpVals); 
legend('Bmal1','RevErb','Per2','Cry1','Dbp');
set([p1,p2,p3,p4,p5],'LineWidth',2); 
title('Simulation of gene expression of all 5 genes'); 
xlabel('Circadian Time [h]'); 
ylabel('Gene Expression [a.u.]'); 
