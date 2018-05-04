% Initialization of the random number generator for normal
randn('seed',0)

% The parameters of the distributions
m1 = 1; 
m2 = 3;
s = 1;

% Generation of X1
N1 = 15;
%N1 = 500;
X1 = randn(1,N1)+m1;

% Generation of X2
N2 = 15;
%N2 = 500;
X2 = randn(1,N2)+m2;

% Generation of Y
% Initialization that guarantees that the same set Y will be produced.
randn('seed',100) 
N = 1000;
Y = [randn(1,N/2)+m1 randn(1,N/2)+m2];
t = [ones(1,N/2) 2*ones(1,N/2)];

% Maximum likelihood estimates of the means
m1_ML = sum(X1)/N1;
m2_ML = sum(X2)/N2;

% Estimation of the a priori probabilities
P1 = N1/(N1+N2);
P2 = N2/(N1+N2);

% Bayes rule for the case where the true means are used
output = [];
for i=1:N
    p1 = (1/(sqrt(2*pi)*s))*exp(-(Y(i)-m1)^2/(2*s));
    p2 = (1/(sqrt(2*pi)*s))*exp(-(Y(i)-m2)^2/(2*s));
    % Application of the Bayes rule
    if(P1*p1>P2*p2)
        output = [output 1];
    else
        output = [output 2];
    end
end
% if bayes_res(i)=1 then the i-th point is correctly classified
bayes_res = (t~=output);

errors_bayes = sum(bayes_res);
disp("Errors Bayes: " + errors_bayes);


% Bayes rule for the case where the estimated means are used
output_ML = [];
for i=1:N
    p1 = (1/(sqrt(2*pi)*s))*exp(-(Y(i)-m1_ML)^2/(2*s));
    p2 = (1/(sqrt(2*pi)*s))*exp(-(Y(i)-m2_ML)^2/(2*s));
    % Application of the Bayes rule
    if(P1*p1>P2*p2)
        output_ML = [output_ML 1];
    else
        output_ML = [output_ML 2];
    end
end
% if point is correctly classified bayes_res_ML(i)=1 then the i-th
bayes_res_ML = (t~=output_ML); 

errors_bayes_ML = sum(bayes_res_ML);
disp("Errors Bayes ML: " + errors_bayes_ML);
