I = imread('sunset.jpg');
J = imread('lake.jpg');
K = imadd(I,J);
figure(1)
imshow(K);title('图像叠加')

RGB = imread('cameraman.bmp');
RGB2 = imadd(RGB,50);
figure(2)
subplot(1,2,1);imshow(RGB);title('原图')
subplot(1,2,2);imshow(RGB2);title('图像加亮')

rice = imread('cameraman.bmp');
background = imopen(rice, strel('disk',15));
rice2 = imsubtract(rice, background);
figure(3)
subplot(1,2,1);imshow(rice);title('原图')
subplot(1,2,2);imshow(rice2);title('减去背景')

q= imread('candygirl.bmp'); 
w = immultiply(q,1.6); 
figure(4)
subplot(1,2,1);imshow(q);title('原图')
subplot(1,2,2);imshow(w);title('图像乘法')

Rice = imread('cameraman.bmp'); e = double(Rice);
background = imopen(Rice, strel('disk',15));
Rice2 = imsubtract(Rice, background);
Ip = imdivide(Rice, Rice2);
figure(5)
imshow(Ip, []);title('图像除法')


I11=imread('bottles.jpg');
I12=imread('sky.jpg');
K11=imdivide(imadd(I11,I12),4);
figure(6)
imshow(K11);title('四则运算')

