%read image and convert to grayscale
I = imread('tablets.jpg') ;
I = rgb2gray(I) ;

%binarize the image
thresh = graythresh(I) ;
BW = im2bw(I, thresh) ;
imtool(BW, []) ;

%apply morphological operators
se = strel('disk', 5) ;
BW1 = imopen(BW, se) ;
imtool(BW1, []) ;

%count the number of used tablets
[L, num] = bwlabel(BW1) ;

%remove noise from image
I1 = medfilt2(I) ;
imtool(I1, []) ;

%hist equalization  
I2 = histeq(I1) ;
imtool(I2, []) ;

%binarize the image
thresh = graythresh(I2) ;
BW2 = im2bw(I2, thresh) ;
imtool(BW2, []) ;

%apply morphological operators
se = strel('disk', 7) ;
BW3 = imopen(BW2, se) ;
imtool(BW3, []) ;

%get the location of unused tablet, which is also the smallest
BW4 = bwareafilt(BW3,1, 'smallest') ;
imtool(BW4, []) ;

%erode this image untill it becomes single point/dot/pixel
se = strel('disk', 9) ;
BW5 = imerode(BW4, se) ;
imtool(BW5, []) ;

%get the centre pixel value
for i = 1:size(BW5, 1) 
    for j = 1:size(BW5, 2)
        if BW5(i, j) == 1
            rowIndex = i ;
            colIndex = j ;
        end
    end
end



