%reading input image
I = imread('brain_skull.jpg');

%rgb to grayscale
I = rgb2gray(I); 
I = im2double(I);

%reszing image to 256 x 256
I = imresize(I, [256 256]);

%adding uniformly distributed random noise to image 
p = 0.2;
J = (I + p*rand(size(I)))/(1+p);

imshow([I J]) ;