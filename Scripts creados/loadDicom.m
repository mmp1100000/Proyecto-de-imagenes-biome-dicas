function [ dicomVector ] = loadDicom(d)

    path = d;
    s = size(path);
    if(path(s(2))~='/')
        path=[path,'/'];
    end
    d = dir(path);
    dirLen = size(d);
    dirLen = dirLen(1);
    dicomVector = struct([]);
    for file = 1:dirLen
        if(d(file).isdir == 0)
            %try
                info = dicominfo(strcat(path,d(file).name));
            %catch e
            dicomVector = [dicomVector info];
        end
    end    
end

