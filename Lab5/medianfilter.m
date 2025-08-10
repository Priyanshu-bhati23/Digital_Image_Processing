clear all
close all
clc

%Salt and pepper -->Median fileter

I=rgb2gray(imread("pr2.png"))
Isp=imnoise(I,"salt & pepper",0.05);

medf=@(x) median(x(:));

med_Im=nlfilter(Isp,[3,3],medf);

figure
subplot(131)
imshow(I)


subplot(132)
imshow(Isp)

subplot(133)
imshow(med_Im)
