% Initialization of the random number generator
randn('seed',0)

% Mean vectors
m1 = [0 0 0]'; 
m2 = [0.5 0.5 0.5]';
m = [m1 m2];

% Covariance matrix
S = [0.8 0.01 0.01; 0.01 0.2 0.01; 0.01 0.01 0.2]; 
% Number of data vectors (only even numbers)
N = 10000; 

% Generation of the data set
% Y is an 3xN matrix
Y = [mvnrnd(m1',S,N/2); mvnrnd(m2',S,N/2)]'; 

% Class labels (if (t(i)=1(2), the i-th vector is from class 1(2))
t = [ones(1,N/2) 2*ones(1,N/2)];

% Application of the Euclidean classifier
out_eucl = euclidean_classifier(m,Y);
eucl_res = (t~=out_eucl); 
% disp(eucl_res);

errors_eucl = sum(eucl_res);
disp("Euclidean distance errors: " + errors_eucl);

% Application of the Mahalanobis classifier
out_maha = mahalanobis_classifier(m,S,Y);
maha_res = (t~=out_maha); 
%disp(maha_res);

errors_maha = sum(maha_res);
disp("Mahalanobis distance errors: " + errors_maha);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
% [z]=euclidean_classifier(m,X)
% This function classifies a set of data vectors in one out of c possible
% classes, according to the Euclidean classifier.
%
% INPUT ARGUMENTS:
% m: an lxc dimensional matrix, whose i-th column corresponds to the
% mean of the i-th class.
% X: an lxN dimensional matrix whose columns are the data vectors to
% be classified.
%
% OUTPUT ARGUMENTS
% z: an N-dimensional vector whose i-th component contains the label
% of the class where the i-th data vector has been assigned.
%
% (c) 2008 A. Pikrakis, S. Theodoridis, K. Koutroumbas, D. Cavouras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [z]=euclidean_classifier(m,X)
    [l,c] = size(m);
    [l,N] = size(X);
    for i=1:N
        for j=1:c
            de(j) = sqrt((X(:,i)-m(:,j))'*(X(:,i)-m(:,j)));
        end
        [num,z(i)] = min(de);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
% [z]=mahalanobis_classifier(m,S,X)
% This function classifies a set of data vectors in one out of c possible
% classes, according to the Mahalanobis classifier.
%
% INPUT ARGUMENTS:
% m: an lxc dimensional matrix, whose i-th column corresponds to the
% mean of the i-th class
% S: an lxl dimensional matrix which corresponds to the matri
% involved in the Mahalanobis distance (when the classes have
% the same covariance matrix, S equals to this common covariance
% matrix).
% X: an lxN dimensional matrix, whose columns are the data vectors
% to be classified.
%
% OUTPUT ARGUMENTS
% z: an N-dimensional vector whose i-th component contains the label
% of the class where the i-th data vector has been assigned.
%
% (c) 2008 A. Pikrakis, S. Theodoridis, K. Koutroumbas, D. Cavouras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function z=mahalanobis_classifier(m,S,X)
    [l,c] = size(m);
    [l,N] = size(X);
    for i=1:N
        for j=1:c
            dm(j) = sqrt((X(:,i)-m(:,j))'*inv(S)*(X(:,i)-m(:,j)));
        end
        [num,z(i)] = min(dm);
    end
end
