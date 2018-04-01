%(a)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [1 0; 0 1];
N = 500;
X = mvnrnd(m,S,N)';

figure(1), plot(X(1,:), X(2,:), '.');
figure(1), axis equal
figure(1), axis([-7 7 -7 7])

%###########################################

%(b)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [0.2 0; 0 0.2];
N = 500;
X = mvnrnd(m,S,N)';

figure(2), plot(X(1,:), X(2,:), '.');
figure(2), axis equal
figure(2), axis([-7 7 -7 7])

%###########################################

%(c)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [2 0; 0 2];
N = 500;
X = mvnrnd(m,S,N)';

figure(3), plot(X(1,:), X(2,:), '.');
figure(3), axis equal
figure(3), axis([-7 7 -7 7])

%##########################################

%(d)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [0.2 0; 0 2];
N = 500;
X = mvnrnd(m,S,N)';

figure(4), plot(X(1,:), X(2,:), '.');
figure(4), axis equal
figure(4), axis([-7 7 -7 7])

%###########################################

%(e)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [2 0; 0 0.2];
N = 500;
X = mvnrnd(m,S,N)';

figure(5), plot(X(1,:), X(2,:), '.');
figure(5), axis equal
figure(5), axis([-7 7 -7 7])

%###########################################

%(st)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [1 0.5; 0.5 1];
N = 500;
X = mvnrnd(m,S,N)';

figure(6), plot(X(1,:), X(2,:), '.');
figure(6), axis equal
figure(6), axis([-7 7 -7 7])

%###########################################

%(z)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [0.3 0.5; 0.5 2];
N = 500;
X = mvnrnd(m,S,N)';

figure(7), plot(X(1,:), X(2,:), '.');
figure(7), axis equal
figure(7), axis([-7 7 -7 7])

%###########################################

%(h)
%Initialization of randn function
randn('seed',0);
m = [0,0];
S = [0.3 -0.5; -0.5 2];
N = 500;
X = mvnrnd(m,S,N)';

figure(8), plot(X(1,:), X(2,:), '.');
figure(8), axis equal
figure(8), axis([-7 7 -7 7])

%###########################################
