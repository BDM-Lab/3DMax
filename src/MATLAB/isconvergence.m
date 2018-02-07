function [ converge ] = isconvergence(change, cost, NEAR_ZERO)
%% check if the size of derivatives/gradient is close to zero
    converge = 0;
    SUM = 0;
    sq_change = change.^2;
    SUM  = sum(sq_change);
    SUM  = sqrt(SUM);

    if (SUM < (NEAR_ZERO * abs(cost)))
        converge = 1;
    end


end

