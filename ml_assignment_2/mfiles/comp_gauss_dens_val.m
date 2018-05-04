function [z]=comp_gauss_dens_val(m,S,x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%   [z]=comp_gauss_dens_val(m,S,x)
% This function computes the value of the gaussian distribution N(m,S) at
% the point x.
%
% INPUT ARGUMENTS:
%   m:      an l-dimensional column vector corresponding to the mean of the
%           gaussian distribution.
%   S:      an lxl dimensional matrix that corresponds to the covariance
%           matrix of the gaussian distribution.
%   x:      an l-dimensional column vector where the value of the gaussian
%           distribution will be evaluated.
% OUTPUT ARGUMENTS:
%   z:      the value of the gaussian distribution at x (scalar quantity).
%
% (c) 2008 A. Pikrakis, S. Theodoridis, K. Koutroumbas, D. Cavouras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[l,c]=size(m);
z=(1/( (2*pi)^(l/2)*det(S)^0.5) )*exp(-0.5*(x-m)'*inv(S)*(x-m));