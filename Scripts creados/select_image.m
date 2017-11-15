function [I] = select_image()
%This function receives a directory and shows all the images inside it. Then, 
%when "scape" pressed, the function returns the image being viewed.


%%Turning off warnings
%[a,MSGID] = lastwarn()
warning('off','images:dicominfo:fileVRDoesNotMatchDictionary'); %Turn off Marco's programm warning
warning('off','MATLAB:nargchk:deprecated'); %Turn off getkey news
%%

    function [] = dispImg(varargin)
    % Callback for pushbutton
        keyNum = 29;
    end

%uigetdir creates a visual interface for selecting the images location

dicomlist = loadDicom(uigetdir);
cnt = 1;
key = 0;
info = dicominfo(dicomlist(cnt).file);
I = dicomread(info);
figure
btn = uicontrol('Style', 'pushbutton', 'String', 'Next','Position', [20 20 50 20],'Callback', @(src,evnt)dispImg());
curImg = imshow(I,[],'InitialMagnification','fit');
keyNum = 0;


while key ~= 27
    info = dicominfo(dicomlist(cnt).file);
    I = dicomread(info);
    set(curImg,'CData',I);
    title(strcat('Z:      ',num2str(round(dicomlist(cnt).pos))));
    %key = getkey;
    key = keyNum;
    %key = 29;
    if key ~= 27 && key ~= 28 && key ~= 29
        %key = getkey;
    end
    
    if key == 29 
        if cnt ~= numel(dicomlist)
            cnt = cnt + 1;
        else
            cnt=1;
        end
        %pause(0.1);
    else
        if key == 28 
           if cnt ~= 1
            cnt = cnt - 1;
           else
            cnt=numel(dicomlist);
           end
        end
    end
    keyNum=0;
end %Show images


end

