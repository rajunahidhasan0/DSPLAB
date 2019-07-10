clc;

inp = [1 1 0 1 1 0 1 0 0 0 0 1 0];
k=1;
t=0;
bitduration=1;
Vlevel = 7;
samplesize = 100;
for j=1:length(inp)
      for i=0:(1/samplesize):bitduration/2
       time(k) = i+t;
        if inp(j)==1
            ans(k)=Vlevel;
         else ans(k)=-Vlevel;
      
         end;
        k = k+1;
  
        end;
            
      for p=i:1/samplesize:bitduration
        time(k)=t+p;
        ans(k)=0;
        k=k+1;
    end;
     t= time(k-1);
end;
   
 plot(time,ans);