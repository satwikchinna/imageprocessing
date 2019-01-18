clc;clear;close all;

img_color = imread('football.jpg');
img1 = rgb2gray(img_color);
figure;
imshow(img1)
[row col] = size(img1);
b=zeros(row,col,8);

for k = 1:8
    for i = 1:row
        for j = 1:col
            b(i,j,k) = bitget(img1(i,j),k);
        end
    end
end

im1 = b(:,:,1);
im2 = b(:,:,2);
im3 = b(:,:,3);
im4 = b(:,:,4);
im5 = b(:,:,5);
im6 = b(:,:,6);
im7 = b(:,:,7);
im8 = b(:,:,8);

subplot(421);
imshow(im1);
subplot(422);
imshow(im2);
subplot(423);
imshow(im3);
subplot(424);
imshow(im4);
subplot(425);
imshow(im5);
subplot(426);
imshow(im6);
subplot(427);
imshow(im7);
subplot(428);
imshow(im8);
