%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=igraph(oldreq,igraphs);
%here the x is showing the iters of the process...
x=oldreq;
y=igraphs;

plot(x,y);
title('Graph of Completion Time vs Dynamic Request');
xlabel('Dynamic Request');
ylabel('Process Completion time');
%Graph is shown as Figure 1....