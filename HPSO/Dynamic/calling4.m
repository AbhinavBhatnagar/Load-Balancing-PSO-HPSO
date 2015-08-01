function []=calling4(machine,request);
check='no';
if(strcmp(check,'yes'))
    extra=input('how many requests are arriving just before execution?? ');
    dHpso(machine,request+extra,0,1,0);
else
    if(strcmp(check,'no'))
        dHpso(machine,request,0,1,0);
    else disp('Enter correctly  ');
        check=input('enter yes or no    ','s');
        calling4(machine,request);
    end

end