%reading input image
I = imread('noisy.PNG');

%rgb to grayscale
I = rgb2gray(I); 
I = im2double(I);

%reszing image to 255 x 255
I = imresize(I, [217 217]);

%adding uniformly distributed random noise to image 
J = imnoise(I, 'salt & pepper', 0.01) ;
J = padarray(J, [4 4])
J3 = J ;

%selecting subimages of size 5x5 and calcualting R1, R2, R3 segments
for i = [1:2:217]
    for j = [1:2:217]
        B = J3( (i : i + 4), (j : j + 4) )
        sum = 0 ;
        for k = 1:5
            for l = 1:5
                ratio = B(3, 3) / B(k, l);
                if (ratio >=0.9 ) && (ratio <=1.1 )
                    sum = sum + ratio ;
                end
            end
        end
        %removing ratio of B(3, 3)
        sum = sum - 1 ;
        if sum < 5
            %noisy sub-image
            J( (i : i + 4), (j : j + 4) ) = mean(B(:)) ;
            imshow(J) ;
        elseif sum == 5
            %edge sub-image
            J( (i : i + 4), (j : j + 4) ) = median(B(:)) ;
            imshow(J) 
        else J( (i : i + 4), (j : j + 4) ) = B(1:5, 1:5) ;
        end
    end
end


%displaying the final image
imshow(J)
I1 = imresize(conv2(J3, ones(3) ./9), [225 225]) ;
I2 = imresize(conv2(J3, [1 2 1; 2 4 2; 1 2 1] ./16), [225 225]) ;
imtool([J I1 I2]) ;

p1 = psnr(J3, J) ;
P2 = psnr(J3, I1) ;
p3 = psnr(J3, I2) ;

    
            
            