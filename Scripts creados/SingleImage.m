%%Search for edge on a single image
close all
clear all
clc
[filename1, pathname1] = uigetfile( ...
    {'*.*',  'All Files (*.*)'}, ...
    'Pick a file', ...
    'MultiSelect', 'off');

imgMatrix = imread(strcat(pathname1,filename1));
if ndims(imgMatrix) == 3
    imgMatrix = rgb2gray(imgMatrix);
end
imgMatrix = imresize(imgMatrix, 0.5);
imshow(imgMatrix,[]);
phi = rectangles(imgMatrix);
vari = select_var();
[phiInit,vari,areaInit,dim]=DRLSE(imgMatrix,phi,vari);