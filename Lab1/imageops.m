clear all
close all
clc
I=imread("pr2.png");

figure
subplot(121)
imshow(I)


Q=I-200;
imwrite(Q,"newpr.png")

subplot(122)
imshow(Q)