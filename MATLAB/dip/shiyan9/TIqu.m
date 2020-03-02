%%����ͼ��ͼ��ָ�
img = imread('1.jpg');
img1 = im2bw(img);%��ͼ��ָת��Ϊ��ֵͼ
img1 = not(img1);%��ͼ����������ݱ��1
figure
subplot(1,2,1);imshow(img);xlabel('ԭͼ');
subplot(1,2,2);imshow(img1);xlabel('��ֵ��');

%%��ʾͼ����Ŀ��ı߽������
img = imread('1.jpg');
img1 = im2bw(img);%��ͼ��ָת��Ϊ��ֵͼ
img2 = not(img1);%��ͼ����������ݱ��1
[B,L] = bwboundaries(img2);
figure
subplot(1,2,1);imshow(img2);xlabel('��Ǳ߽�');hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1),'g','LineWidth',2);
end
[I,N] = bwlabel(img2);
img_rgb = label2rgb(L,'hsv',[.5 .5 .5],'shuffle');
subplot(1,2,2);imshow(img_rgb);xlabel('�������');hold on
for k =1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
 text(boundary(1,2)-11,boundary(1,1)+11,num2str(k),'Color','y','Fontsize',14,'FontWeight','bold');
end

%%���㼸����״�Ĳ���������Area�������,Centroid�����ģ�,Eccentricity��ƫ���ʣ�,Perimeter���ܳ�����
stats = regionprops(I,'all');%ͳ�Ƶ���������stats��
figure
cmap = colormap(lines(21));
areas = zeros(1,N);
for k = 1:N
 areas(k) = stats(k).Area;
end
TR = zeros(1,N);
for k = 1: N
 TR(k) = k;
end
for k = 1:N
 scatter(TR(k),areas(k),[],cmap(k,:),'filled');
 ylabel('Area'),xlabel('k');
 hold on
end
figure
Perimeters = zeros(1,N);
for k = 1:N
 Perimeters(k) = stats(k).Perimeter;
end
for k = 1:N
 scatter(TR(k),Perimeters(k),[],cmap(k,:),'filled');
 ylabel('Perimeter'),xlabel('k');
 hold on
end