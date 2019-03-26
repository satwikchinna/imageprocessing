clc;clear ;close all;
host=imread('lena.jpg');
[m n p]=size(host);
subplot(1,3,1)
imshow(host);
title('Original Image');
[host_LL,host_LH,host_HL,host_HH]=dwt2(host,'haar');
water_mark=imread('iiitnlogo.jpg');
water_mark=imresize(water_mark,[m n]);

subplot(1,3,2)
imshow(water_mark);
title('Watermark');
[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');
water_marked_LH = host_LH + (0.03*water_mark_LH);
water_marked_HL = host_HL + (0.03*water_mark_HL);
watermarked=idwt2(host_LL,water_marked_LH,water_marked_HL,host_HH,'haar');
subplot(1,3,3)
imshow(uint8(watermarked));
title('Watermarked image');
imwrite(uint8(watermarked),'Watermarked.png');
y='Watermarked succesfully';


[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');
[wm_LL,wm_LH,wm_HL,wm_HH]=dwt2(watermarked,'haar');
extracted_watermark_LH = (wm_LH-host_LH)/0.03;
extracted_watermark_HL = (wm_HL-host_HL)/0.03;
ext=idwt2(water_mark_LL,extracted_watermark_LH,extracted_watermark_HL,water_mark_HH,'haar');
figure
imshow(uint8(ext));
title('Extracted watermark');