
%������
clc
clear

fid=input('��������ܵ�����','s');
f = abs(fid);
p=input('�����һ��������');
q=input('����ڶ���������');
n=p*q;
fain=(p-1)*(q-1);
e=floor(unifrnd(0, fain,1,1));
while (gcd(e,fain)~=1)|(e<2)
     e=floor(unifrnd(0, fain,1,1));
end
d=moni(e,fain);
for i=1:length(f)
    miwen(i)=setstr(dashuchenmi(f(i),e,n));
end
for i=1:length(f)
       mingwen(i)=setstr(dashuchenmi(miwen(i),d,n));
end
miwen
mingwen