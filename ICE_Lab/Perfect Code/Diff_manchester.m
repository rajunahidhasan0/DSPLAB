
clc;
close all;
clear all;

A=3;
bitrate=1;

%x=[1 0 0 1 0 0 0 1 1 0 1 1 0 0 0 1];
x=[1 0 1 0 0  1 1];
T=length(x);
n=100;

N=2*n*T*bitrate;
dt=T/N;
pulse=-A;
t=0:dt:T/bitrate;
y=zeros(1,length(t));
  for i=0:(T-1);
         if x(i+1)==1
             if pulse==A
                 pulse=-A;
                 y(i*2*n+1 : (2*i+1)*n)=-1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             else
                 pulse=A;
                 y(i*2*n+1 : (2*i+1)*n)=-1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             end;
          else
             if pulse==A
                 pulse=A;
                 y(i*2*n+1 : (2*i+1)*n)=-1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             else
                 pulse=-A;
                 y(i*2*n+1 : (2*i+1)*n)=-1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             end;
         end;
  end;
 
plot(t,y);
axis([0  t(end)  -(A+1)  (A+1)]);
grid on;
title('differential Manchester');


j=0;
tmp=A;
 for i=1:2*n:(length(t));
        if y(i)~=tmp
            j=j+1;
            p(j)=0;
        else
            j=j+1;
            tmp=-tmp;
            p(j)=1;
        end;  
 end;
 p(1:T)

