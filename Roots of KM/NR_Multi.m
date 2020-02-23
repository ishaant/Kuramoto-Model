% Function for finding root in multidimensional case using Newton-Raphson 
% method. The code should work when the initial guess is close to one of 
% the roots.
function [Root, Count] = NR_Multi(X_initial, Tol, Fun, Jacob)

Error = 10*Tol;   %Initializing Error variable to be larger than Tol
Count = 0;
%Initializing the Count variable
%delta = 100;
%Count_max = 200;   %Maximum value of Count beyond which search is terminated
global psi;
global N;

while Error > Tol
           Count = Count + 1;
        dX = linsolve(Jacob(X_initial),-1*Fun(X_initial));
        X_new = X_initial + dX;
        Error = norm(dX)/norm(X_new);
        X_initial = X_new;
    for i=2:N
        psi(i,1) = X_new(i-1,1);
    end
    %delta = norm(F(psi));

end

Root = X_initial; %Storing the final value of the root

end