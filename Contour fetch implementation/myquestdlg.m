function [ decision,vari ] = myquestdlg( kind )
%MYQUESTDLG shows two kind of quest dialogues used in DRLSE.
%
%MYQUESTDLG(0) shows a quest dialogue with these three options: 
%
%               _______________________________
%               |Restart|   |Refine|   |Finish|
%               -------------------------------
%
% 'Restart' is used for invoque, later, another quest dialogue. If the
% contour calculated is not the desired one, you can recalculate it again.
%
% 'Refine' is used for add some iterations and set the value of alpha to zero. 
%
% 'Finish' is used for finish DRLSE function.
%
%
% MYQUESTDLG(1) is invoqued when you selected 'Restart' in the previous
% quest dialogue.
% It shows a quest dialogue with these three options: 
%
%         ___________________________________________
%         |Initial area|   |Final contour|   |Finish|
%         -------------------------------------------
%
% 'Inital area' is used for restart DRLSE with the initial contours.
%
% 'Final contour' is used for restart DRLSE, but with the calculated contours. 
%
% 'Finish' is used for finish DRLSE function.
%


if kind == 1
    choice = questdlg('What do you want to do?', ...
        'Options', ...
        'Initial area','Final contour','Finish','Finish');
    % Handle response
    switch choice
        case 'Initial area'
            decision = 1;
            vari=select_var();
        case 'Final contour'
            decision = 2;
            vari=select_var();
        case 'Finish'
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
            disp('Refining!')
            decision = 2;
            
        case 'Finish'
            decision = 27;
    end
end
end

