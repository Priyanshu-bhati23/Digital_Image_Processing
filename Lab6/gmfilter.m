clear all
close all
clc

% Read and convert to grayscale double
I = rgb2gray(imread("pr2.png"));
I = im2double(I);

% Kernel size for GMF
Kr = 5;
Kc = 5;

% Add noise
I_sp = imnoise(I, 'salt & pepper', 0.05); % Salt & pepper noise
I_gauss = imnoise(I, 'gaussian', 0, 0.01); % Gaussian noise

% Geometric Mean Filter function
gmf = @(img) exp(imfilter(log(img + eps), ones(Kr, Kc), 'replicate')) .^ (1 / (Kr * Kc));

% Apply GMF
F_sp = gmf(I_sp);
F_gauss = gmf(I_gauss);

% Display results
figure('Name', 'Geometric Mean Filter on Noisy Images')

% Original
subplot(3,2,1)
imshow(I)
title('Original Image')

% Salt & Pepper noise
subplot(3,2,3)
imshow(I_sp)
title('Salt & Pepper Noise')

% Gaussian noise
subplot(3,2,5)
imshow(I_gauss)
title('Gaussian Noise')

% Filtered Salt & Pepper
subplot(3,2,4)
imshow(F_sp)
title('GM Filtered (S&P)')

% Filtered Gaussian
subplot(3,2,6)
imshow(F_gauss)
title('GM Filtered (Gaussian)')
