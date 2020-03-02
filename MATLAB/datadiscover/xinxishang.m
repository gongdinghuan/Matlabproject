fs=12000;
N=12000;
T=1/fs;
t=(0:N-1)*T;
ff=104;
sig=0.5*(1+sin(2*pi*ff*t)).*sin(2*pi*3000*t)+rand(1,length(t));
Hx=yyshang(sig,10)
 
%???????求一维离散序列信息熵matlab代码
function Hx=yyshang(y,duan)
%不以原信号为参考的时间域的信号熵
%输入：maxf:原信号的能量谱中能量最大的点
%y:待求信息熵的序列
%duan:待求信息熵的序列要被分块的块数
%Hx:y的信息熵
%duan=10;%将序列按duan数等分，如果duan=10,就将序列分为10等份
x_min=min(y);
x_max=max(y);
maxf(1)=abs(x_max-x_min);
maxf(2)=x_min;
duan_t=1.0/duan;
jiange=maxf(1)*duan_t;
% for i=1:10
% pnum(i)=length(find((y_p>=(i-1)*jiange)&(y_p<i*jiange)));
% end
pnum(1)=length(find(y<maxf(2)+jiange));
for i=2:duan-1
    pnum(i)=length(find((y>=maxf(2)+(i-1)*jiange)&(y<maxf(2)+i*jiange)));
end
pnum(duan)=length(find(y>=maxf(2)+(duan-1)*jiange));
%sum(pnum)
ppnum=pnum/sum(pnum);%每段出现的概率
%sum(ppnum)
Hx=0;
for i=1:duan
    if ppnum(i)==0
        Hi=0;
    else
        Hi=-ppnum(i)*log2(ppnum(i));
    end
    Hx=Hx+Hi;
end
end
