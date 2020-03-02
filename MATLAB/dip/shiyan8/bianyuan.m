close all
clear,clc
I1 = imread('dog.jpg');
I=rgb2gray(I1);
%1��sobel����
[s1,st1] = edge(I,'sobel'); 
fprintf('sobel�Զ�ȷ����ֵ st1 = %.4f\n',st1);
s2 = edge(I,'sobel','horizontal');
s3 = edge(I,'sobel','vertical');
s4 = edge(I,'sobel',0.15);
s5 = edge(I,'sobel',0.05); figure('name','sobel');
subplot(231),imshow(I),title('ԭʼͼ��') 
subplot(232),imshow(s4),title('t = 0.15') 
subplot(233),imshow(s5),title('t = 0.05') 
subplot(234),imshow(s1),title('both') 
subplot(235),imshow(s2),title('horizontal') 
subplot(236),imshow(s3),title('vertical')
%2��prewitte����
[p1,pt1] = edge(I,'prewitt'); 
fprintf('prewitt�Զ�ȷ����ֵ pt1 = %.4f\n',pt1);
p2 = edge(I,'prewitt','horizontal');
p3 = edge(I,'prewitt','vertical');
p4 = edge(I,'prewitt',0.15);
p5 = edge(I,'prewitt',0.05); figure('name','prewitt'); 
subplot(231),imshow(I),title('ԭʼ');
subplot(232),imshow(p4),title('t = 0.15') 
subplot(233),imshow(p5),title('t = 0.05') 
subplot(234),imshow(p1),title('both') 
subplot(235),imshow(p2),title('horizontal') 
subplot(236),imshow(p3),title('vertical') 
%3��roberts����
[r1,rt1] = edge(I,'roberts'); 
fprintf('Roberts�Զ�ȷ����ֵ rt1 = %.4f\n',rt1); 
r2 = edge(I,'roberts','horizontal');
r3 = edge(I,'roberts','vertical');
r4 = edge(I,'roberts',0.15);
r5 = edge(I,'roberts',0.05); 
figure('name','Roberts'); 
 subplot(231),imshow(I),title('ԭʼͼ��') 
subplot(232),imshow(p4),title('t = 0.15') 
subplot(233),imshow(p5),title('t = 0.05') 
subplot(234),imshow(p1),title('both') 
subplot(235),imshow(p2),title('horizontal') 
subplot(236),imshow(p3),title('vertical') 
%4��LoG�����
[g1,t1] = edge(I,'log');
g2 = edge(I,'log',0);
g3 = edge(I,'log',[],2.25); 
fprintf('LoG�Զ�ȷ����ֵ t1 = %.4f\n',t1) 
figure('name','LoG');
subplot(221),imshow(I),title('ԭʼͼ��') 
subplot(222),imshow(g1),title('LoG�����') 
subplot(223),imshow(g2),title('T = 0') 
 subplot(224),imshow(g3),title('sigma = 2.25')