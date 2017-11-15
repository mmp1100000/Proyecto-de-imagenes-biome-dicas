function [I] = select_image2()
% SELECT_IMAGE2 Select one dicom image. After running, you must select the dir where the images
%are. In order to select the image that you want, there are several buttons. 
%
% I = imshow() returns that dicom images.
%

%%
    warning('off','images:dicominfo:fileVRDoesNotMatchDictionary'); %Turn off Marco's programm warning
%%
%% Select the directory where the images are.
    dicomlist = loadDicom(uigetdir);
%%

%% Counter of the current image
    cnt = 1;

%% Read and open the first one image from the directory
    info = dicominfo(dicomlist(cnt).file);
    I = dicomread(info);
    curImg = imshow(I,[],'InitialMagnification','fit');
    title(strcat({'Z:'},...
                         {' '},...
                         {num2str(round(dicomlist(cnt).pos))})); 
                         ax = gca; 
                         ttl = ax.Title; 
                         ttl.FontSize = 14;
%%

%% Next Button 
    S.pb = uicontrol('style', 'pushbutton',...
                     'string', 'Next',...
                     'position', [20 20 50 20],...
                     'callback', {@nextImg});
%%

%% Previous Button
    S.pb = uicontrol('style', 'pushbutton',...
                     'string', 'Previous',...
                     'position', [80 20 50 20],...
                     'callback', {@prevImg});


%% End Button
    S.pe = uicontrol('style', 'pushbutton',...
                     'string', 'End',...
                     'position', [140 20 50 20],...
                     'callback', {@endFunc});
%%

%% Variable which allows to finish this function
    exit=0;
%%


%% Handle function "nextImg" 
%It shows the next image 
    function [] = nextImg(varargin)
        if cnt ~= numel(dicomlist)
            cnt = cnt + 1;
            info = dicominfo(dicomlist(cnt).file);
            I = dicomread(info);
            set(curImg,'CData',I);
            title(strcat({'Z:'},...
                         {' '},...
                         {num2str(round(dicomlist(cnt).pos))})); 
                         ax = gca; 
                         ttl = ax.Title; 
                         ttl.FontSize = 14;
        end
    end
%%

%% Handle function "previousImg"
%It shows the previous image
    function [] = prevImg(varargin)
        if cnt ~= 1
            cnt = cnt - 1;
            info = dicominfo(dicomlist(cnt).file);
            I = dicomread(info);
            set(curImg,'CData',I);
            title(strcat({'Z:'},...
                         {' '},...
                         {num2str(round(dicomlist(cnt).pos))})); 
                         ax = gca; 
                         ttl = ax.Title; 
                         ttl.FontSize = 14;             
        end
    end
%%

%% Handle function "endFunc"
%It set the value "1" to the variable exit.
    function [] = endFunc(varargin)
        exit=1; 
    end
%%

%% Loop while. Thanks to it the buttons work properly. 
    while exit==0
       drawnow; % It update figure windows and process callbacks 
    end
%%

end