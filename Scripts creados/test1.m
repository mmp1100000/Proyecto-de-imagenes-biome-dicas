imgVector = loadDicom(uigetdir);
figure
imshow(dicomread(imgVector(3)),[]);
[X,Y] = ginput(1);
close all;

