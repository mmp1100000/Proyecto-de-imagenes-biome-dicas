function [x,y,num_cont,dim] = plotcontour(C,num_cont,dim)
%PLOTCONTOUR update the previous contour faster than using function
%contour. It is possible thanks to setting XData and YData obtained from
%matrix C.
%
%PLOTCONTOUR(C,num_cont,dim) 'C' is the matrix obtained from contourc.
%'num_cont' is the number is contours to update. 'dim' is the array where
%the contours are stored.
%
% [x,y,num_cont,dim] = PLOTCONTOUR(C,num_cont,dim) returns the axis x and
% y, the number of contours and the array with the contours.

[x,y] = C2xyz(C);

numcontact = numel(x);
orange = [1,0.5,0.3];

if num_cont ~= numcontact
    dim(numcontact) = plot(x{max(numcontact-1,1)},y{max(numcontact-1,1)},'Color',orange,'linewidth',2);        %%%%%%%%
    num_cont = numcontact;
end

if numel(x) == 1
    set(dim,'XData',x{:});
    set(dim,'YData',y{:});
else
    for j=1:numel(x)
        set(dim(j),'XData',x{j});
        set(dim(j),'YData',y{j});
    end
    
end

