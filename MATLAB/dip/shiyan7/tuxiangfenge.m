clear;
close all; 
I=imread('1.jpg');
I=rgb2gray(I); %显示原图
figure; 
imshow(I);title('原图')

Ni=imhist(I); 
N=sum(Ni); 
delamax=0; 
threshold=0; 
for k=2:255
    u=dot([0:255],Ni/N); 
    w0=sum(Ni(1:k)/N); 
    w1=1-w0;
    if w0==0|w0==1
        continue
    end
    u0=dot([0:k-1],Ni(1:k)/N)/w0;
    u1=dot([k:255],Ni(k+1:256)/N)/w1; 
dela(k)=w0*(u-u0)^2+w1*(u-u1)^2; %求出类间方差的最大值，最大时的那个值对应的k值存入delamax
    if dela(k)>delamax 
        delamax=dela(k);
        threshold=k-1; 
    end
end
BW1=im2bw(I,threshold/255);
figure;
imshow(BW1),title('自编程序运行结果')
disp('自编程序求的的阈值:');
disp(threshold);%调用系统函数OTSU阈值分割 

level=graythresh(I);
BW2=im2bw(I,level);
figure;
imshow(BW2);title('调用库函数运行结果')
level=round(level*255);
disp('调用库函数求得的阈值:');
disp(level);
[width height]=size(I);
th=input('请输入阈值:'); 
for i=1:width
    for j=1:height 
        if(I(i,j)<th)
            BW1(i,j)=0; 
        else
            BW1(i,j)=1; 
        end
    end
end
figure;
imshow(BW1);title('全局阈值')
%四舍五入计算调用系统函数的阈值
%获取图片宽高
%灰度小于阈值时则为黑色
% 灰度大于等于阈值时则为白色