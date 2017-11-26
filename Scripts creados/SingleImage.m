%%Search for edge on a single image
clc
[filename1, pathname1, ~] = uigetfile( ...
       {'*.*',  'All Files (*.*)'}, ...
        'Pick a file', ...
        'MultiSelect', 'off');

imgMatrix = imread(strcat(pathname1,filename1));
%%imgMatrix = rgb2gray(imgMatrix);
imgMatrix = imresize(imgMatrix, 0.5);
imagesc(imgMatrix,[]); axis off; axis equal; colormap(gray); hold on;
phi = rectangles(imgMatrix);
vari = select_var();
[phiInit,vari,areaInit,dim]=DRLSE(imgMatrix,phi,vari);