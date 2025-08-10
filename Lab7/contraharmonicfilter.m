clear all
close all
clc

% Read and convert to grayscale double
I = rgb2gray(imread("pr2.png"));
I = im2double(I);

% Kernel size
Kr = 5;
Kc = 5;

% Add noise
I_sp = imnoise(I, 'salt & pepper', 0.05); % Salt & pepper noise
I_gauss = imnoise(I, 'gaussian', 0, 0.01); % Gaussian noise

% Q parameter
Q = 1.5;  % Positive Q → better for pepper noise; Negative Q → better for salt noise

% Contra-Harmonic Mean Filter function
chmf = @(img, Q) imfilter(img.^(Q+1), ones(Kr, Kc), 'replicate') ./ ...
                 (imfilter(img.^Q, ones(Kr, Kc), 'replicate') + eps);

% Apply CHMF
F_sp = chmf(I_sp, Q);
F_gauss = chmf(I_gauss, Q);

% Display results
figure('Name', 'Contra-Harmonic Mean Filter on Noisy Images')

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
title(sprintf('CHMF (S&P), Q=%.1f', Q))

% Filtered Gaussian
subplot(3,2,6)
imshow(F_gauss)
title(sprintf('CHMF (Gaussian), Q=%.1f', Q))
