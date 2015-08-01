%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=mygraph(iter,forgraph);
%here the x is showing the iters of the process...
x=1:1:iter;
y=forgraph;
%function plot is inbuilt function in MATLAB for plotting the Graphs..
plot(x,y);
title('Graph of Utilization vs Iterations');
xlabel('Iterations');
ylabel('Gbest(Utilazation)');
%Graph is shown as Figure 1....