%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=mygraph(iter,forgraph,pointer)
%here the x is showing the iters of the process...
figure(2)
x=1:1:iter;
y=forgraph;
%function plot is inbuilt function in MATLAB for plotting the Graphs..
plot(x,y);
title('Graph of Utilization vs Iterations');
xlabel('Iterations');
ylabel('gbest(Utilization)');
hold on;
%Graph is shown as Figure 1....