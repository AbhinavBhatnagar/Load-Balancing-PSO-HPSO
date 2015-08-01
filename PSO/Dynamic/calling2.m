function []=calling2(machine,req);
check='no';
if(strcmp(check,'yes'))
    extra=input('how many requests are arriving just before execution?? ');
    dPso(machine,req+extra,0,1,0);
else
    if(strcmp(check,'no'))
        dPso(machine,req,0,1,0);
    else disp('Enter correctly  ');
        %check=input('enter yes or no    ','s');
        calling2(machine,req);
    end

end