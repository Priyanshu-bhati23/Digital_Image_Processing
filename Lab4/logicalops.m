close all
clc

% Read images
I  = imread('pr2.png');
I2 = imread('simpson.jpg');

% Convert to grayscale
W  = rgb2gray(I);
W2 = rgb2gray(I2);

% Resize second image to match first
[r, c] = size(W);
W2 = imresize(W2, [r, c]);

% Bit complement (NOT operation)
NotW  = bitcmp(W);
NotW2 = bitcmp(W2);

% ROI selection for first image
Mask_RoI = roipoly(W);          % Logical mask
Mask_RoI = im2uint8(Mask_RoI);  % Convert to uint8

% ===== Logical Operations =====
% Between image and ROI mask
AND_roi = bitand(W, Mask_RoI);
OR_roi  = bitor(W, Mask_RoI);
XOR_roi = bitxor(W, Mask_RoI);

% Between two images
AND_img = bitand(W, W2);
OR_img  = bitor(W, W2);
XOR_img = bitxor(W, W2);

% ===== Display: Image 1 + ROI =====
figure('Name','Image 1 with ROI')
subplot(231), imshow(W), title('Original Image 1')
subplot(232), imshow(NotW), title('NOT Image 1')
subplot(233), imshow(AND_roi), title('Image1 AND ROI')
subplot(234), imshow(OR_roi), title('Image1 OR ROI')
subplot(235), imshow(XOR_roi), title('Image1 XOR ROI')

% ===== Display: Between Two Images =====
figure('Name','Logical Ops between Images')
subplot(231), imshow(W), title('Image 1')
subplot(232), imshow(W2), title('Image 2')
subplot(233), imshow(AND_img), title('AND')
subplot(234), imshow(OR_img), title('OR')
subplot(235), imshow(XOR_img), title('XOR')
subplot(236), imshowpair(NotW, NotW2, 'montage'), title('NOT Image1 | NOT Image2')
