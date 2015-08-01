%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Designed By:- 
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
request=input('enter the no. of request  ');
%pmax=input('enter the max no. of population initially  ');
% Function calling..............
%t=timer('startdelay',0.0,'period',10.0);
%t.Timerfcn='disp(''If any other request arrive just before execution...???????'')';
%start(t);
%check=input('enter yes or no    ','s');
calling3(machine,request);
%stop(t);
%First Graph comes as the output is in between Globalbest and Iterations
