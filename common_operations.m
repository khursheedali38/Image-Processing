%edge detection using morphological operators
I = imread('moon.tif') ;
se = strel('disk', 3) ;
J = imerode(I, se) ;
E = I - J ;
imtool([I J E]) ;

% count number of objects in image when image is bw
I = imread('rice_bw.png') ;
imtool(I, []) ;
[L, num] = bwlabel(I) ;
RGB = label2rgb(L) ;
imtool(RGB, []) ;

%when image is noisy and grayscale
I = im2double(imread('rice.png')) ;
I = im2bw(I) ;
I = medfilt2(I) ;
imtool(I, []) ;
[L, num] = bwlabel(I) ;
RGB = label2rgb(L) ;
imtool(RGB, []) ;

%when image is grayscale
I = imread('coins.png') ;
I = im2bw(I) ;
I = imdilate(I, strel('disk', 3)) ;
I = imerode(I, strel('disk', 9)) ;% we need only count hence no issue for diferent dilation
[L, num] = bwlabel(I) ;
imtool(I, []) ;

%when image is grayscale and using imfill for hoels
I = imread('coins.png') ;
I = im2bw(I) ;
I = imfill(I, 'holes') ;
[L, num] = bwlabel(I) ;
RGB = label2rgb(L) ;
imtool(RGB, []) ;

%filling circles in image
I = imread('fill_circles_count.gif') ;
I = imclose(I, strel('disk', 17)) ;
imtool(I, []) ;

%skull stripping
I = im2double(imread('brain_skull.jpg')) ;
I = rgb2gray(I) ;
thresh = graythresh(I) ;
BW = im2bw(I, thresh) ;
BW = imopen(BW, strel('disk', 3)) ;
BW = bwareafilt(BW, 1) ;
BW = imclose(BW, strel('disk', 13)) ;
J = I .*BW ;
imtool([I BW J]) ;

%image enhancement/contrast enhancement to color images on RGB
I = imread('onion.png') ;
r = I(:, :, 1) ;
g = I(:, :, 2) ;
b = I(:, :, 3) ;
r1 = histeq(r) ;
g1 = histeq(g) ;
b1 = histeq(b) ;
J = cat(3, r1, g1, b1) ;
imtool([I J]) ;

%image enhancement/contrast enhancement to color images on HSV
I = imread('onion.png') ;
I1 = rgb2hsv(I) ;
v = histeq(I1(:, :, 3)) ;
I2 = cat(3, I1(:, :, 1), I1(:, :, 2), v) ;
I2 = hsv2rgb(I2) ;
imshowpair(I2, J, 'montage') ;

%color filtering - extract red color
I = im2double(imread('coloredChips.png')) ;
r = I(:, :, 1) ;
g = I(:, :, 2) ;
b = I(:, :, 3) ;
red = graythresh(r) ;
green = graythresh(g) ;
blue = graythresh(b) ;
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        if I(i, j, 1) < red || I(i, j, 2) > green || I(i, j, 3) > blue
            gsc = 0.3*I(i, j, 1) + 0.59*I(i, j, 2) + 0.11*I(i, j, 3) ;
            I(i, j, :) = [gsc gsc gsc] ;
        end
    end
end

imtool(I, []) ;


