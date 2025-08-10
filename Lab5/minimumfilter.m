clear all
close all
clc

%Minimum Filter

I=rgb2gray(imread("simpson.jpg"))
ls=I;
x=rand(size(ls));
ls(x(:)>0.95)=255;

figure
subplot(221)
imshow(ls)


ls(x(:)>0.8)=255;
subplot(222)
imshow(ls)


ls(x(:)>0.6)=255;
subplot(223)
imshow(ls)

ls(x(:)>0.4)=255;
subplot(224)
imshow(ls)
