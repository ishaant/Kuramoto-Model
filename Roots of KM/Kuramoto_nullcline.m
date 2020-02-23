h=0.01;
t=0:h:20;
%phi=[a; b; c];
v=[1; 2; 3];
k=2.8;
%psi=[phi(2,1)-phi(1,1); phi(3,1)-phi(1,1)];
%w=[v(2,1)-v(1,1); v(3,1)-v(2,1)];
limit1=0;
limit2=2*pi;
%for(i=1:length(t)-1)
 
f=@(psi21,psi31) v(2)-v(1) +k*(-2*sin(psi21) - sin(psi31) + sin(psi31-psi21));
g=@(psi21,psi31) v(3)-v(1) +k*(-2*sin(psi31) - sin(psi21) + sin(psi21-psi31));
%blue : psi21dot=0
figure
fimplicit(f,'-' , [limit1 limit2 limit1 limit2]);
%title('Combine Plots')
hold on
fimplicit(g, [limit1 limit2 limit1 limit2]);
%plot(x,y2)
%{
x21=0:0.05:2*pi;
x31=0:0.05:2*pi;
for i=x21
    for j=x31
        if(f(i,j)<(10^-50) && g(i,j)<(10^-50))
            disp("Fixed point : ");
            disp(i);
            disp(j);
        %else
            %disp('Not found');
        end
    end
end
%}