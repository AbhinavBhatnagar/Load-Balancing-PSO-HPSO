function []=calling3(machine,request);
check='no';
pmax=request;
if(strcmp(check,'yes'))
    extra=input('how many requests are arriving just before execution?? ');
    sHpso(machine,request+extra,pmax);
else
    if(strcmp(check,'no'))
        sHpso(machine,request,pmax);
    else disp('Enter correctly  ');
        %check=input('enter yes or no    ','s');
        calling3(machine,request);
    end

end