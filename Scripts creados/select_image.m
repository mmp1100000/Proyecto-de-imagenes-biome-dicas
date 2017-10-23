function [I] = select_image()
%This function receive a directory and show all the images inside it. Then, 
%when you press "scape", the function return the image that you were seeing


%%Turning off warnings
%[a,MSGID] = lastwarn()
warning('off','images:dicominfo:fileVRDoesNotMatchDictionary'); %Turn off Marco's programm warning
warning('off','MATLAB:nargchk:deprecated'); %Turn off getkey news
%%

%uigetdir creates a visual interface for selecting the images location

dicomlist = loadDicom(uigetdir);
cnt = 1;
key = 0;

while key ~= 27
    
    I = dicomread(dicomlist(cnt));
    imshow(I,[]);
    
    key = getkey;
    
    if key ~= 27 && key ~= 28 && key ~= 29
        key = getkey;
    end
    
    if key == 29 && cnt ~= numel(dicomlist)
        cnt = cnt + 1;
    else
        if key == 28 && cnt ~= 1
            cnt = cnt - 1;
        end
    end  
end %Show images


end

