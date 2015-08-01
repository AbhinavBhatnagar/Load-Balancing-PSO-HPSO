%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=mygraph1(iter,drawgraph);
%here the x is showing the iters of the process...
x=1:1:iter;
y=drawgraph;
xlabel('Iterations');
ylabel('Process Completion time');
%function plot is inbuilt function in MATLAB for plotting the Graphs..
title('Graph of Completion Time vs Iterations');
figure(2)=plot(x,y);
%Graph is shown as Figure 1....