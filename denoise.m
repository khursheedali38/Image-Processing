%reading input image
I = imread('brain_skull.jpg');

%rgb to grayscale
I = rgb2gray(I); 
I = im2double(I);

%reszing image to 256 x 256
I = imresize(I, [256 256]);

%adding uniformly distributed random noise to image 
J = imnoise(I, 'salt & pepper', 0.01) ;
imtool([I J])

%selecting subimages of size 5x5 and calcualting R1, R2, R3 segments
for i = 1:252
    for j = 1:252
        B = I( (i : i + 4), (j : j + 4) )
        sum = 0 ;
        for k = [1 2 4 5]
            ratio = B(3, 3) / B(k, k);
            if (ratio >=0.9 ) && (ratio <=1.1 )
                sum = sum + ratio ;
            end
        end
        if sum < 5
            %noisy sub-image
            I( (i : i + 4), (j : j + 4) ) = mean(B(:)) ;
            %imshow(I) ;
        else sum = 5
            %edge sub-image
            I( (i : i + 4), (j : j + 4) ) = median(B(:)) ;
            %imshow(I) 
        end
    end
end

%displaying the final image
imshow(I) ;
    
    
            
            