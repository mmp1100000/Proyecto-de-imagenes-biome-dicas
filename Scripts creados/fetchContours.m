function [ cnt,phiV,A ] = fetchContours( dicomList,vari,phi,cnt,areaInit)
% FETCHCONTOURS makes magic.
% TODO Do something
area = areaInit;
max = round(numel(dicomList)/2);
phiV = struct('phi',cell(1,max),'cnt',cell(1,max));
A = struct('area',cell(1,max),'cnt',cell(1,max));
vari(1)={'0'};
vari(4)={'100'};
cntI = cnt;
while area > str2double(vari(7))*areaInit && numel(dicomList)>=cnt
    info = dicominfo(dicomList(cnt).file);
    Img = dicomread(info);
    figure(8)=imshow(Img,[]);%%
    hold on
    [alfa,lambda,timestep,iter_outer,mu,...
        iter_inner,epsilon,g,potentialFunction] = calculations(Img,vari);
    try
        for n=1:iter_outer
            phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);
            area = pixel_area(phi);

            [C] = contourc(phi, [0,0]);
            [x,y] = C2xyz(C);
            dim = initialContour(x,y);
            plotcontour(C,numel(x),dim);
            pause(0.00001);
        end
    catch ME
        if (strcmp(ME.identifier,'MATLAB:TooManyInputs'))
            pause;
            info = dicominfo(dicomList(cnt-1).file);
            Img = dicomread(info);
            imshow(Img,[]);
            initialContour(x,y);
            break;
        end
    end

    phiV(cnt) = struct('phi',phi,'cnt',cnt);
    A(cnt) = struct('area',area,'cnt',cnt);
    cnt = cnt+1;
end



cnt=cntI;




end
