function [phi] = DRLSE(Img, phi, alfa)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%%
Img=double(Img(:,:,1));
%% parameter setting
timestep=5;  % time step
mu=0.2/timestep;  % coefficient of the distance regularization term R(phi)
iter_inner=5;
iter_outer=1000; %%%%%%1000
lambda=5; % coefficient of the weighted length term L(phi)
epsilon=1.5; % papramater that specifies the width of the DiracDelta function

sigma=0.8;    % scale parameter in Gaussian kernel
G=fspecial('gaussian',5,sigma); % Caussian kernel      %%%%%%%%15
Img_smooth=conv2(Img,G,'same');  % smooth image by Gaussiin convolution
[Ix,Iy]=gradient(Img_smooth);
f=Ix.^2+Iy.^2;
g=1./(1+f);  % edge indicator function.


%% Better view of Selected Zones
figure(2);
mesh(-phi);   % for a better view, the LSF is displayed upside down
hold on;  contour(phi, [0,0], 'r','LineWidth',2);
title('Initial level set function');
view([-80 35]);
%%

%%
figure(2);
imshow(Img,[]);
axis off;
axis equal; 
hold on;  
contour(phi, [0,0], 'r');
title('Initial zero level contour');
pause(0.5);

potential=2;  
if potential ==1
    potentialFunction = 'single-well';  % use single well potential p1(s)=0.5*(s-1)^2, which is good for region-based model 
elseif potential == 2
    potentialFunction = 'double-well';  % use double-well potential in Eq. (16), which is good for both edge and region based models
else
    potentialFunction = 'double-well';  % default choice of potential function
end  

% start level set evolution

figure(3);
imshow(Img,[]); axis off; axis equal; hold on;
        [C] = contourc(phi, [0,0]);
        [x,y] = C2xyz(C);
        dim = plot(x{:}(1),y{:}(1),'r','linewidth',2);
        pos = get(gcf,'Position');
        
for n=1:iter_outer
    phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);    
    if mod(n,2)==0
        n
        pause(0.01)
        figure(3);
        [C] = contourc(phi, [0,0]);
        [x,y] = C2xyz(C);
        set(dim,'XData',x{:});
        set(dim,'YData',y{:});
    end
end
end

