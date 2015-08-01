function []=calling1(machine,request);
check='no';
pmax=request;
if(strcmp(check,'yes'))
    extra=input('how many requests are arriving just before execution?? ');
    sPso(machine,request+extra,pmax);
else
    if(strcmp(check,'no'))
        sPso(machine,request,pmax);
    else disp('Enter correctly  ');
        %check=input('enter yes or no    ','s');
       % calling1(machine,request);
    end

end