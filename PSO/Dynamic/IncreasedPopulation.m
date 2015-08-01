


function []=IncreasedPopulation(oldreq,fig);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%here the x is showing the iters of the process...
x=oldreq;
y=fig;
%function plot is inbuilt function in MATLAB for plotting the Graphs..
plot(x,y);
title('Graph of gbest vs Dynamic Requests');
xlabel('Dynamic Requests');
ylabel('gbest');
%Graph is shown as Figure 1....