function [J] = J(~)
%JACOB computes the Jacobian matrix at x

global N;
global K;
global psi;

J= zeros(N-1,N-1);
for i=2:N
    for k=2:N
J(i-1,k-1) = (K/N)*(cos(psi(k,1)-psi(i,1))-cos(psi(k,1)));

    end
end
for i=2:N
    J(i-1,i-1) = (K/N);
    for k=1:N
    J(i-1,i-1) = J(i-1,i-1) - (K/N)*(cos(psi(k,1)-psi(i,1)));
    end
end
end


