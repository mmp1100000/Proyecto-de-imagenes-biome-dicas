function [area] = pixel_area(phi)
%PIXEL_AREA calculate the area inside each contour over the image.
%It extracts the axis x and y and call the function polyarea.
%
% [area] = PIXEL_AREA(phi) returns the total area.
%

[C] = contourc(phi, [0,0]);
try
    [x,y] = C2xyz(C);
    
    area = 0;
    for ii=1 : numel(x)
        area = area + polyarea(x{ii},y{ii});
    end
    
catch ME
    
    if(strcmp(ME.identifier,'MATLAB:unassignedOutputs'))
        area = 0;
    end
end

