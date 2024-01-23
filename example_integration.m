clc; clear all; close all

% Integration example with prior p(theta) = 1

t = 0:0.1:1;

y = [0.3573, 0.3618, 0.1920, 0.1585, 0.1041, 0.1100, 0.0560, 0.0291, 0.0252, 0.0249, 0.04160]';

pfun = @(a,b) ifun(a,b,t,y);

% The next hack is because integral2 -function wants it's parameters as matrices

integral_f = @(a,b) arrayfun(pfun,a,b);

% Calculate the evidence p(y) from p(y | theta)

evidence = integral2(integral_f,-inf,inf,-inf,inf);

% Conditional means for a and b

CM_fun_a = @(a,b) a.*integral_f(a,b)/evidence; 
CM_fun_b = @(a,b) b.*integral_f(a,b)/evidence;
CM_pars = [integral2(CM_fun_a,-inf,inf,-inf,inf), integral2(CM_fun_b,-inf,inf,-inf,inf)]