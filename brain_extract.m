%read  image
I = imread('brain_up.jpg') ;

%convert 2 gray scale
I = im2double(rgb2gray(I)) ;

%resize
I = imresize(I, [256 256])

%image thresholding
% from R2016 version BW = imbinarize(I) ; 
level = graythresh(I) ;
BW = im2bw(I, level) ;
BW = bwareafilt(BW, 1) ;
J = I .*BW ;
imtool([I BW J]) ;

