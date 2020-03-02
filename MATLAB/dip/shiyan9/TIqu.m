%%载入图像，图像分割
img = imread('1.jpg');
img1 = im2bw(img);%（图像分割）转化为二值图
img1 = not(img1);%把图像想表达的内容变成1
figure
subplot(1,2,1);imshow(img);xlabel('原图');
subplot(1,2,2);imshow(img1);xlabel('二值化');

%%显示图像中目标的边界和区域
img = imread('1.jpg');
img1 = im2bw(img);%（图像分割）转化为二值图
img2 = not(img1);%把图像想表达的内容变成1
[B,L] = bwboundaries(img2);
figure
subplot(1,2,1);imshow(img2);xlabel('标记边界');hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1),'g','LineWidth',2);
end
[I,N] = bwlabel(img2);
img_rgb = label2rgb(L,'hsv',[.5 .5 .5],'shuffle');
subplot(1,2,2);imshow(img_rgb);xlabel('标记区域');hold on
for k =1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
 text(boundary(1,2)-11,boundary(1,1)+11,num2str(k),'Color','y','Fontsize',14,'FontWeight','bold');
end

%%计算几何形状的参数，比如Area（面积）,Centroid（重心）,Eccentricity（偏心率）,Perimeter（周长）等
stats = regionprops(I,'all');%统计的数保留在stats内
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