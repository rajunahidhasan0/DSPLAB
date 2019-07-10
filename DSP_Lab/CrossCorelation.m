% given x(n), y(n), find rxy(l)

clc;
clear;
x=[2, -1, 3, 7, 1, 2, -3];
y=[1, -1, 2, -2, 4, 1, -2, 5];
mx=5;
my=5;

for l=-7:0
   rxy(l+8)=0;
   ll=1;
   if(length(x)<length(y)+l)
       ul=length(x);
   else ul=length(y)+l;
   end
   i=-l+1;
   for n=ll:ul
       rxy(l+8) = rxy(l+8) + x(n)*y(i);
       i=i+1;
   end
end


for l=1:6
   rxy(l+8)=0;
   ll=l+1;
   if(length(x)<length(y)-l)
       ul=length(x);
   else ul=length(y)-l;
   end
   ul=length(x);
   i=1;
   for n=ll:ul
       rxy(l+8) = rxy(l+8) + x(n)*y(i);
       i=i+1;
   end
end
rxy