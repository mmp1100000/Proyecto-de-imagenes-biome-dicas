
[IInit,zInit,dicomList] = select_image2();
phi = rectangles(IInit);
vari = select_var();
[phiInit,vari,areaInit]=DRLSE(IInit,phi,vari);
[Z,C,A]=fetchContours(dicomList,vari,phi,z);

