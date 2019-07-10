%code for Manchester signal

clc;
close all;
clear all;

A=2;
bitrate=6/2;

%x=[0 1 0 1 0 0 0 1 1 0 1 1 0 0 0 1];
x=[0 1 0 0  1 1]
T=length(x);
n=100;
N=2*n*T*bitrate;
dt=T/N;
t=0:dt:T/bitrate;
y=zeros(1,length(t));
    for i=0:1:(T-1);
        if x(i+1)==1
            y(i*2*n+1 : (2*i+1)*n)=-A;
            y((i*2+1)*n+1 : (2*i+2)*n)=A;
        else
            y(i*2*n+1 : (2*i+1)*n)=A;
            y((2*i+1)*n+1 : (2*i+2)*n)=-A;
        end;
    end;
plot(t,y);
axis([0 t(end) -(A+1) (A+1)]);
grid on;
title('Manchester');

j=1;
 for i=0:2*n:(length(t)-1);
        if y(i+1)==A
            p(j)=0;
        else
            p(j)=1;
        end;
        
        j=j+1;
       
 end;
 p(1:T)
