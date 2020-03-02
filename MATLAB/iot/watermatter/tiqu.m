clear;
load key
X=double(imread('lenaattack.jpg'));%'Watermaked Image'
%X=double(imread('lenaattack2.jpg'));
%X=imnoise(X,'gaussian',0,0.02);

[XCsource,XSsource]=wavedec2(X,3,'db1');
low=XCsource(1:4096);
lowarray=reshape(XCsource(1:4096),64,64);
std=result;

for i = 1:64    
    ref1(i)=mean(lowarray(:,i));
    ref2(i)=mean(lowarray(i,:));
    for j=1:64
        pick(i,j,1)=xor(std(i,j,1),(lowarray(i,j)>ref1(i)));
        pick(i,j,2)=xor(std(i,j,2),(lowarray(i,j)>ref2(i)));        
    end

end
for i=1:4096
    ref3tmp=[XCsource(16381+4*i:16384+4*i)];
    ref3(i)=mean(ref3tmp);
    ref4tmp=[XCsource(32765+4*i:32768+4*i)];
    ref4(i)=mean(ref3tmp);
    ref5tmp=[XCsource(49149+4*i:49152+4*i)];
    ref5(i)=mean(ref5tmp);
    ref6tmp=[XCsource(65521+16*i:65536+16*i)];
    ref6(i)=mean(ref6tmp);
    ref7tmp=[XCsource(131057+16*i:131072+16*i)];
    ref7(i)=mean(ref7tmp);
    ref8tmp=[XCsource(196593+16*i:196608+16*i)];
    ref8(i)=mean(ref8tmp);
end

alaph3=double(mean(low)/mean(ref3));
alaph4=double(mean(low)/mean(ref4));
alaph5=double(mean(low)/mean(ref5));
alaph6=double(mean(low)/mean(ref6));
alaph7=double(mean(low)/mean(ref7));
alaph8=double(mean(low)/mean(ref8));

reref3=reshape(ref3,64,64);
reref4=reshape(ref4,64,64);
reref5=reshape(ref5,64,64);
reref6=reshape(ref6,64,64);
reref7=reshape(ref7,64,64);
reref8=reshape(ref8,64,64);

for i =1:64
    for j=1:64
        pick(i,j,3)=xor(std(i,j,3),(lowarray(i,j)>(alaph3*reref3(i,j))));
        pick(i,j,4)=xor(std(i,j,4),(lowarray(i,j)>(alaph4*reref4(i,j))));
        pick(i,j,5)=xor(std(i,j,5),(lowarray(i,j)>(alaph5*reref5(i,j))));
        pick(i,j,6)=xor(std(i,j,6),(lowarray(i,j)>(alaph6*reref6(i,j))));
        pick(i,j,7)=xor(std(i,j,7),(lowarray(i,j)>(alaph7*reref7(i,j))));
        pick(i,j,8)=xor(std(i,j,8),(lowarray(i,j)>(alaph8*reref8(i,j))));
    end
end

for i=1:64
    for j=1:64
        od=double(reshape(pick(i,j,:),1,8));
        dec(i,j)=bin2dec(char(od+48));
    end
end

figure;
subplot(121);imshow(X,[]);
subplot(122);imshow(dec,[]);








