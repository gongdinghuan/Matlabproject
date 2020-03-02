%��ȡͼ�� girl.bmp����ʾ���ͼ�񣬶�ͼ��������Ҷ�任����ʾƵ�����ͼ��
%������ Ҷ��任����ʾͼ�񣬿��Ƿ���ԭͼ����ͬ��
A=imread('cameraman.tif'); subplot(1,3,1),imshow(A);title('ԭͼ��');
B=fftshift(fft2(A));
subplot(1,3,2),imshow(log(abs(B)), [ ]);title('��ά����Ҷ�任'); C= ifft2(B);
subplot(1,3,3),imshow(log(abs(C)), [ ]);title('��任��ͼ��');

%��һ��ͼ��������Ҷ�任����ʾһ��Ƶ��ͼ��ķ����׺���λ�ף��ֱ�Է����׺���λ��������Ҷ��任��
%�۲�������任���ͼ�����Ƶ��ͼ���з�������λ�����á�
I=imread('cameraman.tif');
A=fftshift(fft2(I));
A1=angle(A);
B=ifft2(A);
B1=ifft2(A1);
C=ifft2(abs(A));
figure;
subplot(2,3,1),imshow(I);title('ԭͼ��'); 
subplot(2,3,2),imshow(A1,[]);title('��λ��'); 
subplot(2,3,3),imshow(log(abs(A)),[]);title('����Ҷ����Ƶ��'); 
subplot(2,3,4),imshow(log(abs(B)),[]);title('ֱ��ͼ����任'); 
subplot(2,3,5),imshow(log(abs(B1)),[]);title('��λ��任'); 
subplot(2,3,6),imshow(log(abs(C)),[]);title('����Ҷ������任');

%���һ���򵥵������ͨ�˲���(��ֹƵ����ѡ)����ͼ����Ƶ���ͨ�˲����������� ����
%�۲첻ͬ�Ľ�ֹƵ���·��任���ͼ����ԭͼ�������
A=imread('cameraman.tif'); 
figure;
subplot(3,2,1),imshow(A);title('ԭͼ��');
B=fftshift(fft2(A));
E= ifft2(B);
subplot(3,2,2),imshow(log(abs(E)), [ ]);title('δ�˲�����任ͼ��'); 
[X,MAP]=imread('cameraman.tif');
[m,n]=size(X);
H1=zeros(m,n);
H1(m/4:3*m/4, n/4:3*n/4)=1;
LOWPASS1=B.* H1;
C=ifft2(LOWPASS1); subplot(3,2,3),imshow(log(abs(LOWPASS1)), [ ]);title('��ͨ1');
subplot(3,2,4),imshow(log(abs(C)), [ ]);title('��ͨ1��任ͼ��'); H2=zeros(m,n);
H2(3*m/8:5*m/8, 3*n/8:5*n/8)=1;
LOWPASS2=B.* H2;
D=ifft2(LOWPASS2); subplot(3,2,5),imshow(log(abs(LOWPASS2)), [ ]);title('��ͨ2'); 
subplot(3,2,6),imshow(log(abs(D)), [ ]);title('��ͨ2��任ͼ��');

%���һ���򵥵������ͨ�˲���(��ֹƵ����ѡ)����ͼ����Ƶ���ͨ�˲����������任��
%�۲첻ͬ�Ľ�ֹƵ���·��任���ͼ����ԭͼ�������
A=imread('cameraman.tif'); 
figure;
subplot(3,2,1),imshow(A);title('ԭͼ��');
B=fftshift(fft2(A));
E= ifft2(B);
subplot(3,2,2),imshow(log(abs(E)),[ ]);title('δ�˲�����任ͼ��'); [X,MAP]=imread('cameraman.tif');
[m,n]=size(X);
H1=ones(m,n);
H1(m/4:3*m/4, n/4:3*n/4)=0;
HIGHPASS1=B.* H1;
C=ifft2(HIGHPASS1); subplot(3,2,3),imshow(log(abs(HIGHPASS1)),[ ]);title('��ͨ1'); 
subplot(3,2,4),imshow(log(abs(C)), [ ]);title('��ͨ1��任ͼ��'); H2=ones(m,n);
H2(3*m/8:5*m/8, 3*n/8:5*n/8)=0;
HIGHPASS2=B.* H2;
D=ifft2(HIGHPASS2); subplot(3,2,5),imshow(log(abs(HIGHPASS2)),[ ]);title('��ͨ2'); 
subplot(3,2,6),imshow(log(abs(D)), [ ]);title('��ͨ2��任ͼ��');


I=imread('cameraman.tif'); A=fftshift(fft2(I)); d0=100;
N=8;
[m,n]=size(A);
e=0.5*m;
f=0.5*n;
h=zeros(m,n);
[a,b]=size(I);
%�����ͨ
H=zeros(a,b); H(3*a/8:5*a/8,3*b/8:5*b/8)=1;
%������˹
for i=1:m
    for j=1:n
        d(i,j)=sqrt((i-e)^2+(j-f)^2);
        h(i,j)=1/(1+(d(i,j)/d0)^(2*N));
    end
end
%��˹ 
for i=1:m
    for j=1:n
        d1(i,j)=(i-e)^2+(j-f)^2; 
        g(i,j)=exp(-d1(i,j)/(2*d0^2));
    end
end
low1=A.*H; low2=A.*h; low3=A.*g; D=ifft2(low3);
B=ifft2(low1); C=ifft2(low2);
figure;
subplot(2,4,5),imshow(I);title(' ԭͼ�� '); 
subplot(2,4,2),imshow(log(abs(low1)),[]);title('�����ͨ�˲�Ƶ��'); 
subplot(2,4,3),imshow(log(abs(low2)),[]);title('������˼��ͨ�˲�Ƶ��'); 
subplot(2,4,4),imshow(log(abs(low3)),[]);title('��˹��ͨ�˲�Ƶ��'); 
subplot(2,4,1),imshow(log(abs(A)),[]);title('����Ҷ���Ƶ��'); 
subplot(2,4,6),imshow(uint8(abs(B)),[]);title('�����ͨ�˲���ͼ��'); 
subplot(2,4,7),imshow(uint8(abs(C)),[]);title('������˼��ͨ�˲���ͼ��'); 
subplot(2,4,8),imshow(uint8(abs(D)),[]);title('��˹��ͨ�˲���ͼ��');