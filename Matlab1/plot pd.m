

% Running part

clc, clf, clear, close all
clear all

N=20;   % num of oscillators

K=5;    % Coupling strength.

h=0.1;

iter=5000;

t=0:h:h*iter;

theta=zeros(N,iter);

theta(:,1)=2*pi*rand(N,1);

Omega=rand(N,1);

for j=1:iter


k1=kuramoto(theta(:,j),K,N,Omega);

k2=kuramoto(theta(:,j)+0.5*h*k1,K,N,Omega);

k3=kuramoto(theta(:,j)+0.5*h*k2,K,N,Omega);           % Runge-Kutta

k4=kuramoto(theta(:,j)+h*k3,K,N,Omega);

 

theta(:, j+1)=theta(:,j)+(h/6)*(k1+2*k2+2*k3+k4);


end
for i=1:N
    del(i,:)=theta(i,:)-theta(1,:);
end
plot(t,del);

