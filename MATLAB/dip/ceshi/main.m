Img=imread('dog.jpg');
%imag=Img(:,:,50);
%imshow(imag,[0 255]);
fima=NLmeansfilter(Img,10,3,10);
imshow(fima);