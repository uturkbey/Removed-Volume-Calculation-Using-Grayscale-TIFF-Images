function approximateHeights = approximate(data, x0, y0, x1, y1, x2, y2, x3, y3)
%approximate function creates and returns an approximate surface wrt 4
%points on the borders. This approximation is solely linear.

%initially approximateHeights is equal to data
approximateHeights = data;

%Creating a vector X by inserting 4 data points
X = [x0, y0, data(y0,x0); x1, y1, data(y1,x1); x2, y2, data(y2,x2); x3, y3, data(y3,x3)];

%affine_fit function fits a plane to data points 
[n,V,p] = affine_fit(X);
n = n.'; %n is a column vector form, apply transpose to get row vector form 

%get dimensions o matrix for later use
[rows, columns] = size(data);

%loop through each element of the matrix and discard(set equal to zero) if
%necessary
for y = 1:rows
    for x = 1:columns
        if approximateHeights(y, x) ~= 0
            approximateHeights(y, x) = evaluateZ(x, y, n, p);
        end
    end
end

end

function value = evaluateZ(x,y,n,p)
    %evaluateZ funciton evaluates the Z(x,y) of the plane with normal
    %vector n and passing from point p
    
    value = p(3) - (n(1)/n(3))*(x-p(1)) - (n(2)/n(3))*(y-p(2));
end

function [n,V,p] = affine_fit(X)
    %Computes the plane that fits best (lest square of the normal distance
    %to the plane) a set of sample points.
    %INPUTS:
    %
    %X: a N by 3 matrix where each line is a sample point
    %
    %OUTPUTS:
    %
    %n : a unit (column) vector normal to the plane
    %V : a 3 by 2 matrix. The columns of V form an orthonormal basis of the
    %plane
    %p : a point belonging to the plane
    %
    %NB: this code actually works in any dimension (2,3,4,...)
    %Author: Adrien Leygue
    %Date: August 30 2013
    
    %the mean of the samples belongs to the plane
    p = mean(X,1);
    
    %The samples are reduced:
    R = bsxfun(@minus,X,p);
    %Computation of the principal directions if the samples cloud
    [V,D] = eig(R'*R);
    %Extract the output from the eigenvectors
    n = V(:,1);
    V = V(:,2:end);
end

