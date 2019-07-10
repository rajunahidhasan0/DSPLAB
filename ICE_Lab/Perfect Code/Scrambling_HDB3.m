    
% AMI with Scrambling HDB3 technique

%         odd, 0000 -> 000V      even, 0000 -> B00V
clc;
clear;

n=200;
bitrate=2;
pulse=-3;
x=[1 1 0 0 0 0 0 0 0 0 0 0 1 0 0];

T=length(x);
np=0;
N=n*T*bitrate;
dt=T/N;
p=pulse;

t=0:dt:T/bitrate;
y=zeros(1,length(t));

   for i=0:T-1;
         if x(i+1)==1              
             y(i*n+1 : (i+1)*n)=-pulse;
             pulse=-pulse;
             np=np+1;
         elseif x(i+1)==2*p  
             y(i*n+1 : (i+1)*n)=pulse;   
              np=np+1; 
         else
             if (mod(np,2)==0 && i+3<=T-1 && x(i+2)==0&&x(i+3)==0&&x(i+4)==0)         
                  y(i*n+1 : (i+1)*n)=-pulse;
                  pulse=-pulse;
                  np=np+1;
                  x(i+2)=0;x(i+3)=0;
                  x(i+4)=2*p;               
             elseif (mod(np,2)==1 && i+3<=T-1 && x(i+2)==0&&x(i+3)==0&&x(i+4)==0)         
                  x(i+2)=0;x(i+3)=0;                 
                  x(i+4)=2*p;
             end;
         end;
   end;
   
plot(t,y);
axis([0 t(end) p-1 -p+1]);
grid on;
title('AMI with Scrambling HDB3');
  
%Decoding
t=0:dt:T/bitrate;
np=0;
z=zeros(1,length(x));

   for i=1:n:length(y);
         if (y(i)==p)
             if(mod(np,2)+1==1 && (i+4*n<=length(y))&&((y(i)==p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==0 && y(i+4*n)==p)))
                y(i+n)=0; y(i+2*n)=0; y(i+3*n)=0;y(i+4*n)=0; z(((i-1)/n)+1)=1; np=np+1; np=np+1;
                
             elseif(mod(np,2)==0&&(i+3*n<=length(y))&&((y(i)==p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==p)))
                y(i+n)=0;y(i+2*n)=0;y(i+3*n)=0; np=np+1;np=np+1;
                
             else z(((i-1)/n)+1)=1; np=np+1;
             end;
         elseif y(i)==-p
            if(mod(np,2)+1==1 &&(i+4*n<=length(y))&&((y(i)==-p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==0 && y(i+4*n)==-p)))
                y(i+n)=0; y(i+2*n)=0; y(i+3*n)=0;y(i+4*n)=0; z(((i-1)/n)+1)=1; np=np+1;np=np+1;
                
            elseif(mod(np,2)==0&&(i+3*n<=length(y))&&((y(i)==-p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==-p)))
                y(i+n)=0;y(i+2*n)=0;y(i+3*n)=0; np=np+1;np=np+1;
                
            else z(((i-1)/n)+1)=1; np=np+1;
            end;
         end;       
   end;
  
z
  