function [aboveV, belowV, netV] = calcVolumes(data, approximateHeights, bitSize)
%UNTÝTLED4 calcVolumes function calculates the difference between the approximate surface and the actual 
%surface. Volume above and below the approximate surface are calculated
%seperately. Caution: Both row and column size of the data and approximateHeights
%must be same.

%Initially all volumes to be calculated are set to zero.
aboveV = 0;
belowV = 0;

%get dimensions o matrix for later use
[rows, columns] = size(data);

for y = 1:rows
    for x = 1:columns
        if data(y, x) ~= 0
            if data(y, x) <= approximateHeights(y,x)
                belowV = belowV + (approximateHeights(y,x)-data(y, x)) * bitSize * bitSize;
            else
                aboveV = aboveV + (data(y, x) - approximateHeights(y,x)) * bitSize * bitSize; 
            end
        end
    end
end

belowV = belowV / 1e9;
aboveV = aboveV / 1e9;
netV = belowV - aboveV;

end

