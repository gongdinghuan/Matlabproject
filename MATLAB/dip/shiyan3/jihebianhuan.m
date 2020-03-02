I = imread('cm.tif');
se = translate(strel(1), [25 25]);
J = imdilate(I,se);
figure(1);
subplot(121);imshow(I), title('ԭͼ');
subplot(122);imshow(J), title('ƽ�Ʊ任��');

I2 = imread('cm.tif');
K1 = flip(I2,1);
K2 = flip(I2,2);
K3 = flip(K1,2); 
figure(2);
subplot(2,2,1),imshow(I2) ;title('ԭʼͼ��');
subplot(2,2,2),imshow(K1);title('ˮƽ����');
subplot(2,2,3),imshow(K2);title('��ֱ����');
subplot(2,2,4),imshow(K3);title('ˮƽ��ֱ����');

img= imread('lake.jpg');
img1=imresize(img,1.5); 
img2=imresize(img,0.5); 
figure(3);imshow(img);title('1.5��'); 
figure(4);imshow(img2);title('0.5��');

imge= imread('rose.jpg');
K1=imrotate(imge, 30);
K2=imrotate(imge, -30); 
K3=imrotate(imge,30,'bicubic','crop'); 
K4=imrotate(imge,30, 'bicubic','loose'); 
figure(5);
subplot(2,2,1); imshow(K1);title('��ʱ����ת30�� ') 
subplot(2,2,2); imshow(K2);title('˳ʱ����ת30�� ') 
subplot(2,2,3); imshow(K3);title('��ʱ��30��+crop') 
subplot(2,2,4); imshow(K4);title('��ʱ��30�� +loose')