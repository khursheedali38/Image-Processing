%edge detection using morphological operators
I = imread('moon.tif') ;
se = strel('disk', 3) ;
J = imerode(I, se) ;
E = I - J ;
imtool([I J E]) ;

%Fill holes in circle
I = imread('coins.png') ;
thresh = graythresh(I) ;
I = im2bw(I, thresh) ;
se = strel('disk', 5) ;
K = imclose(I, se) ;
imtool([I K]) ;