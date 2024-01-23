function integ_f = ifun(a,b, t,y)
    sigma = 0.02;
    diff = y-a*exp(-b*t)';
    N = length(y);
    inverse_C = eye(N)/sigma.^2;
    % When you want to take different prior, modify this (BayesianInference.pdf: formula 2.4)
    integ_f = exp(- 0.5*diff'*inverse_C*diff); 
end