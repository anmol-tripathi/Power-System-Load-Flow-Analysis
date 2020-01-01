clear all
clc
eps=0.001;
input_eld
 pload=input('Enter the total load demand');
 pload
n=length(generation(:,1));
pgen=0;
  for i=1:n
     pg(i,1)=(generation(i,5)+generation(i,6))/2;
     pgen=pgen+pg(i,1);
  end
  for k=1:7
      v=B1*pg
      ploss=(transpose(pg)*(B*pg))+B1*pg+B0
      pload_req=pload+ploss;
      for i=1:n
          x=0;
          for j=1:n
              x=x+B(i,j)*pg(j,1);
          end
          penalty(i)=1/(1-2*x-B1(i));
      end
      penalty
      lamda=max(generation(:,3));
      pgo=pg
      for m=1:50
          pgen=0;
          for i=1:n
               pg(i)=((lamda/penalty(i))-generation(i,3))/(2*generation(i,4));
               pgen=pgen+pg(i);
          end
          if abs((pgen-pload_req)) > eps
              lamda=lamda+0.002*(pload_req-pgen);
          else
              m
              break;
          end
          
      end
      if (max(pgo-pg)<eps)
          k
          pg
          break;
      end
 end
  