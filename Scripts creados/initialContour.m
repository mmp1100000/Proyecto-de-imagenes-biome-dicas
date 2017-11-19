function [dim] = initialContour(x,y,dimension)
%initialContour plot a new orange contour over a figure. 
%
%initialContour(x,y) receives the values of axis x and y in order to plot the figure.
%
% [dim] = initialContour(x,y) returns dim. It is an array with the type of lyne.
%
% [dim] = initialContour(x,y,dimension) preallocate dim with the desired
% dimension.
%
% Default dimension of dim is 10, but it culd be higher if it is necessary or desired. 

    switch nargin
        case 2
    dimension = 10;       
    end
    
    dim = gobjects(dimension,1);
    orange = [1,0.5,0.3];
    
if numel(x) == 1
    dim =  plot(x{:},y{:},'Color',orange,'linewidth',2);
else
    for p=1:numel(x)
        dim(p) = plot(x{p},y{p},'Color',orange,'linewidth',2);
    end
end

end

