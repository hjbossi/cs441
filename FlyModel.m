%Test DDE solver for single DDE

v_sp = 0.5;
k_dp = 0.5;
K_1 = 0.3;
dClock = 0.25;

numSteps = 10; 

P_0 = 0.4;
chunk = 10;
dClockfreevals = [];

for i = 1:numSteps
    tstart = (i-1)*chunk;
    tend = i*chunk;
    tspan = tstart:0.1:tend; 
    % make the final result all in one array
    if i == 1
        total_t = tspan;
    else
        total_t = cat(2,total_t,tspan);
    end

    %Per
    dClockfree = dClock - P_0;
    if dClockfree < 0
        dClockfree = 0;
    end
    R_sp = dClockfree/(K_1+dClockfree);
    dPdt = @(t,Per) v_sp*R_sp - k_dp*Per;
    
    [t,Perval] = ode15s( dPdt, tspan, P_0);
    dCfval = dClock - Perval;
    dClockfreevals = [dClockfreevals, dClockfree];
    % first time through the loop set it to initial vals, all other times
    % concatenate
    if i == 1
        perVals = Perval;
        dCfreeVals = dCfval;
    else
        perVals = cat(1, perVals,Perval);
        dCfreeVals = cat(1,dCfreeVals, dCfval);
    end
      %update the initial conditions for the next time step
    if length(perVals) <= 101
        P_0 = perVals(end);
    else    
        P_0 = perVals(end-101);
    end
    %P_0 = Perval(end);
    
end

figure;
plot(total_t,perVals);
hold on;
plot(total_t,dCfreeVals);
%plot(total_t,dClockfreevals);
legend('[Per]','[dClockfree]')
ylim([0 0.5])