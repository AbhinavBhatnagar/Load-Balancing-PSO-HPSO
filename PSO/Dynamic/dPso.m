function []=dPso(machine,request,oldreq,pointer,fig,igraphs);
xmax=10;
xmin=1;
vmax=1;
vmin=-1;
pmax=request;
%display(request);
%display(oldreq);
oldreq(pointer)=request;
%display(newgraph);
population=randint(pmax,request,[1,machine]);
display(population);
position=xmin+(xmax-xmin)*rand(pmax,request);
display(position);
velocity=vmin+(vmax-vmin)*rand(pmax,request); 
display(velocity);
t=timer('startdelay',0.0,'period',10.0);
t.Timerfcn='disp(''If any other requestuests arrive during exexution...????'')';
for iteration=1:1:10
for i= 1:pmax
completiontime(1:machine)=0;
count(1:machine)=0;
    for j=1:request
            if(population(i,j)<=machine)
            count(population(i,j))=count(population(i,j))+1;
            %disp('pop');
            %disp(population(i,j));
            %disp('c');
                          %disp(count(population(i,j)));
            completiontime(population(i,j))=completiontime(population(i,j))+position(i,j);
                                        %disp('time')
            %disp(completiontime(population(i,j)));
            else disp('another');
            end
          end
 for k=1:machine
        if count(k)==0
            avg(i,k)=5;
            utilization(i,k)=0.5;
        else 
    avg(i,k)=completiontime(k)/count(k);
    utilization(i,k)=avg(i,k)/xmax;
        end 
     %disp('machine');
     %disp(k);
     %disp(avg(i,k));
     %disp(utilization(i,k));
    end
    %disp(utilization(i,k));
end
disp('Utilization=');
disp(utilization);
 for i=1:pmax
     pbest(i)=utilization(i,1);
     for j=1:machine
         if(utilization(i,j)>pbest(i))
             pbest(i)=utilization(i,j);
         end
     end
 end
  disp('pbest is');
  disp(pbest);
 gbest=pbest(1);
for i=1:pmax
    if(gbest<pbest(i))
        gbest=pbest(i);
    end 
end
forgraph(iteration)=gbest;
if(iteration>=2)
if(forgraph(iteration-1)>forgraph(iteration))
    forgraph(iteration)=forgraph(iteration-1);
    gbest=forgraph(iteration-1);
end
end
disp('gbest');
disp(gbest);

   %dPso(machine,requestuest);
c1=2;
c2=2;
for i=1:pmax
        for j=1:request
        velocity(i,j)=velocity(i,j) + c1*rand()*((pbest(i)*xmax)-position(i,j)) + c2*rand()*((gbest*xmax)-position(i,j));
        if(velocity(i,j)<vmin)
            velocity(i,j)=vmin;
        end
        if(velocity(i,j)>vmax)
             velocity(i,j)=vmax;
         end
        position(i,j)=position(i,j)+ velocity(i,j);
        if(position(i,j)<xmin)
            position(i,j)=xmin;
        end
        if(position(i,j)>xmax)
            position(i,j)=xmax;
        end
    end
end
disp('new velocity=');
disp(velocity);
disp('new position=');
disp(position);  
%display(request);
for i=1:pmax
   minutilization(i)=utilization(i,1);
    m=i;n=1;
        for j=1:machine
         %max time taking server is swapped with minimum utilization
          if(minutilization(i)>utilization(i,j))
              minutilization(i)=utilization(i,j);
              m=i;
              n=j;
          end
        end
        minutz=min(minutilization);
        %disp(minutilization);
%disp(m);
%disp(n);
%disp('machine');
%disp(n);
lock(i)=n;
end 
drawgraph(iteration)=minutz*10;
%display(drawgraph(iteration));
if(iteration>=2)
if(drawgraph(iteration-1)<drawgraph(iteration))
    %temporary=drawgraph(iteration);
    drawgraph(iteration)=drawgraph(iteration-1);
    %drawgraph(iteration-1)=temporary;
end
end
display(drawgraph);
start(t);
check=input('enter yes or no    ','s');
if(strcmp(check,'yes'))
    %interrupt=interrupt+1;
    fig(pointer)=gbest;
    for i=2:1:pointer
    if(fig(i-1)>fig(i))
    fig(i)=fig(i-1);
    end
    end
    igraphs(pointer)=minutz*10;
    if(pointer>=2)
    if(igraphs(pointer-1)<igraphs(pointer))
    igraphs(pointer)=igraphs(pointer-1); 
    end
    end
    %disp(fig);
    extra=input('how many requestuestuests are arriving just before execution?? ');
    pointer=pointer+1;
    %disp(pointer);
    oldreq(pointer)=request+extra;
   % disp(oldreq);
    dPso(machine,request+extra,oldreq,pointer,fig,igraphs);
    %disp(interrupt);
    %request(interrupt)=request;
    %disp(request);
    break;
end
if(strcmp(check,'no'))
       stop(t);

 %display(drawgraph(iteration));
%disp(lock);
for i=1:pmax
    maxtime=position(i,1);
    m=i;n=1;
        for j=1:request
         %max time taking server is swapped with minimum utilization
          if(maxtime<position(i,j))
              maxtime=position(i,j);
              m=i;
              n=j;
          end
        end
        %disp(maxtime);
%disp(m);
%disp(n);
%disp('machine');
%disp(population(m,n));
%swap(i)=population(m,n);
temp=population(m,n);
population(m,n)=lock(i);
lock(i)=temp;
position(m,n)=xmin+(xmax-xmin)*rand();
end
disp('new population=');
disp(population);    
%disp('position=');
%disp(position);
fig(pointer)=gbest;
for i=2:1:pointer
   if(fig(i-1)>fig(i))
    fig(i)=fig(i-1);
end
end
igraphs(pointer)=minutz*10;
if(pointer>=2)
if(igraphs(pointer-1)<igraphs(pointer))
    igraphs(pointer)=igraphs(pointer-1);
end
end
else display('Error::Enter correctly and restart the process!!!!     ');
   end
   %display(drawgraph);
   figure(1);
IncreasedPopulation(oldreq,fig);
figure(2);
igraph(oldreq,igraphs);
%%%%%%%%%%%%%%%display(oldreq);
%display(igraphs);
%%%%%%%%%%%%%%%display(fig);
%%%%%%%%%%%%%%%disp(graph);
%mygraph1(iteration,drawgraph);
figure(3);
mygraph(iteration,forgraph);
end

%IncreasedPopulation(request,pointer);
end

