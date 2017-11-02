path = uigetdir;
    s = size(path);
    if(path(s(2))~='/')
        path=[path,'/'];
    end
    d = dir(path);
    dirLen = size(d);
    dirLen = dirLen(1);
    
    j = 1;
    
    for file = 1:dirLen
        if(d(file).isdir == 0)
            fileRoute = strcat(path,d(file).name);
            info = dicominfo(fileRoute);
            dicomVector(j) = struct('file',fileRoute,'pos',info.SliceLocation);
            j=j+1;
        end
    end 
    
