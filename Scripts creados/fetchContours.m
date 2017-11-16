<<<<<<< HEAD
function [ cnt,phiV,A ] = fetchContours( dicomList,vari,phi,cnt,areaInit )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
area = areaInit;
max = round(numel(dicomList)/2);
phiV = struct('phi',cell(1,max),'cnt',cell(1,max));
A = struct('area',cell(1,max),'cnt',cell(1,max));
vari(1)={'0'};
vari(4)={'10'};
cntI = cnt;
while area > str2double(vari(7))*areaInit && numel(dicomList)>=cnt
    info = dicominfo(dicomList(cnt).file);
    I = dicomread(info);
    [phi,~,area]=DRLSE(I, phi,vari,0);
    phiV(cnt) = struct('phi',phi,'cnt',cnt);
     A(cnt) = struct('area',area,'cnt',cnt);
    cnt = cnt+1;
end

cnt=cntI;

=======
function [ cnt,C,A ] = fetchContours( dicomList,vari,phi,cnt,areaInit )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here    
    vari(1)=0;
    areanueva=areaInit;
    
while areanueva>(areaInit*0.2)
    info=dicominfo('I1000000');
    I= dicomread(info); 
    [Z,C,A]=DRLSE(I,phi,vari);
    
    areanueva =A; 
    A*info
end
while areanueva>(areaInit*0.2)

end
>>>>>>> fc16c40f06804408227660f87eceb10df8ea0f95


end

