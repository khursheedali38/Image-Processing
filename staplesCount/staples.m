%read Image
I = imread('Staple5.tif') ;

%remove noise and binarize
I1 = medfilt2(I) ;
I2 = im2bw(I1, graythresh(I1)) ;

%perform hist equalization to not miss right first pixel
I3 = histeq(uint8(I2)) ;
I4 = imerode(I3, strel('rectangle', [13 3])) ;

%I4 has different dynamic range so bring to 0 and 1 and count
I5 = im2bw(I4, graythresh(I4)) ;
[L, num] = bwlabel(I5) ;
imtool(I5, []) ;
