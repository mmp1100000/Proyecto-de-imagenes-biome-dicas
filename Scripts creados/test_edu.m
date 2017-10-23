%Test_Edu

I = select_image();

[X,Y] = ginput(2);
selectedImg = I;

c0=2;
initialLSF = c0*ones(size(selectedImg));
% generate the initial region R0 as two rectangles
initialLSF(Y(1) : Y(2),X(1) : X(2))= -c0;
phi=initialLSF;
hold on;
contour(phi, [0,0], 'r','LineWidth',2);