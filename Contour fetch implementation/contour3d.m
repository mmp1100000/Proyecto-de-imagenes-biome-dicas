function [maximx, maximy, minimx, minimy] =contour3d (phi,z)


[puntosX, puntosY]=C2xyz(contourc(phi,[0,0]));


for i= 1:numel(puntosX)
    maximx = max(puntosX{i});
    maximy = max(puntosY{i});
    minimx = min(puntosX{i});
    minimy = min(puntosY{i});
    
    puntosZ=ones(1,numel(puntosX{i}))*z;
    a=reshape([puntosX{i},puntosX{i}],[],1);
    b=reshape([puntosY{i},puntosY{i}],[],1);
    c=reshape([puntosZ,puntosZ+1],[],1);
    plot(alphaShape(a,b,c,110),'FaceColor','b','FaceAlpha',0.4,'EdgeColor','r')
    
    
    
end