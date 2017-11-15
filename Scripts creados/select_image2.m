function [I] = select_image2()
warning('off','images:dicominfo:fileVRDoesNotMatchDictionary'); %Turn off Marco's programm warning
warning('off','MATLAB:nargchk:deprecated'); %Turn off getkey news
%%
dicomlist = loadDicom(uigetdir)
cnt = 1;
info = dicominfo(dicomlist(cnt).file);
I = dicomread(info);
curImg = imshow(I,[],'InitialMagnification','fit')
S.pb = uicontrol('style', 'pushbutton', 'string', 'Next','position', [20 20 50 20],'callback', {@nextImg});

    function [] = nextImg(varargin)
        info = dicominfo(dicomlist(cnt).file);
        I = dicomread(info);
        set(curImg,'CData',I);
        title(strcat('Z:      ',num2str(round(dicomlist(cnt).pos))));
        cnt = cnt + 1;
    end

    function [] = prevImg(varargin)
        info = dicominfo(dicomlist(cnt).file);
        I = dicomread(info);
        set(curImg,'CData',I);
        title(strcat('Z:      ',num2str(round(dicomlist(cnt).pos))));
        cnt = cnt - 1;
    end

end