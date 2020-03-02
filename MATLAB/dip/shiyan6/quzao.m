%I=imread('cameraman.tif');
I1=imread('dog.jpg');
I=rgb2gray(I1);
J=imnoise(I,'gauss',0.2);
ave1=fspecial('average',3);
ave2=fspecial('average',5);
K=filter2(ave1,J)/255;
L=filter2(ave2,J)/255;
M=medfilt2(J,[3 3]);
N=medfilt2(J,[5 5]);
figure(1);
subplot(2,3,1);imshow(I);title('原图');
subplot(2,3,4);imshow(J);title('添加高斯噪声，浓度0.2');
subplot(2,3,2);imshow(K);title('均值滤波3x3');
subplot(2,3,3);imshow(L);title('均值滤波5x5');
subplot(2,3,5);imshow(M);title('中值滤波3x3模板');
subplot(2,3,6);imshow(N);title('中值滤波5x5模板');
J1=imnoise(I,'salt & pepper',0.2);
K1=filter2(ave1,J1)/255;
L1=filter2(ave2,J1)/255;
M1=medfilt2(J1,[3 3]);
N1=medfilt2(J1,[5 5]);
figure(3);
subplot(2,3,1);imshow(I);title('原图');
subplot(2,3,4);imshow(J1);title('添加椒盐噪声，浓度0.2');
subplot(2,3,2);imshow(K1);title('均值滤波3x3');
subplot(2,3,3);imshow(L1);title('均值滤波5x5');
subplot(2,3,5);imshow(M1);title('中值滤波3x3模板');
subplot(2,3,6);imshow(N1);title('中值滤波5x5模板');
J2=imnoise(I,'gauss',0.5);
ave1=fspecial('average',3);
ave2=fspecial('average',5);
K2=filter2(ave1,J2)/255;
L2=filter2(ave2,J2)/255;
M2=medfilt2(J2,[3 3]);
N2=medfilt2(J2,[5 5]);
figure(2);
subplot(2,3,1);imshow(I);title('原图');
subplot(2,3,4);imshow(J2);title('添加高斯噪声，浓度0.5');
subplot(2,3,2);imshow(K2);title('均值滤波3x3');
subplot(2,3,3);imshow(L2);title('均值滤波5x5');
subplot(2,3,5);imshow(M2);title('中值滤波3x3模板');
subplot(2,3,6);imshow(N2);title('中值滤波5x5模板');
J3=imnoise(I,'salt & pepper',0.5);
K3=filter2(ave1,J3)/255;
L3=filter2(ave2,J3)/255;
M3=medfilt2(J3,[3 3]);
N3=medfilt2(J3,[5 5]);
figure(4);
subplot(2,3,1);imshow(I);title('原图');
subplot(2,3,4);imshow(J3);title('添加椒盐噪声，浓度0.5');
subplot(2,3,2);imshow(K3);title('均值滤波3x3');
subplot(2,3,3);imshow(L3);title('均值滤波5x5');
subplot(2,3,5);imshow(M3);title('中值滤波3x3模板');
subplot(2,3,6);imshow(N3);title('中值滤波5x5模板');