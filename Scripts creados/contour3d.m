function [] =contour3d (phi,z)
 [puntosX, puntosY]=C2xyz(contourc(phi,[0,0]));
 for i= 1:numel(puntosX)
 puntosZ=ones(1,numel(puntosX{i}))*z;
 plot3(puntosX{i},puntosY{i},puntosZ,'linewidth',11)
 end