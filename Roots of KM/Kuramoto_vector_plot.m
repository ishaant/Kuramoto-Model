clear all;
h=0.01;
t=0:h:20;
%phi=[a; b; c];
v=[1; 2; 3];
k=2;
%psi=[phi(2,1)-phi(1,1); phi(3,1)-phi(1,1)];
%w=[v(2,1)-v(1,1); v(3,1)-v(2,1)];
limit1=0;
limit2=4;
limit3=0;
limit4=2;
 
f=@(psi21,psi31) v(2)-v(1) +k*(-2*sin(psi21) - sin(psi31) + sin(psi31-psi21));
g=@(psi21,psi31) v(3)-v(1) +k*(-2*sin(psi31) - sin(psi21) + sin(psi21-psi31));

%X=[limit1:h:limit2;limit1:h:limit2];
X=[limit1:h:limit2;limit1:h:limit2];

for i=1:length(X)
    for j=1:length(X)
        dpsi21(i,j)=f(X(1,i),X(2,j));
        dpsi31(i,j)=g(X(1,i),X(2,j));
        %{
        if(dpsi21<10^-2)
            if(dpsi31<10^-2)
            disp(X(1,i),X(2,j));
            end
        else
            %disp('NF');
        end
        %}
    end
end
quiver(X(1,:),X(2,:),dpsi21,dpsi31);