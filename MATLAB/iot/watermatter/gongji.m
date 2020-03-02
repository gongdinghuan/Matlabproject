clear;

B=(imread('embedded.bmp'));%读入原图
Z=B;
%Z = imrotate(B,90,'crop');%旋转 角度可以控制

%Z(128:256,256:384)=255;%剪切 区间和嵌入值可以控制

Z=imnoise(Z,'gaussian');%加噪声 选择参数 help imnoise

imwrite(Z,'lenaattack.jpg','Q',30);%压缩输出(可选择压缩比例)
imwrite(Z,'lenaattack.jpg','jpg');
figure;
subplot(121);imshow(B,[]);
title('Original Image');
subplot(122);imshow(Z,[]);
title('Transpositional Image');