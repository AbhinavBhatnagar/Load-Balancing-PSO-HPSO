%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=mygraph1(iter,drawgraph)
figure(3)
%here the x is showing the iters of the process...
x=1:1:iter;
y=drawgraph;

plot(x,y);
title('Graph of Completion Time vs Iterations');
xlabel('Iterations');
ylabel('Process Completion time');
%Graph is shown as Figure 1....