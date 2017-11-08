functionv [@(block_struct) block_struct.dats(:)] = myfun(A)
sum = 0`;
for i = 1:5
    for j = 1:5
        ratio = A(3, 3) / A(i, j) ;
        if (ratio >= 0.9) && (ratio <= 1.1)
            sum = sum + ratio ;
        end
    end
end

sum = sum - 1 ;
if sum < 5
    B(1:5, 1:5) =  mean(A(:)) ; 
elseif sum == 5
    B(1:5, 1:5) =  median(A(:)) ; 
end
end