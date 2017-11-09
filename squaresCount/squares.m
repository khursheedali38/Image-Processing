
%Read image
I = imread('sq_img.jpg') ;
imtool(I, []) ;

%====================================================

%vector to store count of squares colorwise and size wise
%odd indices represent white squares
%even indices represent gray squares
x = [] ;

%====================================================
%Large Squares

%remove the smaller squares from image
I1 = imopen(I, strel('square', 13 )) ;
imtool(I1, []) ;

%binarize the image to get count of total squares of a particular size
thresh = graythresh(I1) ;
I2 = im2bw(I1, thresh) ;
[L1, num1] = bwlabel(I2) ; %total squares
imtool(I2, []) ;
I3 = im2bw(I1) ;
[L2, num2] = bwlabel(I3) ;%white squares
imtool(I3, []) ;
x = [x, num2, num1 - num2] ;

%remove the squares and move to nest size squares
I11 = I - uint8(I1) ;
imtool(I11, []) ;

%====================================================
%Medium Squares

%remove the smaller squares from image
I1 = imopen(I11, strel('square', 11 )) ;
imtool(I1, []) 

%binarize the image to get count of total squares of a particular size
thresh = graythresh(I1) ;
I2 = im2bw(I1, thresh) ;
[L1, num1] = bwlabel(I2) ; %total squares
imtool(I2, []) ;
I3 = im2bw(I1) ;
[L2, num2] = bwlabel(I3) ;%white squares
imtool(I3, []) ;
x = [x, num2, num1 - num2] ;

%remove the squares and move to nest size squares
I11 = I11 - uint8(I1) ;
imtool(I11, []) ;

%====================================================
%Small Squares

%final iteration only small squares left
I1 = imopen(I11, strel('square', 3 )) ;
imtool(I1, []) ;

%binarize the image to get count of total squares of a particular size
thresh = graythresh(I1) ;
I2 = im2bw(I11, thresh) ;
[L1, num1] = bwlabel(I2) ; %total squares
imtool(I2, []) ;
I3 = im2bw(I1) ;
[L2, num2] = bwlabel(I3) ;%white squares
imtool(I3, []) ;
x = [x, num2, num1 - num2] ;


    