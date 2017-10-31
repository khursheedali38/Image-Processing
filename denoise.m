%reading input image
I = imread('noisy.png');

%rgb to grayscale
I = rgb2gray(I); 
I = im2double(I);

% %adding uniformly distributed random noise to image 
%  I = imnoise(I, 'salt & pepper', 0.01) ;
 I = imresize(I, [230 217]) ;
J = I

%selecting subimages of size 5x5 and calcualting R1, R2, R3 segments
for i = 1:1:226
    for j= 1:1:213
        B = I( (i : i + 4), (j : j + 4) )
        sum = 0 ;
        for k = 1:5
            for l = 1:5
                if (k ==3)&&(l==3)
                    ratio = 0;
                else 
                    ratio = B(3, 3) / B(k, l);
                end
                if (ratio >=0.9 ) && (ratio <=1.1 )
                    sum = sum + ratio ;
                end
            end
        end

        if sum < 5
            %noisy sub-image
            J( i + 2, j + 2 ) = mean(B(:)) ;
            imshow(J) ;
        elseif sum == 5
            %edge sub-image
            diff = B ;
            diff = abs(diff - diff(3, 3)) ;  
            [sortedValues, sortIndex] = sort(diff(:)) ;
            min5index = sortIndex(1:5) ;
            [I, J] = ind2sub([5 5], min5index) ;
            meanVal = (B(I(1), J(1)) + B(I(2), J(2)) + B(I(3), J(3)) + B(I(4), J(4)) + B(I(5), J(5)) ) ./ 5 ;
            J( i+2, j + 2 ) = meanVal ;
            imshow(J) 
        else J( i + 2, j  + 2 ) = B(3, 3) ;
        end
    end
end
% 
% myfilter = @filters ;		
% J = blockproc(I, [1 1], myfilter, 'BorderSize', [2 2], 'TrimBorder', false);
I1 = conv2(I, [1 2 1; 2 4 2; 1 2 1] ./16, 'same') ;
I2 = medfilt2(I) ;


p1 = psnr(I1, I) ;
p2 = psnr(I2, I) ;
p3 = psnr(J, I) ;

    
            
            