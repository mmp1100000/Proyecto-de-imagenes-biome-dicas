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


end

