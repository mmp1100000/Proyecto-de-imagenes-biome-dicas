%Test_Edu

%I = select_image();

info=dicominfo('I1000000');
I= dicomread(info);
imshow(I,[], 'InitialMagnification',400);


I=double(I(:,:,1));
phi = rectangles(I);

DRLSE(I,phi);

