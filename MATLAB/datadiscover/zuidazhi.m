x=[1 3 5 6 7 10 20 3 6 8];
r=length(x);
for i=1:r-1
	for j=i+1:r
        if x(i)>x(j)
            t=x(j);
            x(j)=x(i);
            x(i)=t;
        end
	end
end
x(end)

