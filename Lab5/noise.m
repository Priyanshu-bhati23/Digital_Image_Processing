clear all
close all
clc


W=imread("pr2.png");
I=rgb2gray(W);
SPI=imnoise(I,"salt & pepper",0.1);

GI=imnoise(I,"gaussian",0.1,0.05);


SI=imnoise(I,"speckle",0.5);

figure
subplot(221)
imshow(I)
title('\bf\fontsize{25} Original Image')

subplot(222)
imshow(SPI)
title('\bf\fontsize{25} Salt and Pepper')


subplot(223)
imshow(GI)
title('\bf\fontsize{25} Gaussian')


subplot(224)
imshow(SI)
title('\bf\fontsize{25} Speckle')

