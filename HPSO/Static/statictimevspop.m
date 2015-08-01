%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%fucntion mygraph is used as for drawing the graphs for our analysis....
function []=statictimevspop(pmax,pop,compute_time)
figure(4)
%here the x is showing the iters of the process...
x=pmax:1000:pop;
y=compute_time;
%function plot is inbuilt function in MATLAB for plotting the Graphs..
plot(x,y);
title('Graph of Computation Time vs Populations');
xlabel('Population');
ylabel('Computation time');
%Graph is shown as Figure 1....