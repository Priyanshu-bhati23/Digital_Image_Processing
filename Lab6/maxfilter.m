clear all
close all
clc
I=rgb2gray(imread("simpson.jpg"))
Ip=I;

x=rand(size(Ip));

Ip(x(:)<0.05)=0;
maxf=@(x) max(x(:));

max_Im=nlfilter(Ip,[3,3],maxf);

figure
subplot(131)
imshow(I)


subplot(132)
imshow(Ip)

subplot(133)
imshow(max_Im)

