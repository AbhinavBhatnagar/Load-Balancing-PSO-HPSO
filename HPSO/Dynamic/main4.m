%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Designed By:- Aastha Mediratta and Abhinav Bhatnagar
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%first of all the memory is cleared....
%--------------------------------------------------------------------------
%Then the Command Window is cleared....
%--------------------------------------------------------------------------
clear;
clc;
close all;
%Taking the Inputs from the User End.........
machine=input('enter the no. of machines  ');
req=input('enter the no. of requests  ');
% Function calling..............
%t=timer('startdelay',0.0,'period',10.0);
%t.Timerfcn='disp(''If any other requests arrive just before execution...???????'')';
%start(t);
%check=input('enter yes or no    ','s');
calling4(machine,req);
%stop(t);
%First Graph comes as the output is in between Globalbest and Iterations
