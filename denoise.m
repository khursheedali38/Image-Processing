%reading input image
I = imread('noisy.PNG');

%rgb to grayscale
I = rgb2gray(I); 
I = im2double(I);

%reszing image to 255 x 255
I = imresize(I, [217 217]);

% %adding uniformly distributed random noise to image 
% J = imnoise(I, 'salt & pepper', 0.01) ;
J = I

% %selecting subimages of size 5x5 and calcualting R1, R2, R3 segments
% for i = 1:2:217
%     for j = 1:2:217
%         B = J3( (i : i + 4), (j : j + 4) )
%         sum = 0 ;
%         for k = 1:5
%             for l = 1:5
%                 if (k ==3)&&(l==3)
%                     ratio = 0;
%                 else 
%                     ratio = B(3, 3) / B(k, l);
%                 end
%                 if (ratio >=0.9 ) && (ratio <=1.1 )
%                     sum = sum + ratio ;
%                 end
%             end
%         end
% 
%         if sum < 5
%             %noisy sub-image
%             J4( (i : i + 4), (j : j + 4) ) = mean(B(:)) ;
%             imshow(J4) ;
%         elseif sum == 5
%             %edge sub-image
%             J4( (i : i + 4), (j : j + 4) ) = median(B(:)) ;
%             imshow(J4) 
%         else J4( (i : i + 4), (j : j + 4) ) = B(1:5, 1:5) ;
%         end
%     end
% end

myfilter = @filters ;
processedimage = blockproc(J, [1 1], myfilter, 'BorderSize', [2 2], 'TrimBorder', false);
processedimage = imresize(processedimage, [225 225]) ;

%displaying the final image
imshow(processedimage) ;
I1 = imresize(conv2(J, [1 2 1; 2 4 2; 1 2 1] ./16), [225 225]) ;
I2 = imresize(medfilt2(J), [225 225]) ;
J = imresize(J, [225 225]) ;
imtool([J I1 I2 processedimage]) ;

p1 = psnr(I1, J) ;
p2 = psnr(I2, J) ;
p3 = psnr(processedimage, J) ;

    
            
            