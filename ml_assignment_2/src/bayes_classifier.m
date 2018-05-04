function [z]=bayes_classifier(m,S,P,X)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%   [z]=bayes_classifier(m,S,P,X)
% This function classifies a set of data points to one out of c classes,
% which are modelled by Gaussian distributions, using the Bayesian
% classification rule.
%
% INPUT ARGUMENTS:
%   m:      an lxc dimensional matrix, whose j-th column is the mean of the
%           j-th class.
%   S:      an lxlxc dimensional matrix whose j-th "slice" corresponds to
%           the covariance matrix of the normal distribution of the j-th
%           class. 
%   P:      a c-dimensional vector whose j-th component is the a priori
%           probability of the j-th class.
%   X:      An lxN dimensional matrix whose columns are the data vectors to
%           be classified.
%
% OUTPUT ARGUMENTS
%   z:      an N-dimensional vector whose i-th component contains the label
%           of the class where the i-th data vector is assigned.
%
% (c) 2008 A. Pikrakis, S. Theodoridis, K. Koutroumbas, D. Cavouras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    [l,c]=size(m);
    [l,N]=size(X);
    
    for i=1:N
       for j=1:c
          t(j)=P(j)*comp_gauss_dens_val(m(:,j),S(:,:,j),X(:,i));
       end
       [num,z(i)]=max(t);
    end
    