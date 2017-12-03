function[Volume_mm]= volumeMM(A,info)

area = 0;

for ii = 1 : numel(A)
    area = area + A(ii).area;
end

Zs=info.SliceThickness;
Xs=info.PixelSpacing(1);
Ys=info.PixelSpacing(2);

Volume_mm=area*Zs*Xs*Ys;

Volume_liter = Volume_mm * 10^-6;

formatSpec = 'Total volume is %4.2f mm³ or %4.2f liters \n';
fprintf(formatSpec,Volume_mm,Volume_liter)

end
