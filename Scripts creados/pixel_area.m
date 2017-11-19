function [area] = pixel_area(phi)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
[C] = contourc(phi, [0,0]);
[x,y] = C2xyz(C);
area = 0;
for ii=1 : numel(x)
area = area + polyarea(x{ii},y{ii});
end

