function [phi] = rectangles(Image)
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

for cnt = 1:number_of_rectangles
[X,Y] = ginput(2);    

initialLSF(min(Y(1),Y(2)) : max(Y(1),Y(2)),min(X(1),X(2)):max(X(1),X(2)))= -c0;
phi=initialLSF;
hold on;
contour(phi, [0,0], 'LineColor',[1,0.5,0.3],'LineWidth',2);
end

end

