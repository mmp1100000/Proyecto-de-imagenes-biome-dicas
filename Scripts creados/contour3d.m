function [] =contour3d (phi,z)
 [puntosX, puntosY]=C2xyz(contourc(phi,[0,0]));
 for i= 1:numel(puntosX)
 
 puntosZ=ones(1,numel(puntosX{i}))*z;
 a=reshape([puntosX{i},puntosX{i}],[],1);
 b=reshape([puntosY{i},puntosY{i}],[],1);
 c=reshape([puntosZ,puntosZ+1],[],1);
 plot(alphaShape(a,b,c,10),'FaceColor','b','FaceAlpha',0.4,'EdgeColor','none')
 
 
 
 end