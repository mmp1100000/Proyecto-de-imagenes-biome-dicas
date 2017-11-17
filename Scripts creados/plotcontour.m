function [x,y,num_cont,dim] = plotcontour(C,num_cont,dim)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[x,y] = C2xyz(C);

numcontact = numel(x);

if num_cont ~= numcontact
    dim(numcontact) = plot(x{max(numcontact-1,0)},y{max(numcontact-1,0)},'Color',[1,0.5,0.3],'linewidth',2);        %%%%%%%%
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

