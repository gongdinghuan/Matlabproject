clear;
close all; 
I=imread('1.jpg');
I=rgb2gray(I); %��ʾԭͼ
figure; 
imshow(I);title('ԭͼ')

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
dela(k)=w0*(u-u0)^2+w1*(u-u1)^2; %�����䷽������ֵ�����ʱ���Ǹ�ֵ��Ӧ��kֵ����delamax
    if dela(k)>delamax 
        delamax=dela(k);
        threshold=k-1; 
    end
end
BW1=im2bw(I,threshold/255);
figure;
imshow(BW1),title('�Ա�������н��')
disp('�Ա������ĵ���ֵ:');
disp(threshold);%����ϵͳ����OTSU��ֵ�ָ� 

level=graythresh(I);
BW2=im2bw(I,level);
figure;
imshow(BW2);title('���ÿ⺯�����н��')
level=round(level*255);
disp('���ÿ⺯����õ���ֵ:');
disp(level);
[width height]=size(I);
th=input('��������ֵ:'); 
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
imshow(BW1);title('ȫ����ֵ')
%��������������ϵͳ��������ֵ
%��ȡͼƬ���
%�Ҷ�С����ֵʱ��Ϊ��ɫ
% �Ҷȴ��ڵ�����ֵʱ��Ϊ��ɫ