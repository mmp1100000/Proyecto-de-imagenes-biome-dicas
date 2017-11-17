function [ decision,vari ] = myquestdlg( kind )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if kind == 1
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
    
elseif kind == 0
        
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
    end
end

