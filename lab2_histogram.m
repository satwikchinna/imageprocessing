clc;clear;close all;

x = imread('football.jpg');
y = rgb2gray(x);
imshow(y)
figure
imhist(y)
figure
z = histeq(y)
imshow(z)
figure
imhist(z)