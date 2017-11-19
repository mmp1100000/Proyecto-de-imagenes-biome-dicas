 function [answer]= select_var()
 %SELECT_VAR makes appear a prompt where you can insert the values of the
 %variables necessary for DRLSE.
 %
 % These variables and their default values are:
 %
 %         Variable         Value
 %
 %          alpha:          -1.5
 %         lambda:            5
 %         time step:         5 
 %         iterations:       100 
 %         filter size:       5
 %         sigma:             5
 %         min_area         0.05
 % 
 %[answer] = SELECT_VAR() returns an array with the values order by their
 % positions in the promt.

 prompt={'\alpha','\lambda','time step','iterations','filter size','\sigma','min_area'};
        name='Inputs';
        numlines=1;
        defaultanswer={'-1.5','5','5', '100','5','5','0.05'};
        options.Resize='on';
        options.WindowStyle='normal';
        options.Interpreter='tex';
        answer=inputdlg(prompt,name,numlines,defaultanswer,options);
