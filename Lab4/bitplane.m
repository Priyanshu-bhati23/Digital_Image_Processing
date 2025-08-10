
clear all
close all
clc

W=imread('pr2.png');
I=rgb2gray(W);
Id=double(I);
p0=mod(Id,2);
p1=mod(bitshift(Id,-1),2);
p2=mod(bitshift(Id,-2),2);
p3=mod(bitshift(Id,-3),2);
p4=mod(bitshift(Id,-4),2);
p5=mod(bitshift(Id,-5),2);
p6=mod(bitshift(Id,-6),2);
p7=mod(bitshift(Id,-7),2);

figure
subplot(241)
imshow(p0)
title('Bitplan0')

subplot(242)
imshow(p1)
title('Bitplan1')

subplot(243)
imshow(p2)
title('Bitplan2')

subplot(244)
imshow(p3)
title('Bitplan3')

subplot(245)
imshow(p4)
title('Bitplan4')

subplot(246)
imshow(p5)
title('Bitplan5')

subplot(247)
imshow(p6)
title('Bitplan6')


subplot(248)
imshow(p7)
title('Bitplan7')

