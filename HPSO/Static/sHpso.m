function []=sHpso(machine,req,pmax);
display('Static HPSO');
xmax=10;
xmin=1;
vmax=1;
vmin=-1;
pointer=0;
population=randint(pmax,req,[1,machine]);
display(population);
position=xmin+(xmax-xmin)*rand(pmax,req);
display(position);
velocity=vmin+(vmax-vmin)*rand(pmax,req); 
display(velocity);
for pop=pmax:100:(pmax+100)
    pointer=pointer+1;
for iteration=1:1:100
for i= 1:pmax
completiontime(1:machine)=0;
count(1:machine)=0;
    for j=1:req
            if(population(i,j)<=machine)
            count(population(i,j))=count(population(i,j))+1;
            %disp('pop');
            %disp(population(i,j));
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
c1=2;
c2=2;
for i=1:pmax
        for j=1:req
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
              %disp(minutz);
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
    drawgraph(iteration)=drawgraph(iteration-1);
end
end

%disp(lock);
for i=1:pmax
    maxtime=position(i,1);
    m=i;n=1;
        for j=1:req
         %max time taking server is swapped with minimum utilization
          if(maxtime<position(i,j))
              maxtime=position(i,j);
              m=i;
              n=j;
          end
        end
       %disp(population(m,n));
%swap(i)=population(m,n);
temp=population(m,n);
population(m,n)=lock(i);
lock(i)=temp;
position(m,n)=xmin+(xmax-xmin)*rand();
end
disp('new population=');
disp(population);    
display(position);
for i=1:pmax
    for j=2:req
        for k=1:machine
            if(k~=population(i,j))
                checkposition=xmin+(xmax-xmin)*rand();
                %display(k);
                %display(population(i,j));
                %display(checkposition);
                %display(position(i,j));
                if(position(i,j)>checkposition)
                    population(i,j)=k;
                    position(i,j)=checkposition;
                    %display(position(i,j));
                end 
            end
        end
    end
end
                  
disp('new population1=');
disp(population);    
disp('position1=');
disp(position);
end
for i=1:iteration
    if(forgraph(i)==1)
        showarr(pointer)=i;
        break;
    end
end
figure(2);
mygraph(iteration,forgraph);
%display(showarr);
display(forgraph(iteration));
best(pointer)=forgraph(iteration);
if(pointer>=2)
if(best(pointer-1)>best(pointer))
    best(pointer)=best(pointer-1);
end
end
display(best);
figure(1);
staticpop(pmax,pop,best);

compute_time(pointer)=drawgraph(iteration);
if(pointer>=2)
if(compute_time(pointer-1)<compute_time(pointer))
    compute_time(pointer)=compute_time(pointer-1);
end
end
display(compute_time);

figure(3);
mygraph1(iteration,drawgraph);
figure(4);
statictimevspop(pmax,pop,compute_time);
  

end
%display(best);
%disp(graph);




