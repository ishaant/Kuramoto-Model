clf, clear, close all
clear all

global N;
N=3;   % num of oscillators

global K;

K=2.8*3;    % Coupling strength.



global psi;

psi=zeros(N,1);

global Omega;
%Omega=rand(N,1); % Random Omegas

Omega = [1;2;3]; % Predefined Omegas

%   theta=rand(3,1);
%   theta(:,1)=[1;2;3];
%   
%          for i=1:N
%                 psi(i,1)=theta(i,1)-theta(1,1);       %Psis constant
%         
%          end

Root = zeros(50,2);
for l = 1:200
     theta=zeros(N,1);
     theta(:,1)=2*pi*rand(N,1);
         for i=1:N
             for j=1:N
                 psi(i,j)=theta(i,1)-theta(j,1); %Psi(s) randomised in each loop
             end
         end
         
       %  psi(2,1)=3.5;
        % psi(3,1)=1;

 [root, count] = NR_Multi([psi(2,1); psi(3,1)], 0.00001,@F,@J);
%[root, count] = NR_Multi([ 0.7215; 1.6821], 0.00001,@F,@J);
Root(l,1)= mod(root(1,1),2*pi);
Root(l,2)= mod(root(2,1),2*pi);
end
C = unique(Root,'rows')

% filename= strcat(num2str(100*K/3),'values.xlsx')
% xlswrite(filename,C)

