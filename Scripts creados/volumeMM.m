function[Volume]= volumeMM(area,Str)
info=dicominfo(Str.file);
Zs=info.SliceThickness;
Xs=info.PixelSpacing(1);
Ys=info.PixelSpacing(2);
Volume=area*Zs*Xs*Ys;
