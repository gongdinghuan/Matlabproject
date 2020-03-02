x=[9 8 7 6 7 8 9];
r=length(x);
sum=0;n=0;sum2=0;
for i=1:r
	
        sum=sum+x(i);
      
end
sum
av=sum/r;
av
for j=1:r
    n=(x(i)-av)*(x(i)-av);
    sum2=sum2+n;
    
end
x1=sum2/r;
x1

