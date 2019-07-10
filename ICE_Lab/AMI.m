
%Bipolar AMI
clc;
clear;

bitrate=2;
A=1;
pulse=-A;
x=[0 1 0 1 0 0 0 1 1 0 1 1 0 0 0 1];
T=length(x);
n=200;
N=n*T*bitrate;
dt=T/N;

%t=0:dt:T;
t=0:dt:T/bitrate;


y=zeros(1,length(t));
for i=0:T-1;
    if x(i+1)==A
        y(i*n+1 : (i+1)*n)=-pulse;
        pulse=-pulse;
     else
           y(i*n+1 : (i+1)*n)=0;
     end;
end;

plot(t,y);
axis([0 t(end) -(A+1) (A+1)]);
grid on;
title('Bipolar AMI');

%Decoding
pulse=-A;
z=zeros(1,length(x));
for i=1:T;
    if y((i-1)*200+1)~=0
           z(i)= A; 
    end
end
z
