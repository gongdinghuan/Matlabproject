clear;

B=(imread('embedded.bmp'));%����ԭͼ
Z=B;
%Z = imrotate(B,90,'crop');%��ת �Ƕȿ��Կ���

%Z(128:256,256:384)=255;%���� �����Ƕ��ֵ���Կ���

Z=imnoise(Z,'gaussian');%������ ѡ����� help imnoise

imwrite(Z,'lenaattack.jpg','Q',30);%ѹ�����(��ѡ��ѹ������)
imwrite(Z,'lenaattack.jpg','jpg');
figure;
subplot(121);imshow(B,[]);
title('Original Image');
subplot(122);imshow(Z,[]);
title('Transpositional Image');