function [d]=moni(u,n)
    n1=n;n2=u;b1=0;b2=1;
    for i=1:1000
        q=floor(n1/n2);
        r=n1-q*n2;
        if r~=0
            n1=n2;
            n2=r;
            t=b2;
            b2=b1-q*b2;
            b1=t;
        else 
            break
        end
    end
    if n2~=1
        warning('所求的模逆不存在') ; 
    end
    if n2==1
        d=mod(b2,n);
       % return ;
end