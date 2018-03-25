function [] = show3D(C)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

warning('off','MATLAB:alphaShape:DupPointsBasicWarnId');

figure;
hold on
maximx = 0;
maximy = 0; 
minimx = inf;
minimy = inf;


for ii = 2 : numel(C)-1
    [localmaximx, localmaximy, localminimx, localminimy] = contour3d(C(ii).phi,C(ii).cnt); 
    
    if localmaximx > maximx
        maximx = localmaximx;
    end
    
    if localmaximy > maximy
        maximy = localmaximy;
    end
    
    if localminimx < minimx
        minimx = localminimx;
    end
    
    if localminimy < minimy
        minimy = localminimy;
    end
    
end

xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')

view(70,2);

xlim([minimx maximx])
ylim([minimy maximy])

end
