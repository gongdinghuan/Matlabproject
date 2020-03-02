%模n的大数幂乘函数
function [dashuchenmi]=dashuchenmi(x,r,n);
    a=x;b=r;c=1;
    for i=1:1000
    if b==0
        dashuchenmi=c;
    end
    if mod(b,2)~=0
        b=b-1;
        c=mod(c*a,n);
    else 
        b=b/2;
        a=mod(a*a,n);
    end
end
dashuchenmi=c;

