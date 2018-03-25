%Main workflow execution script

%Propts user to select folder with DICOMS and shows an image viewer with controls to choose a specific image to start with.
[IInit,cntInit,dicomList,info] = select_image2();
%
%Prompts the user to choose points for initial contour(s).
phi = rectangles(IInit);
%
%Prompts user to select active contour variables.
vari = select_var();
%
%Obtains first calculated contour
[phiInit,vari,areaInit,dim]=DRLSE(IInit,phi,vari);
%
%Replicates contour fetch for each image.
[C,A]=fetchContours(dicomList,vari,phiInit,cntInit,areaInit);
%
show3D(C);
volumen = volumeMM(A,info);
