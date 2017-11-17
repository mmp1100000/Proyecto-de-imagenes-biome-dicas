function [dim] = initialContour(x,y)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    dim = gobjects(10,1);
    
if numel(x) == 1
    dim =  plot(x{:},y{:},'Color',[1,0.5,0.3],'linewidth',2);
else
    for p=1:numel(x)
        dim(p) = plot(x{p},y{p},'Color',[1,0.5,0.3],'linewidth',2);
    end
end

end

