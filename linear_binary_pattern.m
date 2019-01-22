%author : satwik bhatt
%BT16ECE021
clc; clear; close all;
img = imread('testimage3.jpg');
subplot(2,2,1);
imshow(img);
title('Original Image');
greyimage = rgb2gray(img);
subplot(2,2,2);
[m,n]=size(greyimage);
imshow(greyimage);
title('Grayscale Image');
img_d = double(greyimage);
weight = zeros(3);

% padding the image
row_padding = zeros(1,size(img,1));
col_padding = zeros(size(img,2)+2,1);
row_padded = [row_padding;img_d;row_padding];
padded = [col_padding,row_padded,col_padding];
subplot(2,2,3);
imshow(uint8(padded));
title('Padded Image');

finalimage = zeros(size(padded));
 
% determining the weights of each pixel in image
for i = 2 : size(padded,1)-1
    for j = 2 : size(padded,2)-1
        if padded(i,j)>padded(i,j+1)
            weight(2,3)=1;
        else
            weight(2,3)=0;
        end
        
        if padded(i,j)>padded(i-1,j+1)
            weight(1,3)=2;
        else
            weight(1,3)=0;
        end
        
        if padded(i,j)>padded(i-1,j)
            weight(1,2)=4;
        else
            weight(1,2)=0;
        end
        
        if padded(i,j)>padded(i-1,j-1)
            weight(1,1)=8;
        else
            weight(1,1)=0;
        end
        
        if padded(i,j)>padded(i,j-1)
            weight(2,1)=16;
        else
            weight(2,1)=0;
        end
        
        if padded(i,j)>padded(i+1,j-1)
            weight(3,1)=32;
        else
            weight(3,1)=0;
        end
        
        if padded(i,j)>padded(i+1,j)
            weight(3,2)=64;
        else
            weight(3,2)=0;
        end
        
        if padded(i,j)>padded(i+1,j+1)
            weight(3,3)=128;
        else
            weight(3,3)=0;
        end
        
        % summing the weights of neighbour pixels and adding them up
        new_value = sum(sum(weight));
        %replace the value in new imagegithu
        finalimage(i,j) = new_value;
    end
end

subplot(2,2,4);
finalimage = uint8(finalimage);
imshow(finalimage);
title('LBP IMAGE')