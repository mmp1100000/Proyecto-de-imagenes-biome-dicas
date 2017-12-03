function [phi,vari,area,dim] = DRLSE(Img, phi,vari)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%%
Img=double(Img(:,:,1));
%% parameter setting

phiInicial = phi;                                               %%WHILE

bucle = 0;

while bucle ~= 27                                               
    phi = phiInicial;
    
    [alfa,lambda,timestep,iter_outer,mu,...
     iter_inner,epsilon,g,potentialFunction] = calculations(Img,vari);
    
    % start level set evolution
    
    figure(2);
    imshow(Img,[]); axis off; axis equal; hold on;
    [C] = contourc(phi, [0,0]);
    [x,y] = C2xyz(C);
    num_cont = numel(x);
    
    dim = initialContour(x,y);
    
    for n=1:iter_outer
        phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);
        pause(0.000001)
        
        [C] = contourc(phi, [0,0]);
        [x,y,num_cont,dim] = plotcontour(C,num_cont,dim);
        
    end

    % Construct a questdlg with three options
    decision = myquestdlg(0);
    
    if decision == 2
        % refine the zero level contour by further level set evolution with alfa=0
        alfa=0;
        iter_refine = 10;
        [x,y,phi] = refine(iter_outer,dim,num_cont,iter_refine,phi, g, lambda, mu, alfa,...
                           epsilon, timestep, iter_inner, potentialFunction);
        
        decision = 27;
        
    elseif decision == 1
        [decision,vari] = myquestdlg(1);
        
        if decision==2
            phiInicial=phi;
        end
    end
    
    bucle = decision;
end
    area = pixel_area(phi);
end