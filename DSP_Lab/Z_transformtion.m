clear;
clear all;
close all;

x=[1,3,5,7,9];

n=length(x);
y=sym('Z');

b=0;
for i=1:n
    b=b+x(i)*y^(-i);
end

display(b);
