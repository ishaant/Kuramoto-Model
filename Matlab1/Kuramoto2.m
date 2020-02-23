% Simulation of Kuramoto's model (Chapter 6, Box A)
% Written by Joakim Munkhammar 
%

clear;

% N is i, the number of individuals in
% the collective (N>1 required))
N=80;

% Total number of timesteps
T=200

% The range for coupling constant K
% Setting up the vector of Ktot
Klow = 0;
Kup = 3.5;
Kstep = 0.05;
totsteps = round((Kup-Klow)/Kstep);
Ktot(1) = Klow;
for i=2:totsteps;
    Ktot(i) =  Ktot(i-1)+Kstep;
end

%Time step size. As tau -> 0 approximation of continumm model improves
tau=0.1

% w is defined as w(i), time independent
% Initial condition for w, initial distribution 
% Standard is normal distribution (Scaled) but
% Centered about zero. Unimodal with infinite tail.

% Initial conditions for initial distribution
% The distribution parameter gamma
gamma=1;

% The width of the distribution
lower=-10;
upper=10;


for run=1:10

    run
    
% Initial conditions with normal distribution for w
sigN=1; 
w = random('Normal',0,sigN,1,N);% Random on initial conditions

% The bifurcation loop
for Steps=1:totsteps
    %Steps;
    % Setting the value of K each lap
    K=Klow+ Steps*Kstep;
    
    % theta is defined as theta(time,i)
    % Here initial conditions for theta
    for i=1:N
        theta(1,i)=w(i);
    end

    % Attempting to calculate r (Phase coherence between 0 and 1) 
    % and phi (Average angle) for the first steps of time
    rx=0;
    ry=0;
    phi(1)=0;
    for i=1:N
        phi(1) = phi(1) + (1/N)*theta(1,i); % Calculation mean angle phi
        rx=rx+(1/N)*cos(theta(1,i)); % Sum of mean x-part of theta
        ry=ry+(1/N)*sin(theta(1,i)); % Sum of mean y-part of theta
    end
    r(1) = sqrt(rx*rx + ry*ry);
    r(2) = r(1);
    phi(2)=phi(1);

    % The main loop
    for t=2:T
        % Initial conditions each timestep in the loop
        rx=0;
        ry=0;
        phi(t+1)=0;
        % The loop of individuals
        for i=1:N
            % Main equation
            theta(t,i) = theta(t-1,i) + tau*(w(i) + K*r(t)*sin(phi(t)-theta(t-1,i)));
            rx=rx+(1/N)*cos(theta(t,i)); % Sum of mean x-part of theta
            ry=ry+(1/N)*sin(theta(t,i)); % Sum of mean y-part of theta
            % Calculating mean angle phi for next step of time
            phi(t+1) = phi(t+1) + (1/N)*theta(t,i);
        end
    
        r(t+1) = sqrt(rx*rx + ry*ry); % Calculating total mean radius
    end
    % Assigning the final value of r at each K to rtot
    rtot(run,Steps) = mean(r(T-100:T+1));
    storew(Steps,:)=w + K*r(t)*sin(phi(t)-theta(t-1,:));
end

end

%pdf: g(0) and g''(0)for Normal distribution
g0=1/(sigN*sqrt(2*pi))

%The following can be used in symbolic matlab
%syms xa sigma pi
%f = 1/(sqrt(2*pi)*sigma)*exp(-xa^2/(2*sigma^2)) 
%subs(diff(diff(f)),{xa},{0})
%g20=subs(diff(diff(f)),{xa,sigma},{0,sigN})

%Ktot2=[Klow:0.001:Kup]
%K0=subs(2/(g0*pi))
%ar1=real(sqrt(16/(subs(pi)*K0^3))*sqrt(((Ktot2-K0)/K0)/(-g20)))
%ar2=real(sqrt(2^(9/2)*sigN^3/(sqrt(subs(pi))*K0^3))*sqrt((Ktot2-K0)/K0))
%ar=real(subs(sqrt(pi))*sqrt((Ktot2-K0)/K0));

% Plotting the radius r (coherence) over K as bifurcation diagram
figure(1)
hold off
plot(Ktot,mean(rtot),'k')%b
hlx=xlabel('Coupling strength: K');
hly=ylabel('Average Coherence: r');
% Plotting Kuramotos analytical results
% only with symbolic toolbox
%hold on;
%plot(Ktot2,ar,'k:')
axis([Klow Kup -0.05 1])


figure(2)
%% Plotting inititial distribution of w(i)
subplot(2,1,1)
hist(w,[-4:0.05:4])
axis([-4 4 0 50])
title('Kuramotos model');
hlx=xlabel('i');
hly=ylabel('g(w) probability density');

%% Plotting final distribution of w(i)
subplot(2,1,2)
hist(storew(46,:),[-4:0.05:4])
axis([-4 4 0 50])
hlx=xlabel('i');
hly=ylabel('g(w) probability density');
%
%figure(3)
%plot(phi)