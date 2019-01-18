clc;clear;close all;
x = imread('football.jpg');
imshow(x)
figure
 y = rgb2gray(x);
imshow(y)
 figure
red_img = x(:,:,1)
blue_img = x(:,:,2)
green_img = x(:,:,3)

z = zeros(size(x), class(x));
red = z;
red(:,:,1) = x(:,:,1)
imshow(red);
figure

blue = z;
blue(:,:,2) = x(:,:,2)
imshow(blue);
figure

green = z;
green(:,:,3) = x(:,:,3)
imshow(green);



