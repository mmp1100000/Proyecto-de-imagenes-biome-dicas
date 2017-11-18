[IInit,cntInit,dicomList] = select_image2();
phi = rectangles(IInit);
vari = select_var();
[phiInit,vari,areaInit,dim]=DRLSE(IInit,phi,vari);
[Z,C,A]=fetchContours(dicomList,vari,phiInit,cntInit,areaInit);
