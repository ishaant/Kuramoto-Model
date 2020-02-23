clear all;
clc;

n=3;
K=1.5;
w1=1.8;
w2=2.4;
w3=3;



fx1 =@(x1,x2,x3,t) w1 + (K/n)*(sin(x2-x1)+sin(x3-x1));
fx2 =@(x1,x2,x3,t) w2 + (K/n)*(sin(x3-x2)+sin(x1-x2));
fx3 =@(x1,x2,x3,t) w3 + (K/n)*(sin(x1-x3)+sin(x2-x3));

t(1)=0;
x1(1) = 1;
x2(1) = 1.3;
x3(1) = 1.8;

% Step Size
 h = 0.1;
 tfinal = 50;
 N =ceil(tfinal/h);
 
 %loop
for i=1:N
    t(i+1)=t(i)+h;
    %Update
    k1x1= fx1(x1(i),x2(i),x3(i),t(i));
    k1x2= fx1(x1(i),x2(i),x3(i),t(i));
    k1x3= fx1(x1(i),x2(i),x3(i),t(i));
    k2x1= fx1(x1(i)+h/2*k1x1,x2(i)+h/2*k1x2,x3(i)+h/2*k1x3,t(i)+h/2);
    k2x2= fx2(x1(i)+h/2*k1x1,x2(i)+h/2*k1x2,x3(i)+h/2*k1x3,t(i)+h/2);
    k2x3= fx3(x1(i)+h/2*k1x1,x2(i)+h/2*k1x2,x3(i)+h/2*k1x3,t(i)+h/2);
    k3x1= fx1(x1(i)+h/2*k2x1,x2(i)+h/2*k2x2,x3(i)+h/2*k2x3,t(i)+h/2);
    k3x2= fx1(x1(i)+h/2*k2x1,x2(i)+h/2*k2x2,x3(i)+h/2*k2x3,t(i)+h/2);
    k3x3= fx1(x1(i)+h/2*k2x1,x2(i)+h/2*k2x2,x3(i)+h/2*k2x3,t(i)+h/2);
    k4x1= fx1(x1(i)+h/2*k3x1,x2(i)+h*k3x2,x3(i)+h*k3x3,t(i)+h);
    k4x2= fx1(x1(i)+h*k3x1,x2(i)+h*k3x2,x3(i)+h*k3x3,t(i)+h);
    k4x3= fx1(x1(i)+h*k3x1,x2(i)+h*k3x2,x3(i)+h*k3x3,t(i)+h);
    x1(i+1)=x1(i) + h/6*(k1x1 +2*k2x1+k2x1*k3x1+k4x1);
    x2(i+1)=x2(i) + h/6*(k1x2 +2*k2x2+k2x2*k3x2+k4x2);
    x3(i+1)=x3(i) + h/6*(k1x3 +2*k2x3+k2x3*k3x3+k4x3);
end


%PLot
plot(t,x1-x2)
hold on 
plot (t,x2-x3)
hold on 
plot (t,x3-x1)
xlabel('Time')
ylabel('Phase')

    