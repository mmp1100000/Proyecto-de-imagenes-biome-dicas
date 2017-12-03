function [phiV,A ] = fetchContours( dicomList,vari,phi,cnt,areaInit)
% FETCHCONTOURS makes magic.
% TODO Do something
area = areaInit;
phiInit = phi;
max = round(numel(dicomList));%%/2);
phiV = struct('phi',cell(1,max),'cnt',cell(1,max));
A = struct('area',cell(1,max),'cnt',cell(1,max));
vari(1)={'0'};
vari(4)={'100'};
cntI = cnt;

figure

%% Upper While
while area > str2double(vari(7))*areaInit && numel(dicomList)>=cnt
    info = dicominfo(dicomList(cnt).file);
    Img = dicomread(info);
    imshow(Img,[]);
    title(cnt);
    hold on
    [alfa,lambda,timestep,iter_outer,mu,...
        iter_inner,epsilon,g,potentialFunction] = calculations(Img,vari);
    
    for n=1:iter_outer
        phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon,...
            timestep, iter_inner, potentialFunction);
        area = pixel_area(phi);
        
        if area ~= 0
            [C] = contourc(phi, [0,0]);
            [x,y] = C2xyz(C);
            dim = initialContour(x,y);
            plotcontour(C,numel(x),dim);
            drawnow;
        end
    end
    
    phiV(cnt) = struct('phi',phi,'cnt',cnt);
    A(cnt) = struct('area',area,'cnt',cnt);
    cnt = cnt+1;
end

cnt=cntI;

area = areaInit;
phi = phiInit;
figure
%% Under While
while area > str2double(vari(7))*areaInit && cnt > 0
    info = dicominfo(dicomList(cnt).file);
    Img = dicomread(info);
    imshow(Img,[]);
    hold on
    [alfa,lambda,timestep,iter_outer,mu,...
        iter_inner,epsilon,g,potentialFunction] = calculations(Img,vari);
    
    for n=1:iter_outer
        phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon,...
            timestep, iter_inner, potentialFunction);
        area = pixel_area(phi);
        
        if area ~= 0
            [C] = contourc(phi, [0,0]);
            [x,y] = C2xyz(C);
            dim = initialContour(x,y);
            plotcontour(C,numel(x),dim);
            drawnow;
        end
    end
    
    phiV(cnt) = struct('phi',phi,'cnt',cnt);
    A(cnt) = struct('area',area,'cnt',cnt);
    cnt = cnt-1;
end


phiV = phiV(~cellfun(@isempty,{phiV.cnt}));
A = A(~cellfun(@isempty,{A.cnt}));






end
