%%Visor de Im?genes

%%Turning off warnings
%[a,MSGID] = lastwarn()
warning('off','images:dicominfo:fileVRDoesNotMatchDictionary'); %Turn off Marco's programm warning
warning('off','MATLAB:nargchk:deprecated'); %Turn off getkey news
%%

%uigetdir crea una interfaz para seleccionar un directorio

dicomlist = loadDicom(uigetdir);
cnt = 1;
key = 0;

while key ~= 27
    
    I = dicomread(dicomlist(cnt));
    imshow(I,[]);
    
    fprintf('press a key, please');
    key = getkey;
    
    if key ~= 27 && key ~= 28 && key ~= 29
        fprintf('press a key, please');
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
