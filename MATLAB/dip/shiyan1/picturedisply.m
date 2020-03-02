clear all;clc;
x=imread('123.jpg');
subplot(2,4,1),imshow(x),title('���ͼ��')

xg=rgb2gray(x);
subplot(2,4,2),imshow(xg),title('�Ҷ�ͼ��')

xbw=im2bw(x,0.50);
subplot(2,4,3),imshow(xbw),title('�ڰ�ͼ��')

x2=imnoise(x,'gaussian');
subplot(2,4,4),imshow(x2);,title('����ͼ��')

[X,map]=rgb2ind(x,32);
x=imread('123.jpg');

yiq=rgb2ntsc(x);
subplot(2,4,5),imshow(yiq);,title('YIQͼ��')

hsv=rgb2hsv(x);
subplot(2,4,6),imshow(hsv);,title('HSVͼ��')

ycbcr=rgb2ycbcr(x);
subplot(2,4,7),imshow(ycbcr);,title('YCBCRͼ��')