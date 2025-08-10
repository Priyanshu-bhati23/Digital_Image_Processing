clc
clear all
close all
I=imread("pr2.png")

figure
subplot(221)
imshow(I)
title('\bf\fontsize{5} Original Image')


%Using Inbuilt command

%IG=rgb2gray(I);
%subplot(222)
%imshow(IG)
%title('\bf\fontsize{5} Gray Scale Image')

[Ind,Imap]=rgb2ind(I,32);%65536 tak values dal sakte hai
subplot(223)
imagesc(Ind)
colormap(Imap)
title('\bf\fontsize{5} Indexed Image')

%RGB=ind2rgb(Ind,Imap)


R = double(I(:,:,1)); % Red channel
G = double(I(:,:,2)); % Green channel
B = double(I(:,:,3)); % Blue channel

grayImage = 0.2989 * R + 0.5870 * G + 0.1140 * B;

grayImage = uint8(grayImage);

subplot(222)
imshow(grayImage);
title('Grayscale Image');

%gray to indexed
IG=rgb2gray(I);
[Ind,Imap]=gray2ind(IG,32);
subplot(223)
imagesc(Ind)
colormap(I)

HSV=rgb2hsv(I);
figure
imshow(HSV)

