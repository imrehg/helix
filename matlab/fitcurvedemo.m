function [estimates, sse] = fitcurvedemo(c,R,z,B)
% Call fminsearch with a random starting point.

options = optimset('Display','iter','MaxIter',200);
%    options = optimset('Display','iter','MaxIter',200);
%    estimates = lsqnonlin(@(c) errfun(c,R,z,B),c, -inf, inf,options);
%    estimates = fminsearch(@(c) errfun(c,R,z,B),c, options);
estimates = fminunc(@(c) errfun(c,R,z,B),c, options);
%    estimates = ga(@(c) errfun(c,R,z,B),c);
sse = errfun(estimates,R,z,B);
end

function sse = errfun(c,R,z,B)
    FittedCurve = helix(c,R,z);
    ErrorVector = FittedCurve - B;
    sse = sum(ErrorVector.^ 2);
end
