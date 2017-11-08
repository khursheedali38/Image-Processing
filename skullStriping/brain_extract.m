%read  image
I = imread('brain_skull.jpg') ;

%convert 2 gray scale
I = im2double(rgb2gray(I)) ;

%resize
I = imresize(I, [256 256])

%binarize
level = graythresh(I) ;
BW = im2bw(I, level) ;

%opening operation
se = strel('disk', 3) ;
BW = imopen(BW, se) ;

%gettingn  biggest component
BW = bwareafilt(BW, 1) ;

%closing operation
BW = imclose(BW, se) ;

J = I .*BW ;

imtool([I J]) ;


