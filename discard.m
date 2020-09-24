function discardedData = discard(data, x0, y0, x1, y1, x2, y2, x3, y3)
%discard function discards the all ramining region beyond the quadrilateral border 
%(defined by these points)of material removal site.. 
%Line equations and matrix manipulations are done. 

%initially the discarded data is set equal to original data 
discardedData = data;

%   Discarding wrt (x0,y0) & (x1,y1) line
if y2 > evaluateY(x2, x0, y0, x1, y1)
   discardedData = discardBelowY(discardedData, x0, y0, x1, y1);
else
   discardedData = discardAboveY(discardedData, x0, y0, x1, y1);
end 
%   Discarding wrt (x1,y1) & (x2,y2) line
if x3 > evaluateX(y3, x1, y1, x2, y2)
   discardedData = discardBelowX(discardedData, x1, y1, x2, y2);
else
   discardedData = discardAboveX(discardedData, x1, y1, x2, y2);
end
%   Discarding wrt (x2,y2) & (x3,y3) line
if y0 > evaluateY(x0, x2, y2, x3, y3)
   discardedData = discardBelowY(discardedData, x2, y2, x3, y3);
else
   discardedData = discardAboveY(discardedData, x2, y2, x3, y3);
end
%   Discarding wrt (x3,y3) & (x0,y0) line
if x1 > evaluateX(y1, x3, y3, x0, y0)
   discardedData = discardBelowX(discardedData, x3, y3, x0, y0);
else
   discardedData = discardAboveX(discardedData, x3, y3, x0, y0);
end

end

function value = evaluateY(x, x0, y0, x1, y1)
%evaluate function evaluates the y value wrt x as if it is a point on the line
%passing through x0,yo and x1,y1 points

value = y0 + ((y1-y0)/(x1-x0))*x - ((y1-y0)/(x1-x0))*x0; 

end

function value = evaluateX(y, x0, y0, x1, y1)
%evaluate function evaluates the y value wrt x as if it is a point on the line
%passing through x0,yo and x1,y1 points

value = x0 + ((x1-x0)/(y1-y0))*y - ((x1-x0)/(y1-y0))*y0;
end

function discardedData = discardBelowY(data, x0, y0, x1, y1)
%discardBelow function discards the whole region below the line passing
%form x0, y0, x1, y1 and sets all the points equal to zero.

%initially discardedData is equal to data
discardedData = data;

%get dimensions o matrix for later use
[rows, columns] = size(data);

%loop through each element of the matrix and discard(set equal to zero) if
%necessary
for y = 1:rows
    for x = 1:columns
        if y < evaluateY(x,x0,y0,x1,y1) 
            discardedData(y,x) = 0;
        end
    end
end

end

function discardedData = discardBelowX(data, x0, y0, x1, y1)
%discardBelow function discards the whole region below the line passing
%form x0, y0, x1, y1 and sets all the points equal to zero.

%initially discardedData is equal to data
discardedData = data;

%get dimensions o matrix for later use
[rows, columns] = size(data);

%loop through each element of the matrix and discard(set equal to zero) if
%necessary
for y = 1:rows
    for x = 1:columns
        if x < evaluateX(y,x0,y0,x1,y1) 
            discardedData(y,x) = 0;
        end
    end
end

end

function discardedData = discardAboveY(data, x0, y0, x1, y1)
%discardBelow function discards the whole region above the line passing
%form x0, y0, x1, y1 and sets all the points equal to zero.

%initially discardedData is equal to data
discardedData = data;

%get dimensions o matrix for later use
[rows, columns] = size(data);

%loop through each element of the matrix and discard(set equal to zero) if
%necessary
for y = 1:rows
    for x = 1:columns
        if y > evaluateY(x,x0,y0,x1,y1) 
            discardedData(y,x) = 0;
        end
    end
end

end

function discardedData = discardAboveX(data, x0, y0, x1, y1)
%discardBelow function discards the whole region above the line passing
%form x0, y0, x1, y1 and sets all the points equal to zero.

%initially discardedData is equal to data
discardedData = data;

%get dimensions o matrix for later use
[rows, columns] = size(data);

%loop through each element of the matrix and discard(set equal to zero) if
%necessary
for y = 1:rows
    for x = 1:columns
        if x > evaluateX(y,x0,y0,x1,y1) 
            discardedData(y,x) = 0;
        end
    end
end

end