[IInit,cntInit,dicomList,info] = select_image2();
phi = rectangles(IInit);
vari = select_var();
[phiInit,vari,areaInit,dim]=DRLSE(IInit,phi,vari);
[C,A]=fetchContours(dicomList,vari,phiInit,cntInit,areaInit);
show3D(C);
volumen = volumeMM(A,info);