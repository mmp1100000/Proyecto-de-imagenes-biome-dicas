function [phi] = rectangles(Image)
% Returns the rectangles.

warning('off','MATLAB:colon:nonIntegerIndex');

prompt = 'How many rectangles do you want? \n';
number_of_rectangles = input(prompt);


[X,Y] = ginput(2*number_of_rectangles);

c0=2;
initialLSF = c0*ones(size(Image));
% generate the initial region R0 as two rectangles
for cnt = 1:number_of_rectangles
    
initialLSF(Y(2*cnt-1) : Y(2*cnt),X(2*cnt-1) : X(2*cnt))= -c0;
phi=initialLSF;
hold on;
contour(phi, [0,0], 'r','LineWidth',2);
end

end

