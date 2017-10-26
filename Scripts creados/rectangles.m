function [phi,number_of_rectangles] = rectangles(Image)
% Returns the rectangles.

warning('off','MATLAB:colon:nonIntegerIndex');

prompt={'Number of rectangles:'};
name='';
numlines=1;
defaultanswer={'1'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
answer=inputdlg(prompt,name,numlines,defaultanswer,options);

number_of_rectangles = str2double(answer(1));



c0=2;
initialLSF = c0*ones(size(Image));
% generate the initial region R0 as two rectangles
for cnt = 1:number_of_rectangles
[X,Y] = ginput(2);    
%initialLSF(Y(2*cnt-1) : Y(2*cnt),X(2*cnt-1) : X(2*cnt))= -c0;
initialLSF(min(Y(1),Y(2)) : max(Y(1),Y(2)),min(X(1),X(2)):max(X(1),X(2)))= -c0;
phi=initialLSF;
hold on;
contour(phi, [0,0], 'r','LineWidth',2);
end

end

