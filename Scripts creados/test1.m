imgVector = loadDicom('../imag/IUHARF4D');
figure
imshow(dicomread(imgVector(3)),[]);
pause
close all;