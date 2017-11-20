function [alfa,lambda,timestep,iter_outer,mu,iter_inner,epsilon,g,potentialFunction] = calculations(Img,vari)
%CALCULATIONS makes all the calculations necessary for drlse_edge
% 

warning('off','MATLAB:conv2:uint16Obsolete');

S = [str2double(vari(1))...
    str2double(vari(2))...
    str2double(vari(3))...
    str2double(vari(4))...
    str2double(vari(5))...
    str2double(vari(6))];

alfa = S(1);
lambda=S(2); % coefficient of the weighted length term L(phi)
timestep=S(3);  % time step
iter_outer=S(4);
mu=0.2/timestep;  % coefficient of the distance regularization term R(phi)
iter_inner=5;
epsilon=1.5; % papramater that specifies the width of the DiracDelta function

sigma=S(6);%2;%0.8;    % scale parameter in Gaussian kernel
G=fspecial('gaussian',S(5),sigma); % Caussian kernel      %%%%%%%%15
Img_smooth=conv2(Img,G,'same');  % smooth image by Gaussiin convolution
[Ix,Iy]=gradient(Img_smooth);
f=Ix.^2+Iy.^2;
g=1./(1+f);  % edge indicator function.




potential=2;

if potential ==1
    potentialFunction = 'single-well';  % use single well potential p1(s)=0.5*(s-1)^2, which is good for region-based model
elseif potential == 2
    potentialFunction = 'double-well';  % use double-well potential in Eq. (16), which is good for both edge and region based models
else
    potentialFunction = 'double-well';  % default choice of potential function
end

end
