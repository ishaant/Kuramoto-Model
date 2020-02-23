function [f] = F(~)
%MFUN calculates and returns the negative of the 'function vector'
%evaluated at x

global N;
global Omega;
global K;
global psi;

f= zeros(N-1,1);

for i=2:N
    f(i-1,1) = (Omega(i,1)-Omega(1,1));
    for j=1:N
    f(i-1,1) = f(i-1,1)+ (K/N)*(sin(psi(j,1)-psi(i,1))-sin(psi(j,1)));
    end
end
end