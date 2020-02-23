

% Running part

clc, clf, clear, close all
clear all

N=3;   % num of oscillators

K=3;    % Coupling strength.

h=0.1;

iter=5000;

t=0:h:h*iter;

theta=zeros(N,iter);

theta(:,1)=2*pi*rand(N,1);

Omega=rand(N,1);

Omega =[1;2;3];

	for j=1:iter


				k1=kuramoto(theta(:,j),K,N,Omega);

				k2=kuramoto(theta(:,j)+0.5*h*k1,K,N,Omega);

				k3=kuramoto(theta(:,j)+0.5*h*k2,K,N,Omega);           % Runge-Kutta

				k4=kuramoto(theta(:,j)+h*k3,K,N,Omega);

				 

				theta(:, j+1)=theta(:,j)+(h/6)*(k1+2*k2	+2*k3+k4);

				 
				 x=cos(theta(:,j));
				 
				 y=sin(theta(:,j));
				  
				 s=linspace(0,2*pi,100);
				  
				 cx=cos(s);
				  
				 cy=sin(s);
	end
     
  
%   plot(x,y,'O',cx,cy)
%   
%   axis([-1 1 -1 1])									%Dynamic Plot
%   
%   axis square
%  
%   drawnow
						mod(theta(2,iter)-theta(1,iter),2*pi)
						mod(theta(3,iter)-theta(1,iter),2*pi)
						%  figure
						subplot(2,1,1)
						plot (mod(theta(1,:)-theta(2,:),2*pi));					%Plotting Phase Differences
						hold on
						subplot(2,1,2)
						plot (mod(theta(1,:)-theta(3,:),2*pi));
						hold on
						%  end 

