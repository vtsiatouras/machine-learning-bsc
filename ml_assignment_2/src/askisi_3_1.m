%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            %1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close('all');
clear;

m(:,1)=[0 0]';
m(:,2)=[7 7]';

S1=2*eye(2);
S2=0.2*eye(2);

P=[1/2 1/2];

% Generate X1 and the required class labels
N1=200;
randn('seed',0)
X1=[mvnrnd(m(:,1),S1,fix(N1/2)); mvnrnd(m(:,2),S2,N1-fix(N1/2))]';
z1=[ones(1,fix(N1/2)) -1*ones(1,N1-fix(N1/2))];

% Generate X2 and the required class labels
N2=200;
%N2=10000 % for X3
%N2=100000 % for X4
randn('seed',100)
X2=[mvnrnd(m(:,1),S1,fix(N2/2)); mvnrnd(m(:,2),S2,N2-fix(N2/2))]';
z2=[ones(1,fix(N2/2)) -1*ones(1,N2-fix(N2/2))];


% Compute the Bayesian classification error based on X2
S_true(:,:,1)=S1;
S_true(:,:,2)=S2;
[z]=bayes_classifier(m,S_true,P,X2);
err_Bayes_true=sum(z~=z2)/sum(N2)

% Compute the classification error of the LS classifier based on X2
[w]=SSErr(X1,z1,0);
SSE_out=2*(w'*X2>0)-1;
err_SSE=sum(SSE_out.*z2<0)/sum(N2)

figure(1)
hold on
scatter(X1(1,z1==1),X1(2,z1==1),'bo')
scatter(X1(1,z1==-1),X1(2,z1==-1),'r.')
plot(w'*X1)
hold off
figure(1), axis equal
