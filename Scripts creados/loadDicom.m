function [ dicomVector ] = loadDicom(d)

path = d;
    s = size(path);
    if(path(s(2))~='/')
        path=[path,'/'];
    end
    d = dir(path);
    dirLen = size(d);
    dirLen = dirLen(1);
    h=waitbar(0,'Loading images, please wait...')
    
    j = 1;
    
    for file = 1:dirLen
        h.Name=strcat('Importing image ',num2str(file));
        waitbar(file/dirLen);
        if(d(file).isdir == 0)
            fileRoute = strcat(path,d(file).name);
            info = dicominfo(fileRoute);
            dicomVector(j) = struct('file',fileRoute,'pos',info.SliceLocation);
            j=j+1;
        end
    end
    close(h)
    [~,index] = sortrows([dicomVector.pos].'); 
    dicomVector = dicomVector(index);
end


