%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=staticpop(pmax,pop,best)
figure(1)
%here the x is showing the iters of the process...
x=pmax:1000:pop;
y=best;
%function plot is inbuilt function in MATLAB for plotting the Graphs..
plot(x,y);
title('Graph of Gbest(utilization) vs Population');
xlabel('Population ');
ylabel('Gbest(utilization)');
%Graph is shown as Figure 1....