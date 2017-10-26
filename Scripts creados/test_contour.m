%Test contour

                        %%info = dicominfo('im1.bmp');
I= imread('im1.bmp');   %%I = dicomread(info);
I=double(I(:,:,1));
imagesc(I,[0 255]);  axis off; axis equal; colormap(gray);



phi = rectangles(I);


DRLSE(I,phi,-7.5);
pause(2);
close all

%[C]=contourc(phi, [0,0]);
%[x,y,z] = C2xyz(C);
%dim = plot(x{:},y{:},'r','linewidth',2)
%x.XData;
%set(dim,'XData',x.XData*0.5)