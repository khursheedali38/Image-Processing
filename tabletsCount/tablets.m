I = imread('image.jpg') ;
I = rgb2gray(I) ;
thresh = graythresh(I) ;
BW = im2bw(I, thresh) ;

