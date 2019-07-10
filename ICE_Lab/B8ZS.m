% AMI with Scrambling B8ZS technique

%         00000000 -> 000VB0VB
clc;
clear;

n=200;
bitrate=2;
pulse=-3;
x=[0 1 0 0 0 0 1 0 0 0 0 0 0 0 0];

T=length(x);
N=n*T*bitrate;
dt=T/N;
p=pulse;
t=0:dt:T/bitrate;
y=zeros(1,length(t));

   for i=0:T-1;
         if x(i+1)==1              
             y(i*n+1 : (i+1)*n)=-pulse;
             pulse=-pulse;
         elseif x(i+1)==2*p  
             y(i*n+1 : (i+1)*n)=pulse;    
         else
             y(i*n+1 : (i+1)*n)=0;
             if (i+7<=T-1 && x(i+2)==0&&x(i+3)==0&&x(i+4)==0&&x(i+5)==0&&x(i+6)==0&&x(i+7)==0&&x(i+8)==0)         
                  x(i+4)=2*p;x(i+7)=2*p;                 
                  x(i+5)=1;x(i+8)=1;
             end;
         end;
   end;
   
plot(t,y);
axis([0 t(end) p-1 -p+1]);
grid on;
title('AMI with Scrambling B8ZS');
  
%Decoding
t=0:dt:T/bitrate;
z=zeros(1,length(x));

   for i=1:n:length(y);
         if (y(i)==p)
             if((i+4*n<=length(y))&&((y(i)==p&&y(i+n)==-p && y(i+2*n)==0 && y(i+3*n)==-p && y(i+4*n)==p)))
                y(i+n)=0;y(i+3*n)=0;y(i+4*n)=0;
             else z(((i-1)/n)+1)=1;
           end;
         elseif y(i)==-p
            if((i+4*n<=length(y))&&(y(i)==-p && y(i+n)==p && y(i+2*n)==0 && y(i+3*n)==p &&y(i+4*n)==-p))              
                y(i+n)=0;y(i+3*n)=0;y(i+4*n)=0;
           else z(((i-1)/n)+1)=1;
           end;
         end;       
   end;
  
z