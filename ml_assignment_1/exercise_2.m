% Initialization of the random number generator for normal distr.
randn('seed',0)

% A priori class probabilities
P1 = 0.5;
P2 = 0.5;
% Mean of normal distributions
m1 = 1;
m2 = 4;
% Variance of the normal distributions
s = 1;
% Total number of points (Give only even numbers)
N = 10000; 

% The vector containing the set of points (1st half from 1st class)
Y = [randn(1,N/2)+m1 randn(1,N/2)+m2];

% The vector containing the true class labels for the points (if t(i)=1(2), the
% i-th point comes from class 1(2))
t = [ones(1, N/2) 2*ones(1, N/2)];

% Vector containing the class labels of
output = [];

for i=1 :N
    %Computation of the pdfs for both classes on the specific data points
    p1 = (1/(sqrt(2*pi)*s))*exp(-(Y(i)-m1)^2/(2*s));
    p2 = (1/(sqrt(2*pi)*s))*exp(-(Y(i)-m2)^2/(2*s));
    % Application of the Bayes rule
    if(P1*p1 > P2*p2)
        output = [output 1];
    else
        output = [output 2];        
    end
end

% Check for the points that are not classified correctly.
% if bayes_res(i)=0 then the i-th point is correctly classified
bayes_res = (t~=output); 

disp(bayes_res);

errors = sum(bayes_res);
disp("Errors: " + errors);
