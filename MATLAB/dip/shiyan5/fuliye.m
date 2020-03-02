%读取图像 girl.bmp，显示这幅图像，对图像作傅立叶变换，显示频域振幅图像。
%作傅立 叶逆变换，显示图像，看是否与原图像相同。
A=imread('cameraman.tif'); subplot(1,3,1),imshow(A);title('原图像');
B=fftshift(fft2(A));
subplot(1,3,2),imshow(log(abs(B)), [ ]);title('二维傅立叶变换'); C= ifft2(B);
subplot(1,3,3),imshow(log(abs(C)), [ ]);title('逆变换后图像');

%对一幅图像作傅立叶变换，显示一幅频域图像的幅度谱和相位谱，分别对幅度谱和相位谱作傅立叶逆变换，
%观察两幅逆变换后的图像，体会频域图像中幅度与相位的作用。
I=imread('cameraman.tif');
A=fftshift(fft2(I));
A1=angle(A);
B=ifft2(A);
B1=ifft2(A1);
C=ifft2(abs(A));
figure;
subplot(2,3,1),imshow(I);title('原图像'); 
subplot(2,3,2),imshow(A1,[]);title('相位谱'); 
subplot(2,3,3),imshow(log(abs(A)),[]);title('傅立叶幅度频谱'); 
subplot(2,3,4),imshow(log(abs(B)),[]);title('直接图像逆变换'); 
subplot(2,3,5),imshow(log(abs(B1)),[]);title('相位逆变换'); 
subplot(2,3,6),imshow(log(abs(C)),[]);title('傅立叶幅度逆变换');

%设计一个简单的理想低通滤波器(截止频率自选)，对图像作频域低通滤波，再作反变 换，
%观察不同的截止频率下反变换后的图像与原图像的区别。
A=imread('cameraman.tif'); 
figure;
subplot(3,2,1),imshow(A);title('原图像');
B=fftshift(fft2(A));
E= ifft2(B);
subplot(3,2,2),imshow(log(abs(E)), [ ]);title('未滤波的逆变换图像'); 
[X,MAP]=imread('cameraman.tif');
[m,n]=size(X);
H1=zeros(m,n);
H1(m/4:3*m/4, n/4:3*n/4)=1;
LOWPASS1=B.* H1;
C=ifft2(LOWPASS1); subplot(3,2,3),imshow(log(abs(LOWPASS1)), [ ]);title('低通1');
subplot(3,2,4),imshow(log(abs(C)), [ ]);title('低通1逆变换图像'); H2=zeros(m,n);
H2(3*m/8:5*m/8, 3*n/8:5*n/8)=1;
LOWPASS2=B.* H2;
D=ifft2(LOWPASS2); subplot(3,2,5),imshow(log(abs(LOWPASS2)), [ ]);title('低通2'); 
subplot(3,2,6),imshow(log(abs(D)), [ ]);title('低通2逆变换图像');

%设计一个简单的理想高通滤波器(截止频率自选)，对图像作频域高通滤波，再作反变换，
%观察不同的截止频率下反变换后的图像与原图像的区别。
A=imread('cameraman.tif'); 
figure;
subplot(3,2,1),imshow(A);title('原图像');
B=fftshift(fft2(A));
E= ifft2(B);
subplot(3,2,2),imshow(log(abs(E)),[ ]);title('未滤波的逆变换图像'); [X,MAP]=imread('cameraman.tif');
[m,n]=size(X);
H1=ones(m,n);
H1(m/4:3*m/4, n/4:3*n/4)=0;
HIGHPASS1=B.* H1;
C=ifft2(HIGHPASS1); subplot(3,2,3),imshow(log(abs(HIGHPASS1)),[ ]);title('高通1'); 
subplot(3,2,4),imshow(log(abs(C)), [ ]);title('高通1逆变换图像'); H2=ones(m,n);
H2(3*m/8:5*m/8, 3*n/8:5*n/8)=0;
HIGHPASS2=B.* H2;
D=ifft2(HIGHPASS2); subplot(3,2,5),imshow(log(abs(HIGHPASS2)),[ ]);title('高通2'); 
subplot(3,2,6),imshow(log(abs(D)), [ ]);title('高通2逆变换图像');


I=imread('cameraman.tif'); A=fftshift(fft2(I)); d0=100;
N=8;
[m,n]=size(A);
e=0.5*m;
f=0.5*n;
h=zeros(m,n);
[a,b]=size(I);
%理想低通
H=zeros(a,b); H(3*a/8:5*a/8,3*b/8:5*b/8)=1;
%巴特沃斯
for i=1:m
    for j=1:n
        d(i,j)=sqrt((i-e)^2+(j-f)^2);
        h(i,j)=1/(1+(d(i,j)/d0)^(2*N));
    end
end
%高斯 
for i=1:m
    for j=1:n
        d1(i,j)=(i-e)^2+(j-f)^2; 
        g(i,j)=exp(-d1(i,j)/(2*d0^2));
    end
end
low1=A.*H; low2=A.*h; low3=A.*g; D=ifft2(low3);
B=ifft2(low1); C=ifft2(low2);
figure;
subplot(2,4,5),imshow(I);title(' 原图像 '); 
subplot(2,4,2),imshow(log(abs(low1)),[]);title('理想低通滤波频谱'); 
subplot(2,4,3),imshow(log(abs(low2)),[]);title('巴特沃思低通滤波频谱'); 
subplot(2,4,4),imshow(log(abs(low3)),[]);title('高斯低通滤波频谱'); 
subplot(2,4,1),imshow(log(abs(A)),[]);title('傅立叶振幅频谱'); 
subplot(2,4,6),imshow(uint8(abs(B)),[]);title('理想低通滤波后图像'); 
subplot(2,4,7),imshow(uint8(abs(C)),[]);title('巴特沃思低通滤波后图像'); 
subplot(2,4,8),imshow(uint8(abs(D)),[]);title('高斯低通滤波后图像');