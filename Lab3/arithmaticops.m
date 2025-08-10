clear all
close all
clc

I1=imread("pr2.png")
figure
subplot(221)
imshow(I1)
title('\bf\fontsize{5} Original Image')

A=I1+50;  %OFFSET BRIGHTINNING imadd

subplot(222)
imshow(A)
title('\bf\fontsize{5} OFFSET BRIGHTINNING')

B=I1-50;  %imsubtract

subplot(223)
imshow(B)
title('\bf\fontsize{5} OFFSET Darkening')


%Dynamic scaling
C=immultiply(I1,2);

subplot(224)
imshow(C)
title('\bf\fontsize{5} Dynamic scaling(Mul)')





I2=imread("simpson.jpg");
[r,c,z]=size(I2);
I1N=imresize(I1,[r,c]);

figure
subplot(131)
imshow(I1N)
subplot(132)
imshow(I2)
title('\bf\fontsize{5} Resized Image')


A2=I1N+I2;  %imadd
figure

subplot(221)
imshow(B)
title('\bf\fontsize{5} Adding 2 images')

B=I1N-I2;  %imsubtract

subplot(222)
imshow(B)
title('\bf\fontsize{5} subtracting images')


B=immultiply(I1N,I2)
%immultiply

subplot(223)
imshow(B)
title('\bf\fontsize{5} multiplying images')


B=imdivide(I1N,I2);  %imdivide

subplot(224)
imshow(B)
title('\bf\fontsize{5} dividing images')

