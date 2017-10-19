function singlevalue = filters(block_struct)
singlevalue=zeros(5);
sum = 0 ;
for n=1:5
    for m=1:5
        if (n == 3) && (m == 3)
            ratio = 0;
        else
            ratio = block_struct.data(3, 3) / block_struct.data(n,m) ;
            if (ratio >= 0.9) && (ratio <= 1.1)
                sum = sum + ratio ;
            end
        end
    end
end

if sum < 5
    singlevalue(1:5, 1:5) = mean(block_struct.data(:)) ;
elseif sum == 5
    singlevalue(1:5, 1:5) = median(block_struct.data(:)) ; %change to mean closest five pixels
else
    singlevalue(1:5, 1:5) = block_struct.data(1:5, 1:5) ;
end
end