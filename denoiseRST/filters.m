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
        diff = block_struct.data() ;
        diff = abs(diff - diff(3, 3)) ;  
        [sortedValues, sortIndex] = sort(diff(:)) ;
        min5index = sortIndex(1:5) ;
        [I, J] = ind2sub([5 5], min5index) ;
        meanVal = (block_struct.data(I(1), J(1)) + block_struct.data(I(2), J(2)) + block_struct.data(I(3), J(3)) + block_struct.data(I(4), J(4)) + block_struct.data(I(5), J(5)) ) ./ 5 ;
        singlevalue(1:5, 1:5) = meanVal ;
else
    singlevalue(1:5, 1:5) = block_struct.data() ;
end
end