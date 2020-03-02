clear;

X=(imread('lena.bmp'));

[XCsource,XSsource]=wavedec2(X,3,'db1');%对X图像数据进行小波二维分解，采用db1小波过滤器
W=double(imread('watermark.bmp')); %'double'将水印矩阵的元素变成双精度元素
lowarray=reshape(XCsource(1:4096),64,64); %convert matrix XCsource(1:4096) to a 64*64 matrix
low=XCsource(1:4096);

for i = 1:64    
    ref1(i)=mean(lowarray(:,i)); %对矩阵每列求均值
    ref2(i)=mean(lowarray(i,:)); %对矩阵每行求均值
    for j=1:64
        w(i,j,:)=int8(dec2bin(W(i,j),8))-48; %dec2bin将矩阵W的每个元素转换成二进制值，每个二进制长度为8
        result(i,j,1)=xor(w(i,j,1),(lowarray(i,j)>ref1(i)));
        result(i,j,2)=xor(w(i,j,2),(lowarray(i,j)>ref2(i)));        
    end

end
for i=1:4096
    ref3tmp=[XCsource(16381+4*i:16384+4*i)];%128*128=16384
    ref3(i)=mean(ref3tmp);
    ref4tmp=[XCsource(32765+4*i:32768+4*i)];%128*256=32768
    ref4(i)=mean(ref3tmp);
    ref5tmp=[XCsource(49149+4*i:49152+4*i)];%(128+64)*256=49152  or (128+256)*128=49152
    ref5(i)=mean(ref5tmp);
    ref6tmp=[XCsource(65521+16*i:65536+16*i)];%256*256=65536 or 128*512=65536
    ref6(i)=mean(ref6tmp);
    ref7tmp=[XCsource(131057+16*i:131072+16*i)];%256*512=131072
    ref7(i)=mean(ref7tmp);
    ref8tmp=[XCsource(196593+16*i:196608+16*i)];%(128+256)*512=196608
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
        result(i,j,3)=xor(w(i,j,3),(lowarray(i,j)>(alaph3*reref3(i,j))));
        result(i,j,4)=xor(w(i,j,4),(lowarray(i,j)>(alaph4*reref4(i,j))));
        result(i,j,5)=xor(w(i,j,5),(lowarray(i,j)>(alaph5*reref5(i,j))));
        result(i,j,6)=xor(w(i,j,6),(lowarray(i,j)>(alaph6*reref6(i,j))));
        result(i,j,7)=xor(w(i,j,7),(lowarray(i,j)>(alaph7*reref7(i,j))));
        result(i,j,8)=xor(w(i,j,8),(lowarray(i,j)>(alaph8*reref8(i,j))));
    end
end
save('key','result');

Y=waverec2(XCsource,XSsource,'db1'); %小波重构图像
Y=uint8(Y);
imwrite(Y,'embedded.bmp','bmp');

W=uint8(W);%格式转换

figure(1);
subplot(121);imshow(X,[]);
title('Original Image');
subplot(122);imshow(W,[]);
title('Waited Watermaked Image');
figure(2);
imshow(Y,[]);
title('Watermaked Image');