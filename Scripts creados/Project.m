
[IInit,cntInit,dicomList] = select_image2();
phi = rectangles(IInit);
vari = select_var();
[phiInit,vari,areaInit]=DRLSE(IInit,phi,vari,1);
[Z,C,A]=fetchContours(dicomList,vari,phiInit,cntInit,areaInit);

