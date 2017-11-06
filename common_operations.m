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











