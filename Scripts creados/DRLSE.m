function [phi,vari,area] = DRLSE(Img, phi,vari,initial)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%%
%%DRLSE(Img,phi,rect);
Img=double(Img(:,:,1));
%% parameter setting

phiInicial = phi;                                               %%WHILE

bucle = 0;

while bucle ~= 27                                               %%WHILE
    phi = phiInicial;
    
    
    
    S = [str2double(vari(1))
        str2double(vari(2))
        str2double(vari(3))
        str2double(vari(4))
        str2double(vari(5))
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
    
    
    % start level set evolution
    
    figure(3);
    imshow(Img,[]); axis off; axis equal; hold on;
    [C] = contourc(phi, [0,0]);
    [x,y] = C2xyz(C);
    
    if numel(x) == 1
        dim =  plot(x{:},y{:},'Color',[1,0.5,0.3],'linewidth',2);
    else
        for p=1:numel(x)
            dim(p) = plot(x{p},y{p},'Color',[1,0.5,0.3],'linewidth',2);
        end
    end
    
    num_cont = numel(x);
    for n=1:iter_outer
        phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);
        pause(0.000001)
        
        [C] = contourc(phi, [0,0]);
        [x,y] = C2xyz(C);
        
        numcontact=numel(x);
        
        if num_cont ~= numcontact
            for news = num_cont +1 : numcontact
                dim(news) = plot(x{news-1},y{news-1},'Color',[1,0.5,0.3],'linewidth',2);
            end
            num_cont = numcontact;
        end
        
        if numel(x) == 1
            set(dim,'XData',x{:});
            set(dim,'YData',y{:});
        else
            for j=1:numel(x)
                set(dim(j),'XData',x{j});
                set(dim(j),'YData',y{j});
            end
        end
        
    end
    if initial == 1

    % Construct a questdlg with three options
    choice = questdlg('What do you want to do?', ...
        'Options', ...
        'Restart','Refine','Finish','Finish');
    % Handle response
    switch choice
        case 'Restart'
            decision = 1;
        case 'Refine'
            disp('Coming right up!')
            decision = 2;
            
        case 'Finish'
            disp('Bye!')
            decision = 27;
    end
    
    if decision == 2
        % refine the zero level contour by further level set evolution with alfa=0
        alfa=0;
        iter_refine = 10;
        phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);
        
        finalLSF=phi;
        
        pause(0.000001)
        
        [C] = contourc(phi, [0,0]);
        [x,y] = C2xyz(C);
        
        numcontact=numel(x);
        
        if num_cont ~= numcontact
            dim(numcontact) = plot(x{numcontact-1},y{numcontact-1},'Color',[1,0.5,0.3],'linewidth',2);        %%%%%%%%
            num_cont = numcontact;
        end
        
        if numel(x) == 1
            set(dim,'XData',x{:});
            set(dim,'YData',y{:});
        else
            for j=1:numel(x)
                set(dim(j),'XData',x{j});
                set(dim(j),'YData',y{j});
            end
        end
        
        str=['Refined!, ', num2str(iter_outer*iter_inner+iter_refine), ' iterations'];
        title(str);
        
        decision = 27;
        
    elseif decision == 1
        choice = questdlg('What do you want to do?', ...
            'Options', ...
            'Initial area','Finish contour','Finish','Finish');
        % Handle response
        switch choice
            case 'Initial area'
                decision = 1;
                vari=select_var();
            case 'Finish contour'
                disp('Coming right up!')
                decision = 2;
                vari=select_var();
            case 'Finish'
                disp('Bye!')
                decision = 27;
        end
        if decision==2
            phiInicial=phi;
        end
    end
    
    bucle = decision;
    end
end
    area = polyarea(x{:},y{:});
end